-- Chercher les demandes qui ont été faites après une date donnée. (Date de votre choix.)
CREATE VIEW View_Demande AS 
SELECT  REFERENCE, DATE
FROM    dbo.CAPTURE
WHERE   dbo.CAPTURE.DATE > '2020-10-05 00:00:00.000';

-- Pour une demande donnée, afficher la date et le nom du chantier, les équipes et corps de métiers
-- présents sur le chantier, les vidéos de contrôles et les liens vers les visites 3D Matterport. (Demande
-- de votre choix.)
CREATE VIEW View_InformationDemande AS 
SELECT  dbo.CHANTIER.DATEDEBUT AS 'DATE', dbo.CHANTIER.ADRESSE AS 'NOM CHANTIER', dbo.SOUSTRAITANT.LIBELLE AS 'EQUIPE', dbo.CORPSMETIER.LIBELLE AS 'CORPS DE METIER', dbo.URLCAPTURE.URL
FROM    dbo.CORPSMETIERSSTT INNER JOIN
        dbo.CORPSMETIER ON dbo.CORPSMETIERSSTT.IDCORPSMETIER = dbo.CORPSMETIER.IDCORPSMETIER INNER JOIN
        dbo.SOUSTRAITANT ON dbo.CORPSMETIERSSTT.IDSOUSTRAITANT = dbo.SOUSTRAITANT.IDSOUSTRAITANT INNER JOIN
        dbo.CAPTURE INNER JOIN
        dbo.CHANTIER ON dbo.CAPTURE.IDCHANTIER = dbo.CHANTIER.IDCHANTIER INNER JOIN
        dbo.CHANTIERSSTT ON dbo.CHANTIER.IDCHANTIER = dbo.CHANTIERSSTT.IDCHANTIER ON dbo.SOUSTRAITANT.IDSOUSTRAITANT = dbo.CHANTIERSSTT.IDSOUSTRAITANT INNER JOIN
        dbo.URLCAPTURE ON dbo.CAPTURE.IDCAPTURE = dbo.URLCAPTURE.IDCAPTURE
WHERE   dbo.CAPTURE.REFERENCE = '#00234';

-- Afficher le nombre de projets réalisés selon un filtre mois/année/exercice (Mois et année de votre
-- choix.)
CREATE VIEW View_CountProjet_ByDate AS 
SELECT  COUNT(DISTINCT dbo.PROJET.IDPROJET) AS 'Nombre de projet'
FROM    dbo.CHANTIER INNER JOIN
        dbo.PROJET ON dbo.CHANTIER.IDPROJET = dbo.PROJET.IDPROJET
WHERE   dbo.CHANTIER.DATEDEBUT > '20191201'

-- Afficher le nombre de sous-traitants employés pour les différents projets réalisés par corps de métiers.
CREATE VIEW View_SousTraitant_Projet AS 
SELECT p.LIBELLE as "Projet", cm.LIBELLE as "Corps métier", t.nbSSTT as "Nombre sous traitant"
FROM    PROJET p,
        CORPSMETIER cm,
        (
                SELECT  count(dbo.SOUSTRAITANT.IDSOUSTRAITANT) AS 'nbSSTT', dbo.CORPSMETIER.IDCORPSMETIER, dbo.PROJET.IDPROJET
                FROM    dbo.PROJET INNER JOIN
                dbo.CHANTIER INNER JOIN
                dbo.CHANTIERSSTT ON dbo.CHANTIER.IDCHANTIER = dbo.CHANTIERSSTT.IDCHANTIER ON dbo.PROJET.IDPROJET = dbo.CHANTIER.IDPROJET INNER JOIN
                dbo.SOUSTRAITANT ON dbo.CHANTIERSSTT.IDSOUSTRAITANT = dbo.SOUSTRAITANT.IDSOUSTRAITANT INNER JOIN
                dbo.CORPSMETIERSSTT INNER JOIN
                dbo.CORPSMETIER ON dbo.CORPSMETIERSSTT.IDCORPSMETIER = dbo.CORPSMETIER.IDCORPSMETIER ON dbo.SOUSTRAITANT.IDSOUSTRAITANT = dbo.CORPSMETIERSSTT.IDSOUSTRAITANT
                GROUP BY dbo.CORPSMETIER.IDCORPSMETIER, dbo.PROJET.IDPROJET
        ) t
WHERE   p.IDPROJET = t.IDPROJET AND t.IDCORPSMETIER = cm.IDCORPSMETIER;

