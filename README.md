# HEALTH ANALYTICS

## Project V1.0: Healthcare Data Analytics Architecture (Synthea) for LLM Fine-Tuning

This repository contains the static infrastructure, data dictionaries, relational models, and analytical query scripts (SQL and Jupyter Notebooks) structured to feed Large Language Models (LLMs) focused on the healthcare domain, hospital billing, and claims auditing (based on the Synthea ecosystem and market auditing principles).

---

## 📁 Repository Structure

```
├── data/         # Raw data in CSV format (Synthea Synthetics - 17 Tables)
├── sql/          # Structured SQL queries (Audit funnels, Q1, Q2, and complex rules)
├── notebooks/    # .ipynb files with exploratory analyses and data treatments
├── dbml/         # Data architecture modeled in DBML (Synthea V1.0)
└── README.md     # Official project documentation
```

## 📊 Data Architecture (DBML V1.0)

The complete relational model consists of 17 interconnected tables that reflect the hospital care cycle, financial transactions, insurance payers, and clinical records:
- Main Dimensions: patients, providers, organizations, payers.
- Care & Clinical: encounters, conditions, allergies, observations, procedures, immunizations, devices, supplies, imaging_studies, careplans.
- Billing & Financial: claims, claims_transactions, payer_transitions.

You can explore and interact with the complete data architecture diagram online via the [dbdiagram.io Interactive Diagram](https://dbdiagram.io/d/6a82203fc6a866c9077932af).

## 🎯 Project Objectives (V1.0)
1. Standardization of Analytical Funnels: Translate complex hospital business rules (such as account eligibility, discharge deadline expirations, and insurance validation) into robust SQL queries.
2. Generation of Datasets for LLMs: Process and structure query results to serve as training data (instruction tuning) for specialized healthcare models.

3. Versioning and Reproducibility: Ensure that the entire analytical pipeline based on static files (CSV + SQL + Notebooks) is version-controlled and ready for future evolution into cloud architectures (V2.0 with PostgreSQL Neon and dbt Core).

## 🚀 How to Use
1. Clone the repository to your local machine.
2. Use the DBML Visualizer extension in VS Code to inspect the relational model in the /dbml folder.
3. Run the SQL scripts locally or in your preferred environment to generate the processed tables that will feed the LLM pipeline.
