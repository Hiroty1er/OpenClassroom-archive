WITH prem_trim AS 
(SELECT
    COUNT(Id_vente) AS prem_trimestre    
FROM Vente_immobiliere 
WHERE date BETWEEN "2020-01-01" AND "2020-03-31"
),

sec_trim AS
(SELECT 
    COUNT(Id_vente) AS sec_trimestre
FROM Vente_immobiliere 
WHERE date BETWEEN "2020-04-01" AND "2020-06-30"
)

SELECT 
    ROUND(ROUND((sec_trimestre - prem_trimestre))/prem_trimestre*100,3) AS "Evolution_vente_trimestre_%"
FROM prem_trim, sec_trim






