# Lesson1 Introduction to Computer Architecture

## What Is “Computer Architecture” ?

**Computer Architecture** = **Instruction Set Architecture** (ISA: Instructions and their properties) + **Machine Organization**
(Pipelining, Memory Hierarchy, Storage systems, etc.)

历史
* IBM 360 (mainframe)
* Intel X86 (Intel, AMD, Transmeta)
* ARM ISA (TI, Qualcomm, Samsung etc)

PS：这里提到了atomic ISA？举了两个Integer相加例子，是否能由硬件一步到位？还是通过其它mechanism实现？【听得很模糊，口音较难理解，也许有偏差】

## Compatibility Problem at IBM

* By early ‘60s, IBM had 4 incompatible lines of computers: 701 650 702 1401
* Each system had its own
	* Instruction set
	* I/O system: magnetic tapes, drums and disks
	* Assemblers, compilers, libraries....
	* Market niche: business, scientific, real time, ...

=> IBM 360 Amdahl, Blaauw and Brooks, 1964

* The design must lend itself to **successor machines**
* General (common) method for connecting to I/O devices

## IBM 360: A General-Purpose Register Machine

* Processor State
	* 16 General-Purpose 32-bit Registers
		* May also be used as **index** and **base register**
		* **Register 0** has some special properties
	* 4 Floating-Point 64-bit Registers
	* A Program Status Word (**PSW**): PC, Condition codes, Control flags
* A 32-bit machine with **24-bit addresses**
	* But no instruction contains a 24-bit address
* Data Formats
	* 8-bit bytes, 16-bit half-words, 32-bit words, 64-bit double-words
	* **The IBM 360 is why bytes are 8-bit long today!**

PS：But no instruction contains a 24-bit address 这是什么意思？那为什么要用24-bit address？22:50前 听不清楚！


## Points to Ponder 思考题

* What is the difference between an assembler and a compiler?
* What is the difference between a base and an index register?
* Why do you think we switched from the 7-bit byte in the Univac days to the modern 8 bit-byte? Hint: Think number system.
* 7 bits was sufficient to represent every printable character at that time. So why the extra bit?

## IBM 360: Initial Implementations

还有一个参数表见P12

IBM 360 instruction set architecture (ISA) completely hid the underlying technological differences between various models.

**Milestone**: The first true ISA designed as portable hardware-software interface!

**With minor modifications it still survives today!**


## IBM 360 47 Years Later: zSeries z11

各种参数见P13

2016 Z13 release
8 cores with SMT and
Vector processing @ 5 GHz, 22n

redundant datapaths

PS：了解这些参数


## Computer Architecture Topics

![](image/)

## Example ISAs (Instruction Set Architectures)


## Points to Ponder

* Why is the IBM mainframe System Z being produced today?
* What are some examples of hazards?
* Which ISA(s) in previous slide is (are) CISC?
* Explain the difference between CISC and RISC.

