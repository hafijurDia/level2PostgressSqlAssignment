## 1. What is PostgreSQL

PostgreSQL is one of the most powerful, object-relational and open source database management system. It is very rubust and support advance data types. Moreover, it supports SQL with offering transactions, concurrency features and support advance queries as well. Its becoming more popular and suitable for small and large projects.

## 2. What is the purpose of a database schema in PostgreSQL?

A database schema is a logical container that holds different objects like tables, views, indexes and functions. It helps organize database objects into logical groups, making it easier to manage and avoid naming conflicts. Schemas support multiple users or applications working within the same database without interfering with each other, by segregating objects into different namespaces.

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

### Primary Key
<ul>
<li>A primary key is a column that uniquely identifies each row in a table</li>
<li>It enforces uniqueness and not null constraints, meaning no two rows can have the same primary key value, and it cannot be null.</li>

</ul>

### Foreign Key
<ul>
<li>A foreign key is a column in one table that references the primary key in another table</li>
<li>It enforces referential integrity, ensuring that the value in the foreign key column exists in the referenced primay key</li>

</ul>

## 4. What is the difference between the VARCHAR and CHAR data types?
The main differences between VARCHAR and CHAR data types in PostgreSQL are related to how they store data and their usage:

### CHAR
<ul>
<li>Fixed-length character data type.</li>
<li>Always reserves space for exactly n characters.</li>
<li>If the actual data is shorter than n, it is padded with spaces to fill the length.</li>
</ul>

### VARCHAR
<ul>
<li>Variable-length character data type</li>
<li>Stores only the actual data length up to n characters.</li>
<li>No padding; it uses only as much space as needed.</li>
</ul>


## 5. Explain the purpose of the WHERE clause in a SELECT statement.

The purpose of the WHERE clause in a SELECT statement is to filter the rows returned from the database, retrieving only those records that meet specific conditions.

<ul>
<li>VIt allows you to specify criteria that must be true for a row to be included in the result set.</li>
<li>Without a WHERE clause, a SELECT statement retrieves all rows from the specified table.
</li>

</ul>
