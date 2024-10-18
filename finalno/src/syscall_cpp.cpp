#include "../h/syscall_cpp.hpp"

void *operator new(size_t n){
    return mem_alloc(n);
}

void operator delete(void *p) {
    mem_free(p);
}

//Thread
Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
}
Thread::~Thread(){
    delete myHandle;
}
int Thread::start() {
    Scheduler::instanceOfScheduler().put(myHandle);
    return 0;
}
void Thread::join() {
    thread_join(myHandle);
}
void Thread::dispatch() {
    thread_dispatch();
}
int Thread::sleep(time_t time) {
    return time_sleep(time);
}
void Thread::wrapper(void * thread) {
    Thread* t = (Thread*) thread;
    t->run();
}
Thread::Thread(){
    thread_create_no(&myHandle, wrapper, this);
}

//Semaphore
Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}
Semaphore::~Semaphore(){
    sem_close(myHandle);
}
int Semaphore::wait(){
    return sem_wait(myHandle);
}
int Semaphore::signal(){
    return sem_signal(myHandle);
}

//Periodic thread
PeriodicThread::PeriodicThread(time_t period) {
    this->period = period;
}
void PeriodicThread::terminate() {
    finished = 1;
}
void PeriodicThread::run() {
    while(!finished){
        time_sleep(this->period);
        this->periodicActivation();
    }
}

//Console
char Console::getc() {
    return ::getc();
}
void Console::putc(char c) {
    ::putc(c);
}