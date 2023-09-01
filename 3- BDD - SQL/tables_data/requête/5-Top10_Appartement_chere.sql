SELECT
    montant,
    nom_departement,
    (surface_habitable+surface_terrain) AS "surface_total"
FROM Vente_immobiliere
INNER JOIN Bien_immobilier ON Bien_immobilier.Id_bien_immobilier = Vente_immobiliere.Id_bien_immobilier
INNER JOIN Code_postal ON Code_postal.Id_Code_postal = Bien_immobilier.Id_Code_postal
INNER JOIN Departement ON Departement.Id_departement = Code_postal.Id_departement
WHERE Bien_immobilier.Id_type_local=1
ORDER BY montant DESC
LIMIT 10