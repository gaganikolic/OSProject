#ifndef PROJECT_BASE_V1_1_SYSCALL_C_HPP
#define PROJECT_BASE_V1_1_SYSCALL_C_HPP

#include "../h/MemoryAllocator.hpp"
#include "../h/tcb.hpp"
#include "../h/riscv.hpp"

class semaphore;

typedef TCB* thread_t;
typedef semaphore* sem_t;

void syscallW(...);

//MemoryAllocator
void* mem_alloc(size_t size);
int mem_free(void* ptr);

//Thread
int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);
int thread_create_no(thread_t* handle, void(*start_routine)(void*), void* arg);
int thread_exit();
void thread_dispatch();
void thread_join(TCB* handle);
int time_sleep(time_t timeSleep);

//Semaphore
int sem_open (sem_t* handle, unsigned init);
int sem_close(sem_t handle);
int sem_signal(sem_t handle);
int sem_wait(sem_t handle);

//Console
char getc();
void putc(char c);

void changeToUser();

#endif //PROJECT_BASE_V1_1_SYSCALL_C_HPP
