#include "../h/buffer.h"

buffer::buffer(int kapacitet) {
    this->kapacitet = kapacitet;
    this->buff = (char*) mem_alloc(sizeof (char) * kapacitet);
    head = tail = 0;
    spaceAvilable = semaphore::open(kapacitet);
    itemAvailable = semaphore::open(0);
    mutexHead = semaphore::open(1);
    mutexTail = semaphore::open(1);
}

void buffer::put(char c) {
    spaceAvilable->wait();
    mutexTail->wait();

    buff[tail] = c;
    tail = (tail + 1)%kapacitet;

    mutexTail->signal();
    itemAvailable->signal();
}

int buffer::get() {
    itemAvailable->wait();
    mutexHead->wait();

    char c = buff[head];
    head = (head + 1)%kapacitet;

    mutexHead->signal();
    spaceAvilable->signal();

    return c;
}

int buffer::getCnt() {
    int ret;

    mutexHead->wait();
    mutexTail->wait();

    if(tail >= head) ret = tail - head;
    else ret = kapacitet - head + tail;

    mutexTail->signal();
    mutexHead->signal();
    return ret;
}