#ifndef OS_PROJEKAT_SYSCALL_CPP_H
#define OS_PROJEKAT_SYSCALL_CPP_H

#include "../h/syscall_c.h"
#include "../h/semaphore.hpp"

void* operator new (size_t);
void operator delete (void*);
//void* ::operator new[] (size_t);
//void ::operator delete[] (void*);

class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    void join();
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    virtual void run () {}
private:
    thread_t myHandle;
    void (*body)(void*);
    void* arg;
    static void wrapper(void*);
};

class Semaphore {
public:
    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();
    int wait ();
    int signal ();
private:
    sem_t myHandle;
};

class PeriodicThread : public Thread {
public:
    void terminate ();
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
private:
    time_t period;
    int finished = 0;
    void run() override;
};

class Console {
public:
    static char getc ();
    static void putc (char);
};

#endif //OS_PROJEKAT_SYSCALL_CPP_H
