#include "../h/syscall_c.h"

//MemoryAllocator
void* mem_alloc(size_t size){
    uint64 blks = (size + MEM_BLOCK_SIZE - 1 )/MEM_BLOCK_SIZE;
    syscallW(0x01, blks);
    uint64 ptr = Riscv::r_a0(); //citanje povratne vrednosti iz a0
    return (void*)ptr;
}

int mem_free(void* ptr){
    syscallW(0x02, ptr);
    int status = Riscv::r_a0();
    return status;
}

//Thread
int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    syscallW(0x11, handle, start_routine, arg);
    TCB* ret = reinterpret_cast<TCB *>(Riscv::r_a0());
    if(!ret) return -1;
    return 0;
}

int thread_create_no(thread_t* handle, void(*start_routine)(void*), void* arg){
    syscallW(0x15, handle, start_routine, arg);
    TCB* ret = reinterpret_cast<TCB *>(Riscv::r_a0());
    if(!ret) return -1;
    return 0;
}

int thread_exit(){
    syscallW(0x12);
    int status = Riscv::r_a0();
    return status;
}

void thread_dispatch(){
    syscallW(0x13);
}

void thread_join(TCB* handle){
    if(!handle) return;
    syscallW(0x14, handle);
}

int time_sleep(time_t timeSleep){
    syscallW(0x31, timeSleep);
    return 0;
}

//Semaphore
int sem_open(sem_t* handle, unsigned init){
    if(!handle) return -1;
    syscallW(0x21, handle, init);
    semaphore* ret = (semaphore*) (Riscv::r_a0());
    if(!ret) return -1;
    return 0;
}

int sem_close(sem_t handle){
    if(!handle) return -1;
    syscallW(0x22, handle);
    int ret = Riscv::r_a0();
    return ret;
}

int sem_wait(sem_t handle){
    if(!handle) return -1;
    syscallW(0x23, handle);
    int ret = Riscv::r_a0();
    return ret;
}

int sem_signal(sem_t handle){
    if(!handle) return -1;
    syscallW(0x24, handle);
    int ret = Riscv::r_a0();
    return ret;
}

//Console
char getc(){
    syscallW(0x41);
    char c = Riscv::r_a0();
    return c;
}

void putc(char c){
    syscallW(0x42, c);
}

void changeToUser(){
    syscallW(0x43);
    return;
}

void syscallW(...){
    __asm__ volatile ("ecall");
}