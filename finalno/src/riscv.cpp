#include "../h/riscv.hpp"

//#include "../lib/console.h"
#include "../h/Scheduler.hpp"
#include "../h/tcb.hpp"
#include "../h/console.hpp"

void Riscv::popSppSpie()
{
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}

void Riscv::wakeupThread() {
    if(!TCB::sleepHead) return;
    TCB::sleepHead->sleepTime--;
    while(TCB::sleepHead && TCB::sleepHead->sleepTime == 0){
        Sleep* removed = TCB::sleepHead;
        TCB::sleepHead = TCB::sleepHead->next;
        TCB* thread = removed->thread;
        thread->setBlocked(false);
        MemoryAllocator::instance().mem_free(removed);
        Scheduler::instanceOfScheduler().put(thread);
    }
}

void Riscv::handleInterrupt() {
    uint64 a0 = r_a0();
    uint64 a1 = r_a1();
    uint64 a2 = r_a2();
    uint64 a3 = r_a3();

    uint64 scause = r_scause();

    if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL) {
        uint64 volatile sepc = r_sepc() + 4;
        uint64 volatile sstatus = r_sstatus();

        //kroz a0 se prosledjuje sistemski poziv
        if (a0 == 0x01) {
            //mem_alloc
            uint64 size = (uint64) a1;
            MemoryAllocator::instance().mem_alloc(size);
        } else if (a0 == 0x02) {
            //mem_free
            void *ptr = (void *) a1;
            MemoryAllocator::instance().mem_free(ptr);
        } else if (a0 == 0x11) {
            //thread_create
            TCB **handle = (TCB **) a1;
            TCB::Body start_routine = (TCB::Body) a2;
            void *arg = (void *) a3;
            char* stack_space = (char*) MemoryAllocator::instance().mem_alloc(
                    (8 * DEFAULT_STACK_SIZE + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);

            *handle = TCB::createThread(start_routine, arg, stack_space);
            if (start_routine != nullptr) {
                Scheduler::instanceOfScheduler().put(*handle);
            }
        } else if (a0 == 0x12) {
            //thread_exit
            TCB::exit();
        } else if (a0 == 0x14) {
            //thread_join
            TCB *handle = (TCB *) a1;
            TCB::running->join(handle);
        } else if (a0 == 0x15) {
            //no add to Scheduler
            TCB **handle = (TCB **) a1;
            TCB::Body start_routine = (TCB::Body) a2;
            void *arg = (void *) a3;
            char* stack_space = (char*) MemoryAllocator::instance().mem_alloc(
                    (8 * DEFAULT_STACK_SIZE + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE);

            *handle = TCB::createThread(start_routine, arg, stack_space);
        } else if (a0 == 0x21) {
            //sem_open
            semaphore **handle = (semaphore **) a1;
            int init = (int) a2;

            *handle = semaphore::open(init);
        } else if (a0 == 0x22) {
            //sem_close
            semaphore *handle = (semaphore *) a1;
            handle->close();
            MemoryAllocator::instance().mem_free(handle);
        } else if (a0 == 0x23) {
            //sem_wait
            semaphore *handle = (semaphore *) a1;
            handle->wait();
        } else if (a0 == 0x24) {
            //sem_signal
            semaphore *handle = (semaphore *) a1;
            handle->signal();
        } else if (a0 == 0x31) {
            //time_sleep
            time_t timeSleep = (time_t) a1;
            TCB::sleep(timeSleep);
        } else if (a0 == 0x41) {
            //getc
            //char c = __getc();
            char c = console::getFromInputBuffer();
            __asm__ volatile ("mv a0, %[p]" : : [p]"r"(c));
        } else if (a0 == 0x42) {
            //putc
            char c = (char) a1;
            console::putInOutputBuffer(c);
            //__putc(c);

        } else if (a0 == 0x43) {
            uint64 mask = 1 << 8;
            w_sstatus(sstatus);
            mc_sstatus(mask);
            __asm__ volatile("csrw sepc, %0" : : "r"(sepc));
            __asm__ volatile("csrc sip, 0x02");
            return;
        }

        //__asm__ volatile ("addi sp, sp, -16");
        //__asm__ volatile ("sd x10, (sp)");

        if (a0 == 0x13 && Scheduler::instanceOfScheduler().head) {
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
        }

        //__asm__ volatile ("ld x10, (sp)");
        //__asm__ volatile ("addi sp, sp, 16");

        w_sstatus(sstatus);
        w_sepc(sepc);
    }
}

//Kod uzet sa sedmih vezbi.
void Riscv::handleTimer() {
    mc_sip(SIP_SSIP);
    TCB::timeSliceCounter++;
    wakeupThread();
    if (TCB::running && TCB::timeSliceCounter >= TCB::running->getTimeSlice())
    {
        uint64 volatile sepc = r_sepc();
        uint64 volatile sstatus = r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch();
        w_sstatus(sstatus);
        w_sepc(sepc);
    }
}

void Riscv::handleConsole() {
    //console_handler();
    //return;
    uint64 volatile sepc = r_sepc();
    uint64 volatile sstatus = r_sstatus();
    if(plic_claim() == CONSOLE_IRQ){
        while(CONSOLE_RX_STATUS_BIT & (*(char*) CONSOLE_STATUS)){
            char c = *(char*) CONSOLE_RX_DATA;
            console::putInInputBuffer(c);
        }
    }
    plic_complete(CONSOLE_IRQ);
    w_sstatus(sstatus);
    w_sepc(sepc);
}

