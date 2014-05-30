## Install chado schema only
Please consult the basic sqitch [reference](../sqitch.md) if neccessary.

### Circumstance 
Simple straight install of chado schema, no management or anything else.

### Steps
#### Download one of the core chado schema from [release](https://github.com/dictyBase/Chado-Sqitch/releases) page
```
$_> curl -O https://github.com/dictyBase/Chado-Sqitch/releases/download/chado-1.23/sqitch-chado-1.23.tar.gz
```
#### Extract the archive and change to that folder
```
$_> tar xvzf sqitch-chado-1.23.tar.gz
$_> cd sqitch-chado-1.23/
```
#### Install sqitch
Follow the instruction from [sqitch](http://sqitch.org) website.

```
#For MacOSX
$_> brew tap theory/sqitch
$_> brew install sqitch_pg

#For Windows
$_> ppm install App-Sqitch

#And from source using cpanminus
$_> cpanm DBD::Pg App::Sqitch
```

#### Install postgresql
Not neccessary if there is one already available locally or in another host.

#### Create database and user
The following commands with create a ```gmod``` user and database in a
locally available postgresql database. This particular user/database
combination is refered throughout the examples.

```
$_> createuser -E -l -U <superuser> gmod
$_> createdb -O gmod -U <superuser> gmod
```

#### Create sqitch configuration
The sqitch configuration file is generally ignored in the git repository and
should not commited. This project comes with one example.
``` 
$_> cp sqitch.conf.sample sqitch.conf
``` 
Add basic configuration
```
$_> sqitch config --user core.pg.client `which psql`
```

#### Add database configuration 
It assumes a postgresql server running locally with a database, user and
password with __gmod__. It allows to run the commands without specifying them
everytime. The database connection URI
[specification](https://metacpan.org/pod/URI::db) is given here.
```
$_> sqitch target add gmod db:pg://gmod:gmod@localhost/gmod
$_> sqitch config core.pg.target gmod
``` 

#### Deploy database schema
Install chado database schema in the default postgresql database. 
```
$_> sqitch deploy 
```

#### Deploy to another database
Add another target by specifying the database url. 
```shell
$_> sqitch target add mymod db:pg://mychado:chado123@localhost/mymod
$_> sqitch deploy -t mymod
```
The same schema could be installed in multiple places by specifying the target
configuration.
