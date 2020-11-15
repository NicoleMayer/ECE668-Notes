❓The LRU replacement algorithm is commonly implemented rather than the optimal replacement algorithm since the latter requires a more expensive implementation.

👨‍🏫The Statement is wrong. The optimal replacement algorithm requires knowledge of the future, which can not be predicted with certainty. Therefore, we can not implement it.

---

❓For very large block sizes, conflict misses increase as block size increases.

👨‍🏫The Statement is correct.

🤔Yeah, I figured it out after the quiz. I always thought that it was the miss penalty that increases rather than the miss rate. Actually, there is an assumption that the overall cache size is fix so that the entries become less if the block size increases. In this case, no wonder the conflict misses increase.

---

真的很伤心，发邮件问老师两个问题很敷衍的回答，还加了一个感叹号，我看着心都凉了，差点被他震慑到放弃我的立场了。Anyway，花了比预期多了好几倍的时间收集资料怼回去！想起来之前问老师ppt上的一个错误，查阅了官网硬件说明，那个引脚个数明明是老师写错了还不承认，唉，遇到我这么较真的学生真是老师的痛苦。