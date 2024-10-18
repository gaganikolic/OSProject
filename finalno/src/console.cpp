#include "../h/console.hpp"

buffer* console::bufferOut = nullptr;
buffer* console::bufferIn = nullptr;

void console::init() {
    bufferIn = new buffer(256);
    bufferOut = new buffer(256);
}

void console::putInInputBuffer(char c) {
    bufferIn->put(c);
}

char console::getFromInputBuffer() {
    return bufferIn->get();
}

void console::putInOutputBuffer(char c) {
    bufferOut->put(c);
}

char console::getFromOutputBuffer() {
    return bufferOut->get();
}

void consolePutc(void*){
    //changeToUser();
    while(true){
        char ready = *(char*) CONSOLE_STATUS;
        while(ready & CONSOLE_TX_STATUS_BIT){
            *(char*) CONSOLE_TX_DATA = console::getFromOutputBuffer();
            ready = *(char*) CONSOLE_STATUS;
        }
        thread_dispatch();
    }
}
