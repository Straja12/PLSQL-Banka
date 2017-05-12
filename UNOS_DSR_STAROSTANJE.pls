create or replace TRIGGER UNOS_DSR_STAROSTANJE 
BEFORE INSERT ON ANALITIKA_IZVODA 
FOR EACH ROW
declare

  V_racun_duz  analitika_izvoda.asi_racduz%type;
  V_racun_pov  analitika_izvoda.asi_racduz%type;
  
  V_greska number;
  
  V_vazi number;
  
  
  
  V_prethodno dnevno_stanje_racuna.dsr_prethodno%type;
  V_nateret dnevno_stanje_racuna.dsr_prethodno%type;
  
 exc9 exception; 
 exc3 exception; 
 exc2 exception;
 
BEGIN
  
if(:new.asi_mododob != 97) then
  raise exc2;
end if;
 
 

  if( :new.vpl_oznaka = 1) then
  GLB_UPIS_DSR.IZVOD_PARSIRANJE( :NEW.asi_racduz,V_racun_duz ,V_greska );
  
  select bar_vazi into v_vazi from RACUNI_PRAVNIH_LICA where
  id_racuna = V_racun_duz;
  
  if (v_vazi = 0) then
    raise exc9;
  end if;
  

  dbms_output.put_line(V_racun_duz);
 
 
 select dsr_novostanje into V_prethodno from dnevno_stanje_racuna where 
  dsr_izvod = (select max(dsr_izvod) from dnevno_stanje_racuna where id_racuna = V_racun_duz);
    
     
     glb_upis_dsr.P_duznik.id_racuna := V_racun_duz;
     
     V_nateret := :new.asi_iznos; 
     
   glb_upis_dsr.P_duznik.dsr_prethodno := V_prethodno;
   glb_upis_dsr.P_duznik.dsr_NATERET   := to_number( :NEW.ASI_IZNOS); 
   glb_upis_dsr.P_duznik.dsr_novostanje := V_prethodno - V_nateret ;
   
   if ( glb_upis_dsr.P_duznik.dsr_novostanje < 0) then
    V_greska := 3;
    raise exc3;
    
   end if;
  
  
 

else
GLB_UPIS_DSR.IZVOD_PARSIRANJE( :NEW.asi_racpov,V_racun_pov ,V_greska );
  
 select dsr_novostanje into V_prethodno from dnevno_stanje_racuna where 
  dsr_izvod = (select max(dsr_izvod) from dnevno_stanje_racuna where id_racuna = V_racun_pov);
    
     
      glb_upis_dsr.P_UPLATILAC.id_racuna := V_racun_pov;
     
     V_nateret := :new.asi_iznos;
     
     
    
   glb_upis_dsr.P_UPLATILAC.dsr_prethodno := V_prethodno;
   glb_upis_dsr.P_UPLATILAC.dsr_ukorist   := to_number( :NEW.ASI_IZNOS); 
   glb_upis_dsr.P_duznik.dsr_novostanje := V_prethodno + V_nateret ;
end if;



 :NEW.asi_tipgreske := V_greska;
 
exception
  when exc3 then 
    raise_application_error(-20000,'nelikvidnost racuna duznika');
  when exc2 then
    raise_application_error(-20000,'moduo nije 97!');
  when exc9 then
    raise_application_error(-20000,'RACUN JE DEAKTIVIRAN');
      
  
END;