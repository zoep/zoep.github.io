From Stdlib Require Import Init.Nat Arith.Arith Lists.List.
Import ListNotations.

(** Student Info
Name:
ID:
*)

(** * Assignment 2 (100 points + 10 bonus points) *)

(** The purpose of this assignment is to practice functional programming
      and proof development in the Rocq Proof Assistant.

    Instructions:

    - Do not change the names of the files that are given to you.

    - You may only use the tactics we covered in class.

    - You may not use theorems from the library unless the exercise explicitly
      instructs you to do so.

    - If you get stuck on an intermediate lemma, you may use [admit] so that you
      can complete the assignment and be graded for what you have solved.

    - The submitted file must compile. You can check this in your terminal with
      the command `rocq assignment2.v`. Files that do not compile will not be
      graded.

    - When you finish a proof, replace the final [Admitted] with [Qed].

    - Do not change the code and text that were given to you. Do not write inside
      the grading comments. This is necessary for smooth and timely grading.
      You may write wherever you see the instruction (*  ___ FILL IN HERE ___ *).
      If it helps, you may define helper functions, lemmas, definitions, etc.

    - Fill in your personal details correctly at the beginning of the file. This
      is necessary for correct grading. *)


(** ** Exercise 1: Properties of Functions (6 points) *)

(** Complete the definition of a function that takes two functions as arguments
    and returns their composition. *)

Definition comp {A B C : Type} (g : B -> C) (f : A -> B) : A -> C
(* :=   ___ FILL IN HERE ___. *)
. Admitted. (* Delete this line and fill in above *)

(* [comp] Grade: 0/1 *)

(** Define what it means for a function h to be the inverse of f
    (from the left -- left inverse). *)

Definition inverse {A B} (h : B -> A) (f : A -> B) : Prop
(* := ___ FILL IN HERE ___  *).
Admitted.

(* [inverse] Grade: 0/1 *)


(** Complete the definition of the predicate that states a function is
    one-to-one (injective). *)

Definition injective {A B} (f : A -> B) : Prop
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [injective] Grade: 0/1 *)

(** Prove that every left-invertible function is injective. *)

Theorem left_inverse_injective :
  forall A B (f : A -> B) (h : B -> A),
    inverse h f ->
    injective f.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.

(* [left_inverse_injective] Grade: 0/3 *)

(** ** Exercise 2: Natural Numbers in Binary (30 points) *)

(** You are given an inductive type that represents natural numbers in
    binary. *)

Inductive bin : Type :=
| Z : bin
| B0 : bin -> bin
| B1 : bin -> bin.

(** In this representation, a number is a sequence of digits
      [B0] (represents 0) or [B1] (represents 1) terminated by [Z]
      (represents the empty bit sequence, i.e., 0). By convention, numbers
      are represented with the least significant bit on the left (i.e. the
      opposite of the usual order). This will make our definitions easier.

    For example, 4 is represented as follows: *)

Definition four : bin := B0 (B0 (B1 Z)).

(** Warm-up: complete the following numbers. *)

Definition three : bin (* :=   ___ FILL IN HERE ___. *)
. Admitted. (* Delete this line and fill in above *)

Definition seven : bin (* :=   ___ FILL IN HERE ___. *)
. Admitted. (* Delete this line and fill in above *)

Definition eight : bin (* :=   ___ FILL IN HERE ___. *)
. Admitted. (* Delete this line and fill in above *)

(* [num_defs] Grade: 0/1 *)

(** Write a function that converts a number in binary representation
    to a number in unary representation. *)

Fixpoint bin_to_nat (b : bin) : nat
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [bin_to_nat] Grade: 0/5 *)

(** Sanity check: The following should hold if your definition is correct. *)

Example test_bin_to_nat : bin_to_nat seven = 7.
Admitted.
(* Proof. simpl. reflexivity. Qed. *)

Example test_bin_to_nat' : bin_to_nat three = 3.
Admitted.
(* Proof. simpl. reflexivity. Qed. *)

Example test_bin_to_nat'' : bin_to_nat (B0 (B1 (B1 Z))) = 6.
Admitted.
(* Proof. simpl. reflexivity. Qed. *)

Example test_bin_to_nat''' : bin_to_nat (B1 (B1 (B0 (B0 Z)))) = 3.
Admitted.
(* Proof. simpl. reflexivity. Qed. *)

Example test_bin_to_nat'''' : bin_to_nat (B1 (B1 (B0 Z))) = 3.
Admitted.
(* Proof. simpl. reflexivity. Qed. *)

(** Write a function that increments a binary number by one. *)

Fixpoint bin_incr (b : bin) : bin
(* := ___ FILL IN HERE ___ *).
Admitted.
(* [bin_incr] Grade: 0/6 *)

(** Using the function above, write a function that converts a number in
    unary representation to a number in binary representation. *)

Fixpoint nat_to_bin (n : nat) : bin
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [nat_to_bin] Grade: 0/4 *)

(** Sanity check: The following should hold if the above definitions are
    correct. Delete [Admitted] and uncomment the proof. *)

Example test_nat_to_bin : nat_to_bin 7 = (B1 (B1 (B1 Z))).
Admitted.
(* Proof. simpl. reflexivity. Qed. *)

Example test_nat_to_bin' : nat_to_bin 6 = (B0 (B1 (B1 Z))).
Admitted.
(* Proof. simpl. reflexivity. Qed. *)

Example test_nat_to_bin'' : nat_to_bin 3 = (B1 (B1 Z)).
Admitted.
(* Proof. simpl. reflexivity. Qed. *)


(** Prove that for every binary number, incrementing it by one and then
    converting it to a unary natural gives the same result as first
    converting it to unary and then incrementing that unary number by one.

    You may use the library theorems [plus_n_O] and [plus_n_Sm].

    Depending on how you defined [bin_incr], you may also need the theorem
    [Nat.add_comm] (commutativity of addition). This will make your proof a bit
    more complicated. (You may slightly change your definition if you want to
    simplify the proof...)

    When doing a [rewrite] with an equality, you may need to specify the terms
    to use for the universally quantified variables. This can be done with the
    keyword [with]. For example:

   [rewrite Nat.add_comm with (m := 1)] or [rewrite Nat.add_comm with (n := 1)]
   or [rewrite Nat.add_comm with (n := 1) (m := 1)].
*)

Check plus_n_O.
Check plus_n_Sm.
Check Nat.add_comm.

Lemma bin_to_nat_pres_incr :
  forall b : bin, bin_to_nat (bin_incr b) = 1 + (bin_to_nat b).
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.

(* [bin_to_nat_pres_incr] Grade: 0/8 *)

(** Using the lemma above, prove that for every natural number, converting it
    to binary and then back to unary returns the original number. That is,
    [bin_to_nat ∘ nat_to_bin] is the identity function. *)

Theorem nat_bin_nat :
  forall n, bin_to_nat (nat_to_bin n) = n.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.

(* [nat_bin_nat] Grade: 0/6 *)

(* Just for fun: Use the results of Exercise 1 to prove that the function
   [nat_to_bin] is injective.

   Is the function [bin_to_nat] injective? Why? *)


(** ** Exercise 3: Logic (22 points + 10 bonus points) *)

(** This exercise asks you to prove various tautologies of propositional logic
    in Rocq. In this exercise you are forbidden to use the tactic [auto]. *)

Theorem curry :
  forall (A B C : Prop),
    (A /\ B -> C) -> A -> B -> C.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [curry] Grade: 0/2 *)


Theorem uncurry :
  forall (A B C : Prop),
    (A -> B -> C) -> A /\ B -> C.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [uncurry] Grade: 0/2 *)

Theorem de_morgan_or :
  forall (A B : Prop), ~ (A \/ B) -> ~ A /\ ~ B.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [de_morgan_or] Grade: 0/3 *)

Theorem contrapositive :
  forall (A B : Prop),
    (A -> B) -> (~ B -> ~ A).
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [contrapositive] Grade: 0/2 *)


(** In classical propositional logic, implication is often defined as
    [P -> Q ≡ ~P \/ Q].

    Prove that [~P \/ Q] implies [P -> Q]. *)

Lemma or_to_implies :
  forall (A B : Prop),
    (~ A \/ B) -> A -> B.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [or_to_implies] Grade: 0/2 *)


(** Now try to prove the converse. What do you notice? Why does this happen? *)

Lemma implies_to_or :
  forall (A B : Prop),
    (A -> B) -> ~ A \/ B.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.

(** Short answer: ___ FILL IN HERE ___ *)
(* [implies_to_or] Grade: 0/3 *)


(** Now prove the same lemma assuming the law of excluded middle. *)

Definition EM : Prop := forall P, P \/ ~P.

Lemma EM_implies_to_or :
    EM ->
    forall (A B : Prop), (A -> B) -> ~ A \/ B.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [EM_implies_to_or] Grade: 0/4 *)


Lemma implies_to_or_EM :
  (forall (A B : Prop), ((A -> B) -> ~ A \/ B)) ->
  EM.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [implies_to_or_EM] Grade: 0/4 *)


(** (Bonus 10 points) Equivalence of DNE and EM *)

(** In class we mentioned that double negation elimination (DNE) is equivalent
    to the law of excluded middle (EM). In this exercise you will formally prove
    this claim. *)

Definition DNE : Prop := forall P, ~~ P -> P.

(** Hint #1: For each of the two directions you will need to use the hypothesis
    with an appropriate logical proposition in place of the universally
    quantified [P]. This proposition will be different in each case. You can do
    this either with the tactic [specialize] or by using the [with] keyword with
    the tactic [apply], as we saw in logic.v. *)

Theorem DNE_EM : DNE <-> EM.
Proof.
  unfold DNE, EM.

  (* Remember that equivalence is defined as a conjunction of two implications.
     So we can use [split] to work on each implication separately. *)
  split.

  - (* DNE -> EM *)
    (* Hint #2: use lemma [de_morgan_or] *)
    admit.

  - (* EM -> DNE *)
    admit.
Admitted.
(* [DNE_EM] Grade (Bonus): 0/10 *)

(** ** Exercise 4: Lists (42 points) *)

(** *** Part 1 *)

(** Write an inductive relation that holds when all elements of a list
    of type [list A] satisfy a predicate [P : A -> Prop]. *)

Inductive All {A} (P : A -> Prop) : list A -> Prop :=
(*  ___ FILL IN HERE ___ *)
.

(* [All] Grade: 0/3 *)


(** Check your definition by proving that all numbers in the list
   [2;4;42;8] are even and that not all numbers in the list
   [2;4;17;8] are even. *)

Fixpoint Even (n : nat) : Prop :=
  match n with
  | O => True
  | S O => False
  | S (S n') => Even n'
  end.

Example All_test1 : All Even [2;4;42;8].
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [All_test1] Grade: 0/1 *)

Example All_test2 : ~ All Even [2;4;17;8].
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [All_test2] Grade: 0/1 *)


(** Prove that if all elements of lists [l1] and [l2] satisfy [P], then the
   same holds for the concatenation [l1 ++ l2]. *)

Lemma All_app :
  forall A P (l1 l2 : list A),
    All P l1 ->
    All P l2 ->
    All P (l1 ++ l2).
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [All_app] Grade: 0/4 *)


(** Next, prove that if all elements of a list satisfy [P], then the same holds
   for the reverse of the list. *)

Lemma All_rev :
  forall A P (l : list A),
    All P l ->
    All P (rev l).
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [All_rev] Grade: 0/4 *)


(** Just for fun: you can practice by proving the following lemmas. *)

Lemma All_and :
  forall (A : Type) (P Q : A -> Prop) (l : list A),
    Forall P l -> Forall Q l -> Forall (fun x : A => P x /\ Q x) l.
Proof.
Abort.

Lemma All_map :
  forall A B P (l : list A) (f : A -> B),
    All (fun x => P (f x)) l ->
    All P (map f l).
Proof.
Abort.

(** *** Part 2 *)

(** Write a polymorphic [fold_left] over types A and B that takes a function
    [f : A -> B -> A], a list [l], and an initial value [i].

    If the list is [[x1; ...; xn]], then the result is
    [f (... (f (f i x1) x2) ...) xn]. The function returns [i] if the list is
    empty.

    That is, the function applies [f] successively to all elements of the list
    from left to right, using the accumulated value as the first argument and the
    current element as the second. *)

Fixpoint fold_left {A B} (f : A -> B -> A) (l : list B) (i : A) : A
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [fold_left] Grade: 0/3 *)

(** Warm-up: use [fold_left] to write a function [length]. *)

Definition length (l : list nat) : nat
(* := ___ FILL IN HERE ___ *).
Admitted.
  
(* [length] Grade: 0/1 *)

Example test_length : length [1;2;3;4] = 4.
Admitted.
(* Proof. reflexivity. Qed. *)

(** Warm-up: use [fold_left] to write a function that sums the elements of a
    list of natural numbers. *)

Definition sum (l : list nat) : nat
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [sum] Grade: 0/1 *)

Example test_sum : sum [1;2;3;4] = 10.
Admitted. (* To check your definition, delete this line and uncomment the one below. *)
(* Proof. reflexivity. Qed. *)


(** Write a polymorphic [fold_right] over types A and B that takes a function
    [f : B -> A -> A], a list [l], and an initial value [a0].

    If the list is [[x1; ...; xn]], then the result is
    [f x1 (f x2 (... (f xn a0))))]. The function returns [a0] if the list is
    empty.

    That is, the function applies [f] successively to all elements of the list,
    starting from the last (rightmost) element, using [a0] as the second
    argument. The result of applying [f] to one element is used as the second
    argument in the next application of [f] to the previous element. *)

Fixpoint fold_right {A B} (f : B -> A -> A) (l : list B) (a0 : A) : A 
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [fold_right] Grade: 0/3 *)

(** Warm-up: use [fold_right] to write a function [length']. *)

Definition length' (l : list nat) : nat
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [length'] Grade: 0/1 *)

Example test_length' : length' [1;2;3;4] = 4.
Admitted.
(* Proof. reflexivity. Qed. *)

(** Warm-up: use [fold_right] to write a function that sums the elements of a
    list of natural numbers. *)

Definition sum' (l : list nat) : nat
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [sum'] Grade: 0/1 *)

Example test_sum' : sum' [1;2;3;4] = 10.
Admitted. (* To check your definition, delete this line and uncomment the one below. *)
(* Proof. reflexivity. Qed. *)

(* We want to prove that applying [fold_left] to a higher-order function [f] and
   a list [l] is equal to applying [fold_right] to the function [f'] (which is
   the same as [f] but takes its arguments in the opposite order) and to the
   reversed list [rev l]. *)

(* First prove that applying [fold_right] to the concatenation of two lists is
   equal to applying it successively to each list. *)

Lemma fold_right_append :
forall A B (f : B -> A -> A) l1 l2 i,
  fold_right f (l1 ++ l2) i = fold_right f l1 (fold_right f l2 i).
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.

(* [fold_right_append] Grade: 0/5 *)

(* Finally, state and prove the desired theorem. *)

Theorem fold_left_fold_right :
forall A B (f : A -> B -> A) (l : list B) (i : A),
    False (* ___ FILL IN HERE ___ *).
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.

(* [fold_left_fold_right] Grade: 0/8 *)

(** Write a function [foo : A -> A -> A] for some type [A] of your choice for
    which [fold_left] and [fold_right] return different results when applied to
    the same list and the same initial value. What properties does this function
    have? Write two examples, in the style of [test_sum] and [test_sum'], that
    show the function returns different results. *)

(*  ___ FILL IN HERE ___ *)

(* [fold_left_fold_right_different] Grade: 0/6 *)