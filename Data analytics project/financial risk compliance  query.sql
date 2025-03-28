COPY financial_risk_compliance FROM 'C:\Book1.csv'
DELIMITER ',' CSV HEADER;

SELECT*FROM financial_risk_compliance;

SELECT * FROM financial_risk_compliance LIMIT 10;

UPDATE financial_risk_compliance 
SET ai_used_for_auditing = 'No' 
WHERE ai_used_for_auditing IS NULL;

ALTER TABLE financial_risk_compliance ADD COLUMN audit_risk_score FLOAT;



UPDATE financial_risk_compliance 
SET audit_risk_score = (high_risk_cases * 0.5 + compliance_violations * 0.3 + fraud_cases_detected * 0.2);

SELECT industry_affected, MAX(total_revenue_impact) AS max_revenue 
FROM financial_risk_compliance 
GROUP BY industry_affected;


SELECT firm_name, SUM(high_risk_cases) AS total_high_risk 
FROM financial_risk_compliance 
GROUP BY firm_name 
ORDER BY total_high_risk DESC

SELECT firm_name, AVG(client_satisfaction_score) AS avg_satisfaction 
FROM financial_risk_compliance 
GROUP BY firm_name 
ORDER BY avg_satisfaction DESC 
LIMIT 5;


SELECT firm_name, AVG(ai_used_for_auditing VARCHAR) AS avg_satisfaction 
FROM financial_risk_compliance 
GROUP BY firm_name 
ORDER BY avg_satisfaction DESC 
LIMIT 5;


