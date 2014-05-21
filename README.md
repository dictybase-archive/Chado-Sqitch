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

## Install chado schema only

__Circumstance:__ Straight install of chado schema, no management or anything else.


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

* Deploy the chado database schema 

```$_> sqitch deploy ```

__Done.__


## Install chado schema for versioning
__Circumstance:__ Installation of chado schema for extending and customization.
Also, might need to add other database tables, schemas that is unrelated to chado
but needed to work with software application layer, for example user management tables.

# Scope
* Works only with postgresql database.
* Installation and configuration of postgresql database is beyond the scope of this project.
* Does not create or manage databases or user accounts. Use ```psql``` or postgresql tools for that.


## Developer's guide
It is intended for contributors/developers who wants to add/edit schema changes to this project.
The changes are finally expected to be installed in production environment.

* Install custom perl using either [perlbrew](http://perlbrew.pl/) or [plenv](https://github.com/tokuhirom/plenv). 
  Plenv is recommended.
* Install [cpanm](https://metacpan.org/release/App-cpanminus) using ```perlbrew``` or ```plenv```.
* Install local::lib.

```
$_> cpanm local::lib
```

* Install postgresql database server. If the server is available in a separate box, install the client libraries only. 
* Checkout [Chado-Sqitch](https://github.com/dictyBase/Chado-Sqitch) project.

```$_> git clone https://github.com/dictyBase/Chado-Sqitch```

* For rest of steps switch to the Chado-Sqitch directory.

```$_> cd Chado-Sqitch```

* Install sqitch from source. Preferably install using local::lib.

```shell
$_> eval $(perl -I${PWD}/local/lib/perl5 -I${PWD}/lib -Mlocal::lib=${PWD}/local)
$_> cpanm .
```

* Create an user and postgresql database to install chado.

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

* Add database configuration. It assumes a postgresql server running locally with a
  database, user and password with __gmod__.

```shell
$_> sqitch target add gmod db:pg://gmod:gmod@localhost/gmod
$_> sqitch config core.pg.target gmod
``` 

* Deploy the chado database schema 

```$_> sqitch deploy ```

