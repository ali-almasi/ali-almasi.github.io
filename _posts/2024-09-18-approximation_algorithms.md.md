---
layout: post
title:  Approximation Algorithms Zoo
date:   2024-09-18 11:00:00
usemathjax: true
---
*In the memory of Luca Trevisan.*

# Introduction

## What is an approximation algorithm?

We’ve all encountered optimization problems that are classified as NP-hard. It is widely believed that finding a fast (i.e., polynomial-time) algorithm to solve these problems is unlikely. However, these problems arise in numerous real-world situations, from VLSI chip design to barter-exchange markets. Given their importance, simply abandoning the search for solutions is not an option. This is where *approximation algorithms* come into play. The core idea behind approximation algorithms is to trade off the quality of the solution for a faster runtime.

Let \( A \) be an algorithm for a minimization problem \( P \), and let \( I \) represent an instance of \( P \) with an optimal solution denoted by \( OPT(I) \). We define \( A(I) \) as the solution output by \( A \) on input \( I \), and \( c(A(I)) \) as the objective value of \( A(I) \). We say that \( A \) is an *\( \alpha \)-approximation algorithm* for \( P \) if for every instance \( I \),
\[
\frac{c(A(I))}{OPT(I)} \leq \alpha.
\]
Here, \( \alpha \geq 1 \) is necessary for the inequality to hold, reflecting that the algorithm’s solution is at most \( \alpha \) times worse than the optimal solution.

A similar definition applies to maximization problems, where \( \alpha \leq 1 \). In this case, \( A \) is an \( \alpha \)-approximation algorithm for a maximization problem \( P \) if for every instance \( I \),
\[
\frac{c(A(I))}{OPT(I)} \geq \alpha.
\]
This ensures that the solution found by \( A \) is at least \( \alpha \) times the optimal value.



Let $V$ be a vector space and $\{v_1, v_2, \dots, v_n\}$ be a basis.
> Algorithm parameters: step size  $\alpha \in (0 , 1] , \epsilon > 0$   
Initialize  $Q  ( s, a ), \  \forall s \in S^+ , a \in A ( s ),$ arbitrarily except that $Q ( terminal , \cdot ) = 0$    
>
> Loop for each episode:  
$\quad$Initialize $S$   
$\quad$Loop  for  each  step  of  episode:    
$\qquad$Choose  $A$ from $S$ using some policy derived from $Q$ (eg $\epsilon$-greedy)   
$\qquad$Take action $A$, observe $R, S'$   
$\qquad Q(S,A) \leftarrow Q(S,A) + \alpha[R+\gamma \max_a(S', a) - Q(S, A)]$   
$\qquad S \leftarrow S'$    
$\quad$ until $S$ is terminal
