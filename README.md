# What is Chado-Sqitch ? 
Chado-Sqitch is a project to manage changes in [chado](http://gmod.org/wiki/Introduction_to_Chado) database, an open-source relational database schema for biological
datasets. It uses [Sqitch](http://sqitch.org), to implement the database change management. It also provides two optional ```sqitch``` commands, ```dump``` and ```load``` that
backup and restore database content for every database change.

[![Build Status](https://secure.travis-ci.org/dictyBase/Chado-Sqitch.png)](https://travis-ci.org/dictyBase/Chado-Sqitch) 

# Getting started
## Assumption
It is an opinionated project and therefore comes with few configured conventions.

* Works only with postgresql database.
* Installation and configuration of postgresql database is beyond the scope of this project.
* Does not create or manage databases or user accounts. Use ```psql``` or postgresql tools for that.
* By default, only install the core tables. Views, functions and extra schemas are excluded. However, they could be easily added as  new changes as neccessary.
* This is not intended for starting with a fresh chado schema installation. For existing  chado schema, please fork this project and use
  this as a starting point. For that, a better understanding of sqitch commands are necessary. If forking does not work, start a new
  project with sqitch as use this as an example or for practice.



## Quick start
The instuctions are more or less for playing around and to get a feel of the project.

* [Install](http://sqitch.org) sqitch.
* Install postgresql database server.  
* Create an user and postgresql database to install chado.

```shell
$_> createuser -E -l -U <superuser> gmod
$_> createdb -O gmod -U <superuser> gmod
```

The above commands with create a ```gmod``` user and database.

* Checkout [Chado-Sqitch](https://github.com/dictyBase/Chado-Sqitch) project.

```$_> git clone https://github.com/dictyBase/Chado-Sqitch```

* For rest of steps switch to the Chado-Sqitch directory.

```$_> cd Chado-Sqitch```

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

The deploy will install the schema under chado namespace(postgresql [schema](http://www.postgresql.org/docs/9.2/static/ddl-schemas.html)).

Done.

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


### Working with schema changes 
To get familiar with sqitch please read through the [tutorial](https://metacpan.org/pod/distribution/App-Sqitch/lib/sqitchtutorial.pod).
This project currently hosts ```1.1``` and ```1.2``` version changes of chado. The default ```deploy``` commands runs
through all changes and ultimately end up with ```1.2```. To install a particular version of changes

```shell
$_> sqitch deploy chado_1.1
```
* To revert changes,

```shell
$_> sqitch revert
$_> sqitch revert chado_1.1

```

* Adding your own changes

```shell
sqitch add <change> -n '<description>'
```

This will create 3 files; ```deploy/<change>.sql```, ```revert/<change>.sql``` and ```verify/<change>.sql```
Edit them as necessary.

