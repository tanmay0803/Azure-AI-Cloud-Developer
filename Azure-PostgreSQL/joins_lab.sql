CREATE TABLE ESG.CarbonTargets (
    TargetID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CompanyID INT,
    TargetYear INT,
    TargetReductionPercent DECIMAL(5,2)
);

INSERT INTO ESG.CarbonTargets
(CompanyID, TargetYear, TargetReductionPercent)
VALUES

(1, 2030, 30.00),
(1, 2035, 45.00),

(2, 2030, 25.00),
(2, 2040, 50.00),

(3, 2035, 40.00),
(3, 2045, 55.00),

(4, 2040, 35.00),

(5, 2030, 20.00),
(6, 2035, 28.00),

(999, 2030, 60.00),
(1000, 2040, 70.00);

INSERT INTO ESG.Companies
(CompanyName, Industry, Country)
VALUES
('AeroFly Aviation', 'Aviation', 'US'),
('BlueOcean Shipping', 'Logistics', 'NL'),
('GreenFoods Ltd', 'Food', 'IN'),
('FutureTech AI', 'Technology', 'US');

INSERT INTO ESG.EmissionRecords
(CompanyID, EmissionDate, Scope, CO2_Emissions, Source)
VALUES

(5, '2025-01-10', 1, 5000.00, 'Jet Fuel'),
(5, '2025-01-12', 3, 2000.00, 'Supply Chain'),

(6, '2025-01-11', 1, 3000.00, 'Marine Fuel'),

(7, '2025-01-15', 2, 700.00, 'Electricity'),

(8, '2025-01-18', 2, 100.00, 'Data Centers');



INSERT INTO ESG.EnergyConsumption
(CompanyID, EnergyType, Consumption, Unit, RecordedAt)
VALUES

(5, 'Jet Fuel', 8000.00, 'liters', '2025-01-10 08:00:00'),

(6, 'Marine Diesel', 6000.00, 'liters', '2025-01-11 09:00:00'),

(7, 'Electricity', 1200.00, 'kWh', '2025-01-15 10:00:00'),

(8, 'Cloud Compute', 300.00, 'kWh', '2025-01-18 11:00:00');



INSERT INTO ESG.SustainabilityReports (CompanyID, ReportText)
VALUES
(5, 'AeroFly is exploring sustainable aviation fuel.'),
(7, 'GreenFoods is optimizing supply chain emissions.');




SELECT
    c.CompanyName,
    t.TargetReductionPercent
FROM ESG.Companies c
INNER JOIN ESG.CarbonTargets t
    ON c.CompanyID = t.CompanyID;


SELECT
    c.CompanyName,
    t.TargetReductionPercent
FROM ESG.Companies c
LEFT JOIN ESG.CarbonTargets t
    ON c.CompanyID = t.CompanyID;


SELECT
    c.CompanyName,
    t.TargetReductionPercent
FROM ESG.Companies c
RIGHT JOIN ESG.CarbonTargets t
    ON c.CompanyID = t.CompanyID;


SELECT
    c.CompanyName,
    t.TargetReductionPercent
FROM ESG.Companies c
FULL OUTER JOIN ESG.CarbonTargets t
    ON c.CompanyID = t.CompanyID;


