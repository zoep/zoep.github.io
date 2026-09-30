Require Import Coq.Lists.List Coq.Init.Nat Coq.Arith.Arith Lia.

(** * Practice Problems with Solutions *)

(** ** Logic *)

(** Or is commutative *)

Lemma or_comut :
  forall P Q, P \/ Q -> Q \/ P.
Proof.
Admitted.

(** Law of contrapositive.  *)

Lemma contrapositive1 :
  forall P Q,
    (P -> Q) -> ~Q -> ~P. 
Proof.
Admitted.


Definition EM := forall P, P \/ ~ P.

(** The other direction only has a classical (i.e., not constructive)
    proof. *)

Lemma contrapositive2 :
  EM ->
  forall P Q,
    (~Q -> ~P) -> P -> Q. 
Proof.
Admitted.

(** Distributive property of conjunction over disjuntion. *)
Lemma and_distr :
  forall P Q R, 
    (P \/ Q) /\ R <-> P /\ R \/ Q /\ R. 
Proof.                         
Admitted.


(** ** Natural Numbers *)

(** Prove the principle of strong induction on natural numbers. This
   principle gives a stronger induction hypothesis that states that
   the statement under proof holds for _all_ strictly smaller numbers
   and not just the predecessor.

   Hint: the proof technique is similar to the proof of [even_or_odd]
   where we first prove a stronger statement that holds for all [m],
   [m <=n]. This strong induction principle can be used to provide a
   direct proof to the lemma [even_or_odd]. You can try this as an
   exercise.

   You can use the tactic [lia] to discharge the goals that involve
   arithmetic inequalities. Recall that this tactic provides a
   decision procedure for linear integer arithmetic (which is a
   decidable fragment of arithmetic, in particular Presburger
   arithmetic). It can solve goals that involve

   - first order quantification addition, subtraction, multiplication
   - with constants equality and ordering disjunction, conjuntion,
   - negation, implication

   Since [lia] implements a decision procedure, it will succeed if and
   only if a goal of this form is true. If a goal is not in this
   fragment of logic, [lia] is not guaranteed to succeed if the goal
   is true. *)


Lemma strong_nat_ind :
  forall (P : nat -> Prop),
    (forall n, (forall m, m < n -> P m) -> P n) ->
    forall n, P n.
Proof.
Admitted.


(** Associativity of addition *)

Lemma add_assoc:
  forall n m k,
    n + m + k = n + (m + k). 
Proof.
Admitted.


(** Distributive property of multiplication over addition *)

Lemma mul_distr:
  forall n m k,
    n * (m + k) = n * m + n * k. 
Proof.
Admitted.

(** Write an inductive relation [le : nat -> nat -> Prop] that is true
    if and only iff the first natural number is less than or equal to
    the second. *)

Inductive le : nat -> nat -> Prop :=
(* __ FILL IN HERE __ *). 

Example leq_3_5:
  le 3 5.
Proof.  
Admitted.

Example not_leq_5_2:
  ~ le 5 3.
Proof.
Admitted.

(** Note: this is exactly the definition of [<=] in the standard
    library. *)

Lemma le_transitive :
  forall n m k,
    le n m ->
    le m k ->
    le n k.
Proof.
Admitted.

(** ** Lists *) 

Print rev.

Locate "++".
Print app.

Import ListNotations.

(** [nil] is the neutral element of [app] *)

Lemma app_nil :
  forall (A : Type) (l : list A),
    l ++ [] = l.
Proof.
Admitted.
  

(** [rev] distributes over [app]. You will need [app_nil] and the
    lemma [app_assoc] from the standard library. *)

Lemma rev_app_distr :
  forall (A : Type) (l1 l2 : list A),
    rev (l1 ++ l2) = rev l2 ++ rev l1.
Proof.
Admitted.
  
(** [rev] is involutive. You will need [rev_app_distr] *)

Lemma rev_rev_same :
  forall A (l : list A),
    rev (rev l) = l.
Proof.
Admitted.
