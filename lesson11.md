# Lesson 11 Tomasulo Loop Examples

[TOC]

## Objectives &  Prior Learning
* Analyze various examples of Tomasulo’s Loop 
* Explore overlapping iterations of loops
* Analyze advantages of Tomasulo’s scheme
* Demonstrate mastery of course concepts


Patterson, Chapters 1 and 3, and Appendix C
* Hardware dynamic scheduling using Tomasulo’s algorithm
* Distributed control of functional units
* Use of reservation stations
* Uses a common data bus
* Three phases (issue, execute, and write result)

## Tomasulo Loop Example

```
Loop:   LD    F0  0 R1 
        MULTD F4 F0 F2 
        SD    F4  0 R1 
        SUBI  R1 R1 #8
        BNEZ  R1 Loop
```

* This time assume Multiply takes 4 clocks
* Assume first load takes 8 clocks (L1 cache miss), second load takes 4 clocks (hit)
* To be clear, will show clocks for SUBI, BNEZ
  * Reality: integer instructions ahead of Floating Point Instructions 🤔
* Show 3 iterations of loop

![](image/2020-10-03-loop-example.jpg)

### Loop Example Cycle 1

![](image/2020-10-03-loop-example-cycle1.jpg)

### Loop Example Cycle 2

![](image/2020-10-03-loop-example-cycle2.jpg)

### Loop Example Cycle 3

![](image/2020-10-03-loop-example-cycle3.jpg)

### Loop Example Cycle 4

![](image/2020-10-03-loop-example-cycle4.jpg)

### Loop Example Cycle 5

![](image/2020-10-03-loop-example-cycle5.jpg)

### Loop Example Cycle 6

![](image/2020-10-03-loop-example-cycle6.jpg)

register renaming:
* One might think a WAW hazard exists because the second load will moving data into F0 while the multiply is still working with the old value of F0.
* However no WAW hazard exists because the data in F0 was already read and stored in the multiplying functional unit’s reservation station.
* The concept is that instead of loading data into F0 then the multiplier reads it from F0 as the code indicates, the data is actually loaded into the reservation station of the multiplying functional unit grabs it from there.
* Basically a direct path from the loader to the multiplier exists using the reservation station while F0 is bypassed.
* The F0 register only serves to indicate this path.
* It is as though each iteration has its own register F0.
* Actually each functional unit has its own reservation station that stores all the data it needs to complete its task so that the input registers can be used avoiding WAW hazards.
* This is the “register renaming” concept.

❓What is the maximum number of multiplier functional units (or reservation stations for a pipelined multiplier functional unit) we can add to improve performance for this example?

🤔 1

### Loop Example Cycle 7

![](image/2020-10-04-loop-example-cycle7.jpg)

### Loop Example Cycle 8 

![](image/2020-10-04-loop-example-cycle8.jpg)

### Loop Example Cycle 9

![](image/2020-10-04-loop-example-cycle9.jpg)

### Loop Example Cycle 10

![](image/2020-10-04-loop-example-cycle10.jpg)

### Loop Example Cycle 11

![](image/2020-10-04-loop-example-cycle11.jpg)

### Loop Example Cycle 12

![](image/2020-10-04-loop-example-cycle12.jpg)

### Loop Example Cycle 13

![](image/2020-10-04-loop-example-cycle13.jpg)

### Loop Example Cycle 14

![](image/2020-10-04-loop-example-cycle14.jpg)

### Loop Example Cycle 15

![](image/2020-10-04-loop-example-cycle15.jpg)

### Loop Example Cycle 16

![](image/2020-10-04-loop-example-cycle16.jpg)

### Loop Example Cycle 17

![](image/2020-10-04-loop-example-cycle17.jpg)

### Loop Example Cycle 18

![](image/2020-10-04-loop-example-cycle18.jpg)

### Loop Example Cycle 19

![](image/2020-10-04-loop-example-cycle19.jpg)

### Loop Example Cycle 20

![](image/2020-10-04-loop-example-cycle20.jpg)


## Details
* If there was a third multiplying functional unit it could have executed three loops concurrently since there are three loaders and three stores.
* Execution Completion and Write Result order: 1 3 5 2 4 6;
* Note the order at which instructions have completed: Ld, Ld, Mult, Mult, St, St.
* This resembles Loop unrolling – what a compiler would do, as we will see later on in the class.

❓Why Can Tomasulo Overlap Iterations of Loops?

1. Register renaming
   * Multiple iterations use different physical destinations for registers (dynamic loop unrolling)
2. Reservation stations
   * Permit instruction issue to advance past integer control flow operations
   * Also buffer old values of registers - totally avoiding the WAR stall that we saw in the scoreboard
3. Other perspective: Tomasulo building data flow dependency graph on the fly


## Summary: Tomasulo’s Scheme Offers Two Major Advantages
(1) The distribution of the hazard detection logic
* Distributed reservation stations and the CDB
* If multiple instructions waiting on single result, & each instruction has the other operand, then instructions can be released simultaneously by broadcast on CDB.
* If a centralized register file were used, the units would have to read their results from the registers when register buses are available.

(2) The elimination of stalls for WAW and WAR hazards