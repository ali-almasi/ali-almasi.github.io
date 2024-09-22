---
layout: post
title:  An Information Theoretic Proof for the Infinitude of Primes
date:   2023-03-20 11:00:00
usemathjax: true
---
# Introduction
Prime numbers are among the most fascinating objects in mathematics, and their study has led to advancements in several areas of mathematics. One of the oldest known theorems about primes is that the sequence of primes is infinite. The earliest existing proof, attributed to Euclid circa 300 B.C., can be found in *Elements, Book IX, Proposition 20*. Since then, many different proofs for this statement have emerged, with a comprehensive list compiled in [1].

In this blog post, I will present a proof due to Gregory Chaitin, which can be found in [2]. This proof was featured as a problem on the final exam for a course I took on information theory. I would like to thank [Thomas Debris-Alazard](https://tdalazard.io/) for including this elegant problem in that exam.

# Proof
Let $n$ be a natural number, and define $N$ as a uniform random variable whose support is the set $\\{ 1,2, \dots, n \\}$. The number of primes less than or equal to $n$ is denoted by $\pi(n)$, known as the prime-counting function. Let $p_1 < p_2 < \cdots < p_{\pi(n)}$ represent the sequence of primes less than or equal to $n$. For $1 \leq i \leq \pi(n)$, define a random variable $X_i$ as the exponent of $p_i$ in the prime factorization of $N$.

By the [Fundamental Theorem of Arithmetic](https://en.wikipedia.org/wiki/Fundamental_theorem_of_arithmetic), $(X_1, \dots, X_{\pi(n)})$ is a function of $N$ and vice versa. Therefore, we have
\\[ H(X_1, \dots, X_{\pi(n)}) = H(N), \\]
where $H(\cdot)$ denotes [Shannon entropy](https://en.wikipedia.org/wiki/Entropy_(information_theory)). Since $N$ is a uniform random variable on a support of size $n$, $H(N) = \log n$. On the other hand, we can bound $H(X_1, \dots, X_{\pi(n)})$, using the inequality 
\\[ H(X_1, \dots, X_{\pi(n)}) \leq \sum_{i=1}^{\pi(n)} H(X_i). \\]
The cardinality of the support of $X_i$ is $\lbrack \log_{p_i} n \rbrack + 1 \leq \log n + 1$, thus, 
\\[ H(X_i) \leq \log (\log n + 1), \\]
which leads to the inequality 
\\[ \pi(n) \geq \frac{\log n}{\log (\log n + 1)}. \\]
As $ n \to \infty$, the right-hand side of this inequality tends to infinity, implying that $\pi(n)$ becomes arbitrarily large.
Q.E.D.

It is worth noting that this approach not only proves the infinitude of primes, but also provides a lower bound on the prime-counting function, which is of great interest to many mathematicians.

# An Excercise
It is possible to improve the bound obtained above to
\\[ \pi(n) \geq \frac{ \log n}{2 \log 2}, \\]
using a different factorization of $n$. Can you provide a proof?

# Bibliography
[1] Meštrović, R. (2012). Euclid's theorem on the infinitude of primes: a historical survey of its proofs (300 BC--2022) and another new proof. arXiv preprint arXiv:1202.3670.
[2] Chaitin, G. J. (1977). Toward a Mathematical Definition of Life, 2. IBM Thomas J. Watson Research Division.
