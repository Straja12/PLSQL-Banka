/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     6/1/2016 4:16:01 PM                          */
/*==============================================================*/


drop table  ANALITIKA_IZVODA;

drop table  BANKA;

drop table  DNEVNO_STANJE_RACUNA;

drop table DRZAVA;

drop table KLIJENT;

drop table KURSNA_LISTA;

drop table  KURS_U_VALUTI;

drop table NASELJENO_MESTO;

drop table  RACUNI_PRAVNIH_LICA;

drop table  UKIDANJE;

drop table  VALUTE;

drop table  VRSTE_PLACANJA;

/*==============================================================*/
/* Table: BANKA                                                 */
/*==============================================================*/
create table BANKA 
(
   ID_BANKE             integer                        not null,
   SIFRA_BANKE          char(3)                        not null,
   PR_PIB               char(10)                       not null,
   PR_NAZIV             varchar(120)                   not null,
   PR_ADRESA            varchar(120)                   not null,
   PR_EMAIL             varchar(128)                   null,
   PR_WEB               varchar(128)                   null,
   PR_TELEFON           varchar(20)                    null,
   PR_FAX               varchar(20)                    null,
   PR_BANKA             smallint                       not null,
   constraint PK_BANKA primary key (ID_BANKE)
);

/*==============================================================*/
/* Table: DRZAVA                                                */
/*==============================================================*/
create table DRZAVA 
(
   DR_SIFRA             numeric(3)                     not null,
   
   DR_NAZIV             varchar(40)                    not null,
   constraint PK_DRZAVA primary key (DR_SIFRA)
);

/*==============================================================*/
/* Table: VALUTE                                                */
/*==============================================================*/
create table VALUTE 
(
   ID_VALUTE            integer                        not null,
   DR_SIFRA             numeric(3)                     not null,
   VA_IFRA              char(3)                        not null,
   VA_NAZIV             varchar(30)                    not null,
   VA_DOMICILNA         smallint                       not null,
   	constraint CKC_VA_DOMICILNA_VALUTE check (VA_DOMICILNA between 0 and 1),
   constraint PK_VALUTE primary key (ID_VALUTE),
   constraint FK_VALUTE_DRZAVNA_V_DRZAVA foreign key (DR_SIFRA)
      references DRZAVA (DR_SIFRA)
       
);

/*==============================================================*/
/* Table: KLIJENT                                               */
/*==============================================================*/
create table KLIJENT 
(
   ID_KLIJENTA          integer                        not null,
   TIP_KLIJENTA         char(1)                        null,
   JMBG                 char(13)                       not null,
   PREZIME              varchar(20)                    not null,
   IME                  varchar(20)                    not null,
   ADRESA               varchar(40)                    not null,
   TELEFON              varchar(20)                    not null,
   PIB                  char(10)                       null,
   NAZIV_FIRME          varchar(50)                    null,
   constraint PK_KLIJENT primary key (ID_KLIJENTA)
);

/*==============================================================*/
/* Table: RACUNI_PRAVNIH_LICA                                   */
/*==============================================================*/
create table RACUNI_PRAVNIH_LICA 
(
   ID_RACUNA            integer                        not null,
   ID_BANKE             integer                        not null,
   ID_VALUTE            integer                        not null,
   ID_KLIJENTA          integer                        not null,
   BAR_RACUN            varchar(18)                    not null,
   BAR_DATOTV           date                           not null,
   BAR_VAZI             smallint                       not null,
   	constraint CKC_BAR_VAZI_RACUNI_P check (BAR_VAZI between 0 and 1),
   constraint PK_RACUNI_PRAVNIH_LICA primary key (ID_RACUNA),
   constraint FK_RACUNI_P_POSLOVNA__BANKA foreign key (ID_BANKE)
      references BANKA (ID_BANKE)
        ,
   constraint FK_RACUNI_P_VALUTA_RA_VALUTE foreign key (ID_VALUTE)
      references VALUTE (ID_VALUTE)
        ,
   constraint FK_RACUNI_P_VLASNIK_R_KLIJENT foreign key (ID_KLIJENTA)
      references KLIJENT (ID_KLIJENTA)
        
);

/*==============================================================*/
/* Table: DNEVNO_STANJE_RACUNA                                  */
/*==============================================================*/
create table DNEVNO_STANJE_RACUNA 
(
   DSR_IZVOD            integer                        not null,
   ID_RACUNA            integer                        not null,
   DSR_DATUM            date                           not null,
   DSR_PRETHODNO        decimal(15,2)                  not null,
   DSR_UKORIST          decimal(15,2)                  not null,
   DSR_NATERET          decimal(15,2)                  not null,
   DSR_NOVOSTANJE       decimal(15,2)                  not null,
   constraint PK_DNEVNO_STANJE_RACUNA primary key (DSR_IZVOD),
   constraint FK_DNEVNO_S_DNEVNI_IZ_RACUNI_P foreign key (ID_RACUNA)
      references RACUNI_PRAVNIH_LICA (ID_RACUNA)
       
);

/*==============================================================*/
/* Table: NASELJENO_MESTO                                       */
/*==============================================================*/
create table NASELJENO_MESTO 
(
   NM_SIFRA             integer                        not null,
   DR_SIFRA             numeric(3)                     not null,
   
   NM_NAZIV             varchar(60)                    not null,
   NM_PTTOZNAKA         varchar(12)                    not null,
   constraint PK_NASELJENO_MESTO primary key (NM_SIFRA),
   constraint FK_NASELJEN_MESTA_U_D_DRZAVA foreign key (DR_SIFRA)
      references DRZAVA (DR_SIFRA)
      
);

/*==============================================================*/
/* Table: VRSTE_PLACANJA                                        */
/*==============================================================*/
create table VRSTE_PLACANJA 
(
   VPL_OZNAKA           numeric(3)                     not null,
   VPL_NAZIV            varchar(120)                   not null,
   constraint PK_VRSTE_PLACANJA primary key (VPL_OZNAKA)
);

/*==============================================================*/
/* Table: ANALITIKA_IZVODA                                      */
/*==============================================================*/
create table ANALITIKA_IZVODA 
(
   ASI_BROJSTAVKE       integer                        not null,
   DSR_IZVOD            integer                        not null,
   VPL_OZNAKA           numeric(3)                     null,
   NM_SIFRA             integer                        null,
   ID_VALUTE            integer                        null,
   ASI_DUZNIK           varchar(256)                   not null,
   ASI_SVRHA            varchar(256)                   not null,
   ASI_POVERILAC        varchar(256)                   not null,
   ASI_DATPRI           date                           not null,
   ASI_DATVAL           date                           not null,
   ASI_RACDUZ           varchar(18)                    null,
   ASI_MODZAD           numeric(2)                     null,
   ASI_PBZAD            varchar(20)                    null,
   ASI_RACPOV           varchar(18)                    null,
   ASI_MODODOB          numeric(2)                     null,
   ASI_PBODO            varchar(20)                    null,
   ASI_HITNO            smallint                       not null,
   	constraint CKC_ASI_HITNO_ANALITIK check (ASI_HITNO between 0 and 1),
   ASI_IZNOS            decimal(15,2)                  not null,
   ASI_TIPGRESKE        numeric(1)                     not null,
   	constraint CKC_ASI_TIPGRESKE_ANALITIK check (ASI_TIPGRESKE in (1,2,3,8,9)),
   ASI_STATUS           char(1)                        null
   	constraint CKC_ASI_STATUS_ANALITIK check (ASI_STATUS is null or (ASI_STATUS in ('E','P'))),
   constraint PK_ANALITIKA_IZVODA primary key (ASI_BROJSTAVKE),
   constraint FK_ANALITIK_ANALITIKA_DNEVNO_S foreign key (DSR_IZVOD)
      references DNEVNO_STANJE_RACUNA (DSR_IZVOD)
       ,
   constraint FK_ANALITIK_MESTO_PRI_NASELJEN foreign key (NM_SIFRA)
      references NASELJENO_MESTO (NM_SIFRA)
        ,
   constraint FK_ANALITIK_VRSTA_PLA_VRSTE_PL foreign key (VPL_OZNAKA)
      references VRSTE_PLACANJA (VPL_OZNAKA)
        ,
   constraint FK_ANALITIK_VALUTA_PL_VALUTE foreign key (ID_VALUTE)
      references VALUTE (ID_VALUTE)
       
);

/*==============================================================*/
/* Table: KURSNA_LISTA                                          */
/*==============================================================*/
create table KURSNA_LISTA 
(
   ID_KURSNE_LISTE      integer                        not null,
   ID_BANKE             integer                        not null,
   KL_DATUM             date                           not null,
   KL_BROJ              numeric(3)                     not null,
   KL_DATPR             date                           not null,
   constraint PK_KURSNA_LISTA primary key (ID_KURSNE_LISTE),
   constraint FK_KURSNA_L_KURS_POSL_BANKA foreign key (ID_BANKE)
      references BANKA (ID_BANKE)
     
);

/*==============================================================*/
/* Table: KURS_U_VALUTI                                         */
/*==============================================================*/
create table KURS_U_VALUTI 
(
  -- KLS_RBR              numeric(9)                     not null,
   ID_KURSNE_LISTE      integer                        not null,
   ID_VALUTE            integer                        not null,
   VAL_ID_VALUTE        integer                        not null,
   KLS_KUPOVNI          decimal(9,4)                   not null,
   KLS_SREDNJI          decimal(9,4)                   not null,
   KLS_PRODAJNI         decimal(9,4)                   not null,
   constraint PK_KURS_U_VALUTI primary key (ID_KURSNE_LISTE,ID_VALUTE),
   constraint FK_KURS_U_V_OSNOVNA_V_VALUTE foreign key (VAL_ID_VALUTE)
      references VALUTE (ID_VALUTE),
	  
   constraint FK_KURS_U_V_PREMA_VAL_VALUTE foreign key (ID_VALUTE)
      references VALUTE (ID_VALUTE)
        ,
   constraint FK_KURS_U_V_VALUTE_U__KURSNA_L foreign key (ID_KURSNE_LISTE)
      references KURSNA_LISTA (ID_KURSNE_LISTE)
    
);

/*==============================================================*/
/* Table: UKIDANJE                                              */
/*==============================================================*/
create table UKIDANJE 
(
   ID_UKIDANJA          integer                        not null,
   ID_RACUNA            integer                        not null,
   UK_DATUKIDANJA       date                           not null,
   UK_NARACUN           varchar(20)                    not null,
   constraint PK_UKIDANJE primary key (ID_UKIDANJA),
   constraint FK_UKIDANJE_UKIDANJE__RACUNI_P foreign key (ID_RACUNA)
      references RACUNI_PRAVNIH_LICA (ID_RACUNA)
       
);

create table VIP_KLIJENT (

  ID_KLIJENTA integer not null,
  BL_VIP integer,
  
  constraint BL_VIP_CHECK check (BL_VIP between  0 and 1),
  constraint id_klijenta_pk primary key (ID_KLIJENTA),
  constraint id_klijenta_fk foreign key (ID_KLIJENTA) references  KLIJENT (ID_KLIJENTA)
  );