-- Chercher les demandes qui ont été faites après une date donnée. (Date de votre choix.)

SELECT  REFERENCE, DATE
FROM    dbo.CAPTURE
WHERE   dbo.CAPTURE.DATE > '2020-10-05 00:00:00.000';

-- Pour une demande donnée, afficher la date et le nom du chantier, les équipes et corps de métiers
-- présents sur le chantier, les vidéos de contrôles et les liens vers les visites 3D Matterport. (Demande
-- de votre choix.)

SELECT  dbo.CAPTURE.DATE, dbo.CHANTIER.ADRESSE AS 'NOM CHANTIER', dbo.CORPSMETIER.LIBELLE AS 'CORPS DE METIER', dbo.URLCAPTURE.URL, dbo.UTILISATEUR.NOM, dbo.UTILISATEUR.PRENOM
FROM    dbo.CAPTURE INNER JOIN
        dbo.CHANTIER ON dbo.CAPTURE.IDCHANTIER = dbo.CHANTIER.IDCHANTIER INNER JOIN
        dbo.CHANTIERMETIER ON dbo.CHANTIER.IDCHANTIER = dbo.CHANTIERMETIER.IDCHANTIER INNER JOIN
        dbo.CORPSMETIER ON dbo.CHANTIERMETIER.IDCORPSMETIER = dbo.CORPSMETIER.IDCORPSMETIER INNER JOIN
        dbo.URLCAPTURE ON dbo.CAPTURE.IDCAPTURE = dbo.URLCAPTURE.IDCAPTURE INNER JOIN
        dbo.UTILCHANTIER ON dbo.CHANTIER.IDCHANTIER = dbo.UTILCHANTIER.IDCHANTIER INNER JOIN
        dbo.UTILISATEUR ON dbo.UTILCHANTIER.IDUTILISATEUR = dbo.UTILISATEUR.IDUTILISATEUR
WHERE   dbo.CAPTURE.REFERENCE = '#00234';

-- Afficher le nombre de projets réalisés selon un filtre mois/année/exercice (Mois et année de votre
-- choix.)

SELECT  COUNT(DISTINCT dbo.PROJET.IDPROJET) AS 'Nombre de projet'
FROM    dbo.CAPTURE INNER JOIN
        dbo.CHANTIER ON dbo.CAPTURE.IDCHANTIER = dbo.CHANTIER.IDCHANTIER INNER JOIN
        dbo.PROJET ON dbo.CHANTIER.IDPROJET = dbo.PROJET.IDPROJET
WHERE   dbo.CAPTURE.DATE > '20201019'

SELECT count(distinct p.IDPROJET) from dbo.PROJET as p inner join dbo.CHANTIER as c on p.IDPROJET=c.IDCHANTIER inner join CAPTURE as c2 on c.IDCHANTIER = c2.IDCHANTIER where c2.Date > '2020-10-21';
