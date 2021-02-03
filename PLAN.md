The rake db:setup command, which in turn calls the rake db:schema:load command, uses this schema file to create the structure of our database from scratch. This is more efficient and reliable than running all the migrations from start to finish. However, database migrations are still needed for future changes to the database schema.

bin/rake routes

The keyword 'raise' allows you to throw an error anywhere (good for debugging)