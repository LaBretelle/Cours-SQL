-- NOM: ROBERT
-- Prénom: Paul
-- Mardi 18 février 2020

/* MRD

etudiant (id_etudiant, nom, prenom, date_naissance, classe, #instrument_id)
instrument (id_instrument, instrument)
professeur (id_professeur, nom, prenom, date_naissance)
enseignement (id_enseignement, intitule, coeff)
salle (id_salle, nom_salle, capacite)
etudie (#enseignement_id, #etudiant_id, note)
enseigne (#professeur_id, #enseignement_id)
cours (id_cours, #enseignement_id, #salle_id, date_cours)

*/


-- 1. Créer la table professeur
-- NE PAS EXÉCUTER CETTE REQUÊTE !
CREATE TABLE professeur (
id_professeur       INTEGER PRIMARY KEY NOT NULL,
nom                 TEXT NOT NULL,
prenom              TEXT,
date_naissance      INTEGER NOT NULL
);



-- 2. Ajouter l’élève Antoine Doisnel dans la table etudiant : il est né en 1996, suit la classe 3 et joue de l’instrument référencé ‘2’
-- NE PAS EXÉCUTER CETTE REQUÊTE !
INSERT INTO etudiant ('nom', 'prenom', 'date_naissance', 'classe', '#instrument_id')
VALUES ('Doisnel', 'Antoine', '1996', '3', '2')



-- 3. Supprimer la table salle
-- NE PAS EXÉCUTER CETTE REQUÊTE !
DROP TABLE salle



-- 4. Donner la liste des enseignements (afficher seulement leur intitulé).
SELECT intitule as Intitulé 
FROM enseignement



-- 5. Afficher les noms et prénoms des élèves de la 2e classe.
SELECT nom, prenom
FROM etudiant
WHERE classe = 2



-- 6. Afficher (seulement) le nom de toutes les salles de plus de 20 places.
SELECT nom_salle
FROM salle
WHERE capacite > 20



-- 7. Afficher le nom et le prénom du professeur le plus âgé.
SELECT nom, prenom
FROM professeur
ORDER BY date_naissance ASC
LIMIT 1



-- 8. Afficher la liste des enseignements donnés aujourd'hui (18 février 2020).
SELECT intitule
FROM cours, enseignement
WHERE date_cours = '2020-02-18' and enseignement_id = id_enseignement



-- 9. Afficher la liste des enseignements donnés aujourd'hui (18 février 2020) ainsi que le nom des salles dans lesquelles ils se déroulent.
SELECT intitule, nom_salle
FROM cours, enseignement, salle
WHERE date_cours = '2020-02-18' and enseignement_id = id_enseignement and salle_id = id_salle



-- 10. Afficher les noms des étudiants de la classe 1 qui jouent du violon.
SELECT nom as étudiant_jouant_du_violon
FROM etudiant
WHERE classe = 2 AND instrument_id = 1



-- 11. Afficher le nom et la note des élèves en « composition ».
SELECT DISTINCT nom || ' ' || prenom, note
FROM etudiant, etudie, enseignement
WHERE id_etudiant = etudie.etudiant_id and enseignement_id = 1



-- 12. Afficher les notes de l'élève Chaprot par enseignement.
SELECT note, intitule
FROM etudie, enseignement
WHERE etudiant_id = 9 and enseignement_id = id_enseignement



-- 13. Afficher les salles occupées aujourd'hui (18 février 2020).
SELECT nom_salle
FROM salle, cours
WHERE salle_id = id_salle and date_cours = '2020-02-18'

-- on aurait aussi pu rajouter un DISTINCT devant SELECT si on veut enlever le double résultat, mais personnellement je trouve ça important de le laisser)



-- !! FONCTIONS D’AGRÉGATION
-- 14. Afficher le nombre d'étudiants de la classe 2 (l'intitulé de la colonne de résultats doit être explicite).
SELECT COUNT(nom) as Nombre_etudiant_classe_2
FROM etudiant
WHERE classe = 2



-- 15. Afficher le nombre d'étudiants en classe 1.
SELECT COUNT(nom) as Nombre_etudiant_classe_1
FROM etudiant
WHERE classe = 1



-- 16. Afficher le nombre d'étudiants jouant du violon en classe 1.
SELECT COUNT(nom) as Nombre_etudiant_classe_1
FROM etudiant
WHERE classe = 1 AND instrument_id = 1



-- 17. Donner la valeur du coefficient le plus important (l'intitulé de la colonne de résultats doit être explicite).
SELECT max(coeff) as Coeff_le_plus_grand
FROM enseignement



-- !! REGROUPEMENT
-- 18. Afficher la moyenne des notes pour le cours de « composition ».
SELECT avg(note)
FROM etudie
WHERE enseignement_id = 1



-- 19. Y a-t-il des frères et soeurs dans l'établissement. Si oui, quel est leur nom ?
SELECT nom, count(nom) as nombre_fratrie
FROM etudiant
GROUP BY nom
HAVING count(nom) != 1

-- Ici, j'ai mis leur nom et le nombre de frères et soeurs

-- 20. Afficher la moyenne générale de chaque élève (on oublie les coefficients).
SELECT prenom || ' ' || nom as Nom, AVG(note) as Moyenne_Générale
FROM etudiant, etudie
WHERE id_etudiant = etudiant_id
GROUP BY nom
ORDER BY Moyenne_Générale DESC

--J'ai ici non seulement affiché leur moyenne, mais je les ai aussi ordonné du meilleur au moins bon



-- 21. Afficher la moyenne générale de l'élève Chaprot (on oublie les coefficients).
SELECT prenom || ' ' || nom as Nom, AVG(note) as Moyenne_Générale
FROM etudiant, etudie
WHERE id_etudiant = etudiant_id and nom = "Chaprot"
GROUP BY nom



-- 22. Afficher le nom, le prénom et la classe des élèves qui ont cours le 20 février 2020.
SELECT DISTINCT nom, prenom, classe
FROM etudiant, cours
WHERE date_cours = '2020-02-20'
ORDER BY classe


--je les ai ici réunis.ies par classe, pour une lecture facilitée



-- 23. Afficher le nombre de cours et la date à laquelle il y a le plus de cours (l’intitulé de la colonne de résultats doit être explicite).
SELECT count(*) as Nombre_de_cours, date_cours
FROM cours
GROUP BY date_cours
HAVING date_cours = MAX(date_cours)
ORDER BY Nombre_de_cours DESC
LIMIT 1



-- !! QUESTION BONUS, VRAIMENT DIFFICILE !
-- 24. Afficher l'instrument le plus joué par les étudiants et son nombre (l'intitulé de la colonne de résultats doit être explicite)
SELECT instrument, count(id_instrument)
FROM etudiant, instrument
WHERE instrument_id = id_instrument
GROUP BY instrument
HAVING max(instrument_id)





