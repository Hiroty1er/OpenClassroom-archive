WITH appt2p AS
(SELECT
     ROUND(AVG(montant/(surface_habitable+surface_terrain))) AS Moyenne_prix_m²
FROM Vente_immobiliere
JOIN Bien_immobilier ON Bien_immobilier.Id_bien_immobilier=Vente_immobiliere.Id_bien_immobilier
WHERE Id_type_local=2
AND nb_piece=2
),

appt3p AS
(SELECT
    ROUND(AVG(montant/(surface_habitable+surface_terrain))) AS Moyenne_prix_m²
FROM Vente_immobiliere
JOIN Bien_immobilier ON Bien_immobilier.Id_bien_immobilier=Vente_immobiliere.Id_bien_immobilier
WHERE Id_type_local=2
AND nb_piece=3
)

SELECT
	appt2p.Moyenne_prix_m²,
	appt3p.Moyenne_prix_m²,
    ROUND((appt3p.Moyenne_prix_m² - appt2p.Moyenne_prix_m²) / appt2p.Moyenne_prix_m²) * 100,4) AS "difference_prix_2p3p_%"
FROM appt2p, appt3p