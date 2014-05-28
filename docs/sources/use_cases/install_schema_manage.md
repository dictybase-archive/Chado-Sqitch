## Install chado schema and manage database changes
### Circumstance
Installation of chado schema for extending and customization. Also, might need
to add other database tables, schemas that is unrelated to chado but needed to
work with software application layer, for example user management tables.

### Steps
#### Install git
Preferably use the package manager of your OS.

#### Clone this repository
```
$_> git clone https://github.com/dictyBase/Chado-Sqitch
$_> cd Chado-sqitch
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
should not commited. This project comes with one example. In fact every user
should use their own configuration file.
``` 
$_> cp sqitch.conf.sample sqitch.conf
``` 

Add configuration parameters
```
$_> sqitch config --user user.name "user name"
$_> sqitch config --user user.email "user email"
$_> sqitch config --user core.pg.client `which psql`
```
The above user will be used tied to all changes made from this checkout of the
repository.

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
By default it will install chado-1.23 in the default postgresql database.
```
$_> sqitch deploy
```
To install a previous version, use the particular tag
```
$_> sqitch deploy @chado-1.11
```
Of course, the same schema could be deployed in multiple  databases by adding
more target.


#### Customization
Once the core chado is installed, any new customization or changes can be
added using sqitch. To understand the basic sqitch command, do go through this
sqitch documentation and official
[tutorial](https://metacpan.org/pod/distribution/App-Sqitch/lib/sqitchtutorial.pod).

** Adding changes**
```
$_> sqitch add mychange -n 'my first change on chado database'
```
It will create three folders ```deploy```, ```revert``` and ```verify``` each
with a single file named ```mychange.sql```. Add your sql statements to each of
this file and then deploy.
```
$_> sqitch deploy
```

**Verify changes**

To make sure each deploy gets verified
```
$_> sqitch config --bool deploy.verify true 
```

**Save changes**

Now, save all changes to git
```
$_> git add sqitch.plan deploy revert verify
$_> git commit -n 'added my first change'
```
Optionally push it to remote
```
$_> git push myremote
```

**Revert changes**

In case the change is not desirable and would like to get back the core chado

```
$_> sqitch revert --to @chado-1.23
```

#### Syncronization
```Chado-Sqitch``` integrates all chado updates in the master branch. So, to
stay uptodate, merge with the master branch.
```
$_> git fetch origin && git merge master
$_> sqitch deploy
```
Last but not the least, it's a better idea to push the local changes to its own
remote repository.
