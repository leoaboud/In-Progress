delimiter //
create	procedure proc_tabuada_r_t(tabuada int)
	begin
		declare contador  int default 0;
        declare resultado int default 0;
        create temporary table temp_tab (res varchar(50));