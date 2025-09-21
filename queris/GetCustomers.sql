DELIMITER $$

create procedure GetCustomers()
begin
	select
		customerName,
		city,
		state,
		postalCode,
		country
	from
		customers
	order by customerName;
end$$

DELIMITER ;