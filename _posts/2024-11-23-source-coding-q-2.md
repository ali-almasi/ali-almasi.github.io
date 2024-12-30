---
layout: post
title:  "Source Coding: Part 2"
date:   2024-11-15
categories: quantum-information-theory
permalink: /blog/source-coding2.html
use_math: true
---

<span style="color:green;font-weight:700;font-size:12px">
It’s unfortunate that there aren’t many good open-source fonts designed specifically for dyslexic readers. However, there’s a helpful [Chrome extension](https://chromewebstore.google.com/detail/opendyslexic-for-chrome/cdnapgfjopgaggbmfgbiinmmbdcglnam?pli=1) that can change the font of the text you read online, making it easier to follow.</span>


**Disclaimer**: There are many excellent resources available on source coding from different viewpoints, varying from pure mathematical treatments (e.g., see [this mini-course](https://perso.imcce.fr/alain-chenciner/Shannon.pdf) by Alain Chenciner) to those that have a more engineering flavor. There are also many textbooks, such as [Cover and Thomas](https://onlinelibrary.wiley.com/doi/book/10.1002/047174882X) that include a chapter on source coding. This blog post is intended to only gather some of the ideas around source coding that I have found interesting, important or insightful.

In the [previous post](/blog/source-coding1.html), we discussed how the entropy of an i.i.d. source governs the rate at which we can reliably compress the source outputs. There is still a lot to say about classical source coding, but in this post I have decided to make a detour and discuss a quantum version of the variant of the source coding theorem we have seen so far. I will assume that the reader is familiar with the basics of quantum information theory, such as quantum states, measurements, and channels, as well as the von Neumann entropy.

