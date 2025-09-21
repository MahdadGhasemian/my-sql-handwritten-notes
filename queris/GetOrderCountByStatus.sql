DELIMITER //

create procedure GetOrderCountByStatus(
	IN orderStatus varchar(25),
    OUT total int
)
begin
	select count(orderNumber)
    into total
    from orders
    where status = orderStatus;
end //

DELIMITER ;
