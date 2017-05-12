create or replace TRIGGER UNOS_DSR_POSLE 
AFTER INSERT ON ANALITIKA_IZVODA 
FOR EACH ROW 
BEGIN
  
  if(:new.vpl_oznaka = 1 ) then
 
   insert into dnevno_stanje_racuna values ( :new.dsr_izvod,glb_upis_dsr.P_duznik.id_racuna, sysdate ,glb_upis_dsr.P_duznik.dsr_prethodno, 0
  
  ,glb_upis_dsr.P_duznik.dsr_nateret,glb_upis_dsr.P_duznik.dsr_novostanje);
  
  else
  
  insert into dnevno_stanje_racuna values ( :new.dsr_izvod,glb_upis_dsr.P_UPLATILAC.id_racuna, sysdate ,glb_upis_dsr.P_UPLATILAC.dsr_prethodno
  
  ,glb_upis_dsr.P_UPLATILAC.dsr_ukorist,0,glb_upis_dsr.P_duznik.dsr_novostanje);
  
  end if;
 
END;