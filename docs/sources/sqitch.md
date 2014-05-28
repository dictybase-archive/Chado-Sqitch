# Sqitch reference
## Commands and concepts
This is a basic list of commands and concepts that are needed to work with __Chado-Sqitch__
project. For better understanding how they works and other commands refer to
the official
[tutorial](https://metacpan.org/pod/distribution/App-Sqitch/lib/sqitchtutorial.pod)
and [documentation](https://metacpan.org/release/App-Sqitch).

### Configuration file
It is a plain text file that contains all the sqitch related information. By
default it is stored in ```sqitch.conf``` file inside the project folder.
Almost all of the sqitch options could be specified here. The sqitch
configuration options set from the command line are also gets stored here.

### Plan file
It is a plain text file that records list of dependencies and order of
deployment. By default it is stored in ```sqitch.plan``` file inside the
project folder. Presence of this file in mandatory.

### Add
This command creates templates for incorporating new database changes. 
```
$_> sqitch add pathway -n 'sql to model biological pathways'
```
It will create three folders ```deploy```, ```verify``` and ```revert``` if not
present and add stub file named ```pathway.sql``` under each of them.
```
deploy/pathway.sql
revert/pathway.sql
verify/pathway.sql
```
The sql files are expected to have sql commands(in this case postgresql) to
add(deploy), revoke(revert) and validate(verify) the changes. For example, the
file under deploy folder looks like
```
-- Deploy pathway

BEGIN;

-- XXX Add DDLs here.

COMMIT;
```
The plan also gets recorded in plan file. 
```
#In the plan file
pathway 2014-05-28T21:07:32Z Siddhartha Basu <email@email.com> # sql to model biological pathways
```

### Deploy
This command runs the sql commands specified in ```sql``` files under the deploy folder. 
```
$_> sqitch deploy
```
By default, it will deploy all upto the last change that is absent in the
default database and present in the ```sqitch.plan``` file. To deploy upto a
specified change, include the name of the change.
```
$_> sqitch deploy --to pathway
```
Generally, the default database is picked up from ```sqitch.conf``` file or
could be specified by the ```-t|--target``` option.

