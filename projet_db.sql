/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     15/06/2021 13:47:28                          */
/*==============================================================*/


drop table if exists CATEGORIE;

drop table if exists CHAMBRE;

drop table if exists CLASSE;

drop table if exists CLIENT;

drop table if exists CONSOMMATION;

drop table if exists DEPENDRE;

drop table if exists HOTEL;

drop table if exists OFFRIR;

drop table if exists PRESTATION;

drop table if exists RELIER;

drop table if exists RESERVATION;

/*==============================================================*/
/* Table: CATEGORIE                                             */
/*==============================================================*/
create table CATEGORIE
(
   NUMCAT               int not null,
   CODECAT              int,
   DESCRIPTION_         text,
   primary key (NUMCAT)
);

/*==============================================================*/
/* Table: CHAMBRE                                               */
/*==============================================================*/
create table CHAMBRE
(
   NUMCHAMBRE           int not null,
   NUMH                 int not null,
   NUMCAT               int not null,
   TELCHAMBRE           numeric(8,0),
   primary key (NUMCHAMBRE)
);

/*==============================================================*/
/* Table: CLASSE                                                */
/*==============================================================*/
create table CLASSE
(
   NUMCLASSE            int not null,
   NBREETOILE           int,
   CARACTERISTIQUE      text,
   primary key (NUMCLASSE)
);

/*==============================================================*/
/* Table: CLIENT                                                */
/*==============================================================*/
create table CLIENT
(
   NUMCLIENT            int not null,
   NOMCLIENT            char(25),
   PRENOMCLIENT         char(25),
   ADRESSECLIENT        char(25),
   VILLECLIENT          char(25),
   CP                   char(25),
   PAYSCLIENT           char(25),
   TELCLIENT            numeric(8,0),
   MAILCLIENT           char(25),
   primary key (NUMCLIENT)
);

/*==============================================================*/
/* Table: CONSOMMATION                                          */
/*==============================================================*/
create table CONSOMMATION
(
   NUMCONS              int not null,
   NUMCLIENT            int not null,
   DATECONS             date,
   HEURECON             time,
   primary key (NUMCONS)
);

/*==============================================================*/
/* Table: DEPENDRE                                              */
/*==============================================================*/
create table DEPENDRE
(
   NUMCLASSE            int not null,
   NUMCAT               int not null,
   PRIXCHAMBRE          decimal,
   primary key (NUMCLASSE, NUMCAT)
);

/*==============================================================*/
/* Table: HOTEL                                                 */
/*==============================================================*/
create table HOTEL
(
   NUMH                 int not null,
   NUMCLASSE            int not null,
   NOMH                 char(30),
   ADRESSEH             char(30),
   CPH                  char(30),
   TELH                 numeric(8,0),
   primary key (NUMH)
);

/*==============================================================*/
/* Table: OFFRIR                                                */
/*==============================================================*/
create table OFFRIR
(
   NUMPRES              int not null,
   NUMCONS              int not null,
   primary key (NUMPRES, NUMCONS)
);

/*==============================================================*/
/* Table: PRESTATION                                            */
/*==============================================================*/
create table PRESTATION
(
   NUMPRES              int not null,
   CODEPRES             int,
   DESIGNATION_         text,
   primary key (NUMPRES)
);

/*==============================================================*/
/* Table: RELIER                                                */
/*==============================================================*/
create table RELIER
(
   NUMH                 int not null,
   NUMPRES              int not null,
   PRIXPRES             decimal,
   primary key (NUMH, NUMPRES)
);

/*==============================================================*/
/* Table: RESERVATION                                           */
/*==============================================================*/
create table RESERVATION
(
   NUMRESERVATION       int not null,
   NUMCHAMBRE           int not null,
   NUMCLIENT            int not null,
   DATEDEBUT            date,
   DATEFIN              date,
   DATEPAYEAVANCE       date,
   MONTANTARRHES        decimal,
   primary key (NUMRESERVATION)
);

alter table CHAMBRE add constraint FK_AVOIR foreign key (NUMCAT)
      references CATEGORIE (NUMCAT) on delete restrict on update restrict;

alter table CHAMBRE add constraint FK_POSSEDER foreign key (NUMH)
      references HOTEL (NUMH) on delete restrict on update restrict;

alter table CONSOMMATION add constraint FK_FACTURER foreign key (NUMCLIENT)
      references CLIENT (NUMCLIENT) on delete restrict on update restrict;

alter table DEPENDRE add constraint FK_DEPENDRE foreign key (NUMCAT)
      references CATEGORIE (NUMCAT) on delete restrict on update restrict;

alter table DEPENDRE add constraint FK_DEPENDRE2 foreign key (NUMCLASSE)
      references CLASSE (NUMCLASSE) on delete restrict on update restrict;

alter table HOTEL add constraint FK_APPARTENIR foreign key (NUMCLASSE)
      references CLASSE (NUMCLASSE) on delete restrict on update restrict;

alter table OFFRIR add constraint FK_OFFRIR foreign key (NUMCONS)
      references CONSOMMATION (NUMCONS) on delete restrict on update restrict;

alter table OFFRIR add constraint FK_OFFRIR2 foreign key (NUMPRES)
      references PRESTATION (NUMPRES) on delete restrict on update restrict;

alter table RELIER add constraint FK_PRESTER foreign key (NUMPRES)
      references PRESTATION (NUMPRES) on delete restrict on update restrict;

alter table RELIER add constraint FK_PRESTER2 foreign key (NUMH)
      references HOTEL (NUMH) on delete restrict on update restrict;

alter table RESERVATION add constraint FK_CONCERNER foreign key (NUMCHAMBRE)
      references CHAMBRE (NUMCHAMBRE) on delete restrict on update restrict;

alter table RESERVATION add constraint FK_RESERVER foreign key (NUMCLIENT)
      references CLIENT (NUMCLIENT) on delete restrict on update restrict;

