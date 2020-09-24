事实上，在写quiz3的总结时，quiz4的成绩已经出来了，可是我当时忙于其它事情所以一直拖延着。

quiz的成绩真的是很大的打击，说很大其实也有点夸张，在大三上学期经历过滑铁卢之后还是比较佛系的。但我看到成绩的那一刹那真的怀疑自己有在学吗。。唔，刚刚和老爸说了这事，他开始教育我，你现在的目标不是A，而是pass。说得也挺对，绩点已不再那么重要，对于phd，research才是重中之重。前不久看了导师转发的《10 Easy Ways to Fail a PhD》，有一条就是在讲“过度在意成绩或课程作业”不是导师所看好的，因为那意味着“本应该用于研究的时间被浪费在了课堂上”。说得很有道理，但我做不到不学课程而只搞科研，我觉得我现在能达到的境界就是：做我该做的，听课做笔记，不懂之处看看书（之后也不太会完完整整看一遍书了，只挑和课堂内容相关的看），quiz不懂问问老师。

---

# Concepts

❓The Op. Code field is 6 bits long and as a result, the MIPS instruction set includes 64 instructions.❌

👨‍🏫The FUNC field in the ALU format allow more than 64 instructions. 

---

❓All MIPS instructions use all the 32 bits in their format. ❌

👨‍🏫JR, for example, uses only 11 out of the 32 bits. 

---

❓Increasing the number of the general-purpose registers in MIPS from 32 to 64 will reduce the range of immediate operands by a factor of `___`?

👨‍🏫An ALU instruction with an immediate operand has two register field that would need 12 instead of 10 bits reducing the range of the immediate operand by a factor of 4.

---

❓The numbers (addresses) assigned to the floating-point registers in a processor must be different from those assigned to the integer (general-purpose) registers.❌

👨‍🏫The addresses for the floating point registers do not need to be different from the integer registers (actually they're better be the same), however, they will be recognized by the instruction op-code and will have their own RF. The correct answer is: No, they do not have to be different

---

❓The IF/ID and ID/EX inter-stage registers in the MIPS processor include the same number of bits. ❌

👨‍🏫For example, IF/ID includes register numbers (5-bit IDs) while ID/EX includes registers' content (32-bit data). 

# Calculations

I made the same problems for all the calculations:

❓A 5-stage pipeline has a single unified instruction and data memory capable of performing a single Read or Write operation every clock cycle. Assume that 28% of the executed instructions are Loads and 13% are Store. Ignoring any data hazards and control hazards that may occur, what is the speedup of the pipeline that has separate instruction and data memories over the pipeline with a single unified memory? (Round to two decimal places)

🤔The correct answer is 1 + (28%+13%) = 1.41. ~~And I think it’s not so accurate. From my perspective, assume there is 100 instructions, then the count of load and store instructions are 28 and 13 separately. In this case, the old cycles = 5 + (100-1) =104, the new cycles = 5 + (100-1) + 28 + 13 = 145, so the speedup = 145/104=1.39~~

👨‍🏫Each Load and Store instruction will result in a single stall cycle in the original pipeline with unified memory. However, in the design with separate instruction and data memories, there would not be any stalls.

----

❓A 5-stage pipeline has a Register File that can execute either a Read operation (of 1 or 2 registers) or a Write operation (into only one register), but not both, during every clock cycle. The instruction mix that the processor executes contains 39% ALU, 27% Load, 14.7% Store and the rest Branch instructions. Ignoring any data hazards and control hazards that may occur, what is the speedup of the pipeline that has a Register File capable of performing two reads and one write every cycle over the pipeline with the limited Register file? (Round to two decimal places)

🤔Only the instructions involve write back stage will lead to a stall, and these instructions include ALU and load. ~~So similar to the previous question, my answer is speedup =  the old cycles / the new cycles = (5 + (100-1) + 39 + 27) / (5 + (100-1)) = 1.63. The correct answer is 1+39%+27% = 1.66~~

👨‍🏫Every ALU or Load instruction that write into the Register Files will stall the pipeline by one cycle, due to the Structural Hazard.

----

❓The only instruction in the 5-stage pipelined MIPS that needs all 5 stages, is Load. It has been suggested to design a 4-stage pipeline where the 4th stage will allow either a memory (read or write) operation, or a Register File write.
The Load instruction will then be replaced by two instructions: Load-A (read from memory) and Load-B (write into the register file). The instruction mix that the processor executes contains 24% ALU instructions, 20% Load, 18% Store and the rest Branch. Ignoring all hazards and assuming that the two pipelines will have the same cycle time, what is the speedup of the 5-stage pipeline over the 4-stage one? (Round to two decimal places)

🤔~~Assume there is 100 instructions, then the count of load instructions are 20 and 80 for other instructions. Since the original signal cycle of load instruction is replaced by two, so we can think there are 40 load instructions in this case. So my answer is speedup =  the 5-stage cycles / the 4-stage cycles = (4+80+20*2-1) / (99+5) = 1.18.~~ But the answer just gives the percentage of load instructions 1+20%=1.2?

👨‍🏫The CPI of the two pipelines is the same (i.e., 1) but the number of instructions for the 4-stage pipeline will increase by 20%.