---
layout: course
title: Advanced Programming Languages
permalink: /teaching/pl2/
sections:
  - name: Information
    id: course-information
  - name: Sections
    id: sections
  - name: Assignments
    id: assignments
  - name: LLM Playground
    id: llm-playground
  - name: References
    id: references
  - name: Thesis Topics
    id: diploma-thesis-topics
---

<div class="course-header">
  <h1 class="course-name">Advanced Programming Languages (Programming Languages II)</h1>
  <div class="course-details">Fall 2026 &middot; School of Electrical and Computer Engineering, National Technical University of Athens</div>
</div>

This course studies the formal foundations of programming languages and their
use in building reliable software. Topics include operational and axiomatic
semantics, compiler correctness, Hoare logic and automated verification, the
lambda calculus, type systems and type inference, type classes and monads,
program analysis, and memory safety. Lectures and assignments use the
[Rocq Prover](https://rocq-prover.org/), Dafny, Haskell, and Rust.

## Course Information

<dl class="course-info">
  <dt>Instructor</dt>
  <dd><a href="{{ '/' | relative_url }}">Zoe Paraskevopoulou</a></dd>
  <dt>Lectures</dt>
  <dd>Friday 11:45–14:30, Room 8, New ECE Building</dd>
  <dt>Office hours</dt>
  <dd>By appointment (<a href="mailto:zoepar@softlab.ntua.gr">contact the instructor</a>)</dd>
  <dt>Course site</dt>
  <dd><a href="https://helios.ntua.gr/">Helios</a> (announcements and assignment submission)</dd>
  <dt>Assignments</dt>
  <dd>Weekly (8–10, tentative), each with a 10-day deadline</dd>
  <dt>Exam</dt>
  <dd>Written final exam, based on the concepts and techniques developed in the assignments. It is designed so that anyone who has engaged substantively with the assignments can do well.</dd>
  <dt>Grading</dt>
  <dd>Assignments 70%, final exam 30%. Passing the course requires a grade of at least 5/10 on the final exam and an overall grade of at least 5/10.</dd>
  <dt>Material</dt>
  <dd><a href="https://github.com/zoep/PL2">github.com/zoep/PL2</a> (lecture notes, code, and resources)</dd>
  <dt>Software</dt>
  <dd>The Rocq Prover (version 9.0 or later) and an editor with Rocq support. See the installation instructions in <a href="https://github.com/zoep/PL2/blob/main/INSTALL.md">Greek</a> or <a href="https://github.com/zoep/PL2/blob/main/INSTALL-eng.md">English</a>.<br>Dafny, for Section 5: the easiest setup is VS Code with the Dafny extension, which offers to install Dafny when you open a <code>.dfy</code> file (see the <a href="https://dafny.org/latest/Installation">Dafny installation instructions</a>).</dd>
</dl>

## Sections

The lecture notes are Rocq files meant to be stepped through interactively in
your editor. They are updated during the term. The latest versions are always in
the [course repository](https://github.com/zoep/PL2/tree/main/lectures/Rocq).

<div class="syllabus-entry">
  <div class="entry-label">Section 1</div>
  <div class="entry-body">
    <div class="entry-title">Introduction &middot; The Rocq Proof Assistant I: Functional Programming with Proofs</div>
    <div class="entry-desc">Course overview and organization. A brief history of the foundations of mathematics and computation, the λ-calculus, the Curry–Howard isomorphism, proof assistants, and Rocq. Functional programming in Rocq: functions and polymorphism, inductive types, pattern matching, and first proofs by simplification, rewriting, case analysis, and induction.</div>
    <div class="entry-links">
      <a href="{{ '/assets/courses/pl2/slides/01-intro.pdf' | relative_url }}">Slides (PDF)</a>
      <a href="https://github.com/zoep/PL2/blob/main/lectures/Rocq/notes_01_intro.v">Notes (notes_01_intro.v)</a>
    </div>
  </div>
</div>

<div class="syllabus-entry">
  <div class="entry-label">Section 2</div>
  <div class="entry-body">
    <div class="entry-title">The Rocq Proof Assistant II: Logic</div>
    <div class="entry-desc">Propositions as types: <code>Prop</code>, predicates, and relations. Logical connectives and their proof rules as tactics. Inductively defined propositions, proof by contradiction and the excluded middle, and induction on the derivation of a proposition.</div>
    <div class="entry-links">
      <a href="https://github.com/zoep/PL2/blob/main/lectures/Rocq/notes_02_logic.v">Notes (notes_02_logic.v)</a>
      <a href="{{ '/assets/courses/pl2/practice/02/practice.v' | relative_url }}">Practice problems (practice.v)</a>
      <a href="{{ '/assets/courses/pl2/practice/02/practice_sol.v' | relative_url }}">Practice solutions (practice_sol.v)</a>
    </div>
  </div>
</div>

<div class="syllabus-entry">
  <div class="entry-label">Section 3</div>
  <div class="entry-body">
    <div class="entry-title">Introduction to Programming Language Semantics &middot; Operational Semantics in Rocq: The Language Imp</div>
    <div class="entry-desc">Big-step and small-step operational semantics of arithmetic expressions and their equivalence. Proof automation with Ltac. The imperative language Imp, commands and their big-step semantics, determinism, a fuel-based interpreter, and a program correctness case study. Compiler correctness: what it means for a program transformation to be correct.</div>
    <div class="entry-links">
      <a href="{{ '/assets/courses/pl2/slides/03-semantics.pdf' | relative_url }}">Slides (PDF)</a>
      <a href="https://github.com/zoep/PL2/blob/main/lectures/Rocq/notes_03_imp.v">Notes (notes_03_imp.v)</a>
      <a href="https://github.com/zoep/PL2/blob/main/lectures/Rocq/notes_04_compcorrect.v">Notes (notes_04_compcorrect.v)</a>
      <a href="{{ '/assets/courses/pl2/practice/03/practice3.zip' | relative_url }}">Practice problems and solutions (practice3.zip)</a>
    </div>
  </div>
</div>

<div class="syllabus-entry">
  <div class="entry-label">Section 4</div>
  <div class="entry-body">
    <div class="entry-title">Introduction to Proof Systems: First-Order Logic and Natural Deduction</div>
    <div class="entry-desc">First-order logic and natural deduction. Semantics of first-order logic: models and validity. Soundness, completeness, Gödel’s incompleteness theorems, decidability, and SMT solvers.</div>
    <div class="entry-links">
      <a href="{{ '/assets/courses/pl2/slides/04-fol.pdf' | relative_url }}">Slides (PDF)</a>
    </div>
  </div>
</div>

<div class="syllabus-entry">
  <div class="entry-label">Section 5</div>
  <div class="entry-body">
    <div class="entry-title">Axiomatic Semantics: Hoare Logic &middot; Program Verification in Dafny</div>
    <div class="entry-desc">Hoare logic for Imp: triples, inference rules, and loop invariants, with proofs of soundness and completeness. Weakest preconditions and verification conditions for automated verification. Program verification in Dafny.</div>
    <div class="entry-links">
      <a href="https://github.com/zoep/PL2/blob/main/lectures/Rocq/notes_05_hoare.v">Notes (notes_05_hoare.v)</a>
      <a href="https://github.com/zoep/PL2/blob/main/lectures/Dafny/examples.dfy">Dafny notes (examples.dfy)</a>
      <a href="https://github.com/zoep/PL2/blob/main/lectures/Dafny/fib.dfy">Dafny notes (fib.dfy)</a>
    </div>
  </div>
</div>

<div class="syllabus-entry">
  <div class="entry-label">Section 6</div>
  <div class="entry-body">
    <div class="entry-title">Introduction to Lambda Calculus &middot; The Pure Lambda Calculus in Rocq</div>
    <div class="entry-desc">Syntax, substitution, and α-equivalence; β-reduction, confluence, and call-by-value and call-by-name evaluation; Church encodings and fixed-point combinators. In Rocq: small-step and big-step semantics, an interpreter proved correct, and an untyped MiniML.</div>
    <div class="entry-links">
      <a href="{{ '/assets/courses/pl2/slides/06-lambda.pdf' | relative_url }}">Slides (PDF)</a>
      <a href="https://github.com/zoep/PL2/blob/main/lectures/Rocq/notes_06_lambda.v">Notes (notes_06_lambda.v)</a>
    </div>
  </div>
</div>

<div class="syllabus-entry">
  <div class="entry-label">Section 7</div>
  <div class="entry-body">
    <div class="entry-title">Introduction to Type Systems &middot; The Simply Typed Lambda Calculus in Rocq</div>
    <div class="entry-desc">Language safety, type safety, and static versus dynamic typing. The simply typed λ-calculus: typing rules, type safety, normalization, and type reconstruction. In Rocq: an extended simply typed λ-calculus, a proof of type safety by progress and preservation, and a type checker proved sound and complete.</div>
    <div class="entry-links">
      <a href="{{ '/assets/courses/pl2/slides/07-typesys-1.pdf' | relative_url }}">Slides (PDF)</a>
      <a href="https://github.com/zoep/PL2/blob/main/lectures/Rocq/notes_07_types.v">Notes (notes_07_types.v)</a>
    </div>
  </div>
</div>

## Assignments

Read the instructions at the top of each file before you start. Only the tactics
covered in class may be used, and submitted files must compile. Each assignment
is available in English and in Greek, and is submitted through Helios.

<div class="syllabus-entry">
  <div class="entry-label">Assignment 1</div>
  <div class="entry-body">
    <div class="entry-title">Functional Programming and Proofs in Rocq</div>
    <div class="entry-desc">Booleans; natural numbers; equality of natural numbers; recursive higher-order functions and the Ackermann function. 100 points + 10 bonus points.</div>
    <div class="entry-links">
      <a href="{{ '/assets/courses/pl2/assignments/01/assignment1_eng.v' | relative_url }}">assignment1_eng.v (English)</a>
      <a href="{{ '/assets/courses/pl2/assignments/01/assignment1.v' | relative_url }}">assignment1.v (Greek)</a>
    </div>
  </div>
</div>

<div class="syllabus-entry">
  <div class="entry-label">Assignment 2</div>
  <div class="entry-body">
    <div class="entry-title">Functions, Binary Numbers, Logic, and Lists</div>
    <div class="entry-desc">Properties of functions; natural numbers in binary; logic; lists. 100 points + 10 bonus points.</div>
    <div class="entry-links">
      <a href="{{ '/assets/courses/pl2/assignments/02/assignment2_eng.v' | relative_url }}">assignment2_eng.v (English)</a>
      <a href="{{ '/assets/courses/pl2/assignments/02/assignment2.v' | relative_url }}">assignment2.v (Greek)</a>
    </div>
  </div>
</div>

<div class="syllabus-entry">
  <div class="entry-label">Assignment 3</div>
  <div class="entry-body">
    <div class="entry-title">Operational Semantics of Imp</div>
    <div class="entry-desc">An Imp program that swaps two variables; correctness of constant folding for Imp; extending Imp with for loops. 100 points + 20 bonus points. The archive also contains <code>imp.v</code> with the Imp definitions from Section 3 and a Makefile; follow the README inside and submit only <code>assignment3.v</code>.</div>
    <div class="entry-links">
      <a href="{{ '/assets/courses/pl2/assignments/03/assignment3_eng.zip' | relative_url }}">assignment3_eng.zip (English)</a>
      <a href="{{ '/assets/courses/pl2/assignments/03/assignment3.zip' | relative_url }}">assignment3.zip (Greek)</a>
    </div>
  </div>
</div>

<div class="syllabus-entry">
  <div class="entry-label">Assignment 4</div>
  <div class="entry-body">
    <div class="entry-title">Hoare Logic and Dafny</div>
    <div class="entry-desc">Repeated squaring in Imp, proved correct with Hoare logic; a havoc command for Imp and Hoare logic; fast exponentiation in Dafny. Solve two of the three exercises for 100 points; solving all three earns 30 bonus points. The archive also contains <code>imp.v</code>, <code>hoare.v</code>, and a Makefile; follow the README inside and submit <code>assignment4.v</code> and/or <code>fastexp.dfy</code>.</div>
    <div class="entry-links">
      <a href="{{ '/assets/courses/pl2/assignments/04/assignment4_eng.zip' | relative_url }}">assignment4_eng.zip (English)</a>
      <a href="{{ '/assets/courses/pl2/assignments/04/assignment4.zip' | relative_url }}">assignment4.zip (Greek)</a>
    </div>
  </div>
</div>

## LLM Playground

The [LLM playground](https://github.com/zoep/PL2/tree/main/LLM-playground) collects
our in-class experiments with LLMs on formal verification and programming languages.

- [Merge sort](https://github.com/zoep/PL2/blob/main/LLM-playground/mergesort.v) (23/10/2026)

## References

- Benjamin C. Pierce et al., [Software Foundations](https://softwarefoundations.cis.upenn.edu/), Volumes I (Logical Foundations) and II (Programming Language Foundations).
- Samuel Mimram, [Program = Proof](https://program-proof.mimram.fr/).
- Benjamin C. Pierce, [Types and Programming Languages](https://www.cis.upenn.edu/~bcpierce/tapl/), MIT Press.

Further reading: [PL resources](https://github.com/zoep/PL2/blob/main/PLresources.md),
[classic PL papers](https://github.com/zoep/PL2/blob/main/PLpapers.md), and
[research schools and workshops for students](https://github.com/zoep/PL2/blob/main/seminars.md).

## Diploma Thesis Topics

If you would like to do your diploma thesis on formal verification, interactive
theorem proving, verified compilers, or AI-assisted proof mechanization, see the
[thesis topics]({{ '/thesis-topics/' | relative_url }}) page for the currently
available topics. More topics are available on request, and you are welcome to
propose your own.
