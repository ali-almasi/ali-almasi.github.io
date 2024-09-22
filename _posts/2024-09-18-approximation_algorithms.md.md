---
layout: post
title:  Approximation Algorithms
date:   2024-09-18 11:00:00
usemathjax: true
---

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
