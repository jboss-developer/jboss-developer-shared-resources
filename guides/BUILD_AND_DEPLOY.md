Build and Deploy the Quickstarts
=====================

This document describes the most common way to build, deploy, and undeploy the quickstarts. See the README file in each individual quickstart folder for specific details and information on how to run and access the example. 

The commands in this document use the *replaceable* value `EAP_HOME` to denote the path to the Red Hat JBoss Enterprise Application Platform 6 installation. When you encounter this value in a README file or guide, be sure to replace it with the actual path to your JBoss EAP 6 installation. The installation path is described in detail here: [Use of EAP_HOME and JBOSS_HOME Variables](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/USE_OF_EAP_HOME.md#use-of-eap_home-and-jboss_home-variables).

_Note:_ If you do not configure the Maven settings as described here, [Configure Maven](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/CONFIGURE_MAVEN.md#configure-maven-to-build-and-deploy-the-quickstarts), you must pass the configuration setting on every Maven command as follows: ` -s QUICKSTART_HOME/settings.xml`

* [Build the Quickstart Archive](#build-the-quickstart-archive)
* [Build and Deploy the Quickstart Archive](#build-and-deploy-the-quickstart-archive)
* [Undeploy the Quickstart Archive](#undeploy-the-quickstart-archive)
* [Verify the Quickstarts Build with One Command](#verify-the-quickstarts-build-with-one-command)
* [Undeploy All Deployed Quickstarts with One Command](#undeploy-all-deployed-quickstarts-with-one-command)


### Build the Quickstart Archive

In most cases, you can use the following steps to build the application to test for compile errors or to view the contents of the archive. See the specific quickstart README file for complete details.

1. Open a command prompt and navigate to the root directory of the quickstart you want to build.
2. Use this command if you only want to build the archive, but not deploy it:
   * If you have configured the Maven settings :

            mvn clean install
   * If you have NOT configured settings Maven settings:

            mvn clean install -s QUICKSTART_HOME/settings.xml

### Build and Deploy the Quickstart Archive

In most cases, you can use the following steps to build and deploy the application. See the specific quickstart README file for complete details.

1. Make sure you start the JBoss EAP server as described in the quickstart README file.
2. Open a command prompt and navigate to the root directory of the quickstart you want to run.
3. Use this command to build and deploy the archive:

   * If you have configured the Maven settings :

            mvn clean install jboss-as:deploy
   * If you have NOT configured the Maven settings :

            mvn clean install jboss-as:deploy -s QUICKSTART_HOME/settings.xml

### Undeploy the Quickstart Archive

The command to undeploy the quickstart is simply: 

        mvn jboss-as:undeploy


### Verify the Quickstarts Build with One Command


You can verify the quickstarts build using one command. However, quickstarts that have complex dependencies must be skipped. For example, the _jax-rs-client_ quickstart is a RESTEasy client that depends on the deployment of the _helloworld-rs_ quickstart. As noted above, the root `pom.xml` file defines a `complex-dependencies` profile to exclude these quickstarts from the root build process. 

To build the quickstarts:

1. Do not start the JBoss EAP server.
2. Open a command prompt and navigate to the root directory of the quickstarts.
3. Use this command to build the quickstarts that do not have complex dependencies:

   * If you have configured the Maven settings :

            mvn clean install '-Pdefault,!complex-dependencies'

   * If you have NOT configured the Maven settings :

            mvn clean install '-Pdefault,!complex-dependencies' -s QUICKSTART_HOME/settings.xml

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

            mvn jboss-as:undeploy -fae

To undeploy any quickstarts that fail due to complex dependencies, follow the undeploy procedure described in the quickstart's README file.



