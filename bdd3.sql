DROP TABLE IF EXISTS APPLIPROFIL;
DROP TABLE IF EXISTS UTILCHANTIER;
DROP TABLE IF EXISTS CHANTIERSSTT;
DROP TABLE IF EXISTS CHANTIERMETIER;
DROP TABLE IF EXISTS CORPSMETIERSSTT;
go

DROP TABLE IF EXISTS APPLICATION;
DROP TABLE IF EXISTS UTILISATEUR;
DROP TABLE IF EXISTS PROFILUTILISATEUR;
go

DROP TABLE IF EXISTS URLCAPTURE;
DROP TABLE IF EXISTS CAPTURE;
DROP TABLE IF EXISTS INCIDENT;
DROP TABLE IF EXISTS TYPECAPTURE;
go

DROP TABLE IF EXISTS CHANTIER;
DROP TABLE IF EXISTS PROJET;
DROP TABLE IF EXISTS SOUSTRAITANT;
DROP TABLE IF EXISTS CORPSMETIER;
go

/*==============================================================*/
/* Table: APPLICATION                                           */
/*==============================================================*/
create table APPLICATION (
   IDAPPLICATION              int                  not null IDENTITY,
   LIBELLE              varchar(500)         not null,
   constraint PK_APPLICATION primary key (IDAPPLICATION)
)
go

/*==============================================================*/
/* Table: APPLIPROFIL                                           */
/*==============================================================*/
create table APPLIPROFIL (
   IDAPPLICATION              int                  not null,
   IDPROFIL             int                  not null,
   constraint PK_APPLIPROFIL primary key (IDAPPLICATION, IDPROFIL)
)
go

/*==============================================================*/
/* Index: APPLIPROFIL2_FK                                       */
/*==============================================================*/
create nonclustered index APPLIPROFIL2_FK on APPLIPROFIL (IDAPPLICATION ASC)
go

/*==============================================================*/
/* Index: APPLIPROFIL_FK                                        */
/*==============================================================*/
create nonclustered index APPLIPROFIL_FK on APPLIPROFIL (IDPROFIL ASC)
go

/*==============================================================*/
/* Table: CAPTURE                                               */
/*==============================================================*/
create table CAPTURE (
   IDCAPTURE            int                  not null IDENTITY,
   IDTYPECAPTURE        int                  not null,
   IDINCIDENT           int                  null,
   IDCHANTIER           int                  not null,
   REFERENCE            varchar(500)         not null,
   DATE                 datetime             not null,
   COORDONNEESGPS       varchar(500)         not null,
   JALON                varchar(500)         null,
   ETAPECAPTURE         varchar(500)         null,
   constraint PK_CAPTURE primary key (IDCAPTURE)
)
go

/*==============================================================*/
/* Index: CAPTTYPE_FK                                           */
/*==============================================================*/
create nonclustered index CAPTTYPE_FK on CAPTURE (IDTYPECAPTURE ASC)
go

/*==============================================================*/
/* Index: CAPTINCIDENT_FK                                       */
/*==============================================================*/
create nonclustered index CAPTINCIDENT_FK on CAPTURE (IDINCIDENT ASC)
go

/*==============================================================*/
/* Index: CAPTCHANTIER_FK                                       */
/*==============================================================*/
create nonclustered index CAPTCHANTIER_FK on CAPTURE (IDCHANTIER ASC)
go

/*==============================================================*/
/* Table: CHANTIER                                              */
/*==============================================================*/
create table CHANTIER (
   IDCHANTIER           int                  not null IDENTITY,
   IDPROJET             int                  not null,
   ADRESSE              varchar(500)         null,
   DATEDEBUT            date                 null,
   DATEFIN              date                 null,
   constraint PK_CHANTIER primary key (IDCHANTIER)
)
go

/*==============================================================*/
/* Index: PROCHANTIER_FK                                        */
/*==============================================================*/
create nonclustered index PROCHANTIER_FK on CHANTIER (IDPROJET ASC)
go

/*==============================================================*/
/* Table: CHANTIERSSTT                                          */
/*==============================================================*/
create table CHANTIERSSTT (
   IDCHANTIER           int                  not null,
   IDSOUSTRAITANT       int                  not null,
   constraint PK_CHANTIERSSTT primary key (IDCHANTIER, IDSOUSTRAITANT)
)
go

/*==============================================================*/
/* Index: CHANTIERSSTT2_FK                                      */
/*==============================================================*/
create nonclustered index CHANTIERSSTT2_FK on CHANTIERSSTT (IDCHANTIER ASC)
go

/*==============================================================*/
/* Index: CHANTIERSSTT_FK                                       */
/*==============================================================*/
create nonclustered index CHANTIERSSTT_FK on CHANTIERSSTT (IDSOUSTRAITANT ASC)
go

/*==============================================================*/
/* Table: CORPSMETIER                                           */
/*==============================================================*/
create table CORPSMETIER (
   IDCORPSMETIER        int                  not null IDENTITY,
   LIBELLE              varchar(500)         not null,
   constraint PK_CORPSMETIER primary key (IDCORPSMETIER)
)
go

/*==============================================================*/
/* Table: INCIDENT                                              */
/*==============================================================*/
create table INCIDENT (
   IDINCIDENT           int                  not null IDENTITY,
   LIBELLE              varchar(500)         not null,
   constraint PK_INCIDENT primary key (IDINCIDENT)
)
go

/*==============================================================*/
/* Table: PROFILUTILISATEUR                                     */
/*==============================================================*/
create table PROFILUTILISATEUR (
   IDPROFIL             int                  not null IDENTITY,
   LIBELLE              varchar(500)         not null,
   constraint PK_PROFILUTILISATEUR primary key (IDPROFIL)
)
go

/*==============================================================*/
/* Table: PROJET                                                */
/*==============================================================*/
create table PROJET (
   IDPROJET             int                  not null IDENTITY,
   LIBELLE              varchar(500)         not null,
   constraint PK_PROJET primary key (IDPROJET)
)
go

/*==============================================================*/
/* Table: SOUSTRAITANT                                          */
/*==============================================================*/
create table SOUSTRAITANT (
   IDSOUSTRAITANT       int                  not null IDENTITY,
   LIBELLE              varchar(500)         not null,
   ADRESSE              varchar(500)         null,
   constraint PK_SOUSTRAITANT primary key (IDSOUSTRAITANT)
)
go

/*==============================================================*/
/* Table: CORPSMETIERSSTT                                          */
/*==============================================================*/
create table CORPSMETIERSSTT (
   IDSOUSTRAITANT       int                  not null,
   IDCORPSMETIER        int                  not null,
   constraint PK_CORPSMETIERSSTT primary key (IDSOUSTRAITANT, IDCORPSMETIER)
)
go


/*==============================================================*/
/* Table: TYPECAPTURE                                           */
/*==============================================================*/
create table TYPECAPTURE (
   IDTYPECAPTURE        int                  not null IDENTITY,
   LIBELLE              varchar(500)         not null,
   constraint PK_TYPECAPTURE primary key (IDTYPECAPTURE)
)
go

/*==============================================================*/
/* Table: UTILCHANTIER                                          */
/*==============================================================*/
create table UTILCHANTIER (
   IDUTILISATEUR        int                  not null,
   IDCHANTIER           int                  not null,
   constraint PK_UTILCHANTIER primary key (IDUTILISATEUR, IDCHANTIER)
)
go

/*==============================================================*/
/* Index: UTILCHANTIER2_FK                                      */
/*==============================================================*/
create nonclustered index UTILCHANTIER2_FK on UTILCHANTIER (IDUTILISATEUR ASC)
go

/*==============================================================*/
/* Index: UTILCHANTIER_FK                                       */
/*==============================================================*/
create nonclustered index UTILCHANTIER_FK on UTILCHANTIER (IDCHANTIER ASC)
go

/*==============================================================*/
/* Table: UTILISATEUR                                           */
/*==============================================================*/
create table UTILISATEUR (
   IDUTILISATEUR        int                  not null IDENTITY,
   IDPROFIL             int                  not null,
   NOM                  varchar(200)         not null,
   PRENOM               varchar(200)         not null,
   DATEENREGISTREMENT   datetime             not null,
   IDENTIFIANT          varchar(200)         not null,
   MOTDEPASSE           varchar(200)         not null,
   PREMIERECONNEXION    bit                  not null,
   DATECHGMTMDP         datetime             null,
   ECHECCONNEXION       int                  not null default 0,
   ACTIF                bit                  not null default 0,
   constraint PK_UTILISATEUR primary key (IDUTILISATEUR)
)
go

/*==============================================================*/
/* Index: UTILPROFIL_FK                                         */
/*==============================================================*/
create nonclustered index UTILPROFIL_FK on UTILISATEUR (IDPROFIL ASC)
go

/*==============================================================*/
/* Table: URLCAPTURE                                           */
/*==============================================================*/
create table URLCAPTURE (
   IDURLCAPTURE         int                  not null IDENTITY,
   IDCAPTURE           int                  not null,
   URL                  varchar(200)         not null,
   constraint PK_URLCAPTURE primary key (IDURLCAPTURE)
)
go



alter table APPLIPROFIL
   add constraint FK_APPLIPRO_APPLIPROF_PROFILUT foreign key (IDPROFIL)
      references PROFILUTILISATEUR (IDPROFIL)
go

alter table APPLIPROFIL
   add constraint FK_APPLIPRO_APPLIPROF_APPLICAT foreign key (IDAPPLICATION)
      references APPLICATION (IDAPPLICATION)
go

alter table CAPTURE
   add constraint FK_CAPTURE_CAPTCHANT_CHANTIER foreign key (IDCHANTIER)
      references CHANTIER (IDCHANTIER)
go

alter table CAPTURE
   add constraint FK_CAPTURE_CAPTINCID_INCIDENT foreign key (IDINCIDENT)
      references INCIDENT (IDINCIDENT)
go

alter table CAPTURE
   add constraint FK_CAPTURE_CAPTTYPE_TYPECAPT foreign key (IDTYPECAPTURE)
      references TYPECAPTURE (IDTYPECAPTURE)
go

alter table CHANTIER
   add constraint FK_CHANTIER_PROCHANTI_PROJET foreign key (IDPROJET)
      references PROJET (IDPROJET)
go

alter table CHANTIERSSTT
   add constraint FK_CHANTIER_CHANTIERS_SOUSTRAI foreign key (IDSOUSTRAITANT)
      references SOUSTRAITANT (IDSOUSTRAITANT)
go

alter table CHANTIERSSTT
   add constraint FK_CHANTIER_CHANTIERS_CHANTIER foreign key (IDCHANTIER)
      references CHANTIER (IDCHANTIER)
go

alter table UTILCHANTIER
   add constraint FK_UTILCHAN_UTILCHANT_CHANTIER foreign key (IDCHANTIER)
      references CHANTIER (IDCHANTIER)
go

alter table UTILCHANTIER
   add constraint FK_UTILCHAN_UTILCHANT_UTILISAT foreign key (IDUTILISATEUR)
      references UTILISATEUR (IDUTILISATEUR)
go

alter table UTILISATEUR
   add constraint FK_UTILISAT_UTILPROFI_PROFILUT foreign key (IDPROFIL)
      references PROFILUTILISATEUR (IDPROFIL)
go

alter table CORPSMETIERSSTT
   add constraint FK_CORPSMETIERSSTT_SOUSTRAITANT_ID foreign key (IDSOUSTRAITANT)
      references SOUSTRAITANT (IDSOUSTRAITANT)
go

alter table CORPSMETIERSSTT
   add constraint FK_CORPSMETIERSSTT_CORPSMETIER_ID foreign key (IDCORPSMETIER)
      references CORPSMETIER (IDCORPSMETIER)
go

alter table URLCAPTURE
   add constraint FK_URLCAPTURE_CAPTURE_ID foreign key (IDCAPTURE)
      references CAPTURE (IDCAPTURE)
go