//
// Created by os on 8/14/23.
//
#ifndef OS_PROJEKAT_CONSOLE_HPP
#define OS_PROJEKAT_CONSOLE_HPP

#include "../h/buffer.h"

class console{
private:
    console() {};
    static buffer* bufferIn;
    static buffer* bufferOut;

public:
    static void init();

    static void putInInputBuffer(char);
    static char getFromInputBuffer();


    static void putInOutputBuffer(char);
    static char getFromOutputBuffer();
};

#endif //OS_PROJEKAT_CONSOLE_HPP
