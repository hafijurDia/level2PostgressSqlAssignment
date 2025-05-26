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