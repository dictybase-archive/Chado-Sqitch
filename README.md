# Introduction 
* Chado-Sqitch is a project to install and manage chado database schema in postgresql database and more. 
* [Chado](http://gmod.org/wiki/Introduction_to_Chado) is an open-source relational database schema for biological data.
* [Sqitch](http://sqitch.org) is a Perl tool to manage changes in database structure. 
## Why this project ?
* Chado is a generic schema and in highly extensible so that it can be easily
  customized to incorporate various biological data type. This project
  integrates sqitch to painlessly manage and version those changes.
* All changes can be managed without breaking compatibility with core schema changes.
* It deals with schema and database scheme only, completely free of any loader scripts. It is BYOL(bring your own loader) system.
## Extra
It comes with two command line tools ```load``` and ```dump``` to manage postgresql dump along with every versioned changes.

# Use cases
Chado schema is generic and could be used in variety of ways. So, the
application of this project depends on the use case. A few of the cases are
described below. Do consult the scope of this project  before you go ahead.
All commands are expected to be executed from a command line terminal interface.

## Install chado schema only
__Circumstance:__ Simple straight install of chado schema, no management or anything else.

* Download one of the core chado schema from [release](https://github.com/dictyBase/Chado-Sqitch/releases) page. 
* Extract the archive and change to that folder.
* [Install](http://sqitch.org) sqitch.
* Install postgresql database server.  
* Create an user and postgresql database to install chado.

__Example__

```shell
$_> createuser -E -l -U <superuser> gmod
$_> createdb -O gmod -U <superuser> gmod
```

The above commands with create a ```gmod``` user and database.

* Make a new sqitch configuration from the sample.

```$_> cp sqitch.conf.sample sqitch.conf``` 


* Add basic configuration

```shell
$_> sqitch config --user core.pg.client `which psql`
```

* Add database configuration. 

__Example__

It assumes a postgresql server running locally with a
  database, user and password with __gmod__.

```shell
$_> sqitch target add gmod db:pg://gmod:gmod@localhost/gmod
$_> sqitch config core.pg.target gmod
``` 

* Deploy the chado database schema to default database

```$_> sqitch deploy ```


* Deploy to another database

```shell
$_> sqitch target add mymod db:pg://mychado:chado123@localhost/mymod
$_> sqitch deploy -t mymod
```

__Done.__


## Install chado schema and manage database changes
__Circumstance:__ Installation of chado schema for extending and customization.
Also, might need to add other database tables, schemas that is unrelated to chado
but needed to work with software application layer, for example user management tables.


* Install git.
* Clone this repository and switch to that folder.

```shell
$_> git clone https://github.com/dictyBase/Chado-Sqitch
$_> cd Chado-sqitch
```

* Create a new git branch

```shell
$_> git checkout -b mychado
```

* [Install](http://sqitch.org) sqitch.
* Install postgresql database server.  
* Create an user and postgresql database to install chado.

__Example__

```shell
$_> createuser -E -l -U <superuser> gmod
$_> createdb -O gmod -U <superuser> gmod
```

The above commands with create a ```gmod``` user and database.

* Make a new sqitch configuration from the sample.

```$_> cp sqitch.conf.sample sqitch.conf``` 


* Add basic configuration

```shell
$_> sqitch config --user user.name "user name"
$_> sqitch config --user user.email "user email"
$_> sqitch config --user core.pg.client `which psql`
```

* Add database configuration. 

__Example__

It assumes a postgresql server running locally with a
  database, user and password with __gmod__.

```shell
$_> sqitch target add gmod db:pg://gmod:gmod@localhost/gmod
$_> sqitch config core.pg.target gmod
``` 

* Deploy the core chado database schema. By default it will install chado-1.23. 

```$_> sqitch deploy```

To install the previous version, use the particular tag

```$_> sqitch deploy @chado-1.11```

* Once the core chado is installed, any new customization or changes can be
  added using sqitch

### Adding changes


# Scope
* Works only with postgresql database.
* Installation and configuration of postgresql database is beyond the scope of this project.
* Does not create or manage databases or user accounts. Use ```psql``` or postgresql tools for that.


