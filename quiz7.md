❓If one were to switch to a VLIW format, the program size shrinks relative to the original sequential program because many of the instructions are now grouped together for simultaneous execution.

👨‍🏫The Statement is wrong. Program size increases because the compiler can’t always fill all slots in a packet and hence adds no-ops to fill them.

🤔Need to understand how to define the "program size".

---

❓The loop `for (i = 0; i<=100; i = i + 1) (A[2i] = B[i] + C[i]; B[2i + 1] = A[2i + 3] + C[i + 1])` can be unrolled.

👨‍🏫The Statement is wrong. 

🤔For array A, a=2 b=0 c=2 d=3, gcd(a,c)=2, d-b=3, gcd(a,c) can't divide (d-b), no dependence
For array B, a=2 b=1 c=1 d=0, gcd(a,c)=1, d-b=-1, gcd(a,c) can divide (d-b), dependence -> check failed

---

❓Branch penalties will be less in an N-Issue Superscalar than in a single issue pipeline.

👨‍🏫The Statement is wrong. Branch penalties are higher in the N-lssue Superscalar because more instructions are affected by a stall than in the basic pipeline.

---

❓The exception that corresponds to the earliest (issued first) instruction must be handled first, which is not necessarily the exception that occurred first.

👨‍🏫The Statement is wrong. 

🤔Maybe the wrong part is "issued first", superscalar machine can issue multiple instructions simultaneously.

(Update)Steven helped me to ask professor this question and professor said the statement is correct and the given answer is wrong.

---

❓In an 4-issue superscalar, in order to detect data and structural hazards between the instructions in the packet, we need to do 32 register comparisons.

👨‍🏫The Statement is correct. `2*N*N`

🤔In my opinion, it should be `N*N-N`

(Update)Steven helped me to ask professor this question but he didn't give me a clear feedback. He thought the calculation should be `2*N*(N-1)+(N-1)` but I don't agree. First, the question asks for "register" comparisons, so structural hazards `N-1` shouldn't be counted. Second, how does `2*N*(N-1)` come from? If only consider RAW, then we just need `N*(N-1)`; if we consider other hazards, then it definitely will be larger than `2*N*(N-1)`.