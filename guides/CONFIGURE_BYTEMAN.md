Configure Byteman for Use with the Quickstarts
=============================
Summary: _Byteman_ is a tool that simplifies tracing and testing of Java programs. It allows you to insert extra Java code into your application, either as it is loaded during JVM startup or after it has already started running. This code can be used to trace what the application is doing and to monitor and debug deployments to be sure it is operating correctly. You can also use _Byteman_ to inject faults or synchronization code when testing your application. 

A few of the quickstarts use _Byteman_ to demonstrate distributed transaction processing and crash recovery, for example, to halt an application server in the middle of a distributed transaction to demonstrate crash recovery.

The following sections describe the steps necessary to install, configure, and use _Byteman_ with these quickstarts.

* [Download and Configure Byteman](#download-and-configure-byteman)
* [Clear the Transaction ObjectStore](#clear-the-transaction-objectstore)
* [Use Byteman to Halt the Application](#use-byteman-to-halt-the-application)
* [Disable the Byteman Script](#disable-the-byteman-script)


Download and Configure Byteman
-------------------------------

1. Download _Byteman_ from <http://www.jboss.org/byteman/downloads/>
2. Extract the ZIP file to a directory of your choice. In the instructions below, we refer to this directory as `BYTEMAN_HOME`.
3. By default, the _Byteman_ download provides unrestricted permissions to `others` which can cause a problem when running Ruby commands for the OpenShift quickstarts. To restrict the permissions to `others`, open a command prompt and type the following:

        chmod -R o-rwx BYTEMAN_HOME/

Clear the Transaction ObjectStore
-------------------------

Transaction objectstore data remaining from previous tests can prevent _Byteman_ from working properly. You must remove any remaining data before running new _Byteman_ tests.  If you are using the default file based transaction logging store:

1. Open a command prompt and type the following:

        ls $JBOSS_HOME/standalone/data/tx-object-store/ShadowNoFileLockStore/defaultStore/StateManager/BasicAction/TwoPhaseCoordinator/AtomicAction/
2. If this directory exists and contains any files, delete them before starting the server:

        rm -rf $JBOSS_HOME/standalone/data/tx-object-store/ShadowNoFileLockStore/defaultStore/StateManager/BasicAction/TwoPhaseCoordinator/AtomicAction/*
3. On Windows, use the file manager to accomplish the same result.


Use Byteman to Halt the Application
-------------------------------

_NOTE_: The _Byteman_ scripts only work in JTA mode. They do not work in JTS mode. If you have configured the server for a quickstart that uses JTS, you must follow the quickstart instructions to remove the JTS configuration from the JBoss server before making the following changes. Otherwise _Byteman_ will not halt the server. 

When instructed to use _Byteman_ to halt the application, perform the following steps:
 
1. Find the appropriate configuration file for your operating system in the list below.

        For Linux: JBOSS_HOME/bin/standalone.conf 
        For Windows: JBOSS_HOME\bin\standalone.conf.bat

2. **Important**: Make a backup copy of this file before making any modifications.

3. The quickstart README file should specify the text you need to append to the server configuration file.

4. Open the configuration file and append the text specified by the quickstart to the end of the file. Make sure to replace the file paths with the correct location of your quickstarts and the _Byteman_ download. 

5. The following is an example of of the configuration changes needed for the _jta-crash-rec_ quickstart: 

    For Linux, open the `JBOSS_HOME/bin/standalone.conf` file and append the following line:

        JAVA_OPTS="-javaagent:/BYTEMAN_HOME/lib/byteman.jar=script:/QUICKSTART_HOME/jta-crash-rec/src/main/scripts/xa.btm ${JAVA_OPTS}" 
    For Windows, open the `JBOSS_HOME\bin\standalone.conf.bat` file and append the following line:

        SET "JAVA_OPTS=%JAVA_OPTS% -javaagent:C:\BYTEMAN_HOME\lib\byteman.jar=script:C:\QUICKSTART_HOME\jta-crash-rec\src\main\scripts\xa.btm %JAVA_OPTS%"


Disable the Byteman Script
----------------------
 
When you have completed testing the quickstart, replace the server configuration file with the backup copy you created in step 2 above to disable _Byteman_.

[Back to top](#configure-byteman-for-use-with-the-quickstarts)

