---
layout: post
title: "Machine-Generated Code Deserves Machine-Checked Proofs"
date: 2026-04-17
image: /assets/img/godel-grave.jpg
---

For more than a hundred years, the dream of a "proof machine", a mechanical procedure that automatically carries out mathematical reasoning according to formal rules, has haunted mathematics and computer science. In its strongest form, the dream proved to be theoretically impossible, but in the process, the theory of computation was born. And despite the limitations, it continued to inspire generations of mathematicians and computer scientists, who, along the way, built the tools to draw as close to it as possible: proof assistants and theorem provers. Yet, mechanizing mathematical proofs has remained a daunting task, requiring enormous human effort.

Last February, I sat at my laptop and watched an AI coding agent write 7,800 lines of such a proof in four days. This post is about that experience, and about the longer arc it belongs to.


## The Oldest Dream in Computer Science

In the early 20th century, a foundational crisis shook mathematics. Paradoxes in set theory exposed the shaky foundations of the informal reasoning mathematicians relied on. In 1921, David Hilbert, one of the most renowned mathematicians of his time, proposed a foundational program to the mathematical community, one that would change the course of mathematical logic and computer science. Hilbert's ambition was to have a formal, unifying theory of mathematics, one that would put all of mathematics on solid ground. He proposed to express all of mathematics in a formal language, and derive all mathematical truths from a finite set of axioms and inference rules. Such axiomatization had to be *consistent*, meaning it cannot prove false statements, and *complete*, meaning that it can prove all true statements.

But Hilbert's vision went even further: he wanted the system to be *decidable*, meaning that there would be a mechanical procedure, a "proof machine", so to speak, that could determine whether any given statement is provable from the axioms.

The dream did not last long. In 1931, Kurt Godel proved that any formal system powerful enough to express arithmetic cannot prove its own consistency, and that there will always be true statements within it that cannot be proved. The consistency and completeness that Hilbert sought were mathematically impossible. A few years later, Turing and Church independently settled the *Entscheidungsproblem*: there is no algorithm that can decide the provability of a given mathematical statement. The mechanical procedure Hilbert dreamed of does not exist.

<figure style="max-width: 500px; margin: 1.5em auto; text-align: center;">
<img src="{{ site.baseurl }}/assets/img/godel-grave.jpg" alt="Godel's grave at Princeton Cemetery, 2017" style="width: 100%;">
<figcaption><em>Godel's grave at Princeton Cemetery, Easter 2017.</em></figcaption>
</figure>

Hilbert's vision for a proof machine failed. But the concept of computation itself was born from this quest. Turing's proof that the decision problem is unsolvable required him to define, with mathematical precision, what a "mechanical procedure" actually was. The result was the Turing machine, and with it the theoretical foundations of computer science.

And within the boundaries that Godel, Church, and Turing drew, the dream persisted. An enormous amount of mathematics and software *can* be formally verified. It simply cannot be done automatically for all statements. What is possible is *machine-checked proof*: a human (or a machine) constructs a proof in a formal language, and a small, trusted program, the *proof checker*, verifies that every step follows from the rules of logic. The proof checker only needs to implement the theory correctly. Starting in the 1960s, researchers began building the tools to do exactly this:


- **Automath** (Nicolaas Govert de Bruijn, 1967). A formal language capable of expressing mathematical statements and their proofs, together with a proof checker. It is the first proof assistant based on dependent type theory and the Curry-Howard correspondence, which is the basis for many modern proof assistants.
- **Logic for Computable Functions (LCF)** (Robin Milner, 1970s). An interactive theorem prover that gave rise to the ML programming language, which was introduced as a meta-language for writing proof tactics.
- **Coq (now Rocq)** (Gérard Huet and Thierry Coquand, 1984). Coq introduced the Calculus of Constructions, a dependent type theory that allows for expressive specifications and proofs. Rocq is one of the most widely used proof assistants today.
- **Isabelle** (Lawrence Paulson, 1986). A successor to LCF, Isabelle is a generic proof assistant that is still used today.

The list is by no means exhaustive; many other proof assistants and theorem provers have been developed over the years, with Lean being a recent addition that has gained significant traction in the mathematical community.

A separate but related line of work pursued a different goal: deciding mathematical validity automatically. Automated theorem proving, from the Davis-Putnam algorithm for propositional satisfiability (1960) to Robinson's resolution principle (1965) to modern SAT and SMT solvers, aims to discharge proof obligations without human guidance, at least for restricted classes of problems.

These efforts narrowed the gap between Hilbert's dream and reality and have led to remarkable results in formalizing complex mathematical theorems and verifying significant pieces of software. Some of the most notable results include:

- **The [four-color theorem](https://www.ams.org/notices/200811/tx081101382p.pdf)** (Rocq, 2005). The four-color theorem was the first major theorem whose proof, by Appel and Haken in 1976, relied on computer calculation. Georges Gonthier's formalization in Rocq was a landmark in mathematical mechanization and demonstrated that proof assistants could handle substantial proofs. The formalization is approximately 60,000 lines of Rocq code.
- **The [CompCert](https://github.com/absint/compcert) verified compiler** (Rocq, 2005). CompCert was one of the first major successes in large-scale formal verification of software, showing that a realistic, optimizing C compiler could be proved correct. The development took approximately 3 person-years and 42,000 lines of Rocq.
- **The [seL4](https://dl.acm.org/doi/10.1145/1629575.1629596) microkernel** (Isabelle/HOL, 2009). seL4 was the first formally verified general-purpose operating system kernel. The verification took approximately 20 person-years and 200,000 lines of proof.
- **The [Feit-Thompson theorem](https://inria.hal.science/hal-00816699/document)** (Rocq, 2012). The formalization of the Feit-Thompson theorem took six years and approximately 150,000 lines of Rocq.

But the bottleneck has always been the human effort required to construct machine-checked proofs. For decades, formal verification has been a discipline of the devoted few, requiring crushing labor for results that most of the world never sees.

## Enter AI

And now something is shifting.

We are at a point that most of us working in the field could not have anticipated. Large language models, systems trained on vast corpora of text and code, have developed the ability to reason mathematically and generate proofs in formal systems. These proofs can be mechanically checked for validity by the same proof assistants that researchers have been building for decades.

The results have been remarkable. In the past year, we've seen:

- **Competition mathematics.** At the International Math Olympiad 2025, three AI systems achieved gold-medal performance, with [Harmonic's Aristotle](https://arxiv.org/abs/2510.01346) producing formally verified Lean proofs for all its solutions.
- **Algorithm verification in F\*.** Microsoft's RiSE team used LLMs to verify [approximately 50 CLRS data structures and algorithms](https://risemsr.github.io/blog/2026-03-06-autoclrs/) in F\*, producing over 100,000 lines of machine-checked proofs in weeks.
- **Programming language metatheory.** Ilya Sergey [reports](https://proofsandintuitions.net/2026/03/18/move-borrow-checker-lean/) using AI coding assistants to mechanize a 39,000-line proof of the metatheory of Move's borrow checker in Lean in less than a month.
- **Busy beaver proof.** Tristan Hume [reports](https://tristan.st/blog/opus_4_6_formal_proofs) using Opus 4.6 to generate 258 out of 260 lemmas for the BB(4) busy beaver proof automatically.
- **Compiler verification.** In my own experiments, I mechanized a [7,800-line correctness proof](https://arxiv.org/abs/2602.20082) for the CertiRocq verified compiler in approximately 96 hours, using Opus 4.6 with Claude Code. This proof was comparable to one that took me several months to do manually, and it was generated with minimal human involvement.

Together, these results suggest that the bottleneck that has constrained formal verification for decades may be breaking.


## My Own Experience with AI-Assisted Verification

I started experimenting with LLMs for proof generation only recently, as, only a few months ago, commercial models were not yet capable of handling complex proofs and, admittedly, I was skeptical about their proof capabilities. After a nudge by a colleague, who informed me about Opus 4.6's remarkable capabilities for generating Agda proofs, I decided to try it for myself. I bought a subscription to Claude Max and decided to give it a non-trivial problem: the correctness proof of a compiler transformation. I had, a few years ago, attempted to do this proof manually and set it aside -- the reasoning was complex and the time it required too great.

The transformation is part of the [CertiRocq](https://github.com/CertiRocq/certirocq) verified compiler for pure functional programming languages, which myself and others have been developing for several years. It translates functional programs into [A-normal form (ANF)](https://en.wikipedia.org/wiki/A-normal_form), a low-level, functional intermediate representation. My plan was to reuse a proof technique that [I had already used and published](https://dl.acm.org/doi/10.1145/3485491) on a related transformation (translation to Continuation-Passing Style, CPS) and ask the LLM to adapt it to the new setting.

The results were astonishing. In about four days, Claude Code was able to generate an end-to-end machine-checked proof for the transformation, a proof consisting of roughly 7,800 lines of code. My initial prompt was short and simple: I asked the LLM to look at the proof of the CPS transformation and use the same technique to prove the ANF transformation correct. Then the LLM started working: planning the proof, generating proof skeletons and helper lemmas, compiling them, diagnosing errors, and iterating.

My role was to guide the process: I would point it at the next proof obligation to tackle. In a few situations where the proof got stuck, I had to figure out the underlying reasoning and provide guidance on how to tackle the proof, in natural language. But I did not write any proof code myself. The LLM handled all the plumbing: setting up inductions, performing case analyses, applying lemmas from the codebase and the Rocq standard library.

The LLM's performance was not perfect, of course. It made mistakes, and it got stuck on some cases. But the overall trajectory was consistently progressing towards a complete proof.
An important aspect that makes this kind of work possible is the feedback loop with the proof checker. The LLM would write a proof script, compile it, and if it failed, it would diagnose the error and iterate, without human involvement. This process keeps the LLM on track towards a correct proof, and allows it to work through the night without supervision. Sometimes, I left the LLM working unattended for many hours and came back to find entire lemmas and proof cases completed.

Since this first experiment, I have been using LLMs for proof mechanization in other projects as well, with similar results. The experience has been transformative, and it has given me a glimpse of what the future of formal verification might look like.

- Over a weekend, I mechanized a type safety proof for the [act](https://github.com/argotorg/act) verification language for smart contracts that my collaborators and I have been developing. The [original proof](https://arxiv.org/abs/2604.02955) is roughly 45 pages of hand-written proof. The LLM read the proof and mechanized the syntax, type system, and semantics of the language, and then mechanized the proof in about 4,400 lines of code. It even found a small error in the original proof -- which thankfully, was fixable.

- I have used LLMs to extend the aforementioned ANF proof to a) prove a stronger property (i.e., that a transformation preserves non-terminating behavior) and b) handle a more complex source language. In both cases, the LLM was able to adapt the existing proof to the new setting, but not without frustration and limitations. During this experiment, I also tried other models, namely GPT-5.4 with Codex, which I found to be way more effective for the particular task.

- I asked Harmonic's [Aristotle](https://aristotle.harmonic.fun/) to implement and verify simple algorithms in Lean. Currently, Aristotle seems capable of working autonomously to produce verified Lean code, at least for simple algorithms. For example, it was capable of solving the [product-maximizing partition](https://bldavies.com/blog/product-maximising-partitions/) problem and generating a machine-checked proof of optimality in a matter of an hour.


## The Vision: Verified AI-Generated Software

Why does this matter beyond the small and niche world of software verification?

The process of software development is rapidly changing. As AI generates more and more of the world's software, the question of correctness becomes more pressing. But for the first time in history, we have a hint that formal verification may be applicable at scale, using the exact same tools that generate the code. So, why not use these tools to generate machine-checked proofs of correctness for the very software they produce?

The end-to-end vision is this:

1. **An LLM writes software** in a proof-oriented language (Rocq, Lean, F\*), along with a mathematical proof of its correctness.
2. **A proof assistant** mechanically checks that the proof is valid. The LLM is not trusted. Only the mathematics matters.
3. **A verified compiler** compiles the verified source to an executable. The compiler itself has been proved correct, so compilation cannot introduce bugs.

The result is software with end-to-end mathematical guarantees, from specification to executable. The user need not trust the LLM, the compiler, or the proof. The only things the user needs to trust are the *specification*, which is the mathematical statement of what the software is supposed to do, and the proof checker, which ensures that the proof is valid.

As the preliminary results suggest, this vision may not be far from reality. However, there are still challenges to overcome.

- LLMs are not perfect. They can make mistakes, get stuck in reasoning loops, and even silently weaken theorem statements to make them easier to prove. Human oversight is still needed to guide the proof process. As LLMs improve, we can hope for a more autonomous workflow, but for now, the human-in-the-loop is essential.

- The software and proof development process are now heavily dependent on commercial LLMs. I find this disconcerting, as the pricing, availability, and capabilities of these models can change in unpredictable ways. For scientific reproducibility and broad accessibility, open-source models for formal proof generation are needed.

- There is not yet mature tooling for this kind of workflow. Integrating LLMs with proof assistants in a way that allows interactive proof development instead of batch compilation could dramatically reduce the time needed to construct and syntactically repair proofs.

## What comes next?

There is still work ahead. But for the first time in history, what once seemed out of reach is happening: machines are writing code together with machine-checked proofs of its correctness. The attempt to automate mathematical proof gave birth to the concept of computation. A century later, computation is returning the favor.
