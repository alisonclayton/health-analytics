CREATE SCHEMA synthea;
SET search_path TO synthea;

-- 1. allergies
CREATE TABLE allergies (
    start_date DATE,
    stop_date DATE,
    patient VARCHAR(100),
    encounter VARCHAR(100),
    code VARCHAR(100),
    system VARCHAR(255),
    description VARCHAR(255),
    type VARCHAR(100),
    category VARCHAR(100),
    reaction1 VARCHAR(100),
    description1 VARCHAR(255),
    severity1 VARCHAR(100),
    reaction2 VARCHAR(100),
    description2 VARCHAR(255),
    severity2 VARCHAR(100)
);

-- 2. careplans
CREATE TABLE careplans (
    id VARCHAR(100) PRIMARY KEY,
    start_date DATE,
    stop_date DATE,
    patient VARCHAR(100),
    encounter VARCHAR(100),
    code VARCHAR(100),
    description VARCHAR(255),
    reasoncode VARCHAR(100),
    reasondescription VARCHAR(255)
);

-- 3. claims
CREATE TABLE claims (
    id VARCHAR(100) PRIMARY KEY,
    patientid VARCHAR(100),
    providerid VARCHAR(100),
    primarypatientinsuranceid VARCHAR(100),
    secondarypatientinsuranceid VARCHAR(100),
    departmentid VARCHAR(50),
    patientdepartmentid VARCHAR(50),
    diagnosis1 VARCHAR(100),
    diagnosis2 VARCHAR(100),
    diagnosis3 VARCHAR(100),
    diagnosis4 VARCHAR(100),
    diagnosis5 VARCHAR(100),
    diagnosis6 VARCHAR(100),
    diagnosis7 VARCHAR(100),
    diagnosis8 VARCHAR(100),
    referringproviderid VARCHAR(100),
    appointmentid VARCHAR(100),
    currentillnessdate TIMESTAMP,
    servicedate TIMESTAMP,
    supervisingproviderid VARCHAR(100),
    status1 VARCHAR(50),
    status2 VARCHAR(50),
    statusp VARCHAR(50),
    outstanding1 NUMERIC(18,4),
    outstanding2 NUMERIC(18,4),
    outstandingp NUMERIC(18,4),
    lastbilleddate1 TIMESTAMP,
    lastbilleddate2 TIMESTAMP,
    lastbilleddatep TIMESTAMP,
    healthcareclaimtypeid1 VARCHAR(50),
    healthcareclaimtypeid2 VARCHAR(50)
);

-- 4. claims_transactions
CREATE TABLE claims_transactions (
    id VARCHAR(100) PRIMARY KEY,
    claimid VARCHAR(100),
    chargeid VARCHAR(50),
    patientid VARCHAR(100),
    type VARCHAR(50),
    amount NUMERIC(18,4),
    method VARCHAR(50),
    fromdate TIMESTAMP,
    todate TIMESTAMP,
    placeofservice VARCHAR(100),
    procedurecode VARCHAR(100),
    modifier1 VARCHAR(50),
    modifier2 VARCHAR(50),
    diagnosisref1 VARCHAR(50),
    diagnosisref2 VARCHAR(50),
    diagnosisref3 VARCHAR(50),
    diagnosisref4 VARCHAR(50),
    units INT,
    departmentid VARCHAR(50),
    notes TEXT,
    unitamount NUMERIC(18,4),
    transferoutid VARCHAR(100),
    transfertype VARCHAR(50),
    payments NUMERIC(18,4),
    adjustments NUMERIC(18,4),
    transfers NUMERIC(18,4),
    outstanding NUMERIC(18,4),
    appointmentid VARCHAR(100),
    linenote TEXT,
    patientinsuranceid VARCHAR(100),
    feescheduleid VARCHAR(50),
    providerid VARCHAR(100),
    supervisingproviderid VARCHAR(100)
);

-- 5. conditions
CREATE TABLE conditions (
    start_date DATE,
    stop_date DATE,
    patient VARCHAR(100),
    encounter VARCHAR(100),
    code VARCHAR(100),
    description VARCHAR(255)
);

-- 6. devices
CREATE TABLE devices (
    start_date TIMESTAMP,
    stop_date TIMESTAMP,
    patient VARCHAR(100),
    encounter VARCHAR(100),
    code VARCHAR(100),
    description VARCHAR(255),
    udi VARCHAR(255)
);

-- 7. encounters
CREATE TABLE encounters (
    id VARCHAR(100) PRIMARY KEY,
    start_date TIMESTAMP,
    stop_date TIMESTAMP,
    patient VARCHAR(100),
    organization VARCHAR(100),
    provider VARCHAR(100),
    payer VARCHAR(100),
    encounterclass VARCHAR(50),
    code VARCHAR(100),
    description VARCHAR(255),
    base_encounter_cost NUMERIC(18,4),
    total_claim_cost NUMERIC(18,4),
    payer_coverage NUMERIC(18,4),
    reasoncode VARCHAR(100),
    reasondescription VARCHAR(255)
);

-- 8. imaging_studies
CREATE TABLE imaging_studies (
    id VARCHAR(100) PRIMARY KEY,
    date TIMESTAMP,
    patient VARCHAR(100),
    encounter VARCHAR(100),
    series_uid VARCHAR(255),
    bodysite_code VARCHAR(100),
    bodysite_description VARCHAR(255),
    modality_code VARCHAR(50),
    modality_description VARCHAR(255),
    instance_uid VARCHAR(255),
    sop_code VARCHAR(255),
    sop_description VARCHAR(255),
    procedure_code VARCHAR(100)
);

-- 9. immunizations
CREATE TABLE immunizations (
    start_date TIMESTAMP,
    stop_date TIMESTAMP,
    patient VARCHAR(100),
    payer VARCHAR(100),
    encounter VARCHAR(100),
    code VARCHAR(100),
    description VARCHAR(255),
    base_cost NUMERIC(18,4),
    payer_coverage NUMERIC(18,4),
    dispenses INT,
    totalcost NUMERIC(18,4),
    reasoncode VARCHAR(100),
    reasondescription VARCHAR(255)
);

-- 10. observations
CREATE TABLE observations (
    date TIMESTAMP,
    patient VARCHAR(100),   
    encounter VARCHAR(100),
    category VARCHAR(100),
    code VARCHAR(100),
    description VARCHAR(255),
    value VARCHAR(255),
    units VARCHAR(50),
    type VARCHAR(50)
);

-- 11. organizations
CREATE TABLE organizations (
    id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip VARCHAR(50),
    lat NUMERIC(18,6),
    lon NUMERIC(18,6),
    phone VARCHAR(50),
    revenue NUMERIC(18,4),
    utilization INT
);

-- 12. patients
CREATE TABLE patients (
    id VARCHAR(100) PRIMARY KEY,
    birthdate DATE,
    deathdate DATE,
    ssn VARCHAR(50),
    drivers VARCHAR(50),
    passport VARCHAR(50),
    prefix VARCHAR(50),
    first VARCHAR(100),
    last VARCHAR(100),
    suffix VARCHAR(50),
    maiden VARCHAR(100),
    marital VARCHAR(50),
    race VARCHAR(50),
    ethnicity VARCHAR(50),
    gender VARCHAR(10),
    birthplace VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    county VARCHAR(100),
    zip VARCHAR(50),
    lat NUMERIC(18,6),
    lon NUMERIC(18,6),
    healthcare_expenses NUMERIC(18,4),
    healthcare_coverage NUMERIC(18,4)
);

-- 13. payer_transitions
CREATE TABLE payer_transitions (
    patient VARCHAR(100),
    memberid VARCHAR(100),
    start_year TIMESTAMP,
    end_year TIMESTAMP,
    payer VARCHAR(100),
    secondary_payer VARCHAR(100),
    ownership VARCHAR(100),
    ownername VARCHAR(255)
);

-- 14. payers
CREATE TABLE payers (
    id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    state_headquartered VARCHAR(50),
    zip VARCHAR(50),
    phone VARCHAR(50),
    amount_covered NUMERIC(18,4),
    amount_uncovered NUMERIC(18,4),
    revenue NUMERIC(18,4),
    covered_encounters INT,
    uncovered_encounters INT,
    covered_medications INT,
    uncovered_medications INT,
    covered_procedures INT,
    uncovered_procedures INT,
    covered_immunizations INT,
    uncovered_immunizations INT,
    unique_customers INT,
    qols_avg NUMERIC(18,4),
    member_months INT
);

-- 15. procedures
CREATE TABLE procedures (
    start_date TIMESTAMP,
    stop_date TIMESTAMP,
    patient VARCHAR(100),
    encounter VARCHAR(100),
    code VARCHAR(100),
    description VARCHAR(255),
    base_cost NUMERIC(18,4),
    reasoncode VARCHAR(100),
    reasondescription VARCHAR(255)
);

-- 16. providers
CREATE TABLE providers (
    id VARCHAR(100) PRIMARY KEY,
    organization VARCHAR(100),
    name VARCHAR(255),
    gender VARCHAR(10),
    speciality VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip VARCHAR(50),
    lat NUMERIC(18,6),
    lon NUMERIC(18,6),
    utilization INT
);

-- 17. supplies
CREATE TABLE supplies (
    date DATE,
    patient VARCHAR(100),
    encounter VARCHAR(100),
    code VARCHAR(100),
    description VARCHAR(255),
    quantity INT
);