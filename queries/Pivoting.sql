CREATE TABLE sales (
    product VARCHAR(50),
    region VARCHAR(50),
    amount INT
);

-- Insert some data
INSERT INTO sales VALUES ('Laptop', 'North', 1000);
INSERT INTO sales VALUES ('Laptop', 'South', 1200);
INSERT INTO sales VALUES ('Desktop', 'North', 800);
INSERT INTO sales VALUES ('Desktop', 'South', 900);
INSERT INTO sales VALUES ('Tablet', 'North', 500);
INSERT INTO sales VALUES ('Tablet', 'South', 600);

-- Read table normally
select * from sales;

-- Pivoting Sales data by Region
select
	product Products,
    sum(case when region = 'North' then amount else 0 end) as North,
    sum(case when region = 'South' then amount else 0 end) as South
from
	sales
group by
	product;
