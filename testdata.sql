


insert into VRSTE_PLACANJA (VPL_OZNAKA, VPL_NAZIV) values (1, 'NA teret dug');

insert into VRSTE_PLACANJA (VPL_OZNAKA, VPL_NAZIV) values (2, 'u korist dobijanje');





insert into BANKA (ID_BANKE, SIFRA_BANKE, PR_PIB, PR_NAZIV, PR_ADRESA, PR_EMAIL, PR_WEB, PR_TELEFON, PR_FAX, PR_BANKA) values (111, '111', '1000100011', 'INTEZA', 'NEGDE', 'inteza AT gmail', 'inteza dot kom', '655555', 'LOL', 1);

insert into BANKA (ID_BANKE, SIFRA_BANKE, PR_PIB, PR_NAZIV, PR_ADRESA, PR_EMAIL, PR_WEB, PR_TELEFON, PR_FAX, PR_BANKA) values (222, '222', '1234567891', 'HIPO', ' Beograd 23', ' HIPO AT gmail  ', ' hipo dot kom  ', '123 456', 'lol2', 1);

insert into DRZAVA (DR_SIFRA, DR_NAZIV) values (15, 'SRBIJA');

insert into DRZAVA (DR_SIFRA, DR_NAZIV) values (20, 'AMERIKA');

insert into DRZAVA (DR_SIFRA, DR_NAZIV) values (25, 'SVEDSKA');



insert into KLIJENT (ID_KLIJENTA, TIP_KLIJENTA, JMBG, PREZIME, IME, ADRESA, TELEFON, PIB, NAZIV_FIRME) values (10, 'P', '12345678912', 'PERIC', 'PERA', 'sin 32', '123 654', '5679992222', 'GORENJE');

insert into KLIJENT (ID_KLIJENTA, TIP_KLIJENTA, JMBG, PREZIME, IME, ADRESA, TELEFON, PIB, NAZIV_FIRME) values (20, 'K', '12345678911', 'MITROVIC', 'MIRA', 'nesto 11', '331 555', '5679992221', 'IRSISH PUB');

insert into VALUTE (ID_VALUTE, DR_SIFRA, VA_IFRA, VA_NAZIV, VA_DOMICILNA) values (1, 15, '15', 'SRB', 1);

insert into VALUTE (ID_VALUTE, DR_SIFRA, VA_IFRA, VA_NAZIV, VA_DOMICILNA) values (2, 20, '20', 'USA', 0);

insert into VALUTE (ID_VALUTE, DR_SIFRA, VA_IFRA, VA_NAZIV, VA_DOMICILNA) values (3, 25, '25', 'SVE', 0);



insert into NASELJENO_MESTO (NM_SIFRA, DR_SIFRA, NM_NAZIV, NM_PTTOZNAKA) values (1, 15, 'NOVI SAD', '21000');

insert into NASELJENO_MESTO (NM_SIFRA, DR_SIFRA, NM_NAZIV, NM_PTTOZNAKA) values (2, 20, 'BOSTON', '13000');

insert into KURSNA_LISTA (ID_KURSNE_LISTE, ID_BANKE, KL_DATUM, KL_BROJ, KL_DATPR) values (KURS_INC.nextval, 111, sysdate, 1, sysdate);

insert into KURS_U_VALUTI (ID_KURSNE_LISTE, ID_VALUTE, VAL_ID_VALUTE, KLS_KUPOVNI, KLS_SREDNJI, KLS_PRODAJNI) values (kurs_inc.currval, 2, 1, 110, 115, 120);

insert into KURS_U_VALUTI (ID_KURSNE_LISTE, ID_VALUTE, VAL_ID_VALUTE, KLS_KUPOVNI, KLS_SREDNJI, KLS_PRODAJNI) values (kurs_inc.currval, 3, 1, 150, 160, 170);	

insert into KURSNA_LISTA (ID_KURSNE_LISTE, ID_BANKE, KL_DATUM, KL_BROJ, KL_DATPR) values (KURS_INC.nextval, 222, sysdate, 0, sysdate);

insert into KURS_U_VALUTI (ID_KURSNE_LISTE, ID_VALUTE, VAL_ID_VALUTE, KLS_KUPOVNI, KLS_SREDNJI, KLS_PRODAJNI) values (kurs_inc.currval, 2, 1, 109, 115, 121);




insert into RACUNI_PRAVNIH_LICA (ID_RACUNA, ID_BANKE, ID_VALUTE, ID_KLIJENTA, BAR_RACUN, BAR_DATOTV, BAR_VAZI) values (150150, 111, 1, 10, '150150', sysdate, 1);

insert into RACUNI_PRAVNIH_LICA (ID_RACUNA, ID_BANKE, ID_VALUTE, ID_KLIJENTA, BAR_RACUN, BAR_DATOTV, BAR_VAZI) values (200200, 111, 1, 20, '200200', sysdate, 1);




insert into DNEVNO_STANJE_RACUNA (DSR_IZVOD, ID_RACUNA, DSR_DATUM, DSR_PRETHODNO, DSR_UKORIST, DSR_NATERET, DSR_NOVOSTANJE) values (1, 150150, sysdate, 0, 10000, 0, 10000);

insert into DNEVNO_STANJE_RACUNA (DSR_IZVOD, ID_RACUNA, DSR_DATUM, DSR_PRETHODNO, DSR_UKORIST, DSR_NATERET, DSR_NOVOSTANJE) values (2, 150150, sysdate, 10000, 0, 3000, 7000);

insert into DNEVNO_STANJE_RACUNA (DSR_IZVOD, ID_RACUNA, DSR_DATUM, DSR_PRETHODNO, DSR_UKORIST, DSR_NATERET, DSR_NOVOSTANJE) values (3, 200200, sysdate, 0, 90000, 0, 90000);


--insert into ANALITIKA_IZVODA (ASI_BROJSTAVKE, DSR_IZVOD, VPL_OZNAKA, NM_SIFRA, ID_VALUTE, ASI_DUZNIK, ASI_SVRHA, ASI_POVERILAC, ASI_DATPRI, ASI_DATVAL, ASI_RACDUZ, ASI_MODZAD, ASI_PBZAD, ASI_RACPOV, ASI_MODODOB, ASI_PBODO, ASI_HITNO, ASI_IZNOS, ASI_TIPGRESKE, ASI_STATUS) values (1, 0, 0, 1, 0, 'KAX6XPQA5GPBLQTV0MFJD0MFJM51OXW7Y33JA1F7LE09OSYWH4K NY33SAT9 EGVP2VP6WTWA8PIH7GFE9 TU1M0TT3Q6D4JK9CRKQ E6B74TQDR8TNHVMFUWRSEL1IKT4CHGT8 T9NYL1WA0XB1SYYGS EXMJJF7LG9TD6189YEONOKA8F8K8 STS9JOUFQ3X35QJQ40RUM02HC5PBGBHK0TXH87VNCASFX9B2 9QSCJNHG8P0S2P D5HXJNI 6', 'RS9RFM36Y0HYR3KL9T2C631G521WQ7XV2M1C39Y2VAD8UE4WBFIU74FUL KLJH7W5E019L6VKXCQQTSIFQ2CBNRWKIMQJAKY8QPIEI86HQ93RL26L15R0KPTULIUM95X3LGYYS0QNWSMAVQUD 1NSM9WQN9 N2DQ CDBH7LEM0DAQRVKSNOB4HOM0HO I7YKRRE5HCEAG38NG6TIFJWLMPHM0CD863TPQ14PKQ3KSJB0 154GK81VSIPNTRVM1BM', '3 52M1P5C8MKVFC4 6G13LSWGNU8B41 3UCV J9BKA5YFQNW6FFKFLHPQPXBSR2L DLBAE2NTW91F9P6X0OHOOEB7EF6IW5BQX4SQAEGCJL7X1QF WGG2G MEGE30 6QT71AJSU8V7KH2Y9DKKOTTGYQB0MV ECKAD8G BANR9CLYU3RIS5K72CUJNN31D2PRXAMD9VHTFWWSFBL6UDCLLFC6CUWW4379TPR0W0QDW ESAC0EDOG9BRSUFC69PGA', '1-1-1', '953-2-7', 'F9KG26HW415FKB70MT', 1, 'RVG18L194AXN B8H6 TY', 'JBY9B9X3X8TJJKJM8S', 1, 'KHXJT2V8JLXYM 3KCRYY', 0, 0, 3, 'E');

--iNsert into ANALITIKA_IZVODA (ASI_BROJSTAVKE, DSR_IZVOD, VPL_OZNAKA, NM_SIFRA, ID_VALUTE, ASI_DUZNIK, ASI_SVRHA, ASI_POVERILAC, ASI_DATPRI, ASI_DATVAL, ASI_RACDUZ, ASI_MODZAD, ASI_PBZAD, ASI_RACPOV, ASI_MODODOB, ASI_PBODO, ASI_HITNO, ASI_IZNOS, ASI_TIPGRESKE, ASI_STATUS) values (0, 1, 1, 1, 1, '7BFXHNNFMG408O3YO2EX0SUDR0BRKFGCR0S7LD7JAOUO5CY15 279I1K2E2RGBE4ER2GP7SGXJU3CR21V2GO KRQ12D4VPFX3VJ02TOJSLPNVWOHKDR0GJES6OB2G0GCC4BWVRGANRUDUOB0K9XJV PTJFMGTNL37L8REH BSFF FXSFMMPAIAP1NWXTMVC48TYXYDGH2CGUTC7Q3ONUQSNTL JCKTFEJSWEUP8QTOMY6JW0U12JTO5Q24LVCLU7', 'UT3TCRNMR8GAS3UXG01XI3UTBYYLUBXWH1H2EUB 1C61D11KMKG14XV1Y5YVV1IBL5BNG5LBUJTIBH7XPDDYHGAN0AHPS95SNYFD7WAHVVIL6X4 XXHT8T 1JL0UOX9FNODSC2IGFR5TKQSX26AH508T0QVNOXIG6YI1OOLEA2GE5AJ2EF0G1XIPIQ45Y U89U0X K7MS3T6LQYUTGOUOEMKN3M1PTHCIQRX3I9LSGJPM8WXND5GW6MGKO0O4Y I', '2II7U7 WO9M4YUJ2TQYSLVWLVRP0HX3JMEPJ58VCE W8DGC7PJJWO11AS0VQ33XIB3NDX2OVDHXKNX FC31M13Y20JJ58RTJXNCR34GIM339O1G166DCPEVLTUF894E PIOIOOKLMHJ2AE3E9 A6M89Q T4KLBMCEL91N0LGGS8GCLE343ATUQVETRWHLCO8D6FD25HNPHUKU38UUINPG0QR6EWWQ41HHYE917CXGJV4OARI3LFVH 64EU0EGGH0', '1001-12-30', '1-1-1', '60S9LE6UMC7VOP3EX3', 0, '1OWFDDQPM7LP73SN5ACT', '8ST9NXCKOKOEMCOKJ3', 0, 'LH OH998HD2EBR85TLGY', 0, 1, 8, 'P');







	insert into ANALITIKA_IZVODA (ASI_BROJSTAVKE, DSR_IZVOD, VPL_OZNAKA,

ASI_DUZNIK, ASI_SVRHA,
ASI_POVERILAC, ASI_DATPRI, ASI_DATVAL,
ASI_RACDUZ ,ASI_MODODOB, ASI_HITNO, ASI_IZNOS,
ASI_TIPGRESKE) values ( seq_asi.nextval, seq_drs.nextval , 1,
'pera','dug',
'banka', sysdate,sysdate, '111-150150-85',97, 1, 2000 ,1);

insert into ANALITIKA_IZVODA (ASI_BROJSTAVKE, DSR_IZVOD, VPL_OZNAKA,

ASI_DUZNIK, ASI_SVRHA,
ASI_POVERILAC, ASI_DATPRI, ASI_DATVAL,
ASI_RACDUZ ,ASI_MODODOB, ASI_HITNO, ASI_IZNOS,
ASI_TIPGRESKE) values ( 10, 3 , 1,
'pera','dug',
'banka', sysdate,sysdate, '111-154150-85',97, 1, 2000 ,1);

insert into ANALITIKA_IZVODA (ASI_BROJSTAVKE, DSR_IZVOD, VPL_OZNAKA,

ASI_DUZNIK, ASI_SVRHA,
ASI_POVERILAC, ASI_DATPRI, ASI_DATVAL,
ASI_RACDUZ ,ASI_MODODOB, ASI_HITNO, ASI_IZNOS,
ASI_TIPGRESKE) values ( 10, 3 , 1,
'pera','dug',
'banka', sysdate,sysdate, '111-154150-85',98, 1, 2000 ,1);

insert into ANALITIKA_IZVODA (ASI_BROJSTAVKE, DSR_IZVOD, VPL_OZNAKA,
                              ASI_DUZNIK, ASI_SVRHA, 
                              ASI_POVERILAC, ASI_DATPRI, ASI_DATVAL,
                              ASI_RACDUZ, ASI_MODZAD,
                              ASI_RACPOV, ASI_MODODOB,
                              ASI_HITNO, ASI_IZNOS, ASI_TIPGRESKE
                              ) values 
                              
                              ( seq_ASI.nextval,  seq_DRS.nextval, 2,
                                 'Mitar', 'uplata',
                                'BANKA1', sysdate,sysdate,
                                '111-150150-85', 97,
                                '111-200200-44',97,
                                1, 3000,1);

insert into ukidanje values (1,150150,sysdate,'111-200200-94');

begin

VIP_korisnik_unos;

end;

declare

  P_kursevi kop_kursne.T_kurs;

  i integer := 0;
begin

  P_kursevi(0).valuta := 3;
  P_kursevi(0).os_valuta :=1;
  P_kursevi(0).kupovni := 153;
  P_kursevi(0).sredni := 200;
  P_kursevi(0).prodajni := 230;
  
  
  kop_kursne.kopija_kursne_liste(P_kursevi,111);
   
 
end;







