create or replace TRIGGER ukidanje_posle 
AFTER INSERT ON UKIDANJE 
FOR EACH ROW 
BEGIN
  
  
  
  
  
    
/*insert into ANALITIKA_IZVODA (ASI_BROJSTAVKE, DSR_IZVOD, VPL_OZNAKA,
ASI_DUZNIK, ASI_SVRHA,
ASI_POVERILAC, ASI_DATPRI, ASI_DATVAL,
ASI_RACDUZ ,ASI_MODODOB, ASI_HITNO, ASI_IZNOS,
ASI_TIPGRESKE) values ( seq_ASI.nextval, seq_DRS.nextval , 1,
'pera','dug',
'banka', sysdate,sysdate, GLB_UKIDANJE.p_ukidr,97, 1, glb_ukidanje.p_iznos ,1); */


/*insert into ANALITIKA_IZVODA (ASI_BROJSTAVKE, DSR_IZVOD, VPL_OZNAKA,
ASI_DUZNIK, ASI_SVRHA,
ASI_POVERILAC, ASI_DATPRI, ASI_DATVAL,
ASI_RACDUZ ,ASI_MODODOB, ASI_HITNO, ASI_IZNOS,
ASI_TIPGRESKE) values ( seq_ASI.nextval, seq_DRS.nextval , 2,
'pera','dug',
'banka', sysdate,sysdate, :new.uk_naracun,97, 1, glb_ukidanje.p_iznos ,1);
*/
                            
insert into ANALITIKA_IZVODA (ASI_BROJSTAVKE, DSR_IZVOD, VPL_OZNAKA,
                              ASI_DUZNIK, ASI_SVRHA, 
                              ASI_POVERILAC, ASI_DATPRI, ASI_DATVAL,
                              ASI_RACDUZ, ASI_MODZAD,
                              ASI_RACPOV, ASI_MODODOB,
                              ASI_HITNO, ASI_IZNOS, ASI_TIPGRESKE
                              ) values 
                              
                              ( seq_ASI.nextval,  seq_DRS.nextval, 1,
                                glb_ukidanje.P_imed, 'dug',
                                glb_ukidanje.P_imeP, sysdate,sysdate,
                                glb_ukidanje.p_ukidr, 97,
                                :new.uk_naracun,97,
                                1, glb_ukidanje.p_iznos,1);




                            
insert into ANALITIKA_IZVODA (ASI_BROJSTAVKE, DSR_IZVOD, VPL_OZNAKA,
                              ASI_DUZNIK, ASI_SVRHA, 
                              ASI_POVERILAC, ASI_DATPRI, ASI_DATVAL,
                              ASI_RACDUZ, ASI_MODZAD,
                              ASI_RACPOV, ASI_MODODOB,
                              ASI_HITNO, ASI_IZNOS, ASI_TIPGRESKE
                              ) values 
                              
                              ( seq_ASI.nextval,  seq_DRS.nextval, 2,
                                 glb_ukidanje.P_imed, 'uplata',
                                glb_ukidanje.P_imeP, sysdate,sysdate,
                                glb_ukidanje.p_ukidr, 97,
                                :new.uk_naracun,97,
                                1, glb_ukidanje.p_iznos,1);
                                
                              

 

update racuni_pravnih_lica set
    bar_vazi = 0 where
    id_racuna = :new.id_racuna;
  
   
END;