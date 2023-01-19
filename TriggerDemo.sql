use korisnici5;

select * from korisnici;
select * from backup;

insert into korisnici values(null, "Predrag", "Nesic");
insert into korisnici values(null, "Isidora", "Nesic");
insert into korisnici values(null, "Marko", "Nesic");

update korisnici set ime = "Jaje" where korisnici_id = 6; 

create trigger checkName before insert on korisnici for each row set new.ime = concat(new.ime, "_test");

delimiter //
create trigger checkName2 before insert on korisnici for each row
	begin
		set new.ime = concat(new.ime, "_dodato");
	end //
delimiter ;

delimiter //
create trigger checkName3 before insert on korisnici for each row
	begin
		if length(new.ime < 20) then
			set new.ime = concat(new.ime, "_kratko");
		end if;
	end //
delimiter ;

delimiter //
create trigger checkName4 before update on korisnici for each row
	begin
		set new.prezime = new.ime;
	end //
delimiter ;

delimiter //
create trigger backup before insert on korisnici for each row
	begin
		insert into backup values(null, new.ime, new.prezime);
	end //
delimiter ;