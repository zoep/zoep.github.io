---
layout: course
title: Advanced Programming Languages
permalink: /teaching/pl2/
sections:
  - name: Information
    id: course-information
  - name: Lectures
    id: lectures
  - name: Assignments
    id: assignments
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
[Rocq Prover](https://rocq-prover.org/), Haskell, and Rust.

## Course Information

<dl class="course-info">
  <dt>Instructor</dt>
  <dd><a href="{{ '/' | relative_url }}">Zoe Paraskevopoulou</a></dd>
  <dt>Lectures</dt>
  <dd>Friday 11:45–14:30</dd>
  <dt>Office hours</dt>
  <dd>By appointment (<a href="mailto:zoepar@softlab.ntua.gr">contact the instructor</a>)</dd>
  <dt>Course site</dt>
  <dd><a href="https://helios.ntua.gr/">Helios</a> (announcements and assignment submission)</dd>
  <dt>Assignments</dt>
  <dd>Weekly (about 11, tentative), each with a 10-day deadline</dd>
  <dt>Exam</dt>
  <dd>No final exam</dd>
  <dt>Material</dt>
  <dd><a href="https://github.com/zoep/PL2">github.com/zoep/PL2</a> (lecture notes, code, and resources)</dd>
  <dt>Software</dt>
  <dd>The Rocq Prover (version 9.0 or later) and an editor with Rocq support. See the installation instructions in <a href="https://github.com/zoep/PL2/blob/main/INSTALL.md">Greek</a> or <a href="https://github.com/zoep/PL2/blob/main/INSTALL-eng.md">English</a>.</dd>
</dl>

## Lectures

The lecture notes are Rocq files meant to be stepped through interactively in
your editor. They are updated during the term; the latest versions are always in
the [course repository](https://github.com/zoep/PL2/tree/main/lectures/Rocq).

<div class="syllabus-entry">
  <div class="entry-label">Lecture 1</div>
  <div class="entry-body">
    <div class="entry-title">Introduction &middot; The Rocq Proof Assistant I: Functional Programming with Proofs</div>
    <div class="entry-desc">Course overview and organization. A brief history of the foundations of mathematics and computation, the λ-calculus, the Curry–Howard isomorphism, proof assistants, and Rocq. Functional programming in Rocq: functions and polymorphism, inductive types (booleans, natural numbers, pairs, lists, option), pattern matching, and first proofs by simplification, rewriting, case analysis, and induction.</div>
    <div class="entry-links">
      <a href="{{ '/assets/courses/pl2/slides/01-intro.pdf' | relative_url }}">Slides (PDF)</a>
      <a href="https://github.com/zoep/PL2/blob/main/lectures/Rocq/notes_01_intro.v">Notes (notes_01_intro.v)</a>
    </div>
  </div>
</div>

<div class="syllabus-entry">
  <div class="entry-label">Lecture 2</div>
  <div class="entry-body">
    <div class="entry-title">The Rocq Proof Assistant II: Logic</div>
    <div class="entry-desc">Propositions as types: <code>Prop</code>, predicates, and relations. Logical connectives and their proof rules as tactics: implication, universal quantification, True and False, negation, disjunction, conjunction, if and only if, equality, and existential quantification. Inductively defined propositions, proof by contradiction and the excluded middle, and induction on the derivation of a proposition.</div>
    <div class="entry-links">
      <a href="https://github.com/zoep/PL2/blob/main/lectures/Rocq/notes_02_logic.v">Notes (notes_02_logic.v)</a>
      <a href="{{ '/assets/courses/pl2/practice/02/practice.v' | relative_url }}">Practice problems (practice.v)</a>
      <a href="{{ '/assets/courses/pl2/practice/02/practice_sol.v' | relative_url }}">Practice solutions (practice_sol.v)</a>
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
