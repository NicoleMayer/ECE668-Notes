# Lesson5 MIPS Instruction Pipeline

[TOC]

## Objectives &  Prior Learning

* Explore the stages of pipelining
* Analyze the steps of MIPS datapath
* Explore methods for visualizing pipelining
* Explore methods for calculating CPI
* Analyze structural hazards


Patterson, Chapter 3 and Appendix C 
* Typical RISC architecture
* RISC data formats and memory addresses 
* MIPS Instruction set architecture
* MIPS control signals and data paths

# Pipeline Stages

2 stages or 5 stages:

![](image/2020-09-08-execution-cycles.jpg)


# Pipeline Datapath


## datapath w/o pipeline registers

![](image/2020-09-08-execution-cycles2.jpg)


❓What is the Address register?

🤔To store the instruction address.

👨‍🏫PC - program counter.

---

❓Why +4?

🤔To fetch the next instruction. The instruction is 32-bit and is accessed by byte-addressing mode.

👨‍🏫Right.

---

❓What are the 2 inputs to DataMem?

🤔The data's address that will be overwritten and the updated value.

👨‍🏫Right. The upper one is for address and the bottom one is for data.

PS: I add some comments on the data path. After figuring out each line and box in the diagram, it's much easier to understand all of these questions.

![](image/2020-09-11-implementation-with-comments.jpg)

---

❓What instruction uses MD?

🤔I don't know what MD short for...

👨‍🏫Fine, MD means memory data register. So I know it's for load instruction...

A student ask: is there possible to directly use the results of MD in ALU? (I think he means fowarding)

👨‍🏫Yeah, actually we use latches instead of MD afterwards for pipelining.

---

❓What is the purpose of Mux?

🤔Combined with some control signals to select a correct way, that means doing sth or not.

👧See my previous image with comments. Everything is clear.


---


❓Can this implementation (without the common bus) be pipelined?

🤔Yes.

👨‍🏫Correct.

## datapath with pipeline registers

![](image/2020-09-08-mips-datapath.jpg)


## pipelined datapath 

![](image/2020-09-08-pipelined-datapath.jpg)

And there are some technology assumptions to ensure:

* A small amount of very fast memory (caches) backed up by a large, slower memory
* Fast ALU (at least for integers)
* Multiported Register files (slower!)

Thus, the following timing assumption is made:

t_{IM} ≈ t_{RF} ≈ t_{ALU} ≈ t_{DM} ≈ t_{RW}

# 2 ways to visualize the pipeline

Visualizing Pipelining - 1st way:

![](image/2020-09-08-pipeline-visualize.jpg)


❓Which are potential problems with the pipeline?

A. Two instructions are trying to use the same memory unit at the same time.

B. One instruction needs the results from the previous instruction to complete its computation.

C. One instruction is a jump and the instructions after it do not execute at that time.

D. The current instruction caused an exception and the remaining instructions are invalid.

E. All of the above.


🤔E. All of the above.

👨‍🏫Correct.

---

Visualizing Pipelining - 2nd way:

![](image/2020-09-08-pipeline-visualize2.jpg)

# CPI comparsion between different machines

Bus-based machine / Unpipelined n-stage machine / Pipelined machine

![](image/2020-09-08-CPI-calculation.jpg)

Speedup calculation for Instruction Pipeline: see slide 14.


# Hazards

* Instructions interact with each other in pipeline
* Hazards prevent next instruction from executing during its designated clock cycle

* Issues:
  * How to detect?
  * How to minimize the penalty?

## Structural Hazards

An instruction in the pipeline may need a resource being used by a previous instruction in the pipeline (e.g., address calculation for one instruction using the same adder used for addition in another instruction).


❓Give another example of a structural hazard.

🤔Data and instruction are stored in the same memory. When they are accessed at the same time, then structural hazard will happen.

---

One Memory Port Example (See slide 16-17)

👨‍🏫One possible way is to use two ports for reading, one port for writing. 

Several questions:

❓Why is the first instruction here a LOAD?

🤔Any instruction can be executed at first, as long as the user want...

👨‍🏫I think professor thinks in my way, and he just want to emphasize that some instructions can cause a hazard.

---

❓How can this be detected?

🤔Something like lock? One time only one people can access something. If we want to detect it before executing, maybe it is compiler's responsibility.

---

❓What can be done? Should the clock be stopped for one cycle?

🤔Install some bubbles or just wait for one extra cycle.

---

❓How can this hazard be avoided?

🤔Optimize the instruction's order? And a more direct way is to add more hardware support.

---

### Resolving Structural Hazards

* Structural hazards occurs when two instruction need same hardware resource at same time
  * Can resolve in hardware by stalling newer instruction till older instruction finishes with resource
* A structural hazard can always be avoided by adding more hardware to design
  * E.g., if two instructions both need a port to memory at same time, could avoid hazard by adding second port to memory
* **Our 5-stage pipe has no structural hazards by design**


## Data hazards

Instruction depends on (data) result of prior instruction still in the pipeline.


There are three generic data hazards:
1. RAW (Read after write)
2. WAR (Write after read)
3. WAW (write after write)

### 1st Generic Data Hazard - RAW

![](image/2020-09-08-RAW.jpg)

 
Data Hazard on R1:

![](image/2020-09-01-RAW-hazard.jpg)


❓How many stalls for SUB?

🤔2 stalls.

👨‍🏫Right.

---

❓How can penalty be reduced?

🤔forwarding? re-order?

👨‍🏫Right. Extra hardware also helps.

### 2nd Generic Data Hazard - WAR

![](image/2020-09-08-WAR.jpg)

### 3rd Generic Data Hazard - WAW

![](image/2020-09-08-WAW.jpg)

## Control hazards

Branches and jumps

## Interrupts/exceptions

/




PS: I feel sleepy when I listened the lectures so I didn't follow really well.

PS2: Professor also talks about something in the quiz and homework. Due to the limited time, many questions in the lecture haven't been discussed.