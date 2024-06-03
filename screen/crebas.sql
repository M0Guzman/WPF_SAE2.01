/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 12                        */
/* Date de création :  30/05/2024 13:37:48                      */
/*==============================================================*/


drop procedure if exists AMI_DELETEPROCEDURE;

drop procedure if exists AMI_INSERTPROCEDURE;

drop procedure if exists AMI_SELECTPROCEDURE;

drop procedure if exists AMI_UPDATEPROCEDURE;

drop procedure if exists BORNE_DELETEPROCEDURE;

drop procedure if exists BORNE_INSERTPROCEDURE;

drop procedure if exists BORNE_SELECTPROCEDURE;

drop procedure if exists BORNE_UPDATEPROCEDURE;

drop procedure if exists CLUB_DELETEPROCEDURE;

drop procedure if exists CLUB_INSERTPROCEDURE;

drop procedure if exists CLUB_SELECTPROCEDURE;

drop procedure if exists CLUB_UPDATEPROCEDURE;

drop procedure if exists COUREUR_DELETEPROCEDURE;

drop procedure if exists COUREUR_INSERTPROCEDURE;

drop procedure if exists COUREUR_SELECTPROCEDURE;

drop procedure if exists COUREUR_UPDATEPROCEDURE;

drop procedure if exists COURSE_DELETEPROCEDURE;

drop procedure if exists COURSE_INSERTPROCEDURE;

drop procedure if exists COURSE_SELECTPROCEDURE;

drop procedure if exists COURSE_UPDATEPROCEDURE;

drop procedure if exists EFFECTUE_DELETEPROCEDURE;

drop procedure if exists EFFECTUE_INSERTPROCEDURE;

drop procedure if exists EFFECTUE_SELECTPROCEDURE;

drop procedure if exists EFFECTUE_UPDATEPROCEDURE;

drop procedure if exists ENVOIE_DELETEPROCEDURE;

drop procedure if exists ENVOIE_INSERTPROCEDURE;

drop procedure if exists ENVOIE_SELECTPROCEDURE;

drop procedure if exists ENVOIE_UPDATEPROCEDURE;

drop procedure if exists FEDERATION_DELETEPROCEDURE;

drop procedure if exists FEDERATION_INSERTPROCEDURE;

drop procedure if exists FEDERATION_SELECTPROCEDURE;

drop procedure if exists FEDERATION_UPDATEPROCEDURE;

drop procedure if exists INSCRIPTIONCOURSE_DELETEPROCEDURE;

drop procedure if exists INSCRIPTIONCOURSE_INSERTPROCEDURE;

drop procedure if exists INSCRIPTIONCOURSE_SELECTPROCEDURE;

drop procedure if exists INSCRIPTIONCOURSE_UPDATEPROCEDURE;

drop procedure if exists TELEPHONE_DELETEPROCEDURE;

drop procedure if exists TELEPHONE_INSERTPROCEDURE;

drop procedure if exists TELEPHONE_SELECTPROCEDURE;

drop procedure if exists TELEPHONE_UPDATEPROCEDURE;

if exists(select 1 from sys.sysforeignkey where role='FK_BORNE_SE_SITUE_COURSE') then
    alter table BORNE
       delete foreign key FK_BORNE_SE_SITUE_COURSE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_COUREUR_APPARTIEN_FEDERATI') then
    alter table COUREUR
       delete foreign key FK_COUREUR_APPARTIEN_FEDERATI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_COUREUR_EST_INSCR_CLUB') then
    alter table COUREUR
       delete foreign key FK_COUREUR_EST_INSCR_CLUB
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EFFECTUE_EFFECTUE_COUREUR') then
    alter table EFFECTUE
       delete foreign key FK_EFFECTUE_EFFECTUE_COUREUR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EFFECTUE_EFFECTUE2_INSCRIPT') then
    alter table EFFECTUE
       delete foreign key FK_EFFECTUE_EFFECTUE2_INSCRIPT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ENVOIE_ENVOIE_BORNE') then
    alter table ENVOIE
       delete foreign key FK_ENVOIE_ENVOIE_BORNE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ENVOIE_ENVOIE2_AMI') then
    alter table ENVOIE
       delete foreign key FK_ENVOIE_ENVOIE2_AMI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_INSCRIPT_LIE_COURSE') then
    alter table INSCRIPTIONCOURSE
       delete foreign key FK_INSCRIPT_LIE_COURSE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TELEPHON_TELEPHONE_AMI') then
    alter table TELEPHONE
       delete foreign key FK_TELEPHON_TELEPHONE_AMI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TELEPHON_TELEPHONE_COUREUR') then
    alter table TELEPHONE
       delete foreign key FK_TELEPHON_TELEPHONE_COUREUR
end if;

drop index if exists AMI.AMI_PK;

drop table if exists AMI;

drop index if exists BORNE.SE_SITUE_FK;

drop index if exists BORNE.BORNE_PK;

drop table if exists BORNE;

drop index if exists CLUB.CLUB_PK;

drop table if exists CLUB;

drop index if exists COUREUR.EST_INSCRIT_FK;

drop index if exists COUREUR.APPARTIENT_FK;

drop index if exists COUREUR.COUREUR_PK;

drop table if exists COUREUR;

drop index if exists COURSE.COURSE_PK;

drop table if exists COURSE;

drop index if exists EFFECTUE.EFFECTUE2_FK;

drop index if exists EFFECTUE.EFFECTUE_FK;

drop index if exists EFFECTUE.EFFECTUE_PK;

drop table if exists EFFECTUE;

drop index if exists ENVOIE.ENVOIE_FK;

drop index if exists ENVOIE.ENVOIE_PK;

drop table if exists ENVOIE;

drop index if exists FEDERATION.FEDERATION_PK;

drop table if exists FEDERATION;

drop index if exists INSCRIPTIONCOURSE.LIE_FK;

drop index if exists INSCRIPTIONCOURSE.INSCRIPTIONCOURSE_PK;

drop table if exists INSCRIPTIONCOURSE;

drop index if exists TELEPHONE.TELEPHONE2_FK;

drop index if exists TELEPHONE.TELEPHONE_FK;

drop index if exists TELEPHONE.TELEPHONE_PK;

drop table if exists TELEPHONE;

/*==============================================================*/
/* Table : AMI                                                  */
/*==============================================================*/
create table AMI 
(
   IDAMI                integer                        not null,
   TELEPHONEAMI         numeric(10,0)                  not null,
   constraint PK_AMI primary key (IDAMI)
);

/*==============================================================*/
/* Index : AMI_PK                                               */
/*==============================================================*/
create unique index AMI_PK on AMI (
IDAMI ASC
);

/*==============================================================*/
/* Table : BORNE                                                */
/*==============================================================*/
create table BORNE 
(
   IDBORNE              integer                        not null,
   IDCOURSE             integer                        not null,
   DISTANCEBORNE        numeric(6,3)                   not null,
   constraint PK_BORNE primary key (IDBORNE)
);

/*==============================================================*/
/* Index : BORNE_PK                                             */
/*==============================================================*/
create unique index BORNE_PK on BORNE (
IDBORNE ASC
);

/*==============================================================*/
/* Index : SE_SITUE_FK                                          */
/*==============================================================*/
create index SE_SITUE_FK on BORNE (
IDCOURSE ASC
);

/*==============================================================*/
/* Table : CLUB                                                 */
/*==============================================================*/
create table CLUB 
(
   IDCLUB               integer                        not null,
   NOMCLUB              varchar(20)                    not null,
   constraint PK_CLUB primary key (IDCLUB)
);

/*==============================================================*/
/* Index : CLUB_PK                                              */
/*==============================================================*/
create unique index CLUB_PK on CLUB (
IDCLUB ASC
);

/*==============================================================*/
/* Table : COUREUR                                              */
/*==============================================================*/
create table COUREUR 
(
   IDCOUREUR            integer                        not null,
   IDFEDERATION         integer                        not null,
   IDCLUB               integer                        not null,
   NOMCOUREUR           varchar(50)                    not null,
   PRENOMCOUREUR        varchar(50)                    not null,
   SEXECOUREUR          char(1)                        not null,
   VILLECOUREUR         varchar(100)                   not null,
   NUMLICENSECOUREUR    integer                        not null,
   constraint PK_COUREUR primary key (IDCOUREUR)
);

/*==============================================================*/
/* Index : COUREUR_PK                                           */
/*==============================================================*/
create unique index COUREUR_PK on COUREUR (
IDCOUREUR ASC
);

/*==============================================================*/
/* Index : APPARTIENT_FK                                        */
/*==============================================================*/
create index APPARTIENT_FK on COUREUR (
IDFEDERATION ASC
);

/*==============================================================*/
/* Index : EST_INSCRIT_FK                                       */
/*==============================================================*/
create index EST_INSCRIT_FK on COUREUR (
IDCLUB ASC
);

/*==============================================================*/
/* Table : COURSE                                               */
/*==============================================================*/
create table COURSE 
(
   IDCOURSE             integer                        not null,
   NOMCOURSE            varchar(20)                    not null,
   DISTANCECOURSE       numeric(6,3)                   not null,
   DATEDEPARTCOURSE     date                           not null,
   HEUREDEPARTCOURSE    time                           not null,
   PRIXCOURSE           numeric(4,2)                   not null,
   constraint PK_COURSE primary key (IDCOURSE)
);

/*==============================================================*/
/* Index : COURSE_PK                                            */
/*==============================================================*/
create unique index COURSE_PK on COURSE (
IDCOURSE ASC
);

/*==============================================================*/
/* Table : EFFECTUE                                             */
/*==============================================================*/
create table EFFECTUE 
(
   IDCOUREUR            integer                        not null,
   IDINSCRIPTION        integer                        not null,
   constraint PK_EFFECTUE primary key clustered (IDCOUREUR, IDINSCRIPTION)
);

/*==============================================================*/
/* Index : EFFECTUE_PK                                          */
/*==============================================================*/
create unique clustered index EFFECTUE_PK on EFFECTUE (
IDCOUREUR ASC,
IDINSCRIPTION ASC
);

/*==============================================================*/
/* Index : EFFECTUE_FK                                          */
/*==============================================================*/
create index EFFECTUE_FK on EFFECTUE (
IDCOUREUR ASC
);

/*==============================================================*/
/* Index : EFFECTUE2_FK                                         */
/*==============================================================*/
create index EFFECTUE2_FK on EFFECTUE (
IDINSCRIPTION ASC
);

/*==============================================================*/
/* Table : ENVOIE                                               */
/*==============================================================*/
create table ENVOIE 
(
   IDBORNE              integer                        not null,
   IDAMI                integer                        not null,
   constraint PK_ENVOIE primary key clustered (IDBORNE, IDAMI)
);

/*==============================================================*/
/* Index : ENVOIE_PK                                            */
/*==============================================================*/
create unique clustered index ENVOIE_PK on ENVOIE (
IDBORNE ASC,
IDAMI ASC
);

/*==============================================================*/
/* Index : ENVOIE_FK                                            */
/*==============================================================*/
create index ENVOIE_FK on ENVOIE (
IDBORNE ASC
);

/*==============================================================*/
/* Table : FEDERATION                                           */
/*==============================================================*/
create table FEDERATION 
(
   IDFEDERATION         integer                        not null,
   NOMFEDERATION        varchar(3)                     not null,
   constraint PK_FEDERATION primary key (IDFEDERATION)
);

/*==============================================================*/
/* Index : FEDERATION_PK                                        */
/*==============================================================*/
create unique index FEDERATION_PK on FEDERATION (
IDFEDERATION ASC
);

/*==============================================================*/
/* Table : INSCRIPTIONCOURSE                                    */
/*==============================================================*/
create table INSCRIPTIONCOURSE 
(
   IDINSCRIPTION        integer                        not null,
   IDCOURSE             integer                        not null,
   constraint PK_INSCRIPTIONCOURSE primary key (IDINSCRIPTION)
);

/*==============================================================*/
/* Index : INSCRIPTIONCOURSE_PK                                 */
/*==============================================================*/
create unique index INSCRIPTIONCOURSE_PK on INSCRIPTIONCOURSE (
IDINSCRIPTION ASC
);

/*==============================================================*/
/* Index : LIE_FK                                               */
/*==============================================================*/
create index LIE_FK on INSCRIPTIONCOURSE (
IDCOURSE ASC
);

/*==============================================================*/
/* Table : TELEPHONE                                            */
/*==============================================================*/
create table TELEPHONE 
(
   IDAMI                integer                        not null,
   IDCOUREUR            integer                        not null,
   constraint PK_TELEPHONE primary key clustered (IDAMI, IDCOUREUR)
);

/*==============================================================*/
/* Index : TELEPHONE_PK                                         */
/*==============================================================*/
create unique clustered index TELEPHONE_PK on TELEPHONE (
IDAMI ASC,
IDCOUREUR ASC
);

/*==============================================================*/
/* Index : TELEPHONE_FK                                         */
/*==============================================================*/
create index TELEPHONE_FK on TELEPHONE (
IDAMI ASC
);

/*==============================================================*/
/* Index : TELEPHONE2_FK                                        */
/*==============================================================*/
create index TELEPHONE2_FK on TELEPHONE (
IDCOUREUR ASC
);

alter table BORNE
   add constraint FK_BORNE_SE_SITUE_COURSE foreign key (IDCOURSE)
      references COURSE (IDCOURSE)
      on update restrict
      on delete restrict;

alter table COUREUR
   add constraint FK_COUREUR_APPARTIEN_FEDERATI foreign key (IDFEDERATION)
      references FEDERATION (IDFEDERATION)
      on update restrict
      on delete restrict;

alter table COUREUR
   add constraint FK_COUREUR_EST_INSCR_CLUB foreign key (IDCLUB)
      references CLUB (IDCLUB)
      on update restrict
      on delete restrict;

alter table EFFECTUE
   add constraint FK_EFFECTUE_EFFECTUE_COUREUR foreign key (IDCOUREUR)
      references COUREUR (IDCOUREUR)
      on update restrict
      on delete restrict;

alter table EFFECTUE
   add constraint FK_EFFECTUE_EFFECTUE2_INSCRIPT foreign key (IDINSCRIPTION)
      references INSCRIPTIONCOURSE (IDINSCRIPTION)
      on update restrict
      on delete restrict;

alter table ENVOIE
   add constraint FK_ENVOIE_ENVOIE_BORNE foreign key (IDBORNE)
      references BORNE (IDBORNE)
      on update restrict
      on delete restrict;

alter table ENVOIE
   add constraint FK_ENVOIE_ENVOIE2_AMI foreign key (IDAMI)
      references AMI (IDAMI)
      on update restrict
      on delete restrict;

alter table INSCRIPTIONCOURSE
   add constraint FK_INSCRIPT_LIE_COURSE foreign key (IDCOURSE)
      references COURSE (IDCOURSE)
      on update restrict
      on delete restrict;

alter table TELEPHONE
   add constraint FK_TELEPHON_TELEPHONE_AMI foreign key (IDAMI)
      references AMI (IDAMI)
      on update restrict
      on delete restrict;

alter table TELEPHONE
   add constraint FK_TELEPHON_TELEPHONE_COUREUR foreign key (IDCOUREUR)
      references COUREUR (IDCOUREUR)
      on update restrict
      on delete restrict;

create procedure AMI_DELETEPROCEDURE  @IDAMI integer as
begin
delete from AMI
where AMI.IDAMI = @IDAMI
end;

create procedure AMI_INSERTPROCEDURE  @IDAMI integer,@TELEPHONEAMI numeric(10,0) as
begin
insert into AMI (AMI.IDAMI,AMI.TELEPHONEAMI)
values(@IDAMI,@TELEPHONEAMI)
end;

create procedure AMI_SELECTPROCEDURE  @IDAMI integer as
begin
select * from AMI
where AMI.IDAMI = @IDAMI
end;

create procedure AMI_UPDATEPROCEDURE  @IDAMI integer,@TELEPHONEAMI numeric(10,0) as
begin
update AMI
set AMI.TELEPHONEAMI = @TELEPHONEAMI
where (AMI.IDAMI = @IDAMI)
end;

create procedure BORNE_DELETEPROCEDURE  @IDBORNE integer as
begin
delete from BORNE
where BORNE.IDBORNE = @IDBORNE
end;

create procedure BORNE_INSERTPROCEDURE  @IDBORNE integer,@IDCOURSE integer,@DISTANCEBORNE numeric(6,3) as
begin
insert into BORNE (BORNE.IDBORNE,BORNE.IDCOURSE,BORNE.DISTANCEBORNE)
values(@IDBORNE,@IDCOURSE,@DISTANCEBORNE)
end;

create procedure BORNE_SELECTPROCEDURE  @IDBORNE integer as
begin
select * from BORNE
where BORNE.IDBORNE = @IDBORNE
end;

create procedure BORNE_UPDATEPROCEDURE  @IDBORNE integer,@IDCOURSE integer,@DISTANCEBORNE numeric(6,3) as
begin
update BORNE
set BORNE.IDCOURSE = @IDCOURSE, BORNE.DISTANCEBORNE = @DISTANCEBORNE
where (BORNE.IDBORNE = @IDBORNE)
end;

create procedure CLUB_DELETEPROCEDURE  @IDCLUB integer as
begin
delete from CLUB
where CLUB.IDCLUB = @IDCLUB
end;

create procedure CLUB_INSERTPROCEDURE  @IDCLUB integer,@NOMCLUB varchar(20) as
begin
insert into CLUB (CLUB.IDCLUB,CLUB.NOMCLUB)
values(@IDCLUB,@NOMCLUB)
end;

create procedure CLUB_SELECTPROCEDURE  @IDCLUB integer as
begin
select * from CLUB
where CLUB.IDCLUB = @IDCLUB
end;

create procedure CLUB_UPDATEPROCEDURE  @IDCLUB integer,@NOMCLUB varchar(20) as
begin
update CLUB
set CLUB.NOMCLUB = @NOMCLUB
where (CLUB.IDCLUB = @IDCLUB)
end;

create procedure COUREUR_DELETEPROCEDURE  @IDCOUREUR integer as
begin
delete from COUREUR
where COUREUR.IDCOUREUR = @IDCOUREUR
end;

create procedure COUREUR_INSERTPROCEDURE  @IDCOUREUR integer,@IDFEDERATION integer,@IDCLUB integer,@NOMCOUREUR varchar(50),@PRENOMCOUREUR varchar(50),@SEXECOUREUR char(1),@VILLECOUREUR varchar(100),@NUMLICENSECOUREUR integer as
begin
insert into COUREUR (COUREUR.IDCOUREUR,COUREUR.IDFEDERATION,COUREUR.IDCLUB,COUREUR.NOMCOUREUR,COUREUR.PRENOMCOUREUR,COUREUR.SEXECOUREUR,COUREUR.VILLECOUREUR,COUREUR.NUMLICENSECOUREUR)
values(@IDCOUREUR,@IDFEDERATION,@IDCLUB,@NOMCOUREUR,@PRENOMCOUREUR,@SEXECOUREUR,@VILLECOUREUR,@NUMLICENSECOUREUR)
end;

create procedure COUREUR_SELECTPROCEDURE  @IDCOUREUR integer as
begin
select * from COUREUR
where COUREUR.IDCOUREUR = @IDCOUREUR
end;

create procedure COUREUR_UPDATEPROCEDURE  @IDCOUREUR integer,@IDFEDERATION integer,@IDCLUB integer,@NOMCOUREUR varchar(50),@PRENOMCOUREUR varchar(50),@SEXECOUREUR char(1),@VILLECOUREUR varchar(100),@NUMLICENSECOUREUR integer as
begin
update COUREUR
set COUREUR.IDFEDERATION = @IDFEDERATION, COUREUR.IDCLUB = @IDCLUB, COUREUR.NOMCOUREUR = @NOMCOUREUR, COUREUR.PRENOMCOUREUR = @PRENOMCOUREUR, COUREUR.SEXECOUREUR = @SEXECOUREUR, COUREUR.VILLECOUREUR = @VILLECOUREUR, COUREUR.NUMLICENSECOUREUR = @NUMLICENSECOUREUR
where (COUREUR.IDCOUREUR = @IDCOUREUR)
end;

create procedure COURSE_DELETEPROCEDURE  @IDCOURSE integer as
begin
delete from COURSE
where COURSE.IDCOURSE = @IDCOURSE
end;

create procedure COURSE_INSERTPROCEDURE  @IDCOURSE integer,@NOMCOURSE varchar(20),@DISTANCECOURSE numeric(6,3),@DATEDEPARTCOURSE date,@HEUREDEPARTCOURSE time,@PRIXCOURSE numeric(4,2) as
begin
insert into COURSE (COURSE.IDCOURSE,COURSE.NOMCOURSE,COURSE.DISTANCECOURSE,COURSE.DATEDEPARTCOURSE,COURSE.HEUREDEPARTCOURSE,COURSE.PRIXCOURSE)
values(@IDCOURSE,@NOMCOURSE,@DISTANCECOURSE,@DATEDEPARTCOURSE,@HEUREDEPARTCOURSE,@PRIXCOURSE)
end;

create procedure COURSE_SELECTPROCEDURE  @IDCOURSE integer as
begin
select * from COURSE
where COURSE.IDCOURSE = @IDCOURSE
end;

create procedure COURSE_UPDATEPROCEDURE  @IDCOURSE integer,@NOMCOURSE varchar(20),@DISTANCECOURSE numeric(6,3),@DATEDEPARTCOURSE date,@HEUREDEPARTCOURSE time,@PRIXCOURSE numeric(4,2) as
begin
update COURSE
set COURSE.NOMCOURSE = @NOMCOURSE, COURSE.DISTANCECOURSE = @DISTANCECOURSE, COURSE.DATEDEPARTCOURSE = @DATEDEPARTCOURSE, COURSE.HEUREDEPARTCOURSE = @HEUREDEPARTCOURSE, COURSE.PRIXCOURSE = @PRIXCOURSE
where (COURSE.IDCOURSE = @IDCOURSE)
end;

create procedure EFFECTUE_DELETEPROCEDURE  @IDCOUREUR integer,@IDINSCRIPTION integer as
begin
delete from EFFECTUE
where EFFECTUE.IDCOUREUR = @IDCOUREUR and EFFECTUE.IDINSCRIPTION = @IDINSCRIPTION
end;

create procedure EFFECTUE_INSERTPROCEDURE  @IDCOUREUR integer,@IDINSCRIPTION integer as
begin
insert into EFFECTUE (EFFECTUE.IDCOUREUR,EFFECTUE.IDINSCRIPTION)
values(@IDCOUREUR,@IDINSCRIPTION)
end;

create procedure EFFECTUE_SELECTPROCEDURE  @IDCOUREUR integer,@IDINSCRIPTION integer as
begin
select * from EFFECTUE
where EFFECTUE.IDCOUREUR = @IDCOUREUR and EFFECTUE.IDINSCRIPTION = @IDINSCRIPTION
end;

create procedure EFFECTUE_UPDATEPROCEDURE  @IDCOUREUR integer,@IDINSCRIPTION integer as
begin
update EFFECTUE
where (EFFECTUE.IDCOUREUR = @IDCOUREUR and EFFECTUE.IDINSCRIPTION = @IDINSCRIPTION)
end;

create procedure ENVOIE_DELETEPROCEDURE  @IDBORNE integer,@IDAMI integer as
begin
delete from ENVOIE
where ENVOIE.IDBORNE = @IDBORNE and ENVOIE.IDAMI = @IDAMI
end;

create procedure ENVOIE_INSERTPROCEDURE  @IDBORNE integer,@IDAMI integer as
begin
insert into ENVOIE (ENVOIE.IDBORNE,ENVOIE.IDAMI)
values(@IDBORNE,@IDAMI)
end;

create procedure ENVOIE_SELECTPROCEDURE  @IDBORNE integer,@IDAMI integer as
begin
select * from ENVOIE
where ENVOIE.IDBORNE = @IDBORNE and ENVOIE.IDAMI = @IDAMI
end;

create procedure ENVOIE_UPDATEPROCEDURE  @IDBORNE integer,@IDAMI integer as
begin
update ENVOIE
where (ENVOIE.IDBORNE = @IDBORNE and ENVOIE.IDAMI = @IDAMI)
end;

create procedure FEDERATION_DELETEPROCEDURE  @IDFEDERATION integer as
begin
delete from FEDERATION
where FEDERATION.IDFEDERATION = @IDFEDERATION
end;

create procedure FEDERATION_INSERTPROCEDURE  @IDFEDERATION integer,@NOMFEDERATION varchar(3) as
begin
insert into FEDERATION (FEDERATION.IDFEDERATION,FEDERATION.NOMFEDERATION)
values(@IDFEDERATION,@NOMFEDERATION)
end;

create procedure FEDERATION_SELECTPROCEDURE  @IDFEDERATION integer as
begin
select * from FEDERATION
where FEDERATION.IDFEDERATION = @IDFEDERATION
end;

create procedure FEDERATION_UPDATEPROCEDURE  @IDFEDERATION integer,@NOMFEDERATION varchar(3) as
begin
update FEDERATION
set FEDERATION.NOMFEDERATION = @NOMFEDERATION
where (FEDERATION.IDFEDERATION = @IDFEDERATION)
end;

create procedure INSCRIPTIONCOURSE_DELETEPROCEDURE  @IDINSCRIPTION integer as
begin
delete from INSCRIPTIONCOURSE
where INSCRIPTIONCOURSE.IDINSCRIPTION = @IDINSCRIPTION
end;

create procedure INSCRIPTIONCOURSE_INSERTPROCEDURE  @IDINSCRIPTION integer,@IDCOURSE integer as
begin
insert into INSCRIPTIONCOURSE (INSCRIPTIONCOURSE.IDINSCRIPTION,INSCRIPTIONCOURSE.IDCOURSE)
values(@IDINSCRIPTION,@IDCOURSE)
end;

create procedure INSCRIPTIONCOURSE_SELECTPROCEDURE  @IDINSCRIPTION integer as
begin
select * from INSCRIPTIONCOURSE
where INSCRIPTIONCOURSE.IDINSCRIPTION = @IDINSCRIPTION
end;

create procedure INSCRIPTIONCOURSE_UPDATEPROCEDURE  @IDINSCRIPTION integer,@IDCOURSE integer as
begin
update INSCRIPTIONCOURSE
set INSCRIPTIONCOURSE.IDCOURSE = @IDCOURSE
where (INSCRIPTIONCOURSE.IDINSCRIPTION = @IDINSCRIPTION)
end;

create procedure TELEPHONE_DELETEPROCEDURE  @IDAMI integer,@IDCOUREUR integer as
begin
delete from TELEPHONE
where TELEPHONE.IDAMI = @IDAMI and TELEPHONE.IDCOUREUR = @IDCOUREUR
end;

create procedure TELEPHONE_INSERTPROCEDURE  @IDAMI integer,@IDCOUREUR integer as
begin
insert into TELEPHONE (TELEPHONE.IDAMI,TELEPHONE.IDCOUREUR)
values(@IDAMI,@IDCOUREUR)
end;

create procedure TELEPHONE_SELECTPROCEDURE  @IDAMI integer,@IDCOUREUR integer as
begin
select * from TELEPHONE
where TELEPHONE.IDAMI = @IDAMI and TELEPHONE.IDCOUREUR = @IDCOUREUR
end;

create procedure TELEPHONE_UPDATEPROCEDURE  @IDAMI integer,@IDCOUREUR integer as
begin
update TELEPHONE
where (TELEPHONE.IDAMI = @IDAMI and TELEPHONE.IDCOUREUR = @IDCOUREUR)
end;

