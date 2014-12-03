Create Users Required by the Quickstarts
===============

Summary: By default, JBoss EAP is distributed with security enabled for the management interfaces. A few of the quickstarts use these management interfaces and require that you create a management or application user to access the running application. An `add-user` script is provided in the `EAP_HOME/bin` directory for that purpose. You can run the script interactively or you can pass arguments on the command line. 

The following procedures describe how to add a user with the appropriate permissions to run the quickstarts that depend on them.

* [Add a Management User](#add-a-management-user)
* [Add an Application User](#add-an-application-user)

_Note:_ Passwords must meet the following requirements:

* It can not be the same as the user name.
* It must contain at least 8 characters.
* It must contain at least one alphanumeric character.
* It must contain at least one digit.
* It must contain at least one non-alphanumeric symbol.

More detailed user configuration instructions can be found in the Administration and Configuration Guide for JBoss Enterprise Application Platform located on the Customer Portal at <https://access.redhat.com/site/documentation/en-US/JBoss_Enterprise_Application_Platform/>.

_NOTE: See [Use of EAP_HOME](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/USE_OF_EAP_HOME) for information about the JBoss EAP installation path._

Add a Management User
----------------------

You can pass arguments on the command line or you can run the script interactively. The examples below use "admin" for the `Username` and "adminPass1!" for the `Password`. If the quickstart requires a specific `Username` and `Password`, be sure to replace them in the examples below.

### Add a Management User Passing Arguments on the Command Line

You can create the management user non-interactively by passing each argument on the command line. 

For example, to add the Management User `admin` in the default `ManagementRealm` realm with password `adminPass1!`, 
open a command prompt and type the following:

        For Linux:   EAP_HOME/bin/add-user.sh -u 'admin' -p 'adminPass1!'
        For Windows: EAP_HOME\bin\add-user.bat -u 'admin' -p 'adminPass1!'

### Add a Management User Interactively

If you prefer, you can create the management user interactively. 

1. Open a command prompt.
2. Type the command for your operating system

        For Linux:   EAP_HOME/bin/add-user.sh
        For Windows: EAP_HOME\bin\add-user.bat
3. You should see the following response:

        What type of user do you wish to add? 

        a) Management User (mgmt-users.properties) 
        b) Application User (application-users.properties)
        (a):

    At the prompt, press enter to use the default Management User.
4. You should see the following response:

        Enter the details of the new user to add.
        Using realm 'ManagementRealm' as discovered from the existing property files.
        Username :
5. Enter the Username and, at the next prompt, enter the Password.
 
        Username : admin
        Password : (choose a password for the admin user)
    Repeat the password.
6. At the next prompt, you will be asked "What groups do you want this user to belong to? (Please enter a comma separated list, or leave blank for none)[ ]: ". Leave it blank and press enter.
7. Choose yes for the remaining prompts.

Add an Application User
-----------------------

You can pass arguments on the command line or you can run the script interactively. The examples below use "quickstartUser" for the `Username`, "quickstartPwd1!" for the `Password`, and "guest" for the group. If the quickstart requires a specific `Username`, `Password`, or `group`, be sure to replace them in the examples below.

### Add an Application User Passing Arguments on the Command Line

You can create the application user non-interactively by passing each argument on the command line. 

The default application user for the quickstarts is `quickstartUser`, in the `ApplicationRealm` realm, with password `quickstartPwd1!`, and belonging to group `guest`. 
To add the default application user, open a command prompt and type the following:

        For Linux:   EAP_HOME/bin/add-user.sh -a -u 'quickstartUser' -p 'quickstartPwd1!' -g 'guest'
        For Windows: EAP_HOME\bin\add-user.bat  -a -u 'quickstartUser' -p 'quickstartPwd1!' -g 'guest'


##### Add an Application User Interactively 

If you prefer, you can create the application user interactively. 

1. Open a command prompt.
2. Type the command for your operating system

        For Linux:   EAP_HOME/bin/add-user.sh
        For Windows: EAP_HOME\bin\add-user.bat
3. You should see the following response:

        What type of user do you wish to add? 

        a) Management User (mgmt-users.properties) 
        b) Application User (application-users.properties)
        (a):

    At the prompt, type:  `b`
4. You should see the following response:

        Enter the details of the new user to add.
        Using realm 'ApplicationRealm' as discovered from the existing property files.
        Username :

5. Enter the the Username and at the next prompt, enter the Password. If the quickstart README specifies a Username and Password, enter them here. Otherwise, use the default Username `quickstartUser` and Password `quickstartPwd1!`.
 
        Username : quickstartUser
        Password : quickstartPwd1!
6. At the next prompt, you will be asked "What groups do you want this user to belong to? (Please enter a comma separated list, or leave blank for none)[  ]: ". If the quickstart README specifies the groups to use, enter that here. Otherwise, type the group: `guest`

[Back to top](#create-users-required-by-the-quickstarts)

