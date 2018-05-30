This is a demo of a bug in the Fluent Siblings system.

https://github.com/vapor/fluent/issues/500

1. vapor build
2. vapor run
3. load http://localhost:8080/v1/layout/1

You will see that the articles are listed with IDs 2 and 3.

If you inspect the SQLite database, you will see that the article IDs are really 5 and 6.

2 and 3 are the IDs of the references in the pivot table.