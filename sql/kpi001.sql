SELECT 
    e.id AS encounter_id,
    e.patient AS patient_id,
    e.encounterclass,
    e.start_date,
    e.stop_date,
    p.name AS payer_name,
    MAX(o.date) AS last_observation_date,
    EXTRACT(DAY FROM (e.stop_date - MAX(o.date))) AS dias_sem_observacao
FROM synthea.encounters e
JOIN synthea.payers p ON e.payer = p.id
JOIN synthea.claims c ON c.appointmentid = e.id
JOIN synthea.observations o ON o.encounter = e.id
WHERE e.encounterclass = 'inpatient'
  AND p.name NOT ILIKE '%SUS%' 
  AND p.name NOT ILIKE '%Particular%'
  AND EXISTS (
      SELECT 1 FROM synthea.claims_transactions ct WHERE ct.claimid = c.id
  )
GROUP BY 
    e.id, e.patient, e.encounterclass, e.start_date, e.stop_date, p.name
HAVING EXTRACT(DAY FROM (e.stop_date - MAX(o.date))) > 1
ORDER BY dias_sem_observacao DESC;