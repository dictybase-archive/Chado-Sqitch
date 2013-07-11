# Versioned Chado & extended Sqitch commands @dictyBase
This repository contains versioned changes to Chado schema and an extension to [App::Sqitch](https://metacpan.org/module/App::Sqitch) commands for dumping & loading data for a particular change 

[![Build Status](https://secure.travis-ci.org/dictyBase/Chado-Sqitch.png)](https://travis-ci.org/dictyBase/Chado-Sqitch) 

## Getting started
* [Setup `Perl` environment using `perlbrew`](http://dictybase.github.io/perl-setup/index.html) or [`plenv`](https://github.com/tokuhirom/plenv#synopsis)

_* Note: If using `plenv`, do not forget to `plenv rehash`_

* Run the following to install required modules

```perl
cpanm App::Sqitch DBD::Pg DBD::SQLite
```

_* Note: You might want to increase `max_locks_per_transaction` for PostgreSQL. Please follow the [prerequisites for installing Chado on PostgreSQL](https://gmod.svn.sourceforge.net/svnroot/gmod/schema/trunk/chado/INSTALL.Chado)_

* Create a PostgreSQL database

```shell
createdb <db-name>
```

* Clone the repository

```shell
git clone https://github.com/dictyBase/Chado-Sqitch.git 
cd Chado-Sqitch
```

* Edit the `sqitch.conf` and change `db_name = <db-name>`

## Deploy/Revert changes

To deploy/revert changes make sure that you are in your Chado-Sqitch directory and it contains `sqitch.conf`, `sqitch.plan` and the folders `deploy/*`, `revert/*` and `verify/*`

Currently, the repository hold 2 versions of Chado. 

* To deploy all the changes; i.e. to have Chado 1.23 installed on your `PostgreSQL` database

```shell
sqitch deploy
```

* To revert all the changes,

```shell
sqitch revert
```

or to revert to a particular change; `sqitch revert chado_1.1`

## Adding your own changes
There could be certain changes that you would like to add or modify the existing tables to fit your needs. For that

```shell
sqitch add <change> -n '<description>'
```

This will create 3 files; `deploy/<change>.sql`, `revert/<change>.sql` and `verify/<change>.sql`

