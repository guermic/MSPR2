/*   /$$$$$$$            /$$ /$$       /$$        /$$$$$$                        /$$                         /$$
    | $$__  $$          |__/| $$      | $$       /$$__  $$                      | $$                        | $$
    | $$  \ $$ /$$   /$$ /$$| $$  /$$$$$$$      | $$  \__/  /$$$$$$  /$$$$$$$  /$$$$$$    /$$$$$$   /$$$$$$ | $$
    | $$$$$$$ | $$  | $$| $$| $$ /$$__  $$      | $$       /$$__  $$| $$__  $$|_  $$_/   /$$__  $$ /$$__  $$| $$
    | $$__  $$| $$  | $$| $$| $$| $$  | $$      | $$      | $$  \ $$| $$  \ $$  | $$    | $$  \__/| $$  \ $$| $$
    | $$  \ $$| $$  | $$| $$| $$| $$  | $$      | $$    $$| $$  | $$| $$  | $$  | $$ /$$| $$      | $$  | $$| $$
    | $$$$$$$/|  $$$$$$/| $$| $$|  $$$$$$$      |  $$$$$$/|  $$$$$$/| $$  | $$  |  $$$$/| $$      |  $$$$$$/| $$
    |_______/  \______/ |__/|__/ \_______/       \______/  \______/ |__/  |__/   \___/  |__/       \______/ |__/
*/                                                                                                           

-- TYPECAPTURE
INSERT INTO BuildControl.dbo.TYPECAPTURE (IDTYPECAPTURE, LIBELLE) VALUES (1, N'drone');
INSERT INTO BuildControl.dbo.TYPECAPTURE (IDTYPECAPTURE, LIBELLE) VALUES (2, N'matterport');

-- SOUSTRAITANT
INSERT INTO BuildControl.dbo.SOUSTRAITANT (IDSOUSTRAITANT, LIBELLE, ADRESSE) VALUES (1, N'Azur Elec', N'33160 St Aubin de Médoc');
INSERT INTO BuildControl.dbo.SOUSTRAITANT (IDSOUSTRAITANT, LIBELLE, ADRESSE) VALUES (2, N'Aubin de Médoc', null);
INSERT INTO BuildControl.dbo.SOUSTRAITANT (IDSOUSTRAITANT, LIBELLE, ADRESSE) VALUES (3, N'Etbs NovoPlomberie', N'33300 Bordeaux');
INSERT INTO BuildControl.dbo.SOUSTRAITANT (IDSOUSTRAITANT, LIBELLE, ADRESSE) VALUES (4, N'GP Fondation SA', N'3 rue du Bourg 33520 BRUGES');

-- PROJET
INSERT INTO BuildControl.dbo.PROJET (IDPROJET, LIBELLE) VALUES (1, N'Lotissement des Anges');
INSERT INTO BuildControl.dbo.PROJET (IDPROJET, LIBELLE) VALUES (2, N'Résidence les Capucines');

-- CHANTIER
INSERT INTO BuildControl.dbo.CHANTIER (IDCHANTIER, IDPROJET, ADRESSE) VALUES (2, 2, N'Gujan Mestras');
INSERT INTO BuildControl.dbo.CHANTIER (IDCHANTIER, IDPROJET, ADRESSE) VALUES (1, 1, N'Saint Aubin de Médoc');


--CHANTIERSSTT
INSERT INTO BuildControl.dbo.CHANTIERSSTT (IDCHANTIER, IDSOUSTRAITANT) VALUES (1, 1);
INSERT INTO BuildControl.dbo.CHANTIERSSTT (IDCHANTIER, IDSOUSTRAITANT) VALUES (1, 2);
INSERT INTO BuildControl.dbo.CHANTIERSSTT (IDCHANTIER, IDSOUSTRAITANT) VALUES (1, 3);
INSERT INTO BuildControl.dbo.CHANTIERSSTT (IDCHANTIER, IDSOUSTRAITANT) VALUES (2, 4);


--INCIDENT
INSERT INTO BuildControl.dbo.INCIDENT (IDINCIDENT, LIBELLE) VALUES (1, N'Montage défectueux compteurs');
INSERT INTO BuildControl.dbo.INCIDENT (IDINCIDENT, LIBELLE) VALUES (2, N'Carence rouleau cable 0.2');
INSERT INTO BuildControl.dbo.INCIDENT (IDINCIDENT, LIBELLE) VALUES (3, N'Carence ciment fondation Nord-Est');


--CAPTURE
INSERT INTO BuildControl.dbo.CAPTURE (IDCAPTURE, IDTYPECAPTURE, IDINCIDENT, IDCHANTIER, REFERENCE, DATE, COORDONNEESGPS, JALON, ETAPECAPTURE) VALUES (2, 1, null, 2, N'#00235', N'2020-09-28 18:29:00.000', N'44.634074, -1.083128', N'Excavation / Fondations', N'Etat fondations');
INSERT INTO BuildControl.dbo.CAPTURE (IDCAPTURE, IDTYPECAPTURE, IDINCIDENT, IDCHANTIER, REFERENCE, DATE, COORDONNEESGPS, JALON, ETAPECAPTURE) VALUES (3, 1, null, 2, N'#00236', N'2020-10-05 18:12:00.000', N'44.634074, -1.083128', N'Installation Grues', N'Banchage');
INSERT INTO BuildControl.dbo.CAPTURE (IDCAPTURE, IDTYPECAPTURE, IDINCIDENT, IDCHANTIER, REFERENCE, DATE, COORDONNEESGPS, JALON, ETAPECAPTURE) VALUES (4, 2, 2, 1, N'#00122', N'2020-10-19 08:11:00.000', N'44.917639, -0.735070', N'Préparation énergie Lot 2', N'Montage R0 R1');
INSERT INTO BuildControl.dbo.CAPTURE (IDCAPTURE, IDTYPECAPTURE, IDINCIDENT, IDCHANTIER, REFERENCE, DATE, COORDONNEESGPS, JALON, ETAPECAPTURE) VALUES (5, 2, 1, 1, N'#00123', N'2020-10-21 08:02:00.000', N'44.917639, -0.735070', N'Préparation énergie Lot 3', N'Montage R0 R1');
INSERT INTO BuildControl.dbo.CAPTURE (IDCAPTURE, IDTYPECAPTURE, IDINCIDENT, IDCHANTIER, REFERENCE, DATE, COORDONNEESGPS, JALON, ETAPECAPTURE) VALUES (6, 2, null, 1, N'#00124', N'2020-10-26 07:59:00.000', N'44.917639, -0.735070', N'Préparation énergie Lot 2', N'Montage R0 R1');
INSERT INTO BuildControl.dbo.CAPTURE (IDCAPTURE, IDTYPECAPTURE, IDINCIDENT, IDCHANTIER, REFERENCE, DATE, COORDONNEESGPS, JALON, ETAPECAPTURE) VALUES (7, 2, null, 1, N'#00125', N'2020-10-29 08:24:00.000', N'44.917639, -0.735070', N'Préparation énergie Lot 3', N'Montage R0 R1');


-- URLCAPTURE
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (1, N'09776545.jpg');  
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (1, N'IG2234.mp4');    
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (1, N'IG2235.mp4');    
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (2, N'IG2236.mp4');    
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (2, N'IG2237.mp4');    
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (2, N'IG2238.mp4');    
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (2, N'IG2239.mp4');    
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (2, N'IG2240.mp4');    
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (2, N'IG2241.mp4');    
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (3, N'IG2242.mp4');    
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (3, N'IG2243.mp4');    
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (3, N'23467567.jpg');  
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (3, N'35654356.jpg');  
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (4, N'https://my.matterport.com/folders/uP8wSdfuhbC?page=1&ordering=-created&page_size=24&type=all&parent=uP8wSdfuhbC&organization=snn2BCakTPF');
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (5, N'https://my.matterport.com/folders/uP8wSdfuhbC?page=1&ordering=-created&page_size=24&type=all&parent=uP8wSdfuhbC&organization=snn2BCakTPF');
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (6, N'https://my.matterport.com/folders/uP8wSdfuhbC?page=1&ordering=-created&page_size=24&type=all&parent=uP8wSdfuhbC&organization=snn2BCakTPF');
INSERT INTO BuildControl.dbo.URLCAPTURE (IDCAPTURE, URL) VALUES (7, N'https://my.matterport.com/folders/uP8wSdfuhbC?page=1&ordering=-created&page_size=24&type=all&parent=uP8wSdfuhbC&organization=snn2BCakTPI');

-- APPLICATION
INSERT INTO BuildControl.dbo.APPLICATION (IDAPPLICATION, LIBELLE) VALUES (1, N'Desktop');
INSERT INTO BuildControl.dbo.APPLICATION (IDAPPLICATION, LIBELLE) VALUES (2, N'Mobile');

-- PROFILUTILISATEUR
INSERT INTO BuildControl.dbo.PROFILUTILISATEUR (IDPROFIL, LIBELLE) VALUES (1, N'Administrateur');   
INSERT INTO BuildControl.dbo.PROFILUTILISATEUR (IDPROFIL, LIBELLE) VALUES (2, N'Utilisateur');      

-- APPLIPROFIL
INSERT INTO BuildControl.dbo.APPLIPROFIL (IDAPPLICATION, IDPROFIL) VALUES (1, 1);
INSERT INTO BuildControl.dbo.APPLIPROFIL (IDAPPLICATION, IDPROFIL) VALUES (2, 2);

-- UTILISATEUR
INSERT INTO BuildControl.dbo.UTILISATEUR (IDUTILISATEUR, IDPROFIL, NOM, PRENOM, DATEENREGISTREMENT, IDENTIFIANT, MOTDEPASSE, PREMIERECONNEXION, DATECHGMTMDP, ECHECCONNEXION, ACTIF) VALUES (1, 1, N'Dupond', N'Marion', N'2021-07-01 11:55:14.000', N'I2021_MADU', N'I2021_MADU', 0, null, null, 1)
INSERT INTO BuildControl.dbo.UTILISATEUR (IDUTILISATEUR, IDPROFIL, NOM, PRENOM, DATEENREGISTREMENT, IDENTIFIANT, MOTDEPASSE, PREMIERECONNEXION, DATECHGMTMDP, ECHECCONNEXION, ACTIF) VALUES (2, 2, N'Dupont', N'Antoine', N'2021-07-01 11:55:14.000', N'C2021_ANDU', N'C2021_ANDU', 0, null, null, 1);

-- UTILCHANTIER
INSERT INTO BuildControl.dbo.UTILCHANTIER (IDUTILISATEUR, IDCHANTIER) VALUES (2, 1);  
INSERT INTO BuildControl.dbo.UTILCHANTIER (IDUTILISATEUR, IDCHANTIER) VALUES (2, 2);

-- CORPSMETIER
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (1, N'géologue');              
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (2, N'géomètre');              
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (3, N'terrassier');            
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (4, N'maçon');                 
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (5, N'charpentier');           
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (6, N'couvreur');              
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (7, N'électricien');           
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (8, N'plâtrier');              
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (9, N'plaquiste');             
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (10, N'menuisier');            
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (11, N'façadier');             
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (12, N'carreleur');            
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (13, N'pisciniste');           
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (14, N'cuisiniste');           
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (15, N'chauffagiste');         
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (16, N'serrurier');            
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (17, N'plombier zingueur');    
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (18, N'Entreprise démolition');
INSERT INTO BuildControl.dbo.CORPSMETIER (IDCORPSMETIER, LIBELLE) VALUES (19, N'Espaces verts');        

-- CHANTIERMETIER
INSERT INTO BuildControl.dbo.CHANTIERMETIER (IDCHANTIER, IDCORPSMETIER) VALUES (1, 1);
INSERT INTO BuildControl.dbo.CHANTIERMETIER (IDCHANTIER, IDCORPSMETIER) VALUES (1, 2);
INSERT INTO BuildControl.dbo.CHANTIERMETIER (IDCHANTIER, IDCORPSMETIER) VALUES (1, 3);
INSERT INTO BuildControl.dbo.CHANTIERMETIER (IDCHANTIER, IDCORPSMETIER) VALUES (1, 4);
INSERT INTO BuildControl.dbo.CHANTIERMETIER (IDCHANTIER, IDCORPSMETIER) VALUES (2, 5);
INSERT INTO BuildControl.dbo.CHANTIERMETIER (IDCHANTIER, IDCORPSMETIER) VALUES (2, 6);
INSERT INTO BuildControl.dbo.CHANTIERMETIER (IDCHANTIER, IDCORPSMETIER) VALUES (2, 7);
INSERT INTO BuildControl.dbo.CHANTIERMETIER (IDCHANTIER, IDCORPSMETIER) VALUES (2, 8);
INSERT INTO BuildControl.dbo.CHANTIERMETIER (IDCHANTIER, IDCORPSMETIER) VALUES (2, 9);