#include "../h/MemoryAllocator.hpp"
//#include "../lib/mem.h"

MemoryAllocator& MemoryAllocator::instance() {
    static MemoryAllocator singleton;
    return singleton;
}

MemoryAllocator::MemoryAllocator() {
    if(head == nullptr){
        head = (FreeMem*)(HEAP_START_ADDR);
        head->next = nullptr;
        head->prev = nullptr;
        head->size = (uint64)((uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR - sizeof(FreeMem));
    }
}

int MemoryAllocator::tryToJoin(FreeMem *cur) {
    if(!cur) return 0;
    if(cur->next && (uint64)cur + cur->size == (uint64)(cur->next)) {
        cur->size += cur->next->size;
        cur->next = cur->next->next;
        if (cur->next) cur->next->prev = cur;
        return 1;
    } else return 0;
}

void* MemoryAllocator::mem_alloc(size_t size) {
    //return __mem_alloc(size * MEM_BLOCK_SIZE);
    if(size < 0) return nullptr;
    //size = broj blokova
    size_t sz = size * MEM_BLOCK_SIZE + sizeof(FreeMem);

    for(FreeMem* cur = head; cur != nullptr; cur = cur->next){
        if(cur->size >= sz){
            if(cur->size - sz <= sizeof(FreeMem)){
                //Ukoliko je prostor koji ostaje manji od velicine FreeMem onda se prikljucuje alociranom bloku
                if(cur->prev) cur->prev->next = cur->next;
                else head = cur->next;
                if(cur->next) cur->next->prev = cur->prev;
            }
            else {
                //U suprotnom u listu slobodnih blokova dodaje se novi cija je velicina (cur->size - sz)
                FreeMem* newFragment = (FreeMem*)((uint64)cur + sz);
                if(cur->prev) cur->prev->next = newFragment;
                else head = newFragment;
                if(cur->next) cur->next->prev = newFragment;
                newFragment->prev = cur->prev;
                newFragment->next = cur->next;
                newFragment->size = cur->size - sz;

            }
            cur->size = sz;
            return (char*)cur + sizeof(FreeMem);
        }
    }
    return nullptr;
}

int MemoryAllocator::mem_free(void *addr) {
    //return __mem_free(addr);
    if(addr == nullptr || (uint64)addr > (uint64)HEAP_END_ADDR || (uint64)addr < (uint64)HEAP_START_ADDR) return -1;

    FreeMem* cur = nullptr;
    if(!head || (uint64)addr < (uint64)head) cur = nullptr;
    else {
        //Cvorovi liste slobodnih blokova uredjeni su po adresama
        for(cur = head; cur->next != 0 && (uint64)addr > (uint64)cur->next; cur = cur->next);
    }

    FreeMem* blk = (FreeMem*)((uint64)addr - sizeof(FreeMem));
    blk->prev = cur;
    if(cur) blk->next = cur->next;
    else blk->next = head;
    if(blk->next) blk->next->prev = blk;
    if(cur) cur->next = blk;
    else head = blk;

    tryToJoin(blk);
    tryToJoin(cur);
    return 0;
}


