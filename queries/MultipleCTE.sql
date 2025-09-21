with SalesRep as (
	select
		employeeNumber,
		concat(firstName, ' ', lastName) as salesrepName
	from employees
	where jobTitle = 'Sales Rep'
),
CustomerSalesRep as (
	select
		customerName, salesrepName
	from
		customers
			inner join
		SalesRep on employeeNumber = salesrepEmployeeNumber
)
select *
from CustomerSalesRep
order by customerName;
