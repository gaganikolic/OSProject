#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"
#include "../h/syscall_cpp.hpp"
#include "../h/console.hpp"

/*class IzvedenaPeriodicna: public PeriodicThread{
public:
    IzvedenaPeriodicna(time_t period) : PeriodicThread(period) {}
    void periodicActivation () override{
        putc('a');
        putc('\n');
    }
};*/

void consolePutc(void*);
void userMain();
int main(){
    //omoguci prekide u vektorskom rezimu
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap | 1);
    //omoguci spoljasnje hardverske prekide
    Riscv::ms_sie(Riscv::SIE_SEIE);

    //main nit
    TCB* t;
    thread_create(&t, nullptr, nullptr);
    TCB::running = t;

    //idle nit
    Scheduler::idle = TCB::createThread(Scheduler::idleBody, nullptr,(char*) MemoryAllocator::instance().mem_alloc(
                                                (8*DEFAULT_STACK_SIZE + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE));
    Scheduler::instanceOfScheduler().put(Scheduler::idle);

    //console
    TCB* c = TCB::createThread(consolePutc, nullptr, (char*) MemoryAllocator::instance().mem_alloc(
            (8*DEFAULT_STACK_SIZE + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE));
    Scheduler::instanceOfScheduler().put(c);
    console::init();

    //omoguci prekid od tajmera
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    changeToUser();

    TCB* mainThread ;
    thread_create(&mainThread, reinterpret_cast<void (*)(void *)>(userMain), nullptr);
    while(!mainThread->isFinished()){
        thread_dispatch();
    }
    thread_dispatch();

    return 0;
}