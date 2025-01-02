---
layout: post
title:  "An Attempt at Understanding the Grand Unification"
date:   2024-12-8
categories: quantum-algorithms
permalink: /blog/grand-unification.html
use_math: true
---

<span style="color:green;font-weight:700;font-size:12px">
It’s unfortunate that there aren’t many good open-source fonts designed specifically for dyslexic readers. However, there’s a helpful [Chrome extension](https://chromewebstore.google.com/detail/opendyslexic-for-chrome/cdnapgfjopgaggbmfgbiinmmbdcglnam?pli=1) that can change the font of the text you read online, making it easier to follow.</span>


# Introduction

There are roughly two main lines of designing quantum algorithms, and many of the algorithms we know today can be classified under one of these two categories. The representative algorithm of the first category is the Grover's search algorithm, and the second category is represented by the Shor's factoring algorithm [One may even argue that Shor's algorithm is not that different from Grover's algorithm.]. It is a natural question then to ask what is the underlying technique that unifies all these algorithms. This is the main claim of the "The Grand Unification" paper: Finding the common underlying technique that unifies all quantum algorithms.

# Block-Encoding

In block-encoding, we want to encode an arbitrary matrix $A \in \mathbb{C}^{r \times c}$ in a unitary matrix $U \in \mathbb{C}^{d \times d}$, in a way that the top-left $r \times c$ block of $U$ is $A$. This condition can be formulated as 

$$ I_{r,d} U I_{d,c} = A, $$

where $I_{r,d}$ is first $r$ rows of the identity matrix of size $d \times d$, and $I_{d,c}$ is the first $c$ columns of the identity matrix of size $d \times d$.

Let us think of the matrix $A$ as an operator acting on a $s$-qubit system, and $U$ as a unitary acting on the $k$-qubit system plus an ancilla $a$-qubit register. Then, $U$ is a block-encoding of $A$ if

$$ \left( \bra{0}^{\otimes a} \otimes I_{2^k} \right) U \left( \ket{0}^{\otimes a} \otimes I_{2^k} \right) = A. $$

An example of a block-encoding is the following:

Suppose that we have a control-qubit $C$ and a target-system $T$ with Hilbert space $\mathcal{H}_T$, and there is a Hermitian operator $H$ acting on the target-system. The following is a block-encoding of $H$:

$$ U = \ket{0}\bra{0}_C \otimes H_T + \ket{0}\bra{1}_C \otimes \sqrt{I - H^2}_T + \ket{1}\bra{0}_C \otimes \sqrt{I - H^2}_T + \ket{1}\bra{1}_C \otimes -H_T, $$

when $\| H \| \leq 1$.

Having the spectral decomposition of $H$ as 

$$ H = \sum_{i} \lambda_i \ket{\lambda_i}\bra{\lambda_i}, $$

we can also write $U$ as

$$ U = \sum_{i} \left( \ket{0}\bra{0}_C \lambda_i + \ket{0}\bra{1}_C \sqrt{1 - \lambda_i^2} + \ket{1}\bra{0}_C \sqrt{1 - \lambda_i^2} - \ket{1}\bra{1}_C \lambda_i \right) \otimes \ket{\lambda_i}\bra{\lambda_i}_T, $$

which can be written in the matrix form as

$$ U = \sum_{i=1}^{\dim(\mathcal{H}_T)} \begin{bmatrix} \lambda_i & \sqrt{1 - \lambda_i^2} \\ \sqrt{1 - \lambda_i^2} & -\lambda_i \end{bmatrix} \otimes \ket{\lambda_i}\bra{\lambda_i}. $$

Block-encodings are in some sense a generalization of unitary operations, in the sense that if $U$ is a block-encoding of $H$, then by applying $U$ on the state $\ket{0}^{\otimes a} \otimes \ket{\psi}$, and then measuring the ancilla register, we obtain the state $\frac{H\ket{\psi}}{\|H\ket{\psi}\|}$ with probability $\|H\ket{\psi}\|^2$.

Now suppose that we have access to a block-encoding of $H$. Consider a matrix $A$ that is a function of $H$, say $A = f(H)$. Can we find a block-encoding of $A$?

# Quantum Signal Processing (QSP)

Let us start with the simplest case: consider your matrix $H$ to be a $1\times 1$ matrix, i.e., a scalar $a \in [-1,1]$. The following unitary is a block-encoding of $H$:

$$ U(a) = \begin{bmatrix} a & i\sqrt{1 - a^2} \\ i\sqrt{1 - a^2} & a \end{bmatrix}. $$

This unitary can be seen as a rotation of the Bloch sphere around the $X$-axis by an angle $-2\arccos(a)$. 

Now, assume that we have also access to another unitary $S(\phi)$, that realizes a rotation with angle $-2\phi$ around the $Z$-axis, which means that

$$ S(\phi) = \begin{bmatrix} e^{i\phi} & 0 \\ 0 & e^{-i\phi} \end{bmatrix}. $$

This latter unitary is in fact a family of unitaries, giving a gate $S(\phi)$ for each $\phi \in [0,2\pi]$.

Now, the question is, "having access to $U(a)$ and $S(\phi)$, what sort of unitaries can we construct?". In other words, if for $\phi = (\phi_0, \phi_1, \dots, \phi_{d})$, we define

$$ U_{\phi} = S(\phi_0) \Pi_{i=1}^{d} U(a) S(\phi_i), $$

then, how can we characterize the set of unitaries $U_{\phi}$?

The answer to this question is given by the main theorem of Quantum Signal Processing (QSP), which is as follows:

**Theorem (QSP)**: A QSP sequence as defined above can be expressed as

$$ \begin{bmatrix} P(a) & iQ(a)\sqrt{1 - a^2} \\ iQ^*(a)\sqrt{1 - a^2} & P^*(a) \end{bmatrix}, $$

for $a \in [-1,1]$, where $P(a)$ and $Q(a)$ are polynomials satisfying
1. $\deg(P) \leq d$, and $\deg(Q) \leq d-1$,
2. $P$ has parity $d \mod 2$ and $Q$ has parity $(d-1) \mod 2$,
3. For all $a \in [-1,1]$, $\vert P(a)\vert^2 + (1 - a^2)\vert Q(a)\vert^2 = 1$.

Moreover, for any $P$ and $Q$ satisfying the above conditions, there exists a QSP sequence realizing the above unitary.

As you can see, in this simple case, we have a rather neat characterization of achievable functions of $H$, which was the matrix whose block-encoding we had access to. 

You may wonder if we can get rid of the dependency to $Q$ in the third condition.
To this end, you can instead consider the possible transformations on the subspace spanned by $\ket{+}$, since

$$ \bra{+} \begin{bmatrix} P(a) & iQ(a)\sqrt{1 - a^2} \\ iQ^*(a)\sqrt{1 - a^2} & P^*(a) \end{bmatrix} \ket{+} = \operatorname{Re}(P(a)) + \operatorname{Re}(Q(a))i\sqrt{1 - a^2}. $$

This implies that for any *real* polynomial $P$ of degree at most $d$ that has parity $d \mod 2$, and for any $a \in [-1,1]$, $\vert P(a)\vert \leq 1$, there exists a QSP sequence realizing this polynomial on the subspace spanned by $\ket{+}$.

# Proof of the QSP Theorem

#### Proof of the Direct Part

We first prove by induction that (1) and (2) hold for any QSP sequence.
Let $U_{\phi} = S(\phi_0) \Pi_{i=1}^{d} U(a) S(\phi_i)$. For $d = 0$, we have 

$$U_{\phi} = S(\phi_0) = \begin{bmatrix} e^{i\phi_0} & 0 \\ 0 & e^{-i\phi_0} \end{bmatrix}, $$

and we see that $P(a) = e^{i\phi_0}$ and $Q(a) = 0$, which are polynomials of degree $0$ and $-\infty$, and parity $0$ and $1$, respectively.

Now, assume that the conditions hold for $d=k-1$. For $d=k$, we have

$$ \begin{align}
U_{\phi} &= \left( S(\phi_0) \Pi_{i=1}^{k-1} U(a) S(\phi_i) \right) U(a) S(\phi_k)\\
&= \begin{bmatrix} \widetilde{P}(a) & i\widetilde{Q}(a)\sqrt{1 - a^2} \\ i\widetilde{Q}^*(a)\sqrt{1 - a^2} & \widetilde{P}^*(a) \end{bmatrix} \begin{bmatrix} a e^{i\phi_k} & i\sqrt{1 - a^2} e^{-i\phi_k} \\ i\sqrt{1 - a^2} e^{i\phi_k} & a e^{-i\phi_k} \end{bmatrix}\\
&= \begin{bmatrix} \widetilde{P}(a) a e^{i\phi_k} - \widetilde{Q}(a)(1-a^2)e^{i\phi_k} & i\widetilde{P}(a)\sqrt{1 - a^2} e^{-i\phi_k} + i\widetilde{Q}(a)a\sqrt{1 - a^2} e^{-i\phi_k} \\ i\widetilde{Q}^*(a)a\sqrt{1 - a^2} e^{i\phi_k} + i\widetilde{P}^*(a)\sqrt{1 - a^2} e^{i\phi_k} & -\widetilde{Q}^*(a)(1 - a^2)e^{-i\phi_k} + \widetilde{P}^*(a)a e^{-i\phi_k} \end{bmatrix}.
\end{align} $$

Defining 

$$ P(a) = \widetilde{P}(a) a e^{i\phi_k} - \widetilde{Q}(a)(1-a^2)e^{i\phi_k},$$

and

$$ Q(a) = \widetilde{P}(a)e^{-i\phi_k} + \widetilde{Q}(a)a e^{-i\phi_k}, $$

we see that $P$ and $Q$ are polynomials of degree at most $k$ and $k-1$, and that the parity of $P$ and $Q$ are the opposite of the parity of $\widetilde{P}$ and $\widetilde{Q}$, respectively. 

Finally, we note that since $U_{\phi}$ is a unitary, we have $\vert P(a)\vert^2 + (1 - a^2)\vert Q(a)\vert^2 = 1$.

#### Proof of the Converse Part

For the converse part, let us assume that 

$$ T = \begin{bmatrix} P(a) & iQ(a)\sqrt{1 - a^2} \\ iQ^*(a)\sqrt{1 - a^2} & P^*(a) \end{bmatrix}, $$

where $P$ and $Q$ are polynomials satisfying (1), (2), and (3), for some $d$. We want to show that a vector of angles $\phi = (\phi_0, \phi_1, \dots, \phi_d)$ exists such that $U_{\phi} = T$.

We prove this by induction on $\deg(P)$. For $\deg(P) = 0$, $P$ is a constant, and for $a \in [-1,1]$, $P(a) = P(1)$. From (3), we have $\vert P(1)\vert = 1$, and since for infinitely many $a \in [-1,1]$, $\vert Q(a)\vert^2 (1 - a^2) = 0$, by the fundamental theorem of algebra, we conclude that $Q(a) = 0$. Since $\vert P(a)\vert = 1$, $P(a) = e^{i\phi_0}$ for some $\phi_0$, and we have $T = S(\phi_0)$.

To choose the rest of the angles, it is easy to see that no matter what the value of $a$ is, we always have

$$ U(a) S(\frac{\pi}{2}) U(a) S(-\frac{\pi}{2}) = I. $$

You can either verify this by direct calculation, or try to convince yourself geometrically by noting that $U(a)$ is a rotation around the $X$-axis by some angle $\theta$, and $S(\frac{\pi}{2})$ and $S(-\frac{\pi}{2})$ are rotations around the $Z$-axis by $-\pi$ and $\pi$, respectively.

Finally, we note that $P$ is a non-zero constant, thus its parity is even, and since (2) holds, $d$ is even. Thus, we can set $\phi_{2i+1} = \pi/2$ and $\phi_{2i} = -\pi/2$ for $i = 0,1,\dots,d/2$, resulting in $U_{\phi} = T$.

Now, assume that the statement holds for $\deg(P) = k-1$. Consider $T$ with polynomial $P$ of degree $k > 0$. 

**Lemma**: If $P$ and $Q$ satisfy (3), and $\deg(P) = k > 0$, then $\deg(Q) = k-1$, and the leading coefficients of $P$ and $Q$ have the same modulus.

**Proof of the Lemma**: Let us write $P$ and $Q$ as

$$ P(a) = \sum_{i=0}^{k} p_i a^i, \quad Q(a) = \sum_{i=0}^{k-1} q_i a^i, $$

where $p_k \neq 0$. From (3), we have

$$ \vert P(a)\vert^2 + (1 - a^2)\vert Q(a)\vert^2 = 1, $$

for all $a \in [-1,1]$. The coefficients of the non-constant terms of the left-hand side have to be zero, thus $\deg(Q) \leq k-1$. Moreover, the coefficient of $a^{2k}$ in the left-hand side is $\vert p_k\vert^2 - \vert q_{k-1}\vert^2$, which has to be zero. This implies that $\deg(Q) = k-1$, and $\vert p_k\vert = \vert q_{k-1}\vert$.

Consider the matrix

$$ T U(a)^\dagger S(\phi_{d})^\dagger, $$

which can be written as 

$$ \begin{align}
T U(a)^\dagger S(\phi_{d})^\dagger &= \begin{bmatrix} P(a) & iQ(a)\sqrt{1 - a^2} \\ iQ^*(a)\sqrt{1 - a^2} & P^*(a) \end{bmatrix} \begin{bmatrix} a e^{-i\phi_d} & -i\sqrt{1 - a^2} e^{-i\phi_d} \\ -i\sqrt{1 - a^2} e^{i\phi_d} & a e^{i\phi_d} \end{bmatrix}\\
&= \begin{bmatrix} P(a) a e^{-i\phi_d} + Q(a)(1 - a^2)e^{i \phi_d} & i\sqrt{1 - a^2} \left( P(a) e^{-i\phi_d} + Q(a) a e^{i\phi_d} \right) \\ -i\sqrt{1 - a^2} \left( P^*(a) e^{i\phi_d} + Q^*(a) a e^{-i\phi_d} \right) & P^*(a) a e^{i\phi_d} + Q^*(a)(1 - a^2)e^{-i \phi_d} \end{bmatrix}.
\end{align} $$ 

We can choose $\phi_d$ such that $e^{2i\phi_d} = \frac{p_k}{q_{k-1}}$ (From the Lemma, we know that this is possible). Then, the $a^{k+1}$ term in $P(a) a e^{-i\phi_d} + Q(a)(1 - a^2)e^{i \phi_d}$ will have a coefficient equal to zero, and since the parity of $P$ and $Q$ are $d \mod 2$ and $(d-1) \mod 2$, respectively, the coefficient of the $a^{k-1}$ in $P(a)$ and $a^{k-2}$ in $Q(a)$ is zero, implying that $P(a) a e^{-i\phi_d} + Q(a)(1 - a^2)e^{i \phi_d}$ is a polynomial of degree at most $k-2$. Similarly, by taking the same $\phi_d$, $P(a) e^{-i \phi_d} + a e^{i\phi_d} Q(a)$ will be a polynomial of degree at most $k-2$. Moreover, the parity of $P(a) a e^{-i\phi_d} + Q(a)(1 - a^2)e^{i \phi_d}$ and $P(a) e^{-i \phi_d} + a e^{i\phi_d} Q(a)$ are $d-1 \mod 2$ and $d - 2 \mod 2$, respectively.

By the induction hypothesis, we can find $\phi_0, \phi_1, \dots, \phi_{d-1}$ such that $T U(a)^\dagger S(\phi_{d})^\dagger $ is a QSP sequence with the corresponding angles. By right-multiplying this unitary with $U(a) S(\phi_d)$, we obtain $T$ as a QSP sequence with angles $\phi_0, \phi_1, \dots, \phi_{d}$.