-- Create a trigger in order to update item_changes table
DELIMITER //

create trigger UpdateItemsTrigger
after update
on items
for each row
begin
	insert into item_changes (item_id, change_type)
    values (NEW.id, 'UPDATE');
end //

DELIMITER ;