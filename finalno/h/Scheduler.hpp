#ifndef OS_PROJEKAT_SCHEDULER_HPP
#define OS_PROJEKAT_SCHEDULER_HPP

#include "../h/MemoryAllocator.hpp"

class TCB;

struct Elem{
    TCB* thread;
    Elem* next;
};

class Scheduler{
private:
    Elem *tail = nullptr;
public:
    Elem* head = nullptr;
    static TCB* idle;
    static void idleBody(void* arg);

    static Scheduler& instanceOfScheduler();
    //addLast
    void put(TCB* tcb);
    //removeFirst
    TCB* get();
};

#endif //OS_PROJEKAT_SCHEDULER_HPP
