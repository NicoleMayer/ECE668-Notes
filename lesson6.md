# Lesson6 Pipeline Data Hazards

[TOC]

## Objectives &  Prior Learning

* Analyze types of data hazards
* Explore MIPS instruction pipeline
* Explore three generic data hazards
* Explore methods for dealing with data hazards


Patterson, Chapter 3 and Appendix C
* Pipeline stages
* Datapath with pipelines and latches
* Cycles per instruction calculations using pipelines 
* Instruction pipeline hazards


# Data Hazards

## How to deal with it?

Must first detect:
1. Introduce stalls (bubbles)
  * Capability to stall instructions and then release when it becomes safe to do so
2. Internal data forwarding
3. Reschedule instructions
  * Static rescheduling - by the compiler
  * Dynamic rescheduling - by the hardware
4. A combination of the above


## How to detect it? - register

### Interlock Control Logic

![](image/2020-09-12-interlock-control-logic.jpg)

Compare source registers of instruction in ID to destination register of previous instructions. Should we always stall if the rs field matches some rd? Not every instruction writes a register ⇒ we or reads ⇒ re

### Possible Source & Destination Registers

instruction types and their formats:

![](image/2020-09-05-instruction-formats.jpg)

![](image/2020-09-12-instruction-with-source-destination.jpg)


❓What is the purpose of r31?

🤔Temporary store the PC, and when the instruction wants to jump back, restore it from r31. I think it's for function stack?

👨‍🏫Right. Usually for function or subroutine calls and the instructions should come back to the saved one.

## Load & Store Hazards

Detecting the data hazards in memory is much harder!

However, the hazard is avoided because our memory system completes writes in one cycle.


# forwarding


## To Avoid RAW Data Hazard

![](image/2020-09-12-forwarding.jpg)

##  HW Change for Forwarding

![](image/2020-09-12-forwarding-hardware.jpg)


❓Why are there two forwarding paths (32 bits each) to both ALU inputs?


🤔For two source registers. Either of them will use the output of previous ALU.

👨‍🏫Right. An example from professor:

```
ADD r1, r2, r3
SUB r4, r1, r5
AND r4, r5, r1
```
ADD modify r1, but both SUB and AND need r1 with different positions. In this case, two forwarding paths are needed.


---

❓Why are there two additional paths from MEM/WB?

🤔~~I think the upper one is the data from memory and the bottom one is to check whether it is a load instruction or a store instruction.~~

👨‍🏫The upper is the data from memory, that's right but to be more specific, only load instruction. The bottom one is just the ALU results from previous stage.

## Other problems

**Data Hazard Even with Forwarding**

![](image/2020-09-12-data-hazard-even-with-forwarding.jpg)


❓Can another forwarding path be added?

🤔No.

👨‍🏫RAW hazard, can add a NOP or dyanmically find a suitable instruction to fit in the stall.

---

❓Which instructions can be fixed by forwarding when they follow `lw r1, 5(r3)` in
the given order?

```assembly
add r4,r1,r5 
sub r6,r1,r7 
or r8,r1,r9
```

🤔The second one and third one.


We can add a bubble to deal with this kind of situation:

![](image/2020-09-12-add-bubble-to-solve-data-hazard.jpg)


## Detecting Pipeline Data Hazards After LW

see slide 14 for more info

* No dependence
* Dependence requiring stall
* Dependence overcome by forwarding
* Dependence with accesses in order


# Advanced Pipeline Example: MIPS R4000

👧They divide the instructions into 8 stages. And please note the "tag check".

![](image/2020-09-12-MIPS-R4000-1.jpg)

![](image/2020-09-12-MIPS-R4000-2.jpg)

RAW Hazard:

![](image/2020-09-12-MIPS-R4000-3.jpg)

❓What are the consequences? (More stages)

👨‍🏫More stalls.

# Pipelining with Stalls - calculations

```
CPI_{pipelined} = CPI_{ideal} + Average Stall cycles per Inst

Speedup = Pipeline depth * (Cycle Time_{unpipelined} / Cycle Time_{pipelined}) * (CPI_{ideal} / (CPI_{ideal} + Avg.stall CPI))

For simple RISC pipeline, CPl_{ideal} = 1:

Speedup = (Pipeline depth / (1 + Average stall CPI Cycle Time)) * (Cycle Time_{unpipelined} / Cycle Time_{pipelined}) 

```

**Benefits of Forwarding (All Instructions)**

see a calculation in slide 19 

❓Why don't calculate with forwarding this time?

👨‍🏫Except "load", all other instructions can be forwarded using forwarding.


---

homework1 question6

嘤嘤嘤，我又做错了。。我把communication cost加在speedup里面，而没有用乘。