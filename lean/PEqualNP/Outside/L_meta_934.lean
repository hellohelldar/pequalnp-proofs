import Mathlib
import PEqualNP.Defs

set_option maxRecDepth 8192 in
set_option maxHeartbeats 12000000 in
theorem PEqualNP.Outside.L_meta_934 :
    (∀ C1 : PEqualNP.CircuitLowerBounds.Circuit, C1 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.and, [0, 1]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [3, 4]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [2, 9]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [3, 7]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [5, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [4, 7]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [6, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [8, 10]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 12]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C1 ∧ C1.size = 10 ∧ (∀ x1 : Fin 8 → Bool, (C1.eval (List.ofFn x1) = true ↔ ∃ u1 v1 : Fin 8, (u1.val, v1.val) ∈ ([(0, 1), (2, 3), (2, 4), (3, 5), (4, 6), (5, 7), (6, 7)] : List (ℕ × ℕ)) ∧ x1 u1 = true ∧ x1 v1 = true))) ∧ (∀ C2 : PEqualNP.CircuitLowerBounds.Circuit, C2 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.and, [0, 1]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [2, 4]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [3, 9]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [6, 7]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [5, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [4, 6]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [7, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [8, 10]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 12]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C2 ∧ C2.size = 10 ∧ (∀ x2 : Fin 8 → Bool, (C2.eval (List.ofFn x2) = true ↔ ∃ u2 v2 : Fin 8, (u2.val, v2.val) ∈ ([(0, 1), (2, 3), (3, 4), (4, 7), (5, 6), (5, 7), (6, 7)] : List (ℕ × ℕ)) ∧ x2 u2 = true ∧ x2 v2 = true))) ∧ (∀ C3 : PEqualNP.CircuitLowerBounds.Circuit, C3 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.and, [0, 1]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [2, 4]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [3, 5]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [10, 7]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [6, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [4, 5]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [7, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [8, 9]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 12]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C3 ∧ C3.size = 10 ∧ (∀ x3 : Fin 8 → Bool, (C3.eval (List.ofFn x3) = true ↔ ∃ u3 v3 : Fin 8, (u3.val, v3.val) ∈ ([(0, 1), (2, 4), (3, 6), (4, 7), (5, 6), (5, 7), (6, 7)] : List (ℕ × ℕ)) ∧ x3 u3 = true ∧ x3 v3 = true))) ∧ (∀ C4 : PEqualNP.CircuitLowerBounds.Circuit, C4 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.and, [0, 1]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [2, 4]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [6, 7]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [5, 10]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [3, 4]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [12, 6]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [7, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [8, 9]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C4 ∧ C4.size = 10 ∧ (∀ x4 : Fin 8 → Bool, (C4.eval (List.ofFn x4) = true ↔ ∃ u4 v4 : Fin 8, (u4.val, v4.val) ∈ ([(0, 1), (2, 4), (3, 7), (4, 7), (5, 6), (5, 7), (6, 7)] : List (ℕ × ℕ)) ∧ x4 u4 = true ∧ x4 v4 = true))) ∧ (∀ C5 : PEqualNP.CircuitLowerBounds.Circuit, C5 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.and, [0, 1]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [2, 5]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [3, 5]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [10, 7]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [6, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [4, 5]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [7, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [8, 9]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 12]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C5 ∧ C5.size = 10 ∧ (∀ x5 : Fin 8 → Bool, (C5.eval (List.ofFn x5) = true ↔ ∃ u5 v5 : Fin 8, (u5.val, v5.val) ∈ ([(0, 1), (2, 5), (3, 6), (4, 7), (5, 6), (5, 7), (6, 7)] : List (ℕ × ℕ)) ∧ x5 u5 = true ∧ x5 v5 = true))) ∧ (∀ C6 : PEqualNP.CircuitLowerBounds.Circuit, C6 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.and, [0, 1]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [7, 5]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [4, 9]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [5, 7]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [2, 3]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [12, 7]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [6, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [8, 10]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C6 ∧ C6.size = 10 ∧ (∀ x6 : Fin 8 → Bool, (C6.eval (List.ofFn x6) = true ↔ ∃ u6 v6 : Fin 8, (u6.val, v6.val) ∈ ([(0, 1), (2, 6), (3, 6), (4, 5), (4, 7), (5, 7), (6, 7)] : List (ℕ × ℕ)) ∧ x6 u6 = true ∧ x6 v6 = true))) ∧ (∀ C7 : PEqualNP.CircuitLowerBounds.Circuit, C7 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.and, [0, 1]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [5, 4]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [3, 9]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [4, 6]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [2, 5]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [12, 6]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [7, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [8, 10]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C7 ∧ C7.size = 10 ∧ (∀ x7 : Fin 8 → Bool, (C7.eval (List.ofFn x7) = true ↔ ∃ u7 v7 : Fin 8, (u7.val, v7.val) ∈ ([(0, 1), (2, 7), (3, 4), (3, 5), (4, 6), (5, 7), (6, 7)] : List (ℕ × ℕ)) ∧ x7 u7 = true ∧ x7 v7 = true))) ∧ (∀ C8 : PEqualNP.CircuitLowerBounds.Circuit, C8 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.or, [0, 1]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [2, 8]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [5, 4]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [3, 10]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [4, 6]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [5, 6]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [7, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [9, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 12]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C8 ∧ C8.size = 10 ∧ (∀ x8 : Fin 8 → Bool, (C8.eval (List.ofFn x8) = true ↔ ∃ u8 v8 : Fin 8, (u8.val, v8.val) ∈ ([(0, 2), (1, 2), (3, 4), (3, 5), (4, 6), (5, 7), (6, 7)] : List (ℕ × ℕ)) ∧ x8 u8 = true ∧ x8 v8 = true))) ∧ (∀ C9 : PEqualNP.CircuitLowerBounds.Circuit, C9 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.or, [0, 4]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [2, 8]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [1, 4]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [3, 10]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [7, 6]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [5, 12]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [6, 7]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [9, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C9 ∧ C9.size = 10 ∧ (∀ x9 : Fin 8 → Bool, (C9.eval (List.ofFn x9) = true ↔ ∃ u9 v9 : Fin 8, (u9.val, v9.val) ∈ ([(0, 2), (1, 3), (2, 4), (3, 4), (5, 6), (5, 7), (6, 7)] : List (ℕ × ℕ)) ∧ x9 u9 = true ∧ x9 v9 = true))) ∧ (∀ C10 : PEqualNP.CircuitLowerBounds.Circuit, C10 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.and, [2, 4]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [0, 1]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [3, 9]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [6, 7]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [5, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [4, 6]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [7, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [8, 10]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 12]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C10 ∧ C10.size = 10 ∧ (∀ x10 : Fin 8 → Bool, (C10.eval (List.ofFn x10) = true ↔ ∃ u10 v10 : Fin 8, (u10.val, v10.val) ∈ ([(0, 3), (1, 3), (2, 4), (4, 7), (5, 6), (5, 7), (6, 7)] : List (ℕ × ℕ)) ∧ x10 u10 = true ∧ x10 v10 = true))) ∧ (∀ C11 : PEqualNP.CircuitLowerBounds.Circuit, C11 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.and, [0, 3]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [1, 3]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [4, 9]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [6, 7]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [5, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [2, 6]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [7, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [8, 10]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 12]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C11 ∧ C11.size = 10 ∧ (∀ x11 : Fin 8 → Bool, (C11.eval (List.ofFn x11) = true ↔ ∃ u11 v11 : Fin 8, (u11.val, v11.val) ∈ ([(0, 3), (1, 4), (2, 7), (3, 4), (5, 6), (5, 7), (6, 7)] : List (ℕ × ℕ)) ∧ x11 u11 = true ∧ x11 v11 = true))) ∧ (∀ C12 : PEqualNP.CircuitLowerBounds.Circuit, C12 = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.and, [0, 3]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [6, 5]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [4, 9]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [5, 6]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [1, 2]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [12, 3]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [7, 13]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [8, 10]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [15, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [16, 14]⟩], output := 17 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C12 ∧ C12.size = 10 ∧ (∀ x12 : Fin 8 → Bool, (C12.eval (List.ofFn x12) = true ↔ ∃ u12 v12 : Fin 8, (u12.val, v12.val) ∈ ([(0, 3), (1, 7), (2, 7), (3, 7), (4, 5), (4, 6), (5, 6)] : List (ℕ × ℕ)) ∧ x12 u12 = true ∧ x12 v12 = true))) := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro C1 hC1
    subst C1
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x1
      let edges : List (Fin 8 × Fin 8) := [(0, 1), (2, 3), (2, 4), (3, 5), (4, 6), (5, 7), (6, 7)]
      have edges_spec :
          edges.any (fun p => x1 p.1 && x1 p.2) = true ↔
            ∃ u1 v1 : Fin 8, (u1.val, v1.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x1 u1 = true ∧ x1 v1 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u1, v1⟩, huv, hbits⟩
          exact ⟨u1, v1, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u1, v1, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u1 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v1 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u1, v1), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u1 v1 : Fin 8, (u1.val, v1.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x1 u1 = true ∧ x1 v1 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

  · intro C2 hC2
    subst C2
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x2
      let edges : List (Fin 8 × Fin 8) := [(0, 1), (2, 3), (3, 4), (4, 7), (5, 6), (5, 7), (6, 7)]
      have edges_spec :
          edges.any (fun p => x2 p.1 && x2 p.2) = true ↔
            ∃ u2 v2 : Fin 8, (u2.val, v2.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x2 u2 = true ∧ x2 v2 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u2, v2⟩, huv, hbits⟩
          exact ⟨u2, v2, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u2, v2, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u2 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v2 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u2, v2), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u2 v2 : Fin 8, (u2.val, v2.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x2 u2 = true ∧ x2 v2 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

  · intro C3 hC3
    subst C3
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x3
      let edges : List (Fin 8 × Fin 8) := [(0, 1), (2, 4), (3, 6), (4, 7), (5, 6), (5, 7), (6, 7)]
      have edges_spec :
          edges.any (fun p => x3 p.1 && x3 p.2) = true ↔
            ∃ u3 v3 : Fin 8, (u3.val, v3.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x3 u3 = true ∧ x3 v3 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u3, v3⟩, huv, hbits⟩
          exact ⟨u3, v3, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u3, v3, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u3 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v3 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u3, v3), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u3 v3 : Fin 8, (u3.val, v3.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x3 u3 = true ∧ x3 v3 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

  · intro C4 hC4
    subst C4
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x4
      let edges : List (Fin 8 × Fin 8) := [(0, 1), (2, 4), (3, 7), (4, 7), (5, 6), (5, 7), (6, 7)]
      have edges_spec :
          edges.any (fun p => x4 p.1 && x4 p.2) = true ↔
            ∃ u4 v4 : Fin 8, (u4.val, v4.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x4 u4 = true ∧ x4 v4 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u4, v4⟩, huv, hbits⟩
          exact ⟨u4, v4, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u4, v4, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u4 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v4 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u4, v4), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u4 v4 : Fin 8, (u4.val, v4.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x4 u4 = true ∧ x4 v4 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

  · intro C5 hC5
    subst C5
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x5
      let edges : List (Fin 8 × Fin 8) := [(0, 1), (2, 5), (3, 6), (4, 7), (5, 6), (5, 7), (6, 7)]
      have edges_spec :
          edges.any (fun p => x5 p.1 && x5 p.2) = true ↔
            ∃ u5 v5 : Fin 8, (u5.val, v5.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x5 u5 = true ∧ x5 v5 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u5, v5⟩, huv, hbits⟩
          exact ⟨u5, v5, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u5, v5, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u5 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v5 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u5, v5), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u5 v5 : Fin 8, (u5.val, v5.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x5 u5 = true ∧ x5 v5 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

  · intro C6 hC6
    subst C6
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x6
      let edges : List (Fin 8 × Fin 8) := [(0, 1), (2, 6), (3, 6), (4, 5), (4, 7), (5, 7), (6, 7)]
      have edges_spec :
          edges.any (fun p => x6 p.1 && x6 p.2) = true ↔
            ∃ u6 v6 : Fin 8, (u6.val, v6.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x6 u6 = true ∧ x6 v6 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u6, v6⟩, huv, hbits⟩
          exact ⟨u6, v6, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u6, v6, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u6 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v6 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u6, v6), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u6 v6 : Fin 8, (u6.val, v6.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x6 u6 = true ∧ x6 v6 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

  · intro C7 hC7
    subst C7
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x7
      let edges : List (Fin 8 × Fin 8) := [(0, 1), (2, 7), (3, 4), (3, 5), (4, 6), (5, 7), (6, 7)]
      have edges_spec :
          edges.any (fun p => x7 p.1 && x7 p.2) = true ↔
            ∃ u7 v7 : Fin 8, (u7.val, v7.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x7 u7 = true ∧ x7 v7 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u7, v7⟩, huv, hbits⟩
          exact ⟨u7, v7, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u7, v7, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u7 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v7 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u7, v7), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u7 v7 : Fin 8, (u7.val, v7.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x7 u7 = true ∧ x7 v7 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

  · intro C8 hC8
    subst C8
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x8
      let edges : List (Fin 8 × Fin 8) := [(0, 2), (1, 2), (3, 4), (3, 5), (4, 6), (5, 7), (6, 7)]
      have edges_spec :
          edges.any (fun p => x8 p.1 && x8 p.2) = true ↔
            ∃ u8 v8 : Fin 8, (u8.val, v8.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x8 u8 = true ∧ x8 v8 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u8, v8⟩, huv, hbits⟩
          exact ⟨u8, v8, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u8, v8, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u8 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v8 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u8, v8), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u8 v8 : Fin 8, (u8.val, v8.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x8 u8 = true ∧ x8 v8 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

  · intro C9 hC9
    subst C9
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x9
      let edges : List (Fin 8 × Fin 8) := [(0, 2), (1, 3), (2, 4), (3, 4), (5, 6), (5, 7), (6, 7)]
      have edges_spec :
          edges.any (fun p => x9 p.1 && x9 p.2) = true ↔
            ∃ u9 v9 : Fin 8, (u9.val, v9.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x9 u9 = true ∧ x9 v9 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u9, v9⟩, huv, hbits⟩
          exact ⟨u9, v9, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u9, v9, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u9 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v9 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u9, v9), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u9 v9 : Fin 8, (u9.val, v9.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x9 u9 = true ∧ x9 v9 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

  · intro C10 hC10
    subst C10
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x10
      let edges : List (Fin 8 × Fin 8) := [(0, 3), (1, 3), (2, 4), (4, 7), (5, 6), (5, 7), (6, 7)]
      have edges_spec :
          edges.any (fun p => x10 p.1 && x10 p.2) = true ↔
            ∃ u10 v10 : Fin 8, (u10.val, v10.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x10 u10 = true ∧ x10 v10 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u10, v10⟩, huv, hbits⟩
          exact ⟨u10, v10, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u10, v10, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u10 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v10 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u10, v10), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u10 v10 : Fin 8, (u10.val, v10.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x10 u10 = true ∧ x10 v10 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

  · intro C11 hC11
    subst C11
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x11
      let edges : List (Fin 8 × Fin 8) := [(0, 3), (1, 4), (2, 7), (3, 4), (5, 6), (5, 7), (6, 7)]
      have edges_spec :
          edges.any (fun p => x11 p.1 && x11 p.2) = true ↔
            ∃ u11 v11 : Fin 8, (u11.val, v11.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x11 u11 = true ∧ x11 v11 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u11, v11⟩, huv, hbits⟩
          exact ⟨u11, v11, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u11, v11, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u11 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v11 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u11, v11), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u11 v11 : Fin 8, (u11.val, v11.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x11 u11 = true ∧ x11 v11 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

  · intro C12 hC12
    subst C12
    refine ⟨?_, rfl, ?_⟩
    · simp [PEqualNP.MetaComplexity.FanInTwo]
    · intro x12
      let edges : List (Fin 8 × Fin 8) := [(0, 3), (1, 7), (2, 7), (3, 7), (4, 5), (4, 6), (5, 6)]
      have edges_spec :
          edges.any (fun p => x12 p.1 && x12 p.2) = true ↔
            ∃ u12 v12 : Fin 8, (u12.val, v12.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
              x12 u12 = true ∧ x12 v12 = true := by
        rw [List.any_eq_true]
        constructor
        · rintro ⟨⟨u12, v12⟩, huv, hbits⟩
          exact ⟨u12, v12, List.mem_map_of_mem huv, Bool.and_eq_true_iff.mp hbits⟩
        · rintro ⟨u12, v12, huv, hu, hv⟩
          obtain ⟨⟨a, b⟩, hab, heq⟩ := List.mem_map.mp huv
          have ha : a = u12 := Fin.ext (congrArg Prod.fst heq)
          have hb : b = v12 := Fin.ext (congrArg Prod.snd heq)
          subst a
          subst b
          exact ⟨(u12, v12), hab, Bool.and_eq_true_iff.mpr ⟨hu, hv⟩⟩
      change _ ↔ ∃ u12 v12 : Fin 8, (u12.val, v12.val) ∈ edges.map (fun p => (p.1.val, p.2.val)) ∧
        x12 u12 = true ∧ x12 v12 = true
      rw [← edges_spec]
      simp only [PEqualNP.CircuitLowerBounds.Circuit.eval, PEqualNP.CircuitLowerBounds.Circuit.wires,
        List.foldl_cons, List.foldl_nil, List.ofFn_succ, List.ofFn_zero,
        List.cons_append, List.nil_append, List.map_cons, List.map_nil, List.getD_cons_zero,
        List.getD_cons_succ, PEqualNP.CircuitLowerBounds.GateOp.eval, List.any_cons, List.any_nil,
        List.all_cons, List.all_nil, id, Bool.and_true, Bool.or_false, edges,
        Bool.and_eq_true, Bool.or_eq_true]
      grind

