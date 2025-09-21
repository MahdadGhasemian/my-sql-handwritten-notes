-- Drop the trigger
drop trigger if exists BeforeWorkCentersInsert;

-- Creating before insert trigger
DELIMITER //

create trigger BeforeWorkCentersInsert
before insert
on WorkCenters for each row
begin
	declare rowcount int;
    
    select count(*)
    into rowcount
    from WorkCenterStats;
    
    if rowcount > 0 then
		update WorkCenterStats
        set totalCapacity = totalCapacity + NEW.capacity;
    else
		insert into WorkCenterStats(totalCapacity)
        values(NEW.capacity);
    end if;
end //

DELIMITER ;