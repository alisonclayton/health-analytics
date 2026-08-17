WITH transicoes_historicas AS (
    SELECT DISTINCT patient
    FROM synthea.payer_transitions
)
SELECT 
    e.id AS encounter_id,
    e.patient AS patient_id,
    e.encounterclass,
    e.base_encounter_cost,
    e.total_claim_cost,
    e.payer_coverage,
    (e.total_claim_cost - e.base_encounter_cost) AS excedente_custo
FROM synthea.encounters e
JOIN transicoes_historicas th ON e.patient = th.patient
WHERE e.total_claim_cost > (e.base_encounter_cost * 1.10)
  AND COALESCE(e.payer_coverage, 0) < e.total_claim_cost
ORDER BY excedente_custo DESC;