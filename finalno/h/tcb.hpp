#ifndef OS_PROJEKAT_TCB_HPP
#define OS_PROJEKAT_TCB_HPP

#include "../h/MemoryAllocator.hpp"
#include "../h/Scheduler.hpp"
#include "../h/riscv.hpp"

//Klasa implementirana na osnovu klase TCB sa vezbi.

struct Suspend{
    TCB* tcb;
    Suspend* next;
    Suspend(TCB* tcb, Suspend* next): tcb(tcb), next(next){};
};

typedef unsigned long time_t;
struct Sleep{
    TCB* thread;
    unsigned long sleepTime;
    struct Sleep* next;
};

class TCB{
public:
    static TCB* running;
    static Sleep* sleepHead;

    typedef void(*Body)(void*);
    static TCB *createThread(Body body, void* arg, char* stack_space);
    static int exit();
    void join(TCB* handle);
    static void yield();
    static void dispatch();
    static void sleep(time_t timeToSleep);

    bool isFinished() const { return finished; }
    void setFinished(bool value) { finished = value; }
    bool isBlocked() const { return blocked; }
    void setBlocked(bool value) { blocked = value; }
    uint64 getTimeSlice() { return timeSliceCounter; }
    /*void setAsleep(bool value) { asleep = value; }
    bool isAsleep() const { return asleep; }
    bool isSuspended() const { return suspended; }
    void setSuspended(bool value) { suspended = value; }*/

private:

    struct Context{
        uint64 ra;
        uint64 sp;
    };

    Body body;
    uint64 userStack;
    void* arg;
    Context contex;
    bool finished = false;
    bool blocked = false;
    //bool suspended = false;
    //bool asleep = false;
    Suspend* headSuspend = nullptr;
    uint64 timeSlice;

    static uint64 timeSliceCounter;

    friend class Riscv;
    static void threadWrapper();
    static void contextSwitch(Context *oldContext, Context *runningContext);
    //static void putInList(Sleep* newSleep);

};

#endif //OS_PROJEKAT_TCB_HPP