create or replace TRIGGER CISCENJE_UKIDANJE 
BEFORE INSERT ON UKIDANJE
BEGIN
 
 glb_ukidanje.P_IZNOS :=0;
 glb_ukidanje.P_RACUN := '0';
 glb_ukidanje.P_UKIDR := '0';
 
 glb_ukidanje.P_IMED := '';
 glb_ukidanje.P_IMEP := 'banka';
 
END;