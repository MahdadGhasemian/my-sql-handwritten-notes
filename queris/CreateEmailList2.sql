DELIMITER //

create procedure CreateEmailList2(
	out email_list text
)
begin
	select group_concat(email separator ';')
    into email_list
    from employees;
end //

DELIMITER ;