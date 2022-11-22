Follow this Design Recipe to design the schema for a single table. The outline is:

 - List all the nouns from the specification or user stories.
 - Decide whether a noun is a record (the table name) or a property of it (a column).
 - Decide the column types.
 - Write the SQL to create the table.

Then create the databse.
> psql -h 127.0.0.1 database_name < albums_table.sql