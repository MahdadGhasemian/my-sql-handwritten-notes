with recursive EmployeeHierarchy as (
    -- Anchor
	select
		employee_id,
        employee_name,
        manager_id,
        0 as level
	from
		employees_2
	where
		manager_id is null -- Anchor member (root of the hierarchy)
        
	union all
    
    select
		e.employee_id,
        e.employee_name,
        e.manager_id,
        eh.level + 1
	from
		employees_2 e
	inner join
		EmployeeHierarchy eh on e.manager_id = eh.employee_id -- Recursive member
)
-- Final query to select from the CTE
select
	employee_id,
    employee_name,
    manager_id,
    level
from
	EmployeeHierarchy
order by
	level, employee_id;