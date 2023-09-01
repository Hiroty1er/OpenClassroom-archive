WITH total AS (
    SELECT COUNT(Id_vente) AS vente_total
      FROM Vente_immobiliere
)
SELECT nb_piece,
       ROUND((ROUND(COUNT(Id_vente)) / vente_total)*100 ,4) AS "proportion_ventes_%"
  FROM Bien_immobilier,
       total
       INNER JOIN
       Vente_immobiliere ON Vente_immobiliere.Id_bien_immobilier = Bien_immobilier.Id_bien_immobilier
       INNER JOIN
       Local ON Local.Id_type_local = Bien_immobilier.Id_type_local
 WHERE type_local = "Appartement"
 GROUP BY nb_piece
 ORDER BY nb_piece ASC;

