#ifndef OS_PROJEKAT_SEMAPHORE_H
#define OS_PROJEKAT_SEMAPHORE_H

#include "../h/tcb.hpp"
#include "../h/syscall_c.h"

struct Blocked{
    TCB* thread;
    Blocked* next;
};

class semaphore{
private:
    int status = 0;
    Blocked *head, *tail;
public:
    semaphore(int status);

    void setStatus(int status){ status = status; }
    int getStatus() { return status; }

    static semaphore* open(int init);
    int close();
    int wait();
    int signal();

};

#endif //OS_PROJEKAT_SEMAPHORE_H
