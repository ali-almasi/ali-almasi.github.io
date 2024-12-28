---
layout: post
title:  "An Information Theoretic Proof for the Infinitude of Primes"
date:   2024-06-11
categories: maths
permalink: /blog/prime-infinitude1.html
use_math: true
---

# Introduction
Prime numbers are among the most fascinating objects in mathematics, and their study has led to advancements in several areas of math. One of the oldest known facts about primes is that the set of primes is not finite. The earliest existing proof for this statement is perhaps the one due to Euclid and can be found in *Elements, Book IX, Proposition 20*. Many different proofs, however, have emerged since then, with a comprehensive list compiled in [1].

In this blog post, I will present two computer science-inspired proofs for the infinitude of primes. The first proof is due to Gregory Chaitin [2] and it uses the notion of Shannon entropy, which is a fundamental concept in information theory. The second proof is due to Aalok Thakkar [3], which was recently featured in American Mathematical Monthly. The latter uses some tools from automata theory.

# Chaitin's Proof
Let $n$ be a natural number, and define $N$ as a uniform random variable whose support is the set $\\{ 1,2, \dots, n \\}$. The number of primes less than or equal to $n$ is denoted by $\pi(n)$, known as the prime-counting function. Let $p_1 < p_2 < \cdots < p_{\pi(n)}$ represent the sequence of primes less than or equal to $n$. For $1 \leq i \leq \pi(n)$, define a random variable $X_i$ as the exponent of $p_i$ in the prime factorization of $N$.

By the [Fundamental Theorem of Arithmetic](https://en.wikipedia.org/wiki/Fundamental_theorem_of_arithmetic), $(X_1, \dots, X_{\pi(n)})$ is a function of $N$ and vice versa. Therefore, we have
\\[ H(X_1, \dots, X_{\pi(n)}) = H(N), \\]
where $H(\cdot)$ denotes [Shannon entropy](https://en.wikipedia.org/wiki/Entropy_(information_theory)). Since $N$ is a uniform random variable on a support of size $n$, $H(N) = \log n$. On the other hand, we can bound $H(X_1, \dots, X_{\pi(n)})$, using the inequality 
\\[ H(X_1, \dots, X_{\pi(n)}) \leq \sum_{i=1}^{\pi(n)} H(X_i). \\]
The cardinality of the support of $X_i$ is $\lbrack \log_{p_i} n \rbrack + 1 \leq \log n + 1$, thus, 
\\[ H(X_i) \leq \log (\log n + 1), \\]
which leads to the inequality 
\\[ \pi(n) \geq \frac{\log n}{\log (\log n + 1)}. \\]
As $ n \to \infty$, the right-hand side of this inequality tends to infinity, implying that $\pi(n)$ becomes arbitrarily large.\

It is worth noting that this approach not only proves the infinitude of primes, but also provides a lower bound on the prime-counting function, which is of great interest to many mathematicians.

#### An Excercise
It is possible to improve the bound obtained above to
\\[ \pi(n) \geq \frac{ \log n}{2 \log 2}, \\]
using a different factorization of $n$. Can you provide a proof?

# Thakkar's Proof
Here, I will only outline Thakkar's proof, and leave working out the details for the reader. The proof is based on the fact that the class of [regular languages](https://en.wikipedia.org/wiki/Regular_language) is closed under finite union. Consider the following family of languages over the alphabet $\\{ 0,1 \\}$:
$$ \mathcal{L}_n = \{ w \in \{ 0,1 \}^* : #_0(w) - #_1(w) \equiv 0 \pmod{n} \}, $$
where $#_0(w)$ and $#_1(w)$ denote the number of zeros and ones in the string $w$, respectively. You can easily verify that $\mathcal{L}_n$ is a regular language for any $n \in \mathbb{N}$. In particular, $\mathcal{L}_p$ is regular for any prime $p$. For the sake of contradiction, assume that the set of primes is finite. This implies that 
\\[ \mathcal{L} = \bigcup_{p \in \mathcal{P}} \mathcal{L}_p, \\]
where $\mathcal{P}$ is the set of all primes, is a finite union of regular languages, hence regular. To arrive at a contradiction, it is easier to use another fact about regular languages: the class of regular languages is closed under complementation. Consider the complement of $\mathcal{L}$, and observe that it is 
\\[ \overline{\mathcal{L}} = \{ w \in \{ 0,1 \}^* : #_0(w) - #_1(w) = \pm 1 \}. \\]
Using the [Pumping Lemma](https://en.wikipedia.org/wiki/Pumping_lemma_for_regular_languages), or the [Myhill-Nerode Theorem](https://en.wikipedia.org/wiki/Myhill%E2%80%93Nerode_theorem), one can show that $\overline{\mathcal{L}}$ is not regular, which is a contradiction. Therefore, the set of primes is infinite.

# Acknowledgements
The first time I came across Chaitin's proof was actually in the final exam of a course I had on information theory. Thanks to [Thomas Debris-Alazard](https://tdalazard.io/) for his excellent teaching and evaluation methods. 

# Bibliography
[1] Meštrović, R. (2012). Euclid's theorem on the infinitude of primes: a historical survey of its proofs (300 BC--2022) and another new proof. *arXiv preprint* arXiv:1202.3670.\
[2] Chaitin, G. J. (1977). Toward a Mathematical Definition of Life, 2. *IBM Thomas J. Watson Research Division*.
[3] Thakkar, A. (2018). Infinitude of Primes Using Formal Languages. *The American Mathematical Monthly*, 125(8), 745–749. https://doi.org/10.1080/00029890.2018.1496761
