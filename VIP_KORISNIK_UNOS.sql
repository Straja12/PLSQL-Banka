create or replace PROCEDURE VIP_KORISNIK_UNOS AS 


  type R_table is record (
    stanje number,
    id_klijent number,
    frenk_izvoda number,
    dat_otvaranja date
    );

   type T_table is table of R_table index by binary_integer;

  V_table T_table;
  
  V_stanje number;
  V_stanje2 number:=0;
  V_frenk_izvoda number;
  V_dat_otvaranja date;
  V_broj_prenetih number;
  
  i integer:=0;
  j integer :=0;
  
  
  
  

BEGIN
  
  
  
  for rec in (select * from klijent) loop
    
    V_table(i).id_klijent := rec.id_klijenta;
    V_table(i).dat_otvaranja := sysdate;
    V_table(i).frenk_izvoda :=0;
    V_table(i).stanje :=0;
  
    for rec2 in (select * from racuni_pravnih_lica where id_klijenta = rec.id_klijenta) loop
    
        if( rec2.bar_datotv < V_table(i).dat_otvaranja) then
          V_table(i).dat_otvaranja := rec2.bar_datotv;
        end if;
          
        
        select count(dsr_izvod) into V_frenk_izvoda from dnevno_stanje_racuna where id_racuna = rec2.id_racuna;
        V_table(i).frenk_izvoda := V_table(i).frenk_izvoda + V_frenk_izvoda;
       
    
        select dsr_novostanje into V_stanje from dnevno_stanje_racuna where dsr_izvod =
        (select max(dsr_izvod) from dnevno_stanje_racuna where id_racuna = rec2.id_racuna);
        
        V_stanje2 := V_stanje2 + V_stanje;
        
        V_table(i).stanje := V_table(i).stanje + V_stanje;
        
    
    end loop;
    
    i := i+1;
    
  end loop;
  

i := V_table.first;

while i <= V_table.last loop
  
  select count(*) into j from Vip_klijent;
  
  /*if( i <= j) then 
  
  if(V_table(i).stanje > 3000 and V_table(i).frenk_izvoda >= 2 and V_table(i).dat_otvaranja > '1-jan-2015') then
    dbms_output.put_line(V_table(i).id_klijent|| 'Moze da postane VIP');
    update Vip_klijent set 
   
    bl_vip = 1
    where   
    id_klijenta = V_table(i).id_klijent; 
    
  else
  dbms_output.put_line(V_table(i).id_klijent || 'NE Moze da postane VIP');
     update Vip_klijent set 
    bl_vip =0
    where   
    id_klijenta = V_table(i).id_klijent; 
  end if; 
  
  else */
  if(V_table(i).stanje > 3000 and V_table(i).frenk_izvoda >= 2 and V_table(i).dat_otvaranja > '1-jan-2015') then
    dbms_output.put_line(V_table(i).id_klijent|| 'Moze da postane VIP');
    insert into Vip_klijent values (V_table(i).id_klijent , 1);
  else
  dbms_output.put_line(V_table(i).id_klijent || 'NE Moze da postane VIP');
     insert into Vip_klijent values (V_table(i).id_klijent , 0);
  end if;
 -- end if;
  i:= V_table.next(i);
end loop;




      
       
      
  
  
END VIP_KORISNIK_UNOS;