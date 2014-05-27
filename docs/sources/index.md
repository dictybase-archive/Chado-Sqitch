# Introduction 
* Chado-Sqitch is a project to install and manage chado database schema in postgresql database and more. 
* [Chado](http://gmod.org/wiki/Introduction_to_Chado) is an open-source relational database schema for biological data.
* [Sqitch](http://sqitch.org) is a Perl tool to manage changes in database structure. 

# Use cases
Chado schema is generic and could be used in variety of ways. So, the
application of this project depends on the use case. A few of the cases are
described below. Do consult the scope of this project  before you go ahead.
All commands are expected to be executed from a command line terminal interface.
The following use cases are documented..

- [Install chado schema](use_cases/install_schema_only.md).
- [Install and manage chado schema](use_cases/install_schema_manage.md).

## Extra sauce
It comes with two command line tools ```load``` and ```dump``` to manage
postgresql dump along with every versioned changes.

# Rationale
* Chado is a generic schema and in highly extensible so that it can be easily
  customized to incorporate various biological data type. This project
  integrates sqitch to painlessly manage and version those changes.
* All changes can be managed without breaking compatibility with core schema changes.
* It deals with schema and database scheme only, completely free of any loader scripts. It is BYOL(bring your own loader) system.

# Scope 
* Works only with postgresql database.
* Installation and configuration of postgresql database is beyond the scope of this project.
* Does not create or manage databases or user accounts. Use ```psql``` or postgresql tools for that.



