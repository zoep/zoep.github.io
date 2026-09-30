From Stdlib Require Import Init.Nat Arith Bool.Bool.

(** Student Information
Name:  
ID: 
*)


(** * Assignment 1 (100 points + 10 bonus points) *)

(** The purpose of this assignment is to familiarize yourself with functional
    programming and proof development in the Rocq Proof Assistant.

    Instructions:

    - You may only use the tactics we have covered in class.  

    - You cannot use theorems from the library, unless this is explicitly required
      by the exercise.

    - If you get stuck on an intermediate lemma or proof goal, you may use [admit]
      in order to complete the exercise and receive partial credit for what you
      have solved.
    
    - The file you submit must compile. You can check this in your terminal with
      the command `rocq assignment1.v`. Files that do not compile will not be
      graded.

    - When you complete a proof, replace the final [Admitted] with [Qed].

    - Do not change the given code and text. Do not write inside the grading
      comments. This is necessary for smooth and timely grading. You may write
      wherever the instruction (*  ___ FILL IN HERE ___ *) appears. If you find it
      useful, you may define helper functions, lemmas, definitions, etc.
      
    - Fill in your information correctly at the beginning of the file. This is 
      necessary for proper grading. *)

(** ** Exercise 1 (warm-up): Booleans (20 points) *)

(** From Boolean algebra we know the following basic rules.

    - ~ ~ x = x                             (double negation elimination)
    - ~ (x && y) = (~ x) || (~ y)           (De Morgan's law)
    - x || y || z = x || (y || z)           (associativity)
    - (x || y) && z = (x && z) || (y && z)  (distributive property)

   The exercise asks you to prove the above rules.

*)


Lemma double_negation_elimination:
  forall x, negb (negb x) = x.
Proof.
 (* ___ FILL IN HERE ___ *)
Admitted.

(* [double_negation_elimination] Grade: 0/3 *)

Lemma DeMorgan_neg_or:
  forall x y, negb (x && y) = (negb x) || (negb y).
Proof.
 (* ___ FILL IN HERE ___ *)
Admitted.

(* [DeMorgan_neg_or] Grade: 0/5 *)

Lemma or_assoc:
  forall x y z, x || y || z = x || (y || z).
Proof.
 (* ___ FILL IN HERE ___ *)
Admitted.

(* [or_assoc] Grade: 0/6 *)

Lemma or_and_distr:
  forall x y z, (x || y) && z = (x && z) || (y && z).
Proof.
 (* ___ FILL IN HERE ___ *)
Admitted.

(* [or_and_distr] Grade: 0/6 *)

(** ** Exercise 2: Natural Numbers (35 points) *)

(** The library function [mul] defines multiplication. Its definition
    is the following. *)

Print mul. 

(** The exercise asks you to prove that [0] is the absorbing element
    of multiplication. *) 

Lemma mul_zero_abs_l :
  forall (m : nat), 0 * m = 0.
Proof.
 (* ___ FILL IN HERE ___ *)
Admitted.

(* [mul_zero_abs_l] Grade: 0/5 *)

Lemma mul_zero_abs_r :
  forall (m : nat), m * 0 = 0.
Proof.
 (* ___ FILL IN HERE ___ *)
Admitted.


(* [mul_zero_abs_r] Grade: 0/10 *)

(** Notice that one of the two lemmas is much easier to prove than the
    other. Why is this the case? Briefly explain.

    Answer: ___ FILL IN HERE ___ *)


(** Use [mul] to write a function [exp] that raises its first argument
    [base] to the power given by its second argument [power] *) 

Fixpoint exp (base power : nat) : nat
(* :=   ___ FILL IN HERE ___. *)
. Admitted. (* Delete this line and complete the one above *)


(* [exp] Grade: 0/5 *)


(** Prove that exponentiation with exponent m + n is equal to the
    product of the same base raised to exponents m and n respectively.

    You may use theorems from the library that prove that 0 is the
    neutral element of addition and that multiplication is associative.

    Use the Search command we saw in class to look them up in the library. *)

Lemma exponent_addition :
  forall base pow1 pow2,
    exp base (pow1 + pow2) = exp base pow1 * exp base pow2.
Proof.
  (*  ___ FILL IN HERE ___ *)
Admitted.

(* [exponent_addition] Grade: 0/15 *)


(** ** Exercise 3: Equality of Natural Numbers (15 points) *)

(** Complete the definition of a function that checks whether two natural
    numbers are equal and returns [true] if the two arguments are equal
    and [false] otherwise. *)

Fixpoint test_eq (n1 n2 : nat) : bool
(* :=   ___ FILL IN HERE ___. *)
. Admitted. (* Delete this line and complete the one above *)

(* [test_eq] Grade: 0/5 *)

(** Prove that the definition of [test_eq] is sound. That is, that a call
    to [test_eq n1 n2] returns [true] only if [n1 = n2]. *)

Lemma test_eq_sound :
  forall n1 n2, test_eq n1 n2 = true -> n1 = n2. 
Proof.
  intros n1; induction n1; intros n2.
 (* ___ FILL IN HERE ___ *)
Admitted.

(* [test_eq_sound] Grade: 0/10 *)


(* Bonus question: Is this proof enough to ensure that our definition is
   correct? Prove the opposite direction that guarantees completeness.

   Note! This proof may require tactics that we will cover in the second class.  *)

(* [test_eq_complete] Bonus Grade: 0/10 *)


(** ** Exercise 4: Recursive Higher-Order Functions – The Ackermann Function (30 points) *)

(* The [Ackermann function](https://en.wikipedia.org/wiki/Ackermann_function)
   is one of the simplest and most famous examples of a total function
   that is computable but cannot be defined with
   [primitive recursion](https://en.wikipedia.org/wiki/Primitive_recursive_function).

   Its definition is the following:

   Ack(0, n) = n + 1
   Ack(m, 0) = Ack(m-1, 1) when m > 0
   Ack(m, n) = Ack(m-1, Ack(m, n-1)) when m > 0 and n > 0

 *)

(* Try to define this function as a recursive two-argument function.
   Is the attempt successful? Why?
   Briefly explain. *)

Fail Fixpoint ack (m n : nat)
(* :=   ___ FILL IN HERE ___. *)
. (* Delete this line and complete the one above *)

(* Answer: ___ FILL IN HERE ___ *)

(* [ack_fail] Grade: 0/5 *)

(* Next, give a valid definition of the Ackermann function. *)

(* Hint: You can define the Ackermann function as a recursive function
   that takes one argument and returns a recursive function that takes
   the second argument. Both functions are recursive in their own
   argument.

   To define the inner function recursively you can use a nested fixpoint,
   as in the following example. *)


Definition nested_fix (n : nat) :=
  fix inner (m : nat) :=
    match m with
    | 0 => n
    | S m' => S (inner m')
    end.


Fixpoint ack (m : nat) : nat -> nat
(* :=   ___ FILL IN HERE ___. *)
. Admitted. (* Delete this line and complete the one above *)


(* [ack] Grade: 0/10 *)


(* Finally, prove that [ack 1 n = n + 2]. You may use
   the theorem [Nat.add_comm] from the standard library. *)
Lemma ackermann_1_n :
  forall n, ack 1 n = n + 2.
Proof.
 (* ___ FILL IN HERE ___ *)
Admitted.

(* [ackermann_1_n] Grade: 0/15 *)
