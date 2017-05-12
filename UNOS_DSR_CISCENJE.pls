create or replace TRIGGER UNOS_DSR_CISCENJE 
BEFORE INSERT ON ANALITIKA_IZVODA 
BEGIN
  
  GLB_UPIS_DSR.P_duznik.dsr_izvod := 0;
  GLB_UPIS_DSR.P_duznik.id_racuna := 0;
  GLB_UPIS_DSR.P_duznik.dsr_datum := sysdate;
  GLB_UPIS_DSR.P_duznik.dsr_prethodno := 0;
  GLB_UPIS_DSR.P_duznik.dsr_ukorist := 0;
  GLB_UPIS_DSR.P_duznik.dsr_nateret := 0;
  GLB_UPIS_DSR.P_duznik.dsr_novostanje :=0;
  
  GLB_UPIS_DSR.P_UPLATILAC.dsr_izvod := 0;
  GLB_UPIS_DSR.P_UPLATILAC.id_racuna := 0;
  GLB_UPIS_DSR.P_UPLATILAC.dsr_datum := sysdate;
  GLB_UPIS_DSR.P_UPLATILAC.dsr_prethodno := 0;
  GLB_UPIS_DSR.P_UPLATILAC.dsr_ukorist := 0;
  GLB_UPIS_DSR.P_UPLATILAC.dsr_nateret := 0;
  GLB_UPIS_DSR.P_UPLATILAC.dsr_novostanje :=0;
  
  
  
END;