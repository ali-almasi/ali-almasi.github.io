---
layout: post
title:  An Information Theoretic Proof for the Infinitude of Primes
date:   2023-02-02 11:00:00
image: /assets/img/lassen.jpeg
caption: Lassen National Park!
usemathjax: true
---
# Introduction
Prime numbers are among the most fascinating mathematical objects, and their studies have led to advancements in several areas of mathematics. One of the oldest theorems about primes is that the sequence of primes is not finite. The oldest proof is due to Euclid, circa 300 B.C., which can be found in *Elements, Book IX, Proposition 20*. Since then, many different proofs have been given for this statement, a pretty exhaustive list of which can be found in [1]. In this blog post, I will present a proof by Chaitin, given in [2]. This proof was one of the problems in the final exam of a course I had on information theory, and I have to thank [Thomas Debris-Alazard](https://tdalazard.io/) for including this beautiful problem in that exam.

# Proof
Let $n$ be an integer and define $N$ as the uniform random variable whose support is the set $\\{ 1,2, \dots, n \\}$. The number of primes less than or equal to $n$ is denoted by $\pi(n)$, known as the prime-counting function. Let $p_1 < p_2 < \cdots < p_{\pi(n)}$ be the sequence of primes less than or equal to $n$. For $i \leq \pi(n)$, define a random variable $X_i$ as the exponent of $p_i$ in the prime factorization of $N$.

By the fundamental theorem of arithmetic, $(X_1, \dots, X_{\pi(n)})$ is a function of $N$ and vice versa. Therefore, 
$$ H(X_1, \dots, X_{\pi(n)}) = H(N),$$
where $H(\cdot)$ denotes the Shannon entropy.
