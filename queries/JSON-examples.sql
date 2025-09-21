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

-- Creating a JSON array
select
    JSON_ARRAY('John','Doe', 25, 'MySQL Developer');

-- Creating a JSON array from table data
select
	json_array(employeeNumber, firstName, email, jobTitle)
from
	employees
where
	employeeNumber in (1002, 1102, 1056);
    
-- Storing JSON arrays into a table
create table contacts_2(
	employeeNumber int primary key,
    data json
);

insert into contacts_2(employeeNumber, data)
select
	employeeNumber,
    json_array(firstName, extension, email)
from
	employees;

select * from contacts_2;

-- JSON object , allow you to make an object from a key-value array
select json_object('name', 'John', 'age', 30);

SELECT 
  JSON_PRETTY(
    JSON_OBJECT(
      'name', 
      'John', 
      'age', 
      30, 
      'phones', 
      JSON_OBJECT(
        'home', '408-999-9999', 'work', '408-111-2222'
      )
    )
  ) data;
  
-- Creating JSON objects dynamically
select
	json_object(
		'first-name', firstName, 'user-email', email
    ) result
from
	employees;

select
	json_object("name", "John", "age", 25, "username", "John");
    
select
	json_search(
		'{"name": "John", "age": 25, "username": "John"}',
        'one',
        'John'
    ) path;

select
	json_search(
		'{"name": "John", "age": 25, "username": "John"}',
        'all',
        'John'
    ) path;

select
	json_search(
		'{"name": "john", "age": 25, "username": "john@test.com"}',
        'all',
        'john%'
    ) path;

SELECT 
  JSON_SEARCH(
    '[{"name": "Joe", "age": 25, "salary":"100_000"},
      {"name": "Doe", "age": 27, "salary":"120_000"}]', 
    'all', 
    '%oe'
  ) path;

SELECT 
  JSON_EXTRACT(
    '{"name":"John","age":25,"job":"MySQL Developer"}', 
    "$.age"
  ) age;

SELECT 
  JSON_EXTRACT(
    '{"name":"John","age":25,"job":"MySQL Developer"}', 
    "$.*"
  ) data;
  
SELECT 
  JSON_CONTAINS_PATH(
    '{"a": 1, "b": 2, "c": {"d": 4}}', 
    'one', '$.a'
  ) result;

SELECT 
  JSON_CONTAINS_PATH(
    '{"a": 1, "b": 2, "c": {"d": 4}}', 
    'one', '$.c.d'
  ) result;
    