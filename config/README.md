Configuration files README
======

Here are somme comments on how to configure your system in order to make this application work

database.yml
------

This file depends on environment variables, you must define those variables:

````
$ echo "export USERNAME=username" >> ~/.profile
$ echo "export PASSWORD=password" >> ~/.profile
$ source ~/.profile
````

Remember to start the postgresql service in order to allow the database to work:

````
$ sudo service postgresql start
````

Create the roles accordingly to your variables

````
$ sudo sudo -u postgres psql
postgres=# CREATE USER username SUPERUSER PASSWORD 'password';
postgres=# \q
````

Once this is done, you can create and/or migrate the database accordingly

````
$ rake db:create
$ rake db:migrate
````