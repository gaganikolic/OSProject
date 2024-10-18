#ifndef OS_PROJEKAT_BUFFER_H
#define OS_PROJEKAT_BUFFER_H

#include "../h/semaphore.hpp"

//Metode implementirane u ovoj klasi uzete su iz klase Buffer date u javnim testovima.

class buffer{
private:
    int kapacitet;
    int head, tail;
    char* buff;

    semaphore* spaceAvilable;
    semaphore* itemAvailable;
    semaphore* mutexHead;
    semaphore* mutexTail;

public:
    buffer(int kapacitet);

    void put(char c);
    int get();
    int getCnt();
};

#endif //OS_PROJEKAT_BUFFER_H
