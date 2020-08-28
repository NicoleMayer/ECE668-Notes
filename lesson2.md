# Lesson2 Performance Metrics and Benchmarks

## Objectives

* Identify issues related to compatibility
* Examine components of IBM machines
* Analyze performance measures and benchmarks

简单的说，比一比哪个计算机好。

## Prior Learning

Textbook: Chapter 1 and Appendix C:

* Define Computer Architecture
* Explain machine code compatibility with future versions of the machine
* Understand characteristics of computer architecture
* Define Instruction Set Architecture (ISA) and hardware (HW) organization to provide interface between hardware and software

## Points to Ponder

Compared to the CISC architecture:
* Why in the RISC architecture there are LD and ST instructions only?
* Why in the RISC architecture are all the instructions the same length?
* Why is the RISC architecture considered to provide higher processor performance?
* Why the RISC architecture that has fewer instructions, runs faster?

## How to Measure Performance

* Time to run the task
	* Execution time, response time, latency
* Performance may be defined as the inverse of execution time
	* Tasks per day, hour, minute, ...
	* Throughput, bandwidth
* Individual application vs. System management

## Speedup

performance = 1 / Execution Time


"Y is N times faster than X" means:

 N = speedup = Execution_time(old brand x) / Execution_time(new brand y) = 1 + w/100


Speedup must be greater than 1; speedup of w%

Ex. Tx/Ty = 3/2=1.5 but not Ty/Tx = 2/3 = 0.67


# MIPS and MFLOPS

* MIPS (Million Instructions Per Second)
	* Can we compare two different CPUs using MIPS?

* MFLOPS (Million Floating-point operations Per Sec.)
	* Application dependent (e.g., compiler)

* How do we compare two computer systems?

* Use benchmarks
	* Standard representative programs

* Benchmarks: e.g., SPEC CPU 2000: 26 applications (with inputs)
	* SPECint: Twelve integer, e.g., gcc, gzip, perl
	* SPECfp: Fourteen floating-point intensive, e.g., equake

## SPEC CPU Benchmark

Benchmark Language Category

举例子


## Other Benchmarks

Source: L. John, “Performance Evaluation: Techniques, Tools and Benchmarks,” The Computer Engineering Handbook, CRC Press,
2001.

Ica.ece.utexas.edu/pubs/john_perfeval.pdf

## Synthetic Benchmarks

前面的太 time consuming?

Whetstone Benchmark (C/C++)

Dhrystone Benchmark


## Goals of new computer designs

* Higher performance
* More functionality (e.g., MMX,SSE,AVX)
* Other design objectives? (examples)

## How Do We Design Faster CPUs?

* Higher frequency — used to be the main approach
	* (a) Power density — too high — hard to dissipate the heat
	* (b) Reliability & yield — getting low

* Larger dies (SOC - System On a Chip)
	* Less wires between ICs but - low yield (next slide)

* Parallel processing - use n independent processors
	* Limited success for large n when executing a single application

* n-issue superscaler microprocessor (currently n=4)
	* Can we expect a Speedup =n ?

* Pipelining

* Simultaneous multi-threading


## Points to Ponder

* Why is SOC a solution?
* Why are there empty slots in the previous slide diagram?*
* What needs to be replicated for SMT?


## Integrated Circuits Yield


Die Yield = Wafer yield * {1 + Defect Density * Die area / alpha}^(-alpha)



有图

## Integrated Circuits Yield -Defects


有图

## Integrated Circuits Costs

一些计算

IC cost = (Die cost + Testing cost + Packaging cost) / Final test yield

 

Die cost = Wafer cost / (Dies per Wafer x Die Yield)


Dies per wafer = pi * (Wafer_diam/2)^2 / Die_Area - pi * Wafer diam / 根号 (2 * Die Area) - Test_Die



Die Cost goes up roughly with (Die_Area)^3


## Intel’s Clovertrail — Smartphone SOC (2013)

有图

 


