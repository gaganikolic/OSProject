#include "../h/tcb.hpp"

TCB* TCB::running = nullptr;
Sleep* TCB::sleepHead = nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB *TCB::createThread(Body body, void *arg, char* stack_space) {
    TCB* newTCB = (TCB*) MemoryAllocator::instance().mem_alloc((sizeof(TCB) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    newTCB->arg =arg;
    newTCB->body = body;
    newTCB->finished = false;
    newTCB->blocked = false;
    //newTCB->suspended = false;
    //newTCB->asleep = false;
    newTCB->headSuspend = nullptr;
    newTCB->timeSlice = DEFAULT_TIME_SLICE;
    newTCB->userStack = (body != nullptr ? (uint64)&(stack_space[8*DEFAULT_STACK_SIZE]) : 0);
    newTCB->contex.ra = (uint64) &threadWrapper;
    newTCB->contex.sp = newTCB->userStack;
    return newTCB;
}

void TCB::threadWrapper() {
    Riscv::popSppSpie();
    running->body(running->arg);
    running->setFinished(true);
    while(running->headSuspend){
        Suspend* old = running->headSuspend;
        running->headSuspend = running->headSuspend->next;
        TCB* t = old->tcb;
        t->setBlocked(false);
        Scheduler::instanceOfScheduler().put(t);
        delete(old);
    }
    thread_dispatch();
}

void TCB::dispatch() {
    TCB* old = running;
    if(!old->isFinished() && !old->isBlocked()) {
        Scheduler::instanceOfScheduler().put(old);
    }
    running = Scheduler::instanceOfScheduler().get();

    TCB::contextSwitch(&old->contex, &running->contex);
}

int TCB::exit() {
    if(!running->isFinished()){
        running->setFinished(true);
        while(running->headSuspend){
            Suspend* old = running->headSuspend;
            running->headSuspend = running->headSuspend->next;
            TCB* t = old->tcb;
            t->setBlocked(false);
            Scheduler::instanceOfScheduler().put(t);
            delete(old);
        }
        thread_dispatch();
        return 0;
    }
    return -1;
}

void TCB::join(TCB *handle) {
    if(handle->isFinished()) return;
    setBlocked(true);
    Suspend* newSuspend = new Suspend(this, nullptr);
    if(handle->headSuspend) newSuspend->next = handle->headSuspend;
    handle->headSuspend = newSuspend;
    thread_dispatch();
}

void TCB::sleep(time_t timeSleep){
    if(timeSleep == 0) return;
    Sleep* newSleep = (Sleep*) MemoryAllocator::instance().mem_alloc((sizeof(Sleep) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    newSleep->thread = TCB::running;
    newSleep->next = nullptr;
    newSleep->sleepTime = timeSleep;


    if(!sleepHead){
        sleepHead = newSleep;
    }
    else if(sleepHead->sleepTime >= timeSleep){
        //add first
        sleepHead->sleepTime -= newSleep->sleepTime;
        newSleep->next = sleepHead;
        sleepHead = newSleep;
    }
    else {
        Sleep *cur = sleepHead;
        Sleep *prev = nullptr;
        while (cur) {
            if (cur->sleepTime > newSleep->sleepTime) break;
            newSleep->sleepTime -= (cur->sleepTime);
            prev = cur;
            cur = cur->next;
        }
        prev->next = newSleep;
        newSleep->next = cur;
        if (cur) cur->sleepTime -= newSleep->sleepTime;
    }
    TCB::running->setBlocked(true);
    thread_dispatch();
}