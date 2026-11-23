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

theorem F_false {n : ℕ} (G : SimpleGraph (Fin n)) :
    F G (fun _ => false) = false := by
  rw [Bool.eq_false_iff, ne_eq, F_true]
  simp

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
    · have hbS : b ∈ S := hnone b (has ▸ hab)
      have hbne : b ≠ s := by
        intro heq; exact hab.ne (has.trans heq.symm)
      exact Or.inr (Finset.mem_erase.mpr ⟨hbne, hbS⟩)
    · by_cases hbs : b = s
      · have haS : a ∈ S := hnone a (hbs ▸ hab.symm)
        have hane : a ≠ s := by
          intro heq; exact hab.ne (heq.trans hbs.symm)
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

noncomputable def chi1 {n : ℕ} (u : Fin n) : Fin n → Bool :=
  fun i => decide (i = u)

noncomputable def chi2 {n : ℕ} (u v : Fin n) : Fin n → Bool :=
  fun i => decide (i = u ∨ i = v)

theorem chi1_eq {n : ℕ} (u : Fin n) : chi1 u u = true := by simp [chi1]

theorem chi1_ne {n : ℕ} (u i : Fin n) (h : i ≠ u) : chi1 u i = false := by
  simp [chi1, h]

theorem chi2_left {n : ℕ} (u v : Fin n) : chi2 u v u = true := by simp [chi2]

theorem chi2_right {n : ℕ} (u v : Fin n) : chi2 u v v = true := by simp [chi2]

theorem chi2_ne {n : ℕ} (u v i : Fin n) (hu : i ≠ u) (hv : i ≠ v) :
    chi2 u v i = false := by
  simp [chi2, hu, hv]

noncomputable def wireVal {n : ℕ} (C : Circuit) (x : Fin n → Bool) (w : ℕ) : Bool :=
  (C.wires (List.ofFn x)).getD w false

theorem wireVal_input {n : ℕ} (C : Circuit) (x : Fin n → Bool) (i : Fin n) :
    wireVal C x i.val = x i := by
  simpa [wireVal] using input_wire_getD C x i

noncomputable def litSupport {n : ℕ} (C : Circuit) (w : ℕ) : Set (Fin n) :=
  {u | wireVal C (chi1 u) w = true}

noncomputable def edgeSupport {n : ℕ} (G : SimpleGraph (Fin n)) (C : Circuit) (w : ℕ) :
    Set (Sym2 (Fin n)) :=
  {e | ∃ u v, s(u, v) = e ∧ G.Adj u v ∧
    wireVal C (chi2 u v) w = true ∧
    wireVal C (chi1 u) w = false ∧
    wireVal C (chi1 v) w = false}

theorem litSupport_mem {n : ℕ} (C : Circuit) (w : ℕ) (u : Fin n) :
    u ∈ litSupport C w ↔ wireVal C (chi1 u) w = true := by
  rfl

theorem edgeSupport_of_mem {n : ℕ} {G : SimpleGraph (Fin n)} {C : Circuit} {w : ℕ}
    {e : Sym2 (Fin n)} (he : e ∈ edgeSupport G C w) :
    e ∈ G.edgeSet := by
  obtain ⟨u, v, rfl, huv, _⟩ := he
  exact (SimpleGraph.mem_edgeSet G).2 huv

theorem edgeSupport_pair_of {n : ℕ} {G : SimpleGraph (Fin n)} {C : Circuit} {w : ℕ}
    {u v : Fin n} (huv : G.Adj u v)
    (h2 : wireVal C (chi2 u v) w = true)
    (h1u : wireVal C (chi1 u) w = false)
    (h1v : wireVal C (chi1 v) w = false) :
    s(u, v) ∈ edgeSupport G C w :=
  ⟨u, v, rfl, huv, h2, h1u, h1v⟩

theorem monotone2_op {C : Circuit} (h : Monotone2 C) (g : Gate) (hg : g ∈ C.gates) :
    g.op = GateOp.and ∨ g.op = GateOp.or := by
  have := (h g hg).1
  simpa only [Set.mem_insert_iff, Set.mem_singleton_iff] using this

theorem monotone2_fanin {C : Circuit} (h : Monotone2 C) (g : Gate) (hg : g ∈ C.gates) :
    g.inputs.length ≤ 2 :=
  (h g hg).2

theorem and_filter_length_le_size (C : Circuit) :
    (C.gates.filter isAnd).length ≤ C.size := by
  simpa [Circuit.size] using List.length_filter_le isAnd C.gates

theorem or_filter_length_le_size (C : Circuit) :
    (C.gates.filter isOr).length ≤ C.size := by
  simpa [Circuit.size] using List.length_filter_le isOr C.gates

theorem cover_card_le_n {n : ℕ} (S : Finset (Fin n)) : S.card ≤ n := by
  simpa using Finset.card_le_univ S

theorem size_ge_from_counts (C : Circuit) (hM : Monotone2 C) (m t : ℕ)
    (hα : t ≤ (C.gates.filter isAnd).length)
    (hω : m - 1 ≤ (C.gates.filter isOr).length)
    (hm : 0 < m) :
    m + t ≤ C.size + 1 := by
  have hsplit := size_eq_and_or C hM
  have := size_ge_joint m (C.gates.filter isAnd).length (C.gates.filter isOr).length t hα hω hm
  omega

theorem IsVertexCover_mono {n : ℕ} {G : SimpleGraph (Fin n)} {S T : Finset (Fin n)}
    (hS : IsVertexCover G S) (hsub : S ⊆ T) : IsVertexCover G T := by
  intro u v huv
  rcases hS u v huv with hu | hv
  · exact Or.inl (hsub hu)
  · exact Or.inr (hsub hv)

theorem tau_le_n {n t : ℕ} {G : SimpleGraph (Fin n)}
    (hex : ∃ S : Finset (Fin n), IsVertexCover G S ∧ S.card = t) :
    t ≤ n := by
  obtain ⟨S, _, hSt⟩ := hex
  have := cover_card_le_n S
  omega

theorem eval_eq_F {n : ℕ} {G : SimpleGraph (Fin n)} {C : Circuit}
    (hF : ∀ x : Fin n → Bool,
      C.eval (List.ofFn x) = true ↔ ∃ u v : Fin n, G.Adj u v ∧ x u = true ∧ x v = true)
    (x : Fin n → Bool) :
    C.eval (List.ofFn x) = F G x := by
  rw [Bool.eq_iff_iff, F_true, hF x]

theorem output_true_on_edge {n : ℕ} {G : SimpleGraph (Fin n)} {C : Circuit}
    (hF : ∀ x : Fin n → Bool,
      C.eval (List.ofFn x) = true ↔ ∃ u v : Fin n, G.Adj u v ∧ x u = true ∧ x v = true)
    {u v : Fin n} (huv : G.Adj u v) :
    wireVal C (chi2 u v) C.output = true := by
  have : C.eval (List.ofFn (chi2 u v)) = true :=
    (hF _).mpr ⟨u, v, huv, by simp [chi2], by simp [chi2]⟩
  simpa [wireVal, Circuit.eval] using this

theorem output_false_on_lit {n : ℕ} {G : SimpleGraph (Fin n)} {C : Circuit}
    (hF : ∀ x : Fin n → Bool,
      C.eval (List.ofFn x) = true ↔ ∃ u v : Fin n, G.Adj u v ∧ x u = true ∧ x v = true)
    (u : Fin n) :
    wireVal C (chi1 u) C.output = false := by
  have : C.eval (List.ofFn (chi1 u)) = false := by
    rw [Bool.eq_false_iff, ne_eq, hF]
    intro ⟨a, b, hab, ha, hb⟩
    have ha' : a = u := of_decide_eq_true (by simpa [chi1] using ha)
    have hb' : b = u := of_decide_eq_true (by simpa [chi1] using hb)
    exact hab.ne (ha'.trans hb'.symm)
  simpa [wireVal, Circuit.eval] using this

theorem edge_in_output_support {n : ℕ} {G : SimpleGraph (Fin n)} {C : Circuit}
    (hF : ∀ x : Fin n → Bool,
      C.eval (List.ofFn x) = true ↔ ∃ u v : Fin n, G.Adj u v ∧ x u = true ∧ x v = true)
    {u v : Fin n} (huv : G.Adj u v) :
    s(u, v) ∈ edgeSupport G C C.output :=
  edgeSupport_pair_of huv (output_true_on_edge hF huv)
    (output_false_on_lit hF u) (output_false_on_lit hF v)

theorem ncard_eq_edgeFinset {n : ℕ} (G : SimpleGraph (Fin n)) [DecidableRel G.Adj] :
    G.edgeSet.ncard = G.edgeFinset.card := by
  rw [← Set.ncard_coe_finset, SimpleGraph.coe_edgeFinset]

theorem gate_wire_index {n : ℕ} (C : Circuit) (j : ℕ) (hj : j < C.gates.length) :
    n + j < n + C.gates.length := by
  omega

def wiresFrom (gs : List Gate) (w : List Bool) : List Bool :=
  gs.foldl (fun w g => w ++ [g.op.eval (g.inputs.map fun i => w.getD i false)]) w

theorem wires_eq_wiresFrom (C : Circuit) (x : List Bool) :
    C.wires x = wiresFrom C.gates x :=
  rfl

theorem wiresFrom_nil (w : List Bool) : wiresFrom [] w = w := by
  simp [wiresFrom]

theorem wiresFrom_cons (g : Gate) (gs : List Gate) (w : List Bool) :
    wiresFrom (g :: gs) w =
      wiresFrom gs (w ++ [g.op.eval (g.inputs.map fun i => w.getD i false)]) := by
  simp [wiresFrom]

theorem wiresFrom_prefix (gs : List Gate) :
    ∀ w : List Bool, ∃ t : List Bool, wiresFrom gs w = w ++ t ∧ t.length = gs.length := by
  induction gs with
  | nil =>
    intro w
    exact ⟨[], by simp [wiresFrom], rfl⟩
  | cons g gs ih =>
    intro w
    obtain ⟨t, ht, hl⟩ := ih (w ++ [g.op.eval (g.inputs.map fun i => w.getD i false)])
    refine ⟨g.op.eval (g.inputs.map fun i => w.getD i false) :: t, ?_, by simp [hl]⟩
    rw [wiresFrom_cons, ht]
    simp

theorem length_wiresFrom (gs : List Gate) (w : List Bool) :
    (wiresFrom gs w).length = w.length + gs.length := by
  obtain ⟨t, ht, hl⟩ := wiresFrom_prefix gs w
  rw [ht]
  simp [hl]

theorem getD_wiresFrom_prefix (gs : List Gate) (w : List Bool) (i : ℕ) (h : i < w.length) :
    (wiresFrom gs w).getD i false = w.getD i false := by
  obtain ⟨t, ht, _⟩ := wiresFrom_prefix gs w
  rw [ht, List.getD_append _ _ _ _ h]

theorem and_eval_two (a b : Bool) :
    GateOp.eval GateOp.and [a, b] = (a && b) := by
  simp [GateOp.eval]

theorem or_eval_two (a b : Bool) :
    GateOp.eval GateOp.or [a, b] = (a || b) := by
  simp [GateOp.eval]

theorem biclique_center_left {n : ℕ} {G : SimpleGraph (Fin n)} (_hG : NoC4 G)
    {A B : Finset (Fin n)}
    (hAdj : ∀ a ∈ A, ∀ b ∈ B, G.Adj a b)
    (_hAne : A.Nonempty) (_hBne : B.Nonempty)
    (hA : A.card = 1) :
    ∃ c, A = {c} ∧ ∀ b ∈ B, G.Adj c b := by
  classical
  obtain ⟨c, hc⟩ := Finset.card_eq_one.mp hA
  refine ⟨c, hc, ?_⟩
  intro b hb
  exact hAdj c (hc ▸ Finset.mem_singleton_self c) b hb

theorem biclique_center_right {n : ℕ} {G : SimpleGraph (Fin n)} (_hG : NoC4 G)
    {A B : Finset (Fin n)}
    (hAdj : ∀ a ∈ A, ∀ b ∈ B, G.Adj a b)
    (_hAne : A.Nonempty) (_hBne : B.Nonempty)
    (hB : B.card = 1) :
    ∃ c, B = {c} ∧ ∀ a ∈ A, G.Adj a c := by
  classical
  obtain ⟨c, hc⟩ := Finset.card_eq_one.mp hB
  refine ⟨c, hc, ?_⟩
  intro a ha
  exact hAdj a ha c (hc ▸ Finset.mem_singleton_self c)

theorem size_eq_and_or_add (C : Circuit) (h : Monotone2 C) :
    C.size + 1 =
      (C.gates.filter isAnd).length + (C.gates.filter isOr).length + 1 := by
  rw [size_eq_and_or C h]

theorem litSupport_input {n : ℕ} (C : Circuit) (i : Fin n) :
    litSupport C i.val = {i} := by
  ext u
  show wireVal C (chi1 u) i.val = true ↔ u = i
  rw [wireVal_input]
  constructor
  · intro h
    have h' : i = u := of_decide_eq_true (by simpa [chi1] using h)
    exact h'.symm
  · intro h
    simp [chi1, h]

theorem edgeSupport_input {n : ℕ} (G : SimpleGraph (Fin n)) (C : Circuit) (i : Fin n) :
    edgeSupport G C i.val = ∅ := by
  apply Set.eq_empty_iff_forall_notMem.mpr
  intro e he
  obtain ⟨u, v, rfl, _huv, h2, h1u, h1v⟩ := he
  have h2' : chi2 u v i = true := by
    simpa [wireVal_input C (chi2 u v) i] using h2
  have h1u' : chi1 u i = false := by
    simpa [wireVal_input C (chi1 u) i] using h1u
  have h1v' : chi1 v i = false := by
    simpa [wireVal_input C (chi1 v) i] using h1v
  have h2'' : i = u ∨ i = v :=
    of_decide_eq_true (by simpa [chi2] using h2')
  cases h2'' with
  | inl hiu =>
    have : chi1 u i = true := by simp [chi1, hiu]
    exact Bool.false_ne_true (h1u'.symm.trans this)
  | inr hiv =>
    have : chi1 v i = true := by simp [chi1, hiv]
    exact Bool.false_ne_true (h1v'.symm.trans this)

theorem GateOp.and_eval_map (inputs : List ℕ) (w : List Bool) :
    GateOp.eval GateOp.and (inputs.map fun i => w.getD i false) =
      (inputs.map fun i => w.getD i false).all id :=
  rfl

theorem GateOp.or_eval_map (inputs : List ℕ) (w : List Bool) :
    GateOp.eval GateOp.or (inputs.map fun i => w.getD i false) =
      (inputs.map fun i => w.getD i false).any id :=
  rfl

theorem all_two (a b : Bool) : [a, b].all id = (a && b) := by simp

theorem any_two (a b : Bool) : [a, b].any id = (a || b) := by simp

theorem and_of_lits_is_star {n : ℕ} {G : SimpleGraph (Fin n)} (hG : NoC4 G)
    {A B : Finset (Fin n)}
    (hAne : A.Nonempty) (hBne : B.Nonempty)
    (hEdges : ∀ a ∈ A, ∀ b ∈ B, G.Adj a b) :
    A.card = 1 ∨ B.card = 1 :=
  biclique_is_star hG hEdges hAne hBne

theorem star_partition_ge {m k : ℕ} (_hk : 0 < k) (_hkm : k ≤ m) :
    m + k - 1 ≤ m + k - 1 :=
  le_rfl

theorem counts_imply_bound (C : Circuit) (hM : Monotone2 C) (m t α ω : ℕ)
    (hαeq : α = (C.gates.filter isAnd).length)
    (hωeq : ω = (C.gates.filter isOr).length)
    (hα : t ≤ α) (hω : m - 1 ≤ ω) (hm : 0 < m) :
    m + t ≤ C.size + 1 := by
  subst hαeq
  subst hωeq
  exact size_ge_from_counts C hM m t hα hω hm

/-- Pair-safety: a wire that is true on a 2-set, and false on both singletons, only
accepts actual edges of `G`. -/
def PairSafe {n : ℕ} (G : SimpleGraph (Fin n)) (C : Circuit) (w : ℕ) : Prop :=
  ∀ u v : Fin n, u ≠ v →
    wireVal C (chi2 u v) w = true →
    wireVal C (chi1 u) w = true ∨ wireVal C (chi1 v) w = true ∨ G.Adj u v

theorem PairSafe_of_edgeSupport {n : ℕ} {G : SimpleGraph (Fin n)} {C : Circuit} {w : ℕ}
    (h : PairSafe G C w) {u v : Fin n} (huv : u ≠ v)
    (h2 : wireVal C (chi2 u v) w = true)
    (h1u : wireVal C (chi1 u) w = false)
    (h1v : wireVal C (chi1 v) w = false) :
    G.Adj u v := by
  have := h u v huv h2
  simp [h1u, h1v] at this
  exact this

theorem PairSafe_input {n : ℕ} (G : SimpleGraph (Fin n)) (C : Circuit) (i : Fin n) :
    PairSafe G C i.val := by
  intro u v huv h2
  have h2' : chi2 u v i = true := by
    simpa [wireVal_input C (chi2 u v) i] using h2
  have : i = u ∨ i = v := of_decide_eq_true (by simpa [chi2] using h2')
  cases this with
  | inl h =>
    left
    simp [wireVal_input, chi1, h]
  | inr h =>
    right; left
    simp [wireVal_input, chi1, h]

theorem PairSafe_output {n : ℕ} {G : SimpleGraph (Fin n)} {C : Circuit}
    (hF : ∀ x : Fin n → Bool,
      C.eval (List.ofFn x) = true ↔ ∃ u v : Fin n, G.Adj u v ∧ x u = true ∧ x v = true) :
    PairSafe G C C.output := by
  intro u v huv h2
  have heval : C.eval (List.ofFn (chi2 u v)) = true := by
    simpa [wireVal, Circuit.eval] using h2
  obtain ⟨a, b, hab, ha, hb⟩ := (hF _).mp heval
  have ha' : a = u ∨ a = v := of_decide_eq_true (by simpa [chi2] using ha)
  have hb' : b = u ∨ b = v := of_decide_eq_true (by simpa [chi2] using hb)
  cases ha' with
  | inl hau =>
    cases hb' with
    | inl hbu =>
      exact absurd (hau.trans hbu.symm) hab.ne
    | inr hbv =>
      right; right
      exact hau ▸ hbv ▸ hab
  | inr hav =>
    cases hb' with
    | inl hbu =>
      right; right
      exact (hav ▸ hbu ▸ hab).symm
    | inr hbv =>
      exact absurd (hav.trans hbv.symm) hab.ne

theorem star_cover_total (m k : ℕ) (_hk : 0 < k) (_hkm : k ≤ m) :
    (m - k) + k + (k - 1) = m + k - 1 := by
  omega

theorem gate_isAnd_iff (g : Gate) :
    isAnd g = true ↔ g.op = GateOp.and := by
  cases g with
  | mk op inputs => cases op <;> simp [isAnd]

theorem gate_isOr_iff (g : Gate) :
    isOr g = true ↔ g.op = GateOp.or := by
  cases g with
  | mk op inputs => cases op <;> simp [isOr]

/-- Under `Monotone2`, every gate is tagged by exactly one of `isAnd` / `isOr`. -/
theorem monotone2_isAnd_or_isOr {C : Circuit} (h : Monotone2 C) {g : Gate}
    (hg : g ∈ C.gates) : isAnd g = true ∨ isOr g = true := by
  rcases monotone2_op h g hg with hA | hO
  · left; exact (gate_isAnd_iff g).mpr hA
  · right; exact (gate_isOr_iff g).mpr hO

end PEqualNP.Outside.L_meta_612_aux
