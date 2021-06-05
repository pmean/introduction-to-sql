---
title: "MEDB 5508, Introduction to SQL, Module01, Objectives"
---

### Module01, Start here

There are eight modules in this class and a final exam. In each module (except the last one), you will participate in a discussion board, take a short quiz, and prepare a homework assignment.

Your first task is unofficial, but you need to decide how you will run SQL in this class.

There are at least three methods to access SQL, and they all have been tested by us.

The first method method is to sign in to the Insights platform and use Oracle. We show you have to access Oracle via SAS. If you do not know SAS, don't worry. The coding you need is minimal and pretty much stays the same for the entire class. The code that does change is the SQL code inside of PROC SQL in SAS.

The second and third methods run SQL programs using SQLite. SQLite is a stand-alone program that is easy to use and install. It simplifies things by combining the client and the server into a single system. It does not have all of the features and security of other databases, but it has a small footprint, making it easy to setup and use. It is great for teaching and also works very well when you need to embed a database inside another application.

You can access SQLite using a stand-alone program, SQLite Studio. It is very easy to use.

Alternately, you access sQLite using R. We show you how to access SQLite via R. Just as with SAS, you do not need to know R. The coding is minimal and stays the same throughout the class.

You can mix and match, such as using SAS with SQLite or R with Oracle, but we have not tested these approaches as extensively.

A student in a previous semester used Python to access SQLServer. It worked quite well, actually, and if you are adventurous, you are welcome to try this.

There are other excellent free databases out there. MySQL is a free database that has features and security that rival even the best commercial products. SQL Server has a free educational version. We have not tried to document these other systems, but you are welcome to try them if you like. If you use an alternative SQL database, you'll have to load a few files into that database before doing anything else.

#### In this module, you will learn how to

+ logon to the Insights platform
+ run a simple SAS program to access an Oracle database
+ run an R program to access a SQLite database
+ run SQLite Studio to access a SQLite database
+ retrieve a limited number of fields
+ retrieve distinct values
+ change field names

#### You will see the following SQL keywords

+ as
+ distinct
+ from
+ select