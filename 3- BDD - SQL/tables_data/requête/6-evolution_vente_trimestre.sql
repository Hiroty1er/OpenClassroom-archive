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
    ROUND((sec_trimestre - prem_trimestre))/prem_trimestre*100
FROM prem_trim, sec_trim






