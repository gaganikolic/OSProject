#include "../h/Scheduler.hpp"
#include "../h/syscall_c.h"

TCB* Scheduler::idle = nullptr;
void Scheduler::idleBody(void* arg) {
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    changeToUser();
    while(true){
        thread_dispatch();
    }
}

Scheduler &Scheduler::instanceOfScheduler() {
    static Scheduler singleton;
    return singleton;
}

void Scheduler::put(TCB *tcb) {
    if(!tcb) return;
    Elem* newElem = (Elem*) MemoryAllocator::instance().mem_alloc((sizeof(Elem) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);
    newElem->thread = tcb;
    newElem->next = nullptr;
    if(!head) head = newElem;
    else tail->next = newElem;
    tail = newElem;
}

TCB *Scheduler::get() {
    if(!head) return idle;
    Elem* removed = head;
    head = head->next;
    if(!head) tail = nullptr;

    TCB* thread = removed->thread;
    MemoryAllocator::instance().mem_free(removed);
    return thread;
}


