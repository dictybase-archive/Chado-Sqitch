# Sqitch reference
## Working principles
__sqitch__ has the concept of ```change```, ```deploy```, ```revert```,
```verify``` and much more. sqitch manages commands for database alteration
thourgh the concept of ```change```. Every change must have a name and each
named change could be deployed or reverted from the database.
```
                    ^
|         change1   | revert
|deploy   change2   |  
|         change3   |
v
```

Deploy and revert are opposite of each other. The __change__ file contain sql
commands that will be run on the database. The list and order of changes are
maintained in a plan file, by default which is ```sqitch.plan``` file. The
sqitch configuration is hosted in ```sqitch.conf``` by default. The ```sqitch.conf```
and ```sqitch.plan``` file are mandatory for every project.


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

### Add command
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

### Deploy command
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
could be specified by the ```-t|--target``` option. The default or other named
database targets could be set using the ```target``` command 


### Revert command
This command goes the opposite of ```deploy``` command. It run the commands
specified under the revert folder.
```
$_> sqitch revert
```
The above will revert all changes that's been applied and present in the
```plan``` file. For a particular change specify them in the command line.
So, for example if you deployed three changes __homolog__, __pathway__ and
__interaction__ in the respective order, then the plan file will look like below. 
```
homolog 2014-05-28T21:01:30Z Siddhartha Basu <email@email.com> # sql to model homolog
pathway 2014-05-28T21:07:32Z Siddhartha Basu <email@email.com> # sql to model biological pathways
interaction 2014-05-28T21:09:33Z Siddhartha Basu <email@email.com> # sql to model protein interaction
```
The default revert(above) will go back to __homolog__, whereas to back to
pathway specify it in the command line. 
```
$_> sqitch revert --to pathway
```
The database configuration will be identical to one described in the
[deploy comamnd](sqitch.md#Deploy command).

### Verify command
This command validate/verify the deploy. It run the commands specified under
the verify folder. This command is similar in concept to ```deploy```. The
verify validates the deploy, for example if a table is added, then it checks
for the presence of table. If a column is altered, it should check for proper
data type. 
```
$_> sqitch verify
```
This command could be run separately or could be automated after the ```deploy```.
```
$_> sqitch config --bool deploy.verify true
```
Automated verification is highly recommended.

### Log command
This command list record of deploy and revert(success or failure).
```
$_> sqitch log
```
Could be also filtered for a particular event(deploy or revert).
```
$_> sqitch log --event deploy
```

### Tag command
This command tag a change or display list of tags. This is conceptually similar
to ```git tag``` command, intended to prepare a release.
```
$_> sqitch tag biodb-1.0 -n 'First version of biodb'
```
By default, most recent change is tagged and it is recorded in the plan file.
The tag name can also be refered in any of the ```deploy```, ```verify``` and
```revert``` commands.
