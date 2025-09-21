DELIMITER //

create procedure GetCustomerLevel(
	in customerNo int,
    out customerLevel varchar(20)
)
begin
	declare credit dec(10,2) default 0;
    
    -- get creadit limit of a customer
    select
		creditLimit
	into credit
    from customers
    where
		customerNumber = customerNo;
	
    -- call the function
    set customerLevel = fncCustomerLevel(credit);
end //

DELIMITER ;
