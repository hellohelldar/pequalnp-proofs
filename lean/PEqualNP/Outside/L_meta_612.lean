import Mathlib
import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_612_aux

open PEqualNP.CircuitLowerBounds PEqualNP.MetaComplexity
open PEqualNP.MetaComplexity.CoverPromise

def NoC4 {n : ℕ} (G : SimpleGraph (Fin n)) : Prop :=
  ∀ a b c d : Fin n, a ≠ b → a ≠ c → a ≠ d → b ≠ c → b ≠ d → c ≠ d →
    G.Adj a b → G.Adj b c → G.Adj c d → ¬ G.Adj d a

noncomputable def F {n : ℕ} (G : SimpleGraph (Fin n)) (x : Fin n → Bool) : Bool :=
  @decide ((∃ u v : Fin n, G.Adj u v ∧ x u = true ∧ x v = true))
    (Classical.propDecidable _)

theorem F_true {n : ℕ} (G : SimpleGraph (Fin n)) (x : Fin n → Bool) :
    F G x = true ↔ ∃ u v : Fin n, G.Adj u v ∧ x u = true ∧ x v = true := by
  unfold F
  exact @decide_eq_true_iff _ (Classical.propDecidable _)

theorem F_singleton {n : ℕ} (G : SimpleGraph (Fin n)) (u : Fin n) :
    F G (fun i => decide (i = u)) = false := by
  rw [Bool.eq_false_iff, ne_eq, F_true]
  rintro ⟨a, b, hab, ha, hb⟩
  exact hab.ne ((of_decide_eq_true ha).trans (of_decide_eq_true hb).symm)

theorem F_pair {n : ℕ} (G : SimpleGraph (Fin n)) {u v : Fin n} (h : G.Adj u v) :
    F G (fun i => decide (i = u ∨ i = v)) = true := by
  rw [F_true]
  exact ⟨u, v, h, by simp, by simp⟩

def isAnd : Gate → Bool
  | ⟨GateOp.and, _⟩ => true
  | _ => false

def isOr : Gate → Bool
  | ⟨GateOp.or, _⟩ => true
  | _ => false

theorem filter_and_or_partition_list :
    ∀ (gates : List Gate),
      (∀ g ∈ gates, g.op ∈ ({GateOp.and, GateOp.or} : Set GateOp)) →
      gates.length = (gates.filter isAnd).length + (gates.filter isOr).length
  | [], _ => by simp
  | g :: gs, h => by
    have hg := h g (by simp)
    have hop : g.op = GateOp.and ∨ g.op = GateOp.or := by
      simpa only [Set.mem_insert_iff, Set.mem_singleton_iff] using hg
    have ih := filter_and_or_partition_list gs (fun g' hg' => h g' (by simp [hg']))
    cases g with
    | mk op inputs =>
      rcases hop with rfl | rfl
      · simp [isAnd, isOr, List.filter_cons, ih]; omega
      · simp [isAnd, isOr, List.filter_cons, ih]; omega

theorem size_eq_and_or (C : Circuit) (h : Monotone2 C) :
    C.size = (C.gates.filter isAnd).length + (C.gates.filter isOr).length := by
  simpa [Circuit.size] using filter_and_or_partition_list C.gates (fun g hg => (h g hg).1)

theorem no_K22 {n : ℕ} {G : SimpleGraph (Fin n)} (hG : NoC4 G)
    {A B : Finset (Fin n)} (hA : 1 < A.card) (hB : 1 < B.card)
    (hAdj : ∀ a ∈ A, ∀ b ∈ B, G.Adj a b) : False := by
  classical
  obtain ⟨a₁, ha₁, a₂, ha₂, ha⟩ := Finset.one_lt_card.mp hA
  obtain ⟨b₁, hb₁, b₂, hb₂, hb⟩ := Finset.one_lt_card.mp hB
  have h1 : G.Adj a₁ b₁ := hAdj a₁ ha₁ b₁ hb₁
  have h2 : G.Adj b₁ a₂ := (hAdj a₂ ha₂ b₁ hb₁).symm
  have h3 : G.Adj a₂ b₂ := hAdj a₂ ha₂ b₂ hb₂
  have h4 : G.Adj b₂ a₁ := (hAdj a₁ ha₁ b₂ hb₂).symm
  exact hG a₁ b₁ a₂ b₂ h1.ne ha h4.ne.symm h2.ne hb h3.ne h1 h2 h3 h4

theorem edgeSet_ncard_pos {n : ℕ} {G : SimpleGraph (Fin n)}
    (hE : ∃ u v : Fin n, G.Adj u v) : 0 < G.edgeSet.ncard := by
  classical
  obtain ⟨u, v, huv⟩ := hE
  have he : (s(u, v) : Sym2 (Fin n)) ∈ G.edgeSet := by
    simpa [SimpleGraph.mem_edgeSet] using huv
  exact (Set.ncard_pos).2 ⟨_, he⟩

theorem joint_potential (m α ω t : ℕ) (hα : t ≤ α) (hpot : m + α - 1 ≤ α + ω)
    (_hm : 0 < m) : m + t ≤ α + ω + 1 := by
  omega

theorem star_cost_identity (m k : ℕ) (_hk : 0 < k) (_hkm : k ≤ m) :
    (m - k) + k + (k - 1) = m + k - 1 := by
  omega

theorem star_partition_cost (m k : ℕ) (hk : 0 < k) (hkm : k ≤ m) :
    m + k - 1 = (m - k) + k + (k - 1) := by
  omega

theorem min_cover_private {n : ℕ} {G : SimpleGraph (Fin n)} {S : Finset (Fin n)}
    (hS : IsVertexCover G S)
    (hmin : ∀ T : Finset (Fin n), IsVertexCover G T → S.card ≤ T.card)
    (s : Fin n) (hs : s ∈ S) :
    ∃ u : Fin n, G.Adj s u ∧ u ∉ S := by
  by_contra hnone
  push Not at hnone
  have hS' : IsVertexCover G (S.erase s) := by
    intro a b hab
    have hab' := hS a b hab
    by_cases has : a = s
    · subst has
      have hbS : b ∈ S := hnone b hab
      have hbne : b ≠ s := hab.ne.symm
      exact Or.inr (Finset.mem_erase.mpr ⟨hbne, hbS⟩)
    · by_cases hbs : b = s
      · subst hbs
        have haS : a ∈ S := hnone a hab.symm
        have hane : a ≠ s := hab.ne
        exact Or.inl (Finset.mem_erase.mpr ⟨hane, haS⟩)
      · rcases hab' with ha | hb
        · exact Or.inl (Finset.mem_erase.mpr ⟨has, ha⟩)
        · exact Or.inr (Finset.mem_erase.mpr ⟨hbs, hb⟩)
  have hle := hmin (S.erase s) hS'
  have hlt : (S.erase s).card < S.card := Finset.card_erase_lt_of_mem hs
  omega

theorem biclique_is_star {n : ℕ} {G : SimpleGraph (Fin n)} (hG : NoC4 G)
    {A B : Finset (Fin n)} (hAdj : ∀ a ∈ A, ∀ b ∈ B, G.Adj a b)
    (hAne : A.Nonempty) (hBne : B.Nonempty) :
    A.card = 1 ∨ B.card = 1 := by
  classical
  by_contra h
  push Not at h
  have hA : 1 < A.card :=
    lt_of_le_of_ne (Nat.succ_le_of_lt (Finset.card_pos.mpr hAne)) h.1.symm
  have hB : 1 < B.card :=
    lt_of_le_of_ne (Nat.succ_le_of_lt (Finset.card_pos.mpr hBne)) h.2.symm
  exact no_K22 hG hA hB hAdj

theorem size_ge_joint (m α ω t : ℕ) (hα : t ≤ α) (hω : m - 1 ≤ ω) (hm : 0 < m) :
    m + t ≤ α + ω + 1 := by
  have hpot : m + α - 1 ≤ α + ω := by omega
  exact joint_potential m α ω t hα hpot hm

theorem size_rewrite (C : Circuit) (h : Monotone2 C) :
    C.size + 1 = (C.gates.filter isAnd).length + (C.gates.filter isOr).length + 1 := by
  rw [size_eq_and_or C h]

theorem wires_prefix_getD (gs : List Gate) :
    ∀ (L : List Bool) (i : ℕ), i < L.length →
      (gs.foldl (fun w g => w ++ [g.op.eval (g.inputs.map fun j => w.getD j false)]) L).getD i false
        = L.getD i false := by
  induction gs with
  | nil =>
    intro L i hi
    simp
  | cons g gs ih =>
    intro L i hi
    change (gs.foldl (fun w g => w ++ [g.op.eval (g.inputs.map fun j => w.getD j false)])
      (L ++ [g.op.eval (g.inputs.map fun j => L.getD j false)])).getD i false = L.getD i false
    have hi' : i < (L ++ [g.op.eval (g.inputs.map fun j => L.getD j false)]).length := by
      simp; omega
    rw [ih _ i hi', List.getD_append L _ false i hi]

theorem input_wire_getD {n : ℕ} (C : Circuit) (x : Fin n → Bool) (i : Fin n) :
    (C.wires (List.ofFn x)).getD i.val false = x i := by
  have hi : i.val < (List.ofFn x).length := by simp
  have h := wires_prefix_getD C.gates (List.ofFn x) i.val hi
  simpa [Circuit.wires, List.getD_eq_getElem?_getD] using h

end PEqualNP.Outside.L_meta_612_aux
