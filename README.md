# RISC-V Multithreaded Kernel – Operating Systems Project

This project is a university-level implementation of a **lightweight operating system kernel** for the **RISC-V** architecture. 
The kernel supports **multithreading**, **semaphores**, **time sharing**, and **preemption**, and is designed to execute within a virtual RISC-V emulator.

The kernel is built as a **library kernel**, meaning the user application and the kernel share the same address space and are statically linked into a single binary. 
This model is common in **embedded systems**, where the operating system and application are bundled into one program that runs directly on the target hardware.

## Project Goals

- Implement a **custom kernel** with:
  - **Threading (lightweight processes)**
  - **Preemptive scheduling** (based on timer interrupts)
  - **Time-sharing** for concurrent thread execution
  - **Semaphore-based synchronization**
  - **Memory allocation support**
  - **Context switching** (both synchronous and asynchronous)
  - **Interrupt handling** (timer and keyboard)

## Technologies Used

- **RISC-V** architecture
- **C/C++** for kernel and application logic
- **Assembly** for low-level interrupt and context switch handling
- **RISC-V Emulator**
