Configure the PostgreSQL Database for Use in the Quickstarts
===============

Summary: Some of the quickstarts required the PostgreSQL database. This guide describes how to install and configure the database for use with these quickstarts. The instructions here are the minimum required to install PostgreSQL version 9.2. If you install a later version, be sure to modify the version when you issue the commands below. More detailed instructions on how to install, configure, and start PostgreSQL can be found on the Internet.

_Note_: Although the database only needs to be installed once, to help partition each quickstart we recommend using a separate database per quickstart. Where you see `QUICKSTART_DATABASE_NAME`, you should replace that with the name provided in the specific quickstart's README file.

The following sections describe the steps necessary to install and configure PostgreSQL for use with the quickstarts:

* [Download and Install PostgreSQL](#download-and-install-postgresql): Follow the instructions for your operating system to download and install PostgreSQL.
* [Create a Database User](#create-a-database-user): Create a user for the PostgreSQL database.
* [Add the PostgreSQL Module to the JBoss EAP server](#add-the-postgresql-module-to-the-jboss-eap-server): Create a JBoss Module for the JBoss EAP server.
* [Configure the PostgreSQL Driver in the JBoss Server](#configure-the-postgresql-driver-in-the-jboss-server): Add PostgreSQL to the JBoss EAP server configuration.
* [Remove the PostgreSQL Configuration](#remove-the-postgresql-configuration): When you are done testing, remove PostgreSQL from the server configuration.


Download and Install PostgreSQL
-------------------------------

Follow the instructions below for your operating system.

* [Download and Install PostgreSQL on Linux](#download-and-install-postgresql-on-linux)
* [Download and Install PostgreSQL on Macintosh](#download-and-install-postgresql-on-macintosh):
* [Download and Install PostgreSQL on Windows](#download-and-install-postgresql-on-windows):
 
_Note:_ The installation of PostgreSQL is a one time procedure. However, unless you have set up the database to automatically start as a service, you must repeat the instructions "Start the database server" for your operating system every time you reboot your machine.
 
### Download and Install PostgreSQL on Linux

Use the following steps to install and configure PostgreSQL on Linux. You can download the PDF installation guide here: <http://yum.postgresql.org/files/PostgreSQL-RPM-Installation-PGDG.pdf>
  
1. Install PostgreSQL
    * The yum install instructions for PostgreSQL can be found here: <http://yum.postgresql.org/howtoyum.php/>
    * Download the repository RPM from here: <http://yum.postgresql.org/repopackages.php/>
    * To install PostgreSQL, in a command prompt type `sudo rpm -ivh RPM_FILE_NAME`, where RPM_FILE_NAME is the name of the downloaded repository RPM file, for example:

            sudo rpm -ivh pgdg-fedora92-9.2-5.noarch.rpm
    * Edit your distributions package manager definitions to exclude PostgreSQL. See the "important note" on <http://yum.postgresql.org/howtoyum.php/> for details on how to exclude install-and-configure-the-postgresql-database packages from the repository of the distribution.
    * Install _postgresql92_ and _postgres92-server_ by typing the following in a command prompt:

            sudo yum install postgresql92 postgresql92-server
2. Set a password for the _postgres_ user
    * In a command prompt, login as root and set the postgres password by typing the following commands: 

            su
            passwd postgres
    * Choose a password
3. Configure the test database
    * In a command prompt, login as the _postgres_ user, navigate to the postgres directory, and initialize the database by typing:

            su postgres
            cd /usr/pgsql-9.2/bin/
            ./initdb -D /var/lib/pgsql/9.2/data
    * Modify the `/var/lib/pgsql/9.2/data/pg_hba.conf` file to set the authentication scheme to password for tcp connections. Modify the line following the IPv4 local connections: change trust to to password. The line should look like this:
    
            host    all    all    127.0.0.1/32    password
    * Modify the `/var/lib/pgsql/9.2/data/postgresql.conf` file to allow prepared transactions and reduce the maximum number of connections

            max_prepared_transactions = 10
            max_connections = 10

4. Start the database server 
    * In the same command prompt, type the following:

            ./postgres -D /var/lib/pgsql/9.2/data
    * Note, this command does not release the command prompt. In the next step you need to open a new command prompt.
    
    _Note: If you do not configure the the database to automatically start as a service, you must repeat the instruction to start the database every time you reboot your machine._

5.  Create a database for the quickstart (as noted above, replace QUICKSTART_DATABASE_NAME with the name provided in the particular quickstart)
    * Open a new command prompt and login again as the _postgres_ user, navigate to the postgres directory, and create the  database by typing the following:

            su postgres
            cd /usr/pgsql-9.2/bin/
            ./createdb QUICKSTART_DATABASE_NAME


### Download and Install PostgreSQL on Macintosh

The following are the steps to install and start PostgreSQL on Mac OS X. Note that this guide covers only 'One click installer' option.

1. Install PostgreSQL using Mac OS X One click installer: <http://www.postgresql.org/download/macosx/>
2. Allow prepared transactions:

        sudo su - postgres
    * Edit `/Library/PostgreSQL/9.2/data/postgresql.conf` to allow prepared transactions
      
            max_prepared_transactions = 10
3. Start the database server 

        cd /Library/PostgreSQL/9.2/bin
        ./pg_ctl -D ../data restart
4. Create a database for the quickstart (as noted above, replace QUICKSTART_DATABASE_NAME with the name provided in the particular quickstart)

        ./createdb QUICKSTART_DATABASE_NAME
5.  Verify that everything works. As the _postgres_ user using the password you specified in Step 1, type the following:

        cd /Library/PostgreSQL/9.2/bin
        ./psql -U postgres    
    At the prompt

        start transaction;
        select 1;
        prepare transaction 'foobar';
        commit prepared 'foobar';
    

### Download and Install PostgreSQL on Windows

Use the following steps to install and configure PostgreSQL on Windows:

1. Install PostgreSQL using the Windows installer: <http://www.postgresql.org/download/windows/>
2. Enable password authentication and configure PostgreSQL to allow prepared transactions
    * Modify the `C:\Program Files\PostgreSQL\9.2\data\pg_hba.conf` file to set the authentication scheme to password for tcp connections. Modify the line following the IPv4 local connections: change trust to to password. The line should look like this:

            host    all    all    127.0.0.1/32    password`
    * Modify the `C:\Program Files\PostgreSQL\9.2\data\postgresql.conf` file to allow prepared transactions and reduce the maximum number of connections:

            max_prepared_transactions = 10
            max_connections = 10
3.  Start the database server
    * Choose Start -> All Programs -> PostgreSQL 9.2\pgAdmin III
    * Server Groups -> Servers (1) -> PostgreSQL 9.2 (localhost:5432)
    * Right click -> Stop Service
    * Right click -> Start Service
4.   Create a database for the quickstart (as noted above, replace QUICKSTART_DATABASE_NAME with the name provided in the particular quickstart)
    * Open a command prompt and type the following:

            cd C:\Program Files\PostgreSQL\9.2\bin\
            createdb.exe -U postgres QUICKSTART_DATABASE_NAME


Create a Database User
----------------------

1.  Make sure the PostgreSQL bin directory is in your PATH. 
    * Open a command prompt and change to the root directory
            psql
    * If you see an error that 'psql' is not a recognized command, you need to add the PostgreSQL bin directory to your PATH environment variable. 
2.  As the _postgres_ user, start the PostgreSQL interactive terminal by typing the following command:

        psql -U postgres
3.  Create the user sa with password sa and all privileges on the database by typing the following commands (as noted above, replace QUICKSTART_DATABASE_NAME with the name provided in the particular quickstart):

        create user sa with password 'sa';
        grant all privileges on database "QUICKSTART_DATABASE_NAME" to sa;
        \q
4.  Test the connection to the database using the TCP connection as user `'sa'`. This validates that the change to `pg_hba.conf` was made correctly: 

        psql -h 127.0.0.1 -U sa QUICKSTART_DATABASE_NAME


Add the PostgreSQL Module to the JBoss EAP server
-------------------------------------------------

1. Create the following directory structure: `JBOSS_HOME/modules/org/postgresql/main`
2. Download the JBDC driver from <http://jdbc.postgresql.org/download.html> and copy it into the directory you created in the previous step.
3. In the same directory, create a file named module.xml. Copy the following contents into the file:

        <?xml version="1.0" encoding="UTF-8"?>
        <module xmlns="urn:jboss:module:1.0" name="org.postgresql">
            <resources>
                <resource-root path="postgresql-9.2-1002.jdbc4.jar"/>
            </resources>
            <dependencies>
                <module name="javax.api"/>
                <module name="javax.transaction.api"/>
            </dependencies>
        </module>

Configure the PostgreSQL Driver in the JBoss Server
-----------------------------------------------------------

You configure the PostgreSQL driver in the JBoss server by running JBoss CLI commands. For your convenience, the quickstarts batch the commands into a `configure-postgresql.cli` script provided in the root directory of the quickstarts.

### Run the Script to Configure PostgreSQL 

1. Before you begin, back up your server configuration file.
    * If it is running, stop the JBoss EAP server.
    * Backup the file: `JBOSS_HOME/standalone/configuration/standalone-full.xml`
    * After you have completed testing the quickstarts, you can replace this file to restore the server to its original configuration.
 
2. Start the JBoss EAP server by typing the following: 

        For Linux:  JBOSS_HOME/bin/standalone.sh -c standalone-full.xml
        For Windows:  JBOSS_HOME\bin\standalone.bat -c standalone-full.xml
3. Review the `configure-postgres.cli` file in the root of the quickstarts directory. This script adds the PostgreSQL driver to the datasources subsystem in the server configuration. 

4. Open a new command prompt, navigate to the root directory of the quickstarts, and run the following command, replacing JBOSS_HOME with the path to your server:

        For Linux: JBOSS_HOME/bin/jboss-cli.sh --connect --file=configure-postgresql.cli 
        For Windows: JBOSS_HOME\bin\jboss-cli.bat --connect --file=configure-postgresql.cli 
You should see the following result when you run the script:

        #1 /subsystem=datasources/jdbc-driver=postgresql:add(driver-name=postgresql,driver-module-name=org.postgresql,driver-xa-datasource-class-name=org.postgresql.xa.PGXADataSource)
        The batch executed successfully.
        {"outcome" => "success"}

#### Review the PostgreSQL Changes to the Server Configuration

If you want to review and understand newly added XML configuration, stop the JBoss server and open the `JBOSS_HOME/standalone/configuration/standalone-full.xml` file. 

The `postgresql` driver was added to the `<drivers>` section in the `datasources` subsystem of the server configuration file.

        <driver name="postgresql" module="org.postgresql">
            <xa-datasource-class>org.postgresql.xa.PGXADataSource</xa-datasource-class>
        </driver>


Remove the PostgreSQL Configuration
------------------------------------

When you are done testing the quickstarts, you can remove the PostgreSQL configuration by running the  `remove-postgresql.cli` script provided in the root directory of the quickstarts or by manually restoring the back-up copy the configuration file. 

### Remove the PostgreSQL Configuration by Running the JBoss CLI Script

1. Start the JBoss EAP server by typing the following: 

        For Linux:  JBOSS_HOME/bin/standalone.sh -c standalone-full.xml
        For Windows:  JBOSS_HOME\bin\standalone.bat -c standalone-full.xml
2. Open a new command prompt, navigate to the root directory of this quickstart, and run the following command, replacing JBOSS_HOME with the path to your server:

        JBOSS_HOME/bin/jboss-cli.sh --connect --file=remove-postgresql.cli 
This script removes PostgreSQL from the `datasources` subsystem in the server configuration. You should see the following result when you run the script:

        #1 /subsystem=datasources/jdbc-driver=postgresql:remove
        The batch executed successfully.
        {"outcome" => "success"}

### Remove the PostgreSQL Configuration Manually

1. If it is running, stop the JBoss EAP server.
2. Replace the `JBOSS_HOME/standalone/configuration/standalone-full.xml` file with the back-up copy of the file.
        
        

