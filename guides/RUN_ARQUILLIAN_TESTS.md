Run the Arquillian Tests
========================

Arquillian is a testing platform that makes it easy to create automated integration, functional, and acceptance tests for your project. Some quickstarts provide Arquillian tests to demonstrate how write tests for your project. Because Arquillian tests an application on a real server, these tests are configured to be skipped by default.

There are two ways you can run Arquillian tests:

  * [Test the Quickstart on a Remote Red Hat JBoss Enterprise Application Platform Server](#test-the-quickstart-on-a-remote-jboss-eap-server): You must start the server yourself and run the tests against a remote server.
  * [Test the Quickstart on a Managed Red Hat JBoss Enterprise Application Platform Server](#test-the-quickstart-on-a-managed-jboss-eap-server): You must not start the server and instead let Arquillian manage the server lifecycle during the testing.

The individual quickstart README should tell you what to expect in the console output and the server log when you run the tests.

_Note:_

* _For the JBoss EAP 6.x quickstarts, if you do not configure your Maven settings as described here, [Configure Maven](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/CONFIGURE_MAVEN.md#configure-maven-to-build-and-deploy-the-quickstarts), you must pass the configuration settings file on every Maven command as follows: ` -s QUICKSTART_HOME/settings.xml`._
* _The JBoss EAP 7 quickstarts include the repository in the project POM files and do not require you to configure your Maven settings._


Test the Quickstart on a Remote Red Hat JBoss Enterprise Application Platform Server
-------------------------------------

Arquillian's remote container adapter expects a Red Hat JBoss Enterprise Application Platform server instance to be already started prior to the test execution.

1. You must start the JBoss EAP server as described in the quickstart README file.

2. If you run the tests against a JBoss EAP server running on a machine other than `localhost`, you must configure the following properties in the `src/test/resources/arquillian.xml` file:

            <container qualifier="jboss" default="true">
                <configuration>
                    <property name="managementAddress">myhost.example.com</property>
                    <property name="managementPort">9999</property>
                    <property name="username">customAdminUser</property>
                    <property name="password">myPassword</property>
                </configuration>
            </container>

3. Run the test goal with the correct profile activated.

   * For JBoss EAP 6.x, this is the `arq-jbossas-remote` profile, so you type the following command:

            mvn clean test -Parq-jbossas-remote

   * For JBoss EAP 7.0, this is the `arq-wildfly-remote` profile, so you type the following command:

            mvn clean verify -Parq-wildfly-remote

   * For JBoss EAP 7.1, this is the `arq-remote` profile, so you type the following command:

            mvn clean verify -Parq-remote


_Note:_ See the individual quickstart README file for any additional requirements.

Test the Quickstart on a Managed Red Hat JBoss Enterprise Application Platform Server
---------------------------------------

Arquillian's managed container adapter starts the container for you and requires that your JBoss EAP server is not running.

1. You must first let Arquillian know where to find the JBoss EAP server directory.

   The simplest approach is to set the `JBOSS_HOME` environment variable to the full path to your JBoss EAP server directory.

   Alternatively, you can set the path in the `jbossHome` property in the Arquillian configuration file as follows.

   * Open the `src/test/resources/arquillian.xml` file located in the quickstart directory.
   * Find the configuration for the JBoss container. It should look like this:

            <!-- Example configuration for a managed JBoss EAP instance -->
            <container qualifier="jboss" default="true">
                <!-- By default, Arquillian will use the JBOSS_HOME environment variable to find the JBoss EAP installation.  
                     If you prefer not to define the JBOSS_HOME environment variable, alternatively you can uncomment the
                     following `jbossHome` property and replace EAP_HOME with the path to your JBoss EAP installation. -->
                <!--<configuration>
                    <property name="jbossHome">EAP_HOME</property>
                </configuration> -->
            </container>

   * Uncomment the `configuration` element, find the `jbossHome` property, and replace the "EAP_HOME" value with the actual path to your JBoss EAP server. For example:

            <!-- Example configuration for a remote JBoss EAP instance -->
            <container qualifier="jboss" default="true">
                <configuration>
                    property name="jbossHome">/home/myusername/EAP/jboss-eap-x.x/</property>
                </configuration>
            </container>


2. Run the test goal with the correct profile activated.

   * For JBoss EAP 6.x, this is the `arq-jbossas-managed` profile, so you type the following command:

            mvn clean test -Parq-jbossas-managed

   * For JBoss EAP 7.0, this is the `arq-wildfly-managed` profile, so you type the following command:

            mvn clean verify -Parq-wildfly-managed

   * For JBoss EAP 7.1, this is the `arq-managed` profile, so you type the following command:

            mvn clean verify -Parq-managed

_Note:_ See the individual quickstart README file for any additional requirements.
