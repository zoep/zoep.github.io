From Stdlib Require Import Init.Nat Arith.Arith Lists.List.
Import ListNotations.

(** Στοιχεία Σπουδαστή
Όνομα:
ΑΜ:
*)

(** * Εργασία 2 (100 μονάδες + 10 μονάδες bonus) *)

(** Ο σκοπός αυτής της εργασίας είναι να εξοικειωθείτε με συναρτησιακό
      προγραμματισμό και την ανάπτυξη αποδείξεων στο Rocq Proof Assistant.

    Οδηγίες:

    - Μην αλλάζετε τα ονόματα των αρχείων που σας δίνονται.

    - Μπορείτε να χρησιμοποιείτε μόνο τα tactics που έχουμε κάνει στο μάθημα.

    - Δεν μπορείτε να χρησιμοποιήσετε θεωρήματα από τη βιβλιοθήκη, εκτός και αν
      αυτό υποδεικνύεται από την άσκηση.

    - Εάν κολλήσετε σε κάποιο ενδιάμεσο lemma, μπορείτε να χρησιμοποιήσετε
      [admit] ώστε να ολοκληρώσετε την άσκηση και να βαθμολογηθείτε για ό,τι
      έχετε λύσει.

    - Το παραδοτέο αρχείο θα πρέπει να κάνει compile. Αυτό μπορείτε να το
      ελέγξετε στο terminal σας με την εντολή `rocq assignment2.v`. Τα αρχεία
      που δεν κάνουν compile δεν θα βαθμολογούνται.

    - Όταν ολοκληρώνετε κάποια απόδειξη, αντικαταστήστε το τελικό [Admitted] με
      [Qed].

    - Μην αλλάζετε τον κώδικα και το κείμενο που σας έχουν δοθεί. Μην γράφετε
      μέσα στα σχόλια της βαθμολόγησης. Αυτό είναι απαραίτητο για την ομαλή και
      έγκαιρη βαθμολόγηση των εργασιών. Μπορείτε να γράψετε όπου υπάρχει η
      οδηγία (*  ___ FILL IN HERE ___ *). Εάν σας εξυπηρετεί, μπορείτε
      να ορίζετε βοηθητικές συναρτήσεις, λήμματα, ορισμούς, κ.α.

    - Συμπληρώστε σωστά τα στοιχεία σας στην αρχή του αρχείου. Αυτό είναι
      απαραίτητο για τη σωστή βαθμολόγηση των εργασιών. *)


(** ** Άσκηση 1: Ιδιότητες Συναρτήσεων (6 μονάδες) *)

(** Συμπληρώστε τον ορισμό μιας συνάρτησης που παίρνει ως ορίσματα δύο
    συναρτήσεις και επιστρέφει τη σύνθεσή τους. *)

Definition comp {A B C : Type} (g : B -> C) (f : A -> B) : A -> C
(* :=   ___ FILL IN HERE ___. *)
. Admitted. (* Διαγράψτε αυτή τη γραμμή και συμπληρώστε την από πάνω *)

(* [comp] Grade: 0/1 *)

(** Ορίστε τι σημαίνει μια συνάρτηση h να είναι η αντιστροφή
    της f (από αριστερά -- left inverse). *)

Definition inverse {A B} (h : B -> A) (f : A -> B) : Prop
(* := ___ FILL IN HERE ___  *).
Admitted.

(* [inverse] Grade: 0/1 *)


(** Συμπληρώστε τον ορισμό του κατηγορήματος που δηλώνει ότι μια συνάρτηση είναι
    ένα-προς-ένα (injective). *)

Definition injective {A B} (f : A -> B) : Prop
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [injective] Grade: 0/1 *)

(** Αποδείξτε ότι κάθε αντιστρέψιμη (από αριστερά) συνάρτηση είναι 1-1. *)

Theorem left_inverse_injective :
  forall A B (f : A -> B) (h : B -> A),
    inverse h f ->
    injective f.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.

(* [left_inverse_injective] Grade: 0/3 *)

(** ** Άσκηση 2: Φυσικοί αριθμοί στο δυαδικό σύστημα (30 μονάδες) *)

(** Σας δίνεται ένας επαγωγικός τύπος που αναπαριστά φυσικούς αριθμούς στο
    δυαδικό σύστημα. *)

Inductive bin : Type :=
| Z : bin
| B0 : bin -> bin
| B1 : bin -> bin.

(** Σε αυτή την αναπαράσταση, ένας αριθμός αναπαρίσταται ως μία ακολουθία ψηφίων
      [B0] (συμβολίζει το 0) ή [B1] (συμβολίζει το 1) που τερματίζονται από το
      [Z] (συμβολίζει την κενή ακολουθία bits που αναπαριστά και το 0). Κατά
      σύμβαση, οι αριθμοί αναπαριστώνται με το least significant bit στα
      αριστερά (δηλαδή το αντίθετο από ό,τι συνήθως). Αυτό θα διευκολύνει τους
      ορισμούς μας.

    Για παράδειγμα, το 4 αναπαρίσταται ως εξής: *)

Definition four : bin := B0 (B0 (B1 Z)).

(** Προθέρμανση: συμπληρώστε τους ακόλουθους αριθμούς. *)

Definition three : bin (* :=   ___ FILL IN HERE ___. *)
. Admitted. (* Διαγράψτε αυτή τη γραμμή και συμπληρώστε την από πάνω *)

Definition seven : bin (* :=   ___ FILL IN HERE ___. *)
. Admitted. (* Διαγράψτε αυτή τη γραμμή και συμπληρώστε την από πάνω *)

Definition eight : bin (* :=   ___ FILL IN HERE ___. *)
. Admitted. (* Διαγράψτε αυτή τη γραμμή και συμπληρώστε την από πάνω *)

(* [num_defs] Grade: 0/1 *)

(** Γράψτε μια συνάρτηση που να μετατρέπει έναν αριθμό σε δυαδική αναπαράσταση
    σε έναν αριθμό σε μοναδιαία (unary) αναπαράσταση. *)

Fixpoint bin_to_nat (b : bin) : nat
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [bin_to_nat] Grade: 0/5 *)

(** Sanity check: Τα παρακάτω θα πρέπει να επιτυγχάνουν εάν ο ορισμός της
    συνάρτησής σας είναι σωστός. *)

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

(** Γράψτε μια συνάρτηση που να αυξάνει έναν δυαδικό αριθμό κατά ένα. *)

Fixpoint bin_incr (b : bin) : bin
(* := ___ FILL IN HERE ___ *).
Admitted.
(* [bin_incr] Grade: 0/6 *)

(** Χρησιμοποιώντας την παραπάνω συνάρτηση, γράψτε μια συνάρτηση που μετατρέπει
    έναν αριθμό σε μοναδιαία (unary) αναπαράσταση σε έναν αριθμό σε δυαδική αναπαράσταση. *)

Fixpoint nat_to_bin (n : nat) : bin
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [nat_to_bin] Grade: 0/4 *)

(** Sanity check: Τα παρακάτω θα πρέπει να επιτυγχάνουν εάν οι
    παραπάνω ορισμοί είναι σωστοί. Διαγράψτε τα [Admitted] και κάντε
    uncomment την απόδειξη. *)

Example test_nat_to_bin : nat_to_bin 7 = (B1 (B1 (B1 Z))).
Admitted.
(* Proof. simpl. reflexivity. Qed. *)

Example test_nat_to_bin' : nat_to_bin 6 = (B0 (B1 (B1 Z))).
Admitted.
(* Proof. simpl. reflexivity. Qed. *)

Example test_nat_to_bin'' : nat_to_bin 3 = (B1 (B1 Z)).
Admitted.
(* Proof. simpl. reflexivity. Qed. *)


(** Αποδείξτε ότι, για κάθε δυαδικό αριθμό, η αύξηση του κατά ένα και στη
    συνέχεια η μετατροπή του σε μοναδιαίο φυσικό αριθμό, δίνει το ίδιο
    αποτέλεσμα με τη μετατροπή του σε μοναδιαίο αριθμό και στη συνέχεια την
    αύξηση αυτού του μοναδιαίου αριθμού κατά ένα.

    Μπορείτε να χρησιμοποιήσετε τα θεωρήματα βιβλιοθήκης [plus_n_O] και
    [plus_n_Sm].

    Αναλόγως με το πώς έχετε ορίσει τη συνάρτηση [bin_incr], ίσως χρειαστείτε
    και το θεώρημα [Nat.add_comm] (αντιμεταθετική ιδιότητα της πρόσθεσης). Αυτό
    θα κάνει την απόδειξή σας λίγο πιο πολύπλοκη. (Μπορείτε να αλλάξετε λίγο τον
    ορισμό σας αν θέλετε να απλοποιήσετε την απόδειξη...)

    Όταν κάνετε ένα [rewrite] με μία ισότητα μπορεί να χρειαστεί να
    προσδιορίσετε τους όρους που θέλετε να χρησιμοποιήσετε στη θέση των
    καθολικών ποσοδεικτών. Αυτό μπορεί να γίνει με το keyword [with]. Για
    παράδειγμα:

   [rewrite Nat.add_comm with (m := 1)] ή [rewrite Nat.add_comm with (n := 1)] ή
   [rewrite Nat.add_comm with (n := 1) (m := 1)].
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

(** Χρησιμοποιώντας το παραπάνω λήμμα, αποδείξτε ότι για κάθε φυσικό
    αριθμό, η μετατροπή του σε δυαδικό και στη συνέχεια η μετατροπή
    πίσω σε μοναδιαίο επιστρέφει τον αρχικό αριθμό. Δηλαδή, ότι
    [bin_to_nat ∘ nat_to_bin] είναι η ταυτοτική συνάρτηση. *)

Theorem nat_bin_nat :
  forall n, bin_to_nat (nat_to_bin n) = n.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.

(* [nat_bin_nat] Grade: 0/6 *)

(* Just for fun: Χρησιμοποιήστε τα αποτελέσματα της Άσκησης 1 για να αποδείξετε 
   ότι η συνάρτηση [nat_to_bin] είναι ένα-προς-ένα. 

   Είναι η συνάρτηση [bin_to_nat] ένα-προς-ένα; Γιατί; *)


(** ** Άσκηση 3: Λογική (22 μονάδες + 10 μονάδες bonus) *)

(** Η άσκηση σάς ζητά να αποδείξετε διάφορες ταυτολογίες της προτασιακής λογικής
    στο Rocq. Σε αυτή την άσκηση απαγορεύεται να χρησιμοποιήσετε το tactic
    [auto]. *)

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


(** Πολλές φορές στην κλασική προτασιακή λογική η συνεπαγωγή ορίζεται
    ως [P -> Q ≡ ~P \/ Q].

    Αποδείξτε ότι το [~P \/ Q] συνεπάγεται ότι [P -> Q]. *)

Lemma or_to_implies :
  forall (A B : Prop),
    (~ A \/ B) -> A -> B.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [or_to_implies] Grade: 0/2 *)


(** Προσπαθήστε τώρα να αποδείξετε το αντίστροφο. Τι παρατηρείτε;
    Γιατί συμβαίνει αυτό; *)

Lemma implies_to_or :
  forall (A B : Prop),
    (A -> B) -> ~ A \/ B.
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.

(** Σύντομη απάντηση: ___ FILL IN HERE ___ *)
(* [implies_to_or] Grade: 0/3 *)


(** Αποδείξτε τώρα το ίδιο λήμμα, υποθέτοντας τον νόμο του
    αποκλειομένου μέσου. *)

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


(** (Bonus 10 μονάδες) Ισοδυναμία DNE και EM *)

(** Στο μάθημα αναφέραμε ότι και ο νόμος της εξάλειψης της διπλής άρνησης
    (double negation elimination) είναι ισοδύναμος με τον νόμο του
    αποκλειομένου μέσου (excluded middle). Στην άσκηση αυτή θα αποδείξετε
    τυπικά αυτόν τον ισχυρισμό. *)

Definition DNE : Prop := forall P, ~~ P -> P.

(** Hint #1: Για κάθε μια από τις δύο κατευθύνσεις θα πρέπει να
    χρησιμοποιήσετε την υπόθεση με την κατάλληλη λογική πρόταση στη
    θέση του καθολικά ποσοτικοποιημένου [P]. Αυτή η πρόταση θα είναι
    διαφορετική σε κάθε περίπτωση. Αυτό μπορείτε να το κάνετε είτε με
    το tactic [specialize] είτε χρησιμοποιώντας το keyword [with] με το
    tactic [apply] όπως είδαμε στο logic.v. *)

Theorem DNE_EM : DNE <-> EM.
Proof.
  unfold DNE, EM.

  (* Θυμηθείτε ότι η ισοδυναμία ορίζεται ως σύζευξη δύο
     συνεπαγωγών. Μπορούμε λοιπόν να χρησιμοποιήσουμε το tactic
     [split] ώστε να δουλέψουμε ξεχωριστά με κάθε συνεπαγωγή. *)
  split.

  - (* DNE -> EM *)
    (* Hint #2: χρησιμοποιήστε το λήμμα [de_morgan_or] *)
    admit.

  - (* EM -> DNE *)
    admit.
Admitted.
(* [DNE_EM] Grade (Bonus): 0/10 *)

(** ** Άσκηση 4: Λίστες (42 μονάδες) *)

(** *** Μέρος 1 *)

(** Γράψτε μία επαγωγική σχέση (inductive relation), που να ισχύει
    όταν όλα τα στοιχεία μίας λίστας τύπου [list A] ικανοποιούν ένα
    κατηγόρημα [P : A -> Prop]. *)

Inductive All {A} (P : A -> Prop) : list A -> Prop :=
(*  ___ FILL IN HERE ___ *)
.

(* [All] Grade: 0/3 *)


(* Ελέγξτε τον ορισμό σας αποδεικνύοντας ότι όλοι οι αριθμοί στη λίστα
   [2;4;42;8] είναι ζυγοί και ότι δεν είναι όλοι οι αριθμοί στη λίστα
   [2;4;17;8] ζυγοί. *)

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


(* Αποδείξτε ότι εάν όλα τα στοιχεία των λιστών [l1] και [l2]
   ικανοποιούν το [P], τότε το ίδιο ισχύει και για τη συνένωση των
   δύο λιστών [l1 ++ l2]. *)

Lemma All_app :
  forall A P (l1 l2 : list A),
    All P l1 ->
    All P l2 ->
    All P (l1 ++ l2).
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [All_app] Grade: 0/4 *)


(* Στη συνέχεια αποδείξτε ότι εάν όλα τα στοιχεία μιας λίστας
   ικανοποιούν το [P], τότε το ίδιο ισχύει και για την αντιστροφή της
   λίστας. *)

Lemma All_rev :
  forall A P (l : list A),
    All P l ->
    All P (rev l).
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.
(* [All_rev] Grade: 0/4 *)


(** Just for fun: μπορείτε να εξασκηθείτε αποδεικνύοντας τα παρακάτω
    λήμματα. *)

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

(** *** Μέρος 2 *)

(** Γράψτε μία συνάρτηση [fold_left] πολυμορφική στους τύπους Α και Β,
    που παίρνει ως όρισμα μία συνάρτηση [f : A -> B -> A], μια λίστα
    [l] και μια αρχική τιμή [i].

    Εάν η λίστα είναι [[x1; ...; xn]] τότε το αποτέλεσμα της
    συνάρτησης είναι το [f (... (f (f i x1) x2) ...) xn]. Η συνάρτηση
    επιστρέφει το [i] εάν η λίστα είναι η κενή.

    Δηλαδή, η συνάρτηση εφαρμόζει διαδοχικά την [f] σε όλα τα στοιχεία
    της λίστας από αριστερά προς τα δεξιά, χρησιμοποιώντας ως πρώτο
    όρισμα τη συσσωρευμένη τιμή και ως δεύτερο όρισμα το τρέχον στοιχείο. *)

Fixpoint fold_left {A B} (f : A -> B -> A) (l : list B) (i : A) : A
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [fold_left] Grade: 0/3 *)

(** Προθέρμανση: χρησιμοποιήστε την [fold_left] για να γράψετε μία συνάρτηση [length]. *)

Definition length (l : list nat) : nat
(* := ___ FILL IN HERE ___ *).
Admitted.
  
(* [length] Grade: 0/1 *)

Example test_length : length [1;2;3;4] = 4.
Admitted.
(* Proof. reflexivity. Qed. *)

(** Προθέρμανση: χρησιμοποιήστε την [fold_left] για να γράψετε μία συνάρτηση που
    αθροίζει τα στοιχεία μιας λίστας φυσικών αριθμών. *)

Definition sum (l : list nat) : nat
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [sum] Grade: 0/1 *)

Example test_sum : sum [1;2;3;4] = 10.
Admitted. (* Για να ελέγξετε τον ορισμό σας, διαγράψτε αυτή τη γραμμή και κάντε uncomment την από κάτω. *)
(* Proof. reflexivity. Qed. *)


(** Γράψτε μία συνάρτηση [fold_right] πολυμορφική στους τύπους Α και Β,
    που παίρνει ως όρισμα μία συνάρτηση [f : B -> A -> A], μια λίστα
    [l] και μια αρχική τιμή [a0].

    Εάν η λίστα είναι [[x1; ...; xn]] τότε το αποτέλεσμα της
    συνάρτησης είναι το [f x1 (f x2 (... (f xn a0))))]. Η συνάρτηση
    επιστρέφει το [a0] εάν η λίστα είναι η κενή.

    Δηλαδή, η συνάρτηση εφαρμόζει διαδοχικά την [f] σε όλα τα στοιχεία
    της λίστας, ξεκινώντας από το τελευταίο (δεξιό) στοιχείο,
    χρησιμοποιώντας ως δεύτερο όρισμα το [a0]. Το αποτέλεσμα της
    εφαρμογής της [f] σε ένα στοιχείο χρησιμοποιείται ως δεύτερο
    όρισμα στην επόμενη εφαρμογή της [f] στο προηγούμενο στοιχείο
    της λίστας. *)

Fixpoint fold_right {A B} (f : B -> A -> A) (l : list B) (a0 : A) : A 
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [fold_right] Grade: 0/3 *)

(** Προθέρμανση: χρησιμοποιήστε την [fold_right] για να γράψετε μία συνάρτηση [length']. *)

Definition length' (l : list nat) : nat
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [length'] Grade: 0/1 *)

Example test_length' : length' [1;2;3;4] = 4.
Admitted.
(* Proof. reflexivity. Qed. *)

(** Προθέρμανση: χρησιμοποιήστε την [fold_right] για να γράψετε μία συνάρτηση που
    αθροίζει τα στοιχεία μιας λίστας φυσικών αριθμών. *)

Definition sum' (l : list nat) : nat
(* := ___ FILL IN HERE ___ *).
Admitted.

(* [sum'] Grade: 0/1 *)

Example test_sum' : sum' [1;2;3;4] = 10.
Admitted. (* Για να ελέγξετε τον ορισμό σας, διαγράψτε αυτή τη γραμμή και κάντε uncomment την από κάτω. *)
(* Proof. reflexivity. Qed. *)

(* Θέλουμε να αποδείξουμε ότι η εφαρμογή της [fold_left] σε μια
   συνάρτηση υψηλής τάξης [f] και μια λίστα [l] ισούται με την
   εφαρμογή της [fold_right] στη συνάρτηση [f'], που είναι ίδια με
   την [f] αλλά παίρνει τα ορίσματα της με αντίθετη σειρά, και στην
   αντίστροφη λίστα [rev l]. *)

(* Αποδείξτε πρώτα ότι η εφαρμογή της [fold_right] στη συνένωση δύο λιστών,
   ισούται με τη διαδοχική εφαρμογή της σε καθεμιά από τις λίστες. *)

Lemma fold_right_append :
forall A B (f : B -> A -> A) l1 l2 i,
  fold_right f (l1 ++ l2) i = fold_right f l1 (fold_right f l2 i).
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.

(* [fold_right_append] Grade: 0/5 *)

(* Τέλος, διατυπώστε και αποδείξτε το ζητούμενο θεώρημα. *)

Theorem fold_left_fold_right :
forall A B (f : A -> B -> A) (l : list B) (i : A),
    False (* ___ FILL IN HERE ___ *).
Proof.
(*  ___ FILL IN HERE ___ *)
Admitted.

(* [fold_left_fold_right] Grade: 0/8 *)

(** Γράψτε μία συνάρτηση [foo : A -> A -> A] για κάποιο τύπο [Α] της
    επιλογής σας για τον οποίο οι συναρτήσεις [fold_left] και
    [fold_right] επιστρέφουν διαφορετικά αποτελέσματα όταν
    εφαρμόζονται στην ίδια λίστα και στην ίδια αρχική τιμή. Τι
    χαρακτηριστικά έχει αυτή η συνάρτηση; Γράψτε δύο παραδείγματα, στο
    πρότυπο των [test_sum] και [test_sum'] που να δείχνουν ότι η
    συνάρτηση επιστρέφει διαφορετικό αποτέλεσμα. *)

(*  ___ FILL IN HERE ___ *)

(* [fold_left_fold_right_different] Grade: 0/6 *)
