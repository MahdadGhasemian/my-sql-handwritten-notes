-- Define a view
create view CustomerPaymentsView
as
select
	customerName,
    checkNumber,
    paymentDate,
    amount
from
	customers
inner join
	payments using (customerNumber);
    
-- Call it
select * from CustomerPaymentsView;