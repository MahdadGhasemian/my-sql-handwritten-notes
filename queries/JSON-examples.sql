-- Creating a table with json column
create table products_2(
	id int auto_increment primary key,
    name varchar(255) not null,
    price decimal(10,2) not null,
    properties json
);

-- Adding a json data
insert into products_2(name, price, properties)
values('T-Shirt', 25.99, '{"sizes":["S","M","L","XL"], "colors": ["white","black"]}');

-- If the output is difficult to read, you can use the `json_pretty()` to format it:
select
	name, json_pretty(properties)
from products_2;

-- Getting the key of json document
select json_keys(properties)
from products_2;

-- Extracting data  from a JSON document
select json_extract(properties, '$.sizes[2]')
from products_2;
