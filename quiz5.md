❓Suppose we have a program containing 18% branch instructions, 69% of which are taken and the rest are not taken. Calculate the CPI if the hardware always predicts not taken. Consider only branch penalties, ignore all other hazards. Assume a correctly predicted branch takes 1 cycle while an incorrectly predicted branch takes 2 cycles to complete. Assume all instructions that are not branches take only 1 cycle. (Round to two decimal places.)

🤔`(1-0.18)+0.18*(0.69*1+0.31*2)=1.06`

👨‍🏫The correct answer is wrong. Mine is right.

---

❓Consider a program that executes 24% branch instructions. 5% of them are unconditional branches, 6% are untaken conditional branches and the rest are taken conditional branches. In the case of the MIPS R4000 (refer to Lesson 8 - Slide 13), what will be the CPI in the 'Branch not Taken' case? Ignore all other types of hazards and assume the ideal CPI = 1.

Assume that the target address calculation is done in the decode stage while the branch condition evaluation is done in the execute (ALU) stage. (Round to two decimal places.)

🤔`1+0.24*(0.05*2+(1-0.05-0.06)*3)=1.66`

👨‍🏫`1+0.05*2+(0.24-0.05-0.06)*3=1.49` SO HOW TO DISTINGUISH THE PERCENTAGE?

---

❓Consider a program that executes 23% branch instructions, 7% of those are unconditional branches, 5% are untaken conditional branches and the rest are taken conditional branches. In the case of the MIPS R4000 (refer to Lesson 8 - Slide 13), what will be the CPI in the 'Branch Taken' case? Ignore all other types of hazards and assume the ideal CPI = 1.

Assume that the target address calculation is done in the decode stage while the branch condition evaluation is done in the execute (ALU) stage. (Round to two decimal places.)

🤔 `1+0.23*(0.07*2+0.05*1+(1-0.07-0.05)*2)=1.45`

👨‍🏫 `1+0.07*2+0.05*3+(0.23-0.07-0.05)*2=1.51` Same argue as previous question. Also, for untaken branches, the penalty should be 3. I doubt that if I misunderstand the "predict branch taken"? I mean despite that we predict branch taken, at first we can't calculate the target address, so we will still use the next instructions until the branch instruction finds the target address. If this is the case, only 1 stall is needed.

---

❓A MIPS-like pipelined processor has the following five stages: IF, ID, EX, MEM and WB. When executing conditional branches the condition is checked in the ID stage while the branch target address is calculated in the EX stage. Assume that the processor supports data forwarding and delayed branches for which you will need to decide on the number of delay slots. You are given the following program segment:

```
S1: SUB R1, R2, R3                     /* R1 is the destination */
S2: Add R4, R3, R5                    /* R4 is the destination */
S3---Sn-1: Instructions not modifying R1 or R4
Sn: BZ R4, 100(R1)                   /* Branch to 100+ (R1) if R4 = 0 */
```

How many delay slots should you include in the design to optimize the performance of the above program segment assuming that n > 5? What would be the total number of cycles required to execute this program segment after the delay slots are usefully filled? Can we reduce the number of cycles for n = 3 by doing some rescheduling?

The answers in the order of the questions are:

```
a. 2, n+4, Yes 
b. 3, n+4, No
c. 3, n+5, Yes
d. 2, n+1, Yes
e. 2, n+4, No
```

🤔 When I was doing the quiz, I thought the third part of this question for a long time. Finally, I thought swap the S1 and S2 would help. In this case, S3 branch instruction can calculate whether to branch earlier. Note that "When executing conditional branches the condition is checked in the ID stage while the branch target address is calculated in the EX stage." makes this problem special.

---

❗️Final question: always be carefully about the question, calculate the CPI or the **contribution** to the CPI !!!