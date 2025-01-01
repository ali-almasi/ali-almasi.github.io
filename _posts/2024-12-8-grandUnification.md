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

$$ \mathsd{1}_{r,d} U \mathsd{1}_{d,c} = A, $$

where $\mathsd{1}_{r,d}$ is first $r$ rows of the identity matrix of size $d \times d$, and $\mathsd{1}_{d,c}$ is the first $c$ columns of the identity matrix of size $d \times d$.

Let us think of the matrix $A$ as an operator acting on a $s$-qubit system, and $U$ as a unitary acting on the $k$-qubit system plus an ancilla $a$-qubit register. Then, $U$ is a block-encoding of $A$ if

$$ \left( \bra{0}^{\otimes a} \otimes \mathsd{1}_{2^k} \right) U \left( \ket{0}^{\otimes a} \otimes \mathsd{1}_{2^k} \right) = A. $$

An example of a block-encoding is the following:

Suppose that we have a control-system $\mathcal{H}_C$ and a target-system $\mathcal{H}_T$, and there is a Hermitian operator $H$ acting on the target-system. The following is a block-encoding of $H$:

$$ U = \ket{0}\bra{0}_C \otimes H_T + \ket{0}\bra{1}_C \otimes \mathsd{\sqrt{1 - H^2}}_T + \ket{1}\bra{0}_C \otimes \mathsd{\sqrt{1 - H^2}}_T + \ket{1}\bra{1}_C \otimes -H_T, $$

when $\mid H \mid \leq 1$.

Having the spectral decomposition of $H$ as 

$$ H = \sum_{i} \lambda_i \ket{\lambda_i}\bra{\lambda_i}, $$

we can also write $U$ as

$$ U = \sum_{i} \left( \ket{0}\bra{0}_C \lambda_i + \ket{0}\bra{1}_C \sqrt{1 - \lambda_i^2} + \ket{1}\bra{0}_C \sqrt{1 - \lambda_i^2} - \ket{1}\bra{1}_C \lambda_i \right) \otimes \ket{\lambda_i}\bra{\lambda_i}_T, $$

which can be written in the matrix form as

$$ U = \sum_{i=1}^{\dim(\mathcal{H}_T)} \begin{bmatrix} \lambda_i & \sqrt{1 - \lambda_i^2} \\ \sqrt{1 - \lambda_i^2} & -\lambda_i \end{bmatrix} \otimes \ket{\lambda_i}\bra{\lambda_i}. $$

