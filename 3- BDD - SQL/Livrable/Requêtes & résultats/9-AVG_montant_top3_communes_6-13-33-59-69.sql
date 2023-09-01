WITH prix_par_ville AS (
SELECT Commune.nom_commune,
       Departement.Id_departement AS departement,
       ROUND(AVG(montant)) AS Moyenne_prix,
       RANK() OVER (PARTITION BY Departement.Id_departement ORDER BY ROUND(AVG(montant)) DESC) AS classement
  FROM Vente_immobiliere
       JOIN
       Bien_immobilier ON Bien_immobilier.Id_bien_immobilier = Vente_immobiliere.Id_bien_immobilier
       JOIN
       Commune ON Commune.Id_commune = Bien_immobilier.Id_commune
       JOIN
       Code_postal ON Code_postal.Id_code_postal = Bien_immobilier.Id_code_postal
       JOIN
       Departement ON Departement.Id_departement = Code_postal.Id_departement
 WHERE Departement.Id_departement IN (6, 13, 33, 59, 69) 
 GROUP BY Commune.nom_commune, Departement.Id_departement
 ORDER BY Moyenne_prix DESC
)

SELECT
    nom_commune,
    departement,
    Moyenne_prix    
FROM prix_par_ville
WHERE classement <=3
