WITH prem_trim AS 
(SELECT
    Commune.Id_commune,
    COUNT(Id_vente) AS prem_trimestre    
FROM Vente_immobiliere 
JOIN Bien_immobilier ON Bien_immobilier.Id_bien_immobilier=Vente_immobiliere.Id_bien_immobilier
JOIN Commune ON Commune.Id_commune=Bien_immobilier.Id_commune
WHERE date BETWEEN "2020-01-01" AND "2020-03-31"
GROUP BY Commune.nom_commune
),

sec_trim AS
(SELECT 
    Commune.Id_commune,
    COUNT(Id_vente) AS sec_trimestre
FROM Vente_immobiliere 
JOIN Bien_immobilier ON Bien_immobilier.Id_bien_immobilier=Vente_immobiliere.Id_bien_immobilier
JOIN Commune ON Commune.Id_commune=Bien_immobilier.Id_commune
WHERE date BETWEEN "2020-04-01" AND "2020-06-30"
GROUP BY Commune.nom_commune
)

SELECT
    nom_commune,
    ROUND(ROUND((sec_trimestre - prem_trimestre))/prem_trimestre*100,2)
FROM prem_trim
JOIN sec_trim ON sec_trim.Id_commune = prem_trim.Id_commune
JOIN Commune ON Commune.Id_commune = sec_trim.Id_commune
WHERE ROUND((sec_trimestre - prem_trimestre))/prem_trimestre*100 >= 20