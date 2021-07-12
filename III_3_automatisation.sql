-- Développez un composant logiciel pour retrouver le nombre de projets réalisés sur une période donnée
-- au niveau de l’application Desktop. Le nom du projet, sa localisation, ses sous-traitants et la période
-- devraient être des arguments transmis au composant logiciel.

-- envoi période => retourne projets avec nom, localisation, sous-traitants

USE BuildControl
GO

CREATE OR ALTER PROCEDURE getProjects 
@dateDebut DATE,
@dateFin DATE
AS
BEGIN
  SELECT p.LIBELLE 'Libelle projet', c.ADRESSE 'Adresse projet', s.LIBELLE 'Sous-traitant' 
  FROM CHANTIER c 
    JOIN PROJET p ON c.IDPROJET = p.IDPROJET 
    JOIN CHANTIERSSTT cs ON c.IDCHANTIER = cs.IDCHANTIER 
    JOIN SOUSTRAITANT s ON s.IDSOUSTRAITANT = cs.IDSOUSTRAITANT 
  WHERE c.DATEDEBUT <= @dateDebut AND c.DATEFIN >= @dateFin;
END
GO

EXEC getProjects '2019-01-01', '2020-12-31'
GO

-- Développez un deuxième composant logiciel permettant de retrouver les problèmes identifiés grâce aux
-- captures faites par les outils de captures. Pensez donc à la gestion des retours d’analyse et aux natures de
-- problèmes relevés rattachés aux corps de métiers impliqués.

USE BuildControl
GO

CREATE OR ALTER PROCEDURE getIncidents
@refCapture varchar(500)
AS
BEGIN
  SELECT c.IDCHANTIER 'Identifiant chantier', c.ADRESSE 'Adresse chantier', i.LIBELLE 'Libelle incident',
  cpt.REFERENCE 'Reference capture', cpt.DATE 'Date capture', s.LIBELLE 'Sous-traitant', cm.LIBELLE 'Corps métier sous-traitant' 
  FROM CHANTIER c 
    JOIN CAPTURE cpt ON c.IDCHANTIER = cpt.IDCHANTIER 
    JOIN INCIDENT i ON cpt.IDINCIDENT = i.IDINCIDENT AND i.IDINCIDENT IS NOT NULL
    JOIN CHANTIERSSTT cs ON c.IDCHANTIER = cs.IDCHANTIER 
    JOIN SOUSTRAITANT s ON s.IDSOUSTRAITANT = cs.IDSOUSTRAITANT 
    JOIN CORPSMETIERSSTT cms ON cms.IDSOUSTRAITANT = s.IDSOUSTRAITANT
    JOIN CORPSMETIER cm ON cm.IDCORPSMETIER = cms.IDCORPSMETIER
  WHERE cpt.REFERENCE = @refCapture
END
GO

EXEC getIncidents'#00122'
GO

-- Lors du renseignement des malfaçons ou problèmes rencontrés, vérifiez qu’il n’y a pas de doublons dans
-- les enregistrements. Créez donc un composant logiciel qui permettra de prévenir l’opérateur de saisie
-- qu’un incident de ce type pour X chantier à telle heure de telle date impliquant N corps de métiers a déjà
-- été référencé. Et s’il ne s’agit pas d’un doublon, permettre l’enregistrement de cette nouvelle data.

USE BuildControl
GO

CREATE OR ALTER TRIGGER checkIncidents ON CAPTURE
INSTEAD OF INSERT 
AS
BEGIN 
  DECLARE @idIncident int
  DECLARE @idChantier int
  DECLARE @dateCapture date
  DECLARE @copy int

  SELECT @idIncident = IDINCIDENT, @idChantier = IDCHANTIER, @dateCapture = DATE FROM inserted

  SELECT @copy = COUNT(*) FROM CAPTURE WHERE IDINCIDENT = @idIncident AND @idChantier = IDCHANTIER AND @dateCapture = DATE

  IF @copy > 0
  BEGIN
    PRINT 'Cet incident a déjà été déclaré.';
    THROW 409, 'The record does not exist.', 1;
  END
  INSERT INTO BuildControl.dbo.CAPTURE (IDTYPECAPTURE, IDINCIDENT, IDCHANTIER, REFERENCE, DATE, COORDONNEESGPS, JALON, ETAPECAPTURE) 
  SELECT IDTYPECAPTURE, IDINCIDENT, IDCHANTIER, REFERENCE, DATE, COORDONNEESGPS, JALON, ETAPECAPTURE FROM INSERTED;
END
GO

INSERT INTO BuildControl.dbo.CAPTURE (IDTYPECAPTURE, IDINCIDENT, IDCHANTIER, REFERENCE, DATE, COORDONNEESGPS, JALON, ETAPECAPTURE) VALUES (1, 1, 2, N'#00237', N'2020-10-21 18:39:00.000', N'44.634074, -1.083128', N'Excavation / Fondations', N'Stockage matériel');
GO
-- TESTING
DELETE FROM BuildControl.dbo.CAPTURE WHERE IDCAPTURE = 8;
GO