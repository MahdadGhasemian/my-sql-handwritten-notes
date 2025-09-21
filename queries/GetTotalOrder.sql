DELIMITER //

create procedure GetTotalOrder()
begin
	declare totalOrder int default 0;
    
    select count(*)
	into totalOrder
    from orders;
	
    select totalOrder;
end //

DELIMITER ;
