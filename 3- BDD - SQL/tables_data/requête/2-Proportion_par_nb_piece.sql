SELECT
    nb_piece,
    COUNT(Id_vente)
FROM
    Bien_immobilier 
INNER JOIN Vente_immobiliere ON Vente_immobiliere.Id_bien_immobilier = Bien_immobilier.Id_bien_immobilier
INNER JOIN Local ON Local.Id_type_local = Bien_immobilier.Id_type_local
WHERE type_local = "Appartement"
GROUP BY nb_piece
ORDER BY nb_piece ASC