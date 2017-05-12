create or replace TRIGGER PRE_UKIDANJE 
BEFORE INSERT ON UKIDANJE 
FOR EACH ROW 
declare

V_nesto number;
V_racun varchar2(30);
BEGIN
  
  
   select dsr_novostanje into glb_ukidanje.P_iznos from dnevno_stanje_racuna where 
  dsr_izvod = (select max(dsr_izvod) from dnevno_stanje_racuna where id_racuna = :new.id_racuna);
  
     glb_ukidanje.P_racun := :new.uk_naracun; 
     
    GLB_UKIDANJE.KREIRANJE_RACUNA(:new.id_racuna, glb_ukidanje.P_UKIDR);
    
    
   select ime into glb_ukidanje.P_IMED from klijent where id_klijenta =
    (select id_klijenta from racuni_pravnih_lica where id_racuna = :new.id_racuna);
    
    
    
    GLB_UPIS_DSR.IZVOD_PARSIRANJE(:new.uk_naracun, V_racun, V_nesto);
    
    
       dbms_output.put_line(V_racun); 
    
   select ime into glb_ukidanje.P_IMEP from klijent where id_klijenta =
    (select id_klijenta from racuni_pravnih_lica where id_racuna = V_RACUN);
    
    dbms_output.put_line(glb_ukidanje.P_IMED);  
  
END;