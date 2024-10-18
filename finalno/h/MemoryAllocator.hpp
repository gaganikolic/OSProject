#ifndef project_base_v1_1_MemoryAllocator_h
#define project_base_v1_1_MemoryAllocator_h

#include "../lib/hw.h"

//Metode implementirane u ovoj klasi radjene su na osnovu zadataka sa starih kolokvijumskih rokova.

struct FreeMem {
    FreeMem* prev;
    FreeMem* next;
    size_t size;
};

class MemoryAllocator{
private:
    FreeMem* head = nullptr;
    int tryToJoin(FreeMem* cur);

public:
    MemoryAllocator();
    static MemoryAllocator& instance();
    void* mem_alloc(size_t size);
    int mem_free(void* ptr);
};
#endif
