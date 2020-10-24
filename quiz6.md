❓A MIPS R4000-like processor has an 8-stage pipeline and uses a Branch Target Buffer (BTB) in its dynamic branch prediction unit to reduce the penalty due to branches. A branch instruction when executing in the pipeline, calculates the target address in the 3rd stage and the branch condition is evaluated in the 4th stage. It was found that the probability that branches that have entries in the BTB are correctly predicted is 0.92. The probability that a branch has any entry in the BTB is 0.83. The instructions executing in this processor include 12% conditional branches and 0.63 of them are taken. Also assume that any update to the BTB results in a 1 cycle stall in the pipeline. Calculate the contribution of conditional branches to the CPI of the processor. Round your answer to four decimal places.

👨‍🏫CPI(conditional branches) = Prob(cond. branch) * [(Prob(hit in BTB) * Prob(incorrect prediction) * Penalty) + (Prob(miss in BTB) * Prob (branch taken) * Penalty)] That is `(0.83*0.08*4+0.17*0.63*4)*0.12=0.0833`
I forget to add the percentage of branch instructions and the answer is reasonable.

---

❓For the modified 5-Stage MIPS pipeline (Lesson 8, Slide 8), what is the penalty (in cycles) when the PC of an instruction is not found in the branch target buffer (Lesson 14, Slide 21) and the instruction is a taken branch?

🤔branch resolution + update the branch target buffer => 2 cycles ~~I don't buy the answer...~~ The penalty for updating the BTB should be considered only if there is only one port for BTB. By default, the BTB has 2 ports so we don't need to consider about it.

👨‍🏫See Lesson 14, Slide 21. One cycle is needed for branch resolution and one to update the branch target buffer, but the latter overlaps the fetch of the instruction from the target.

---

❓For the modified 5-Stage MIPS pipeline (Lesson 8, Slide 8), what is the penalty (in cycles) when the instruction PC is in the branch target buffer (Lesson 14, Slide 21), but the instruction was not a taken branch?

🤔Wrong fetch + delete the entry from BTB => 2 cycles ~~I don't buy the answer...~~ same as previous question

👨‍🏫See Lesson 14, Slide 21. Cycles lost to wrong fetch, flushing wrong fetched instruction, restarting fetch at other target and deleting entry from target buffer.

---

❓The number of entries in the Reorder Buffer must be the same as that in the Result Shift Register. => False

👨‍🏫The number of entries in the Reorder Buffer is determined by the number of instructions 'in flight' while the number of entries in the Result Shift Register is determined by the number of cycles of the operation with the longest execution time.

---

❓Parallel processing uses multiple cores on a single die to run one or more programs simultaneously. 

🤔I think it's ok for running on mutiple dies. But the given answer thinks it's right. [Evidence](https://en.wikipedia.org/wiki/Multi-core_processor):

> Manufacturers typically integrate the cores onto a single integrated circuit die (known as a chip multiprocessor or CMP) or onto multiple dies in a single chip package.

👨‍🏫I asked the professor about this question and he said, "emphasizing the cores on a single die, does NOT make the statement wrong." so the lesson is that don't pay excessive attention to wording!