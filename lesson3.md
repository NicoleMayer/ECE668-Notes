# Lesson3 Amdahl’s Law, CPI, and Arithmetic Pipelines

[TOC]

❓Besides higher frequency, larger dies, more parallel processing, superscalar,
pipelines, and simultaneous multithreading, what other ways can you think of
that can be used to increase processor speeds?

🤔Increase the voltage. Re-design the adder, multiplier, divider... Any component that needed in the ALU implementation. Caches maybe, since if the memory access is slow, it will become the bottleneck and limit the processing speed.

👨‍🏫My answer is correct. Basically the problem is about memory access. Adding multiple layer's cache is a good solution. But there are also other solutions, like buffer (both for data and instructions). Besides, using specialized processing units rather than general-propose processors also helps. Last but not the least, quantum computing.

ℹ️Turbo mode 28:05 听了很久没听懂的...本来以为自己英语不好，原来是孤陋寡闻，我的词库里没有这个东东... 

📗Intel started offering Turbo mode in 2008, where the chip decides that it is safe to run at a higher clock rate for a short time, possibly on just a few cores, until temperature starts to rise. 看书里的定义有印象了，就是没记得这个专有名词。本质上还是 higher frequency 的范畴。


## Amdahl’s Law

Assume we are xecuting a program on N independent processors:

```latex
Fraction_{enhanced} = parallelizable part of program 

Speedup_{enhanced} = n

ExTime_{new} = ExTime_{old} * (1 - Fraction_{enhanced}) + ExTime_{old} * Fraction_{enhanced} / n

Speedup_{overall} = ExTime_{old} / ExTime_{new} = 1 / [(1 - Fraction_{enhanced}) + Fraction_{enhanced} / Speedup_{enhanced}]

lim(n->$\infty$) speedup_{Overall} = 1 / (1 - Fraction_{enhanced})
```

👨‍🏫This fraction can be either executing time wise or instruction number wise.

👧We notice that there is an upper bound of the overall speedup, that is `1 / (1 - Fraction_{enhanced})`. Slide 8 gives an example.

---

❓For the upper bound of 1.66 how much time does Mpy take?

🤔Infinite close to zero?

👨‍🏫Correct.

---

![](image/2020-09-02-speedup-graph.jpg)

❓Why does the practical curve go down?

🤔As the number of processors becomes larger, the running program should be cut into more divisible parts. That's hard when the tasks are really small enought that can't be divided any longer. In that case, some processors are redundant and they can't be taken good advantage. Besides, more processors means there may be more communication costs, which leads to the decrease of the speedup.


👨‍🏫First, when multiple processors access the same cache line, memory data, there may be a collision, which brings a lot of I/O costs. Both for data input and output (if we want things to go together in the end). Second, when you divide the tasks into multiple pieces, the time saving for multiple processors usually less than the time for communication.

## CPI

Average CPU time per program:

![](image/2020-09-02-CPU-time.jpg)


ℹ️End to End Argument: what RISC was ultimately about - it is the performance of the complete system that matters, not individual components!

check the [original paper](https://web.mit.edu/Saltzer/www/publications/endtoend/endtoend.pdf) and [zhihu explanization](https://zhuanlan.zhihu.com/p/55311553).

### Aspects of CPU Performance

![](image/2020-09-02-CPU-influence.jpg)

### Cycles Per Instruction

**Average Cycles per Instruction:**

CPI = Total_No_of_Cycles / Instruction Count

**CPI of Individual Instructions:**

CPl_j - CPI for instruction type j (j=1,...,n)

I_j - # of times instruction j is executed

CPU time = Cycle Time x sum(CPI_j * I_j)

**Instruction Frequency:**

CPI = sum(CPI_j * F_j) where F_j = I_j / Instruction Count

Check slide 12 for a calculation example.


❓Why is ALU only one cycle?

🤔Compared with load, store, ALU don't need to be interacted with memory, which takes a long time to execute; compared with branch, ALU is determinstic and sequential.

👨‍🏫Ummm, my answer is in the wrong direction. As we can see in the last few slides, we can adopt **pipeline** into the implementation of ALU, which will hugely increase the performance.


## Arithmetic Pipelines

### Ideal vs non-ideal pipelines

![](image/2020-09-02-pipeline-example.jpg)

* latency
* throughput
* Speedup
* Non-Ideal -> latches


**k-stage Pipeline - Speedup:**

![](image/2020-09-02-k-stage-pipeline.jpg)

❓Why the practical case will decrease at somewhere?

👨‍🏫The more stages, the more hardware support. But sometimes an instruction cannot be divived into so many stages. So they cannot be executed at the same time.

### Arithmetic Pipelines

TI 家的 Advanced Scientific Computer (check [wiki](https://en.wikipedia.org/wiki/TI_Advanced_Scientific_Computer) for more info):

![](image/2020-09-02-Ti-ASC.jpg)

❓What can be done to remove the bottleneck?

🤔Confused about the question.

---

Multiplier ->  Pipelined Multiplier

![](image/2020-09-02-multiplier.jpg)

![](image/2020-09-02-pipelined-multiplier.jpg)