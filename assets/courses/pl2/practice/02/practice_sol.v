Require Import Coq.Lists.List Coq.Init.Nat Coq.Arith.Arith Lia.

(** * Practice Problems with Solutions *)

(** ** Logic *)

(** Or is commutative *)

Lemma or_comut :
  forall P Q, P \/ Q -> Q \/ P.
Proof.
  intros P Q Hor.
  inversion Hor.

  - right; assumption.

  - left; assumption.
Qed.

(** Law of contrapositive.  *)

Lemma contrapositive1 :
  forall P Q,
    (P -> Q) -> ~Q -> ~P. 
Proof.
  intros P Q Himpl Hnot HP.

  apply Hnot. apply Himpl. assumption. 

  (* or just [auto] *)
Qed.


Definition EM := forall P, P \/ ~ P.

(** The other direction only has a classical (i.e., not constructive)
    proof. *)

Lemma contrapositive2 :
  EM ->
  forall P Q,
    (~Q -> ~P) -> P -> Q. 
Proof.
  intros Hem P Q Himpl HP.

  unfold EM in Hem. 
  specialize Hem with (P := Q).
  
  inversion Hem as [H1 | H2]. 

  - assumption.

  - apply Himpl in H2. contradiction. 
Qed.


(** Distributive property of conjunction over disjuntion. *)
Lemma and_distr :
  forall P Q R, 
    (P \/ Q) /\ R <-> P /\ R \/ Q /\ R. 
Proof.                         
  intros P Q R. split. 

  - intros [[H1 | H2] H3]. 

    + left. split; assumption.

    + right. split; assumption.

  - intros [[H1 H2] | [H1 H2]]. 
    
    + split.
      left; assumption.
      assumption.
      
    + split.
      right; assumption.
      assumption.
Qed.      


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
  intros P Hind n. 

  assert (H : forall m, m <= n -> P m). 
  { induction n as [ | n' IHn' ]; intros m Hleq. 
    - apply Hind. lia. (* succeeds because [m < 0] is absurd *)

    - apply Hind. intros m' Hlt. 
      apply IHn'. lia. } 

  apply H. lia. 
Qed.


(** Associativity of addition *)

Lemma add_assoc:
  forall n m k,
    n + m + k = n + (m + k). 
Proof.
  intros n m k.

  induction n.

  - simpl; reflexivity.

  - simpl. rewrite IHn. reflexivity.

Qed.


(** Distributive property of multiplication over addition *)

Lemma mul_distr:
  forall n m k,
    n * (m + k) = n * m + n * k. 
Proof.
  intros n m k.

  induction n.

  - simpl; reflexivity.

  - simpl. rewrite IHn.
    
    rewrite add_assoc with (m := n * m).
    rewrite <- add_assoc with (n := n * m).
    
    rewrite Nat.add_comm with (n := n * m) (m := k). 

    rewrite add_assoc with (n := m).
    rewrite add_assoc with (n := k).

    reflexivity. 

    (* or just [lia] *)

Qed.

(** Write an inductive relation [le : nat -> nat -> Prop] that is true
    if and only iff the first natural number is less than or equal to
    the second. *)

Inductive le : nat -> nat -> Prop :=
| leO : forall m, le 0 m
| leS : forall n m, le n m -> le (S n) (S m).

Example leq_3_5:
  le 3 5.
Proof.  
  apply leS.
  apply leS.
  apply leS.
  apply leO.
  (* or just [repeat constructor] *)
Qed.


Example not_leq_5_2:
  ~ le 5 3.
Proof.
  intros Habsurd.
  (* invert the derivation until no constructor applies *)
  
  inversion Habsurd as [ | n m Habsurd' Heq1 Heq2 ]; subst.
  inversion Habsurd' as [ | n m Habsurd'' Heq1 Heq2 ]; subst.
  inversion Habsurd'' as [ | n m Habsurd''' Heq1 Heq2 ]; subst.
  inversion Habsurd'''.
Qed.

(** Note: this is exactly the definition of [<=] in the standard
    library. *)

Lemma le_transitive :
  forall n m k,
    le n m ->
    le m k ->
    le n k.
Proof.
  intros n. induction n; intros m k Hleq1 Hleq2.
  - apply leO. 
  - destruct k as [ | k' ]. 
    + (* k = 0 *)
      inversion Hleq2; subst. (* [Hleq2] can only be derived by [leO] therefore [m = 0] *)

      inversion Hleq1. (* this fact is absurd. There is no derivation for it *)

    + (* k = S k' *)
      inversion Hleq1 as [ | n' m' Hleq Heq1 Heq2 ]; subst. (* [Hleq1] can only be derived by [leS] *)
      inversion Hleq2 as [ | n'' m'' Hleq' Heq3 Heq4 ]; subst. (* [Hleq2] can only be derived by [leS] *)

      apply leS. apply IHn with (m := m'); assumption. 
Qed.

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
  intros A l. induction l as [ | x l' IHl ]; simpl.
  - reflexivity.
  - rewrite IHl. reflexivity.
Qed.
  

(** [rev] distributes over [app]. You will need [app_nil] and the
    lemma [app_assoc] from the standard library. *)

Lemma rev_app_distr :
  forall (A : Type) (l1 l2 : list A),
    rev (l1 ++ l2) = rev l2 ++ rev l1.
Proof.
  intros A l1. induction l1 as [ | x l1' IHl1 ]; intros l2; simpl.
  - rewrite app_nil. reflexivity. 
  - rewrite IHl1, app_assoc. reflexivity.
Qed.
  
(** [rev] is involutive. You will need [rev_app_distr] *)

Lemma rev_rev_same :
  forall A (l : list A),
    rev (rev l) = l.
Proof.
  intros A l. induction l as [ | x l' IHl ].
  - reflexivity.
  - simpl.
    rewrite rev_app_distr. simpl.
    rewrite IHl. reflexivity. 
Qed.    
