#include "../h/semaphore.hpp"

semaphore::semaphore(int status){
    this->status = status;
    head = nullptr;
    tail = nullptr;
}

semaphore* semaphore::open(int init){
    semaphore* sem = (semaphore*) MemoryAllocator::instance().mem_alloc((sizeof(semaphore) + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE);
    sem->status = init;
    sem->head = nullptr;
    sem->tail = nullptr;
    return sem;
}

int semaphore::close(){
    while(head){
        Blocked* removed = head;
        TCB* t = removed->thread;
        t->setBlocked(false);

        mem_free(removed);
        Scheduler::instanceOfScheduler().put(t);
        head = head->next;
    }
    return 0;
}

int semaphore::signal(){
    if(++status <= 0){
        if(head){
            Blocked* removed = head;
            TCB* t = removed->thread;
            t->setBlocked(false);
            head = head->next;
            if(!head) tail = nullptr;

            //mem_free(removed);
            MemoryAllocator::instance().mem_free(removed);
            if(!t->isBlocked()) Scheduler::instanceOfScheduler().put(t);
        }
    }
    return 0;
}

int semaphore::wait(){
    TCB* old = TCB::running;
    if(--status < 0){
        old->setBlocked(true);
        //Blocked* newBlocked = (Blocked*) mem_alloc(sizeof(Blocked));
        Blocked* newBlocked = (Blocked*) MemoryAllocator::instance().mem_alloc((sizeof(Blocked) + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE);
        newBlocked->thread = old;
        newBlocked->next = nullptr;
        if(!head) head = newBlocked;
        else tail->next = newBlocked;
        tail = newBlocked;
        thread_dispatch();
    }
    return 0;
}