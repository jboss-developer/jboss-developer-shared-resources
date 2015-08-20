Build and Deploy the Quickstarts to JBoss EAP 7
=====================

This document describes the most common way to build, deploy, and undeploy the quickstarts. See the README file in each individual quickstart folder for specific details and information on how to run and access the example. 

The commands in this document use the *replaceable* value `EAP7_HOME` to denote the path to the Red Hat JBoss Enterprise Application Platform 7 installation. When you encounter this value in a README file or guide, be sure to replace it with the actual path to your JBoss EAP 7 installation. The installation path is described in detail here: [Use of EAP7_HOME and JBOSS_HOME Variables](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/USE_OF_EAP7_HOME.md#use-of-EAP7_HOME-and-jboss_home-variables).

See [Configure Maven for JBoss EAP 7](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/CONFIGURE_MAVEN_JBOSS_EAP7.md#configure-maven-to-build-and-deploy-the-quickstarts) to make sure you are configured correctly for testing the quickstarts.

* [Build the Quickstart Archive](#build-the-quickstart-archive)
* [Build and Deploy the Quickstart Archive](#build-and-deploy-the-quickstart-archive)
* [Undeploy the Quickstart Archive](#undeploy-the-quickstart-archive)
* [Verify the Quickstarts Build with One Command](#verify-the-quickstarts-build-with-one-command)
* [Undeploy All Deployed Quickstarts with One Command](#undeploy-all-deployed-quickstarts-with-one-command)


### Build the Quickstart Archive

In most cases, you can use the following steps to build the application to test for compile errors or to view the contents of the archive. See the specific quickstart README file for complete details.

1. Open a command prompt and navigate to the root directory of the quickstart you want to build.
2. Use this command if you only want to build the archive, but not deploy it:

        mvn clean install

### Build and Deploy the Quickstart Archive

In most cases, you can use the following steps to build and deploy the application. See the specific quickstart README file for complete details.

1. Make sure you start the JBoss EAP server as described in the quickstart README file.
2. Open a command prompt and navigate to the root directory of the quickstart you want to run.
3. Use this command to build and deploy the archive:

        mvn clean install wildfly:deploy

### Undeploy the Quickstart Archive

The command to undeploy the quickstart is simply: 

        mvn wildfly:undeploy


### Verify the Quickstarts Build with One Command


You can verify the quickstarts build using one command. However, quickstarts that have complex dependencies must be skipped. For example, the _jax-rs-client_ quickstart is a RESTEasy client that depends on the deployment of the _helloworld-rs_ quickstart. As noted above, the root `pom.xml` file defines a `complex-dependencies` profile to exclude these quickstarts from the root build process. 

To build the quickstarts:

1. Do not start the JBoss EAP server.
2. Open a command prompt and navigate to the root directory of the quickstarts.
3. Use this command to build the quickstarts that do not have complex dependencies:

        mvn clean install '-Pdefault,!complex-dependencies'

_Note_: If you see a `java.lang.OutOfMemoryError: PermGen space` error when you run this command, increase the memory by typing the following command for your operating system, then try the above command again.

        For Linux:   export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m"
        For Windows: SET MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m"


### Undeploy All Deployed Quickstarts with One Command
------------------------------------------------------

To undeploy the quickstarts from the root of the quickstart folder, you must pass the argument `-fae` (fail at end) on the command line. This allows the command to continue past quickstarts that fail due to complex dependencies and quickstarts that only have Arquillian tests and do not deploy archives to the server.

You can undeploy quickstarts using the following procedure:

1. Start the JBoss EAP server.
2. Open a command prompt and navigate to the root directory of the quickstarts.
3. Use this command to undeploy any deployed quickstarts:

            mvn wildfly:undeploy -fae

To undeploy any quickstarts that fail due to complex dependencies, follow the undeploy procedure described in the quickstart's README file.



