with TopSales2003CTE as (
	select
		salesRepEmployeeNumber employeeNumber,
        sum(quantityOrdered * priceEach) sales
	from
		orders
			inner join
		orderdetails using (orderNumber)
			inner join
		customers using (customerNumber)
	where
		year(shippedDate) = 2003 and status = 'Shipped'
	group by salesRepEmployeeNumber
    order by sales desc
    limit 5
)
select
	employeeNumber,
    firstName,
    lastName,
    sales
from
	employees
		join
	TopSales2003CTE using (employeeNumber);