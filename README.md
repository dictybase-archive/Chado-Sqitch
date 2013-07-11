# Versioned Chado & extended Sqitch commands @dictyBase
This repository contains versioned changes to Chado schema and an extension to [App::Sqitch](https://metacpan.org/module/App::Sqitch) commands for dumping & loading data for a particular change 

[![Build Status](https://secure.travis-ci.org/dictyBase/App-Sqitch-data.png?branch=develop)](https://travis-ci.org/dictyBase/App-Sqitch-data) [![Coverage Status](https://coveralls.io/repos/dictyBase/App-Sqitch-data/badge.png)](https://coveralls.io/r/dictyBase/App-Sqitch-data)

## Background
1. Chado schema
   * Schema is stable. 
   * Does not have default versioning system
2. We will have to make changes to default schema. It should be possible for us to make changes upstream
   * e.g - If we make changes on default schema today, and the schema changes tomorrow; we should be able to keep track of all changes
3. __We are NOT doing data versioning, ONLY schema versioning__

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

Currently, the repository hold 2 versions of Chado; 1.1 & 1.23(1.2). Chado 1.23 is an update from Chado 1.1. So Chado 1.1 is a dependency for Chado 1.23 

* To deploy all the changes; i.e. to have Chado 1.23 installed on your `PostgreSQL` database

```shell
sqitch deploy
```

These are just a couple of changes and can be reverted

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

