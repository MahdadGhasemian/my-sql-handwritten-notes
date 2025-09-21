DELIMITER //

create procedure GetOfficeByCountry(
	IN countryName varchar(255)
)
begin
	select *
    from offices
    where country = countryName;
end //

DELIMITER ;
