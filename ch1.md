# ch1: Fundamentals of Quantitative Design and Analysis

## Introduction

SaaS / PaaS / IaaS: related to cloud computing
*  SaaS: don't need any programming knowledge
*  PaaS: need a little bit
*  IaaS: hardware infrastructure needed

instruction-level parallelism (ILP) -> data-level parallelism (DLP) -> thread-level parallelism (TLP) -> WSCs and request-level parallelism (RLP)
* 除了 ILP，其它都需要程序员注意怎么写，所以对程序员要求比较高


并行主要分两种（比较好理解，CPU执行任务，memory存储数据，两者都可以并行）：
*  Data-level parallelism (DLP)
*  Task-level parallelism (TLP)

具体硬件实现可以从以下四方面展开：
* instruction-level parallelism (ILP) 利用了DLP
  * pipelining
  * speculative execution
* Vector architectures, graphic processor units (GPUs), and multimedia instruction sets 利用了DLP
  * apply a single instruction to a collection of data in parallel
* thread-level parallelism (TLP) 利用了DLP或TLP
  * interaction between parallel threads
* request-level parallelism (RLP) 利用了TLP
  * specified by the programmer or the operating system

Flynn (1966)：
* Single instruction stream, single data stream (SISD)
* Single instruction stream, multiple data streams (SIMD)
* Multiple instruction streams, single data stream (MISD)
* Multiple instruction streams, multiple data streams (MIMD)

## Defining Computer Architecture

### Instruction Set Architecture

7 dimensions
* Class of ISA
* Memory addressing
* Addressing modes
* Types and sizes of operands
* Operations
* Control flow instructions
* Encoding an ISA

### Terminology

* organization = microarchitecture (就算ISA一样，organization也可能不同，比如pipeline的设计等等)
* core
* multiprocessor microprocessor = multicore
* Hardware (different clock rates and different memory systems)
* Architecture = ISA + Organization + Hardware

## Trend

### in Technology

* Integrated circuit logic technology
* Semiconductor DRAM (dynamic random-access memory)
* Semiconductor Flash (electrically erasable programmable read-only mem- ory)
* Magnetic disk technology
* Network technology

### in Power and Energy in Integrated Circuits

* use energy as metric rather than power (most of the time)
* calculation formulas

### in Cost

* Time, Volume, and Commoditization (怎么感觉像是讲经济学...随时时间的推移，技术进步，价格肯定降低；数量越多，那需要均摊的成本价越少，价格也会降低；还有各种商业竞争行为，所以要反垄断嘛，竞争越厉害咱们消费者越有利)
* Integrated Circuit
  * Chip, a monolithic integrated circuit without its packaging, a microchip（从某种程度上说，chip=IC）
  * Some formulas (check [here](https://github.com/NicoleMayer/ECE668-Notes/blob/master/lesson2.md#integrated-circuits-costs) for details)
    * Cost of integrated circuit
    * Cost of die
    * Dies per wafer (a little difference between textbook and slides, but I adopt the one in the slides)
    * Die Yield (check the formula [here](https://github.com/NicoleMayer/ECE668-Notes/blob/master/lesson2.md#integrated-circuits-yield))
      * 👧Actually, I don't agree with the definition of the Wafer yield in the textbook, you can check the previous link for my understanding.
  * Operation Cost (e.g. WSC)


## Dependability

👧看起来这些概念都很熟悉，像是学过的样子，问了同学本科学习《计算机组成原理》的课本是啥，原来是老师推荐的第二本教材《Computer organization and design: The hardware / software interface》，卒。老了老了，记性不好了，现在打开教材封面确实很熟悉，当年学计组的时候整本书都啃下来了，但现在还记得多少是个未知数。所以，好好做笔记是多么重要的事情！


Terminology
* service level agreements (SLAs) & service level objectives (SLOs)
* Two states: Service accomplishment & Service interruption
* failures (from state 1 to state 2) & restorations (2 to 1)
* Module reliability: use MTTF or MTBF as metrics
* Module availability: MTTF / MTBF
* mean time to failure (MTTF): inverse of the failure rate
* mean time to repair (MTTR)
* mean time between failures (MTBF) = MTTF + MTTR

## Performance


### Speedup

check [here](https://github.com/NicoleMayer/ECE668-Notes/blob/master/lesson2.md#speedup)


### Benchmarks

check [here](https://github.com/NicoleMayer/ECE668-Notes/blob/master/lesson2.md#examples-of-benchmarks)


Comments for Synthetic Benchmarks:

> 📗Regrettably for your authors—who dropped the fallacy about using synthetic benchmarks to characterize performance in the fourth edition of this book since we thought all computer architects agreed it was disreputable—the synthetic program Dhrystone is still the most widely quoted benchmark for embedded processors in 2017!


benchmark-specific compiler flags: [CPP/C++ Compiler Flags and Options](https://caiorss.github.io/C-Cpp-Notes/compiler-flags-options.html#org39cc157)


source code modifications

...

👧There are so many details in this section, please check p39-p47 for more information.

## Quantitative Principles of Computer Design

* Take Advantage of Parallelism
* Principle of Locality
* Focus on the Common Case
* Amdahl’s Law
* Clock cycle time / CPU time / CPI (cycles per instruction)