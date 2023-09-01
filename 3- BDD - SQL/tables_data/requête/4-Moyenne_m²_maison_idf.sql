SELECT
    nom_region,
    ROUND(AVG(montant/(surface_habitable+surface_terrain))) AS "Moyenne_prix_m²"
FROM Region
INNER JOIN Departement ON Departement.Id_region=Region.Id_region
INNER JOIN Code_postal ON Code_postal.Id_departement=Departement.Id_departement
INNER JOIN Bien_immobilier ON Bien_immobilier.Id_Code_postal=Code_postal.Id_Code_postal
INNER JOIN Vente_immobiliere ON Vente_immobiliere.Id_bien_immobilier=Bien_immobilier.Id_bien_immobilier
WHERE Region.Id_region=8