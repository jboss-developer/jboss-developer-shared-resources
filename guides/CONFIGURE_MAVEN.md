Configure Maven to Build and Deploy the Quickstarts
===============

Summary: The artifacts and dependencies needed to build and deploy applications to Red Hat JBoss Enterprise Application Platform 6 are hosted in public repositories. You must configure Maven to use these repositories before you build and deploy the quickstarts. How you do this depends on whether you plan to use JBoss Developer Studio or Maven command line to build and deploy your applications. Both methods are described below.

* [Configure Maven - For Use with Command Line](#configure-maven-for-use-with-command-line): Follow these instructions if you plan to build and deploy the quickstarts using Maven command line tools.
* [Configure Maven - For Use with JBoss Developer Studio](#configure-maven-for-use-with-jboss-developer-studio): Follow these instructions if you plan to build and deploy the quickstarts using JBoss Developer Studio.

Some common profiles are defined and may be used in some quickstart POM files. These profiles are described here: [Use of Maven Profiles in POM Files](#use-of-maven-profiles-in-pom-files)

For more information about Maven, see the [Maven Guide](https://access.redhat.com/documentation/en-US/JBoss_Enterprise_Application_Platform/6.4/html-single/Development_Guide/index.html#chap-Maven_Guide "Maven Guide") chapter in the _Development Guide_ for Red Hat JBoss Enterprise Application Platform.

For more information about how to configure Maven for use with the quickstarts, see [Configure Maven](https://access.redhat.com/documentation/en-us/JBoss_Enterprise_Application_Platform/6.4/html-single/Getting_Started_Guide/index.html#sect-Configure_Maven "Configure Maven") in the _Getting Started Guide_ for Red Hat JBoss Enterprise Application Platform.


Configure Maven - For Use With Command Line
-------------------------------------------

### Download and Install Maven

If you have not yet done so, you must download and install Maven.

1. Go to [Apache Maven Project - Download Maven](http://maven.apache.org/download.html) and download the latest distribution for your operating system.
2. See the Maven documentation for information on how to download and install Apache Maven for your operating system.

_Note:_ Maven 3.2.2 introduced a bug that breaks resolution of the JBoss EAP BOM dependencies because it ignores additional repositories during artifact resolution. For more information about this bug, see <https://jira.codehaus.org/browse/MNG-5663>. Make sure to use Maven 3.2.3 or later.

### Configure Maven to Use the JBoss EAP Repositories

The quickstarts use artifacts located in the JBoss GA and Early Access repositories. You must configure Maven to use these repositories before you build and deploy the quickstarts. 

_Note:_ These instructions assume you are working with a released version of the quickstarts. If you are working with the quickstarts located in the GitHub master branch, follow the instructions located in the [Contributing Guide](CONTRIBUTING.md#configure-maven).

1. Locate the Maven install directory for your operating system. It is usually installed in `${user.home}/.m2/`. 

            For Linux or Mac:   ~/.m2/
            For Windows: "\Documents and Settings\USER_NAME\.m2\"  -or-  "\Users\USER_NAME\.m2\"

2. Copy the `settings.xml` file from the root of the quickstarts directory to your Maven install directory.
 
            For Linux or Mac:  cp QUICKSTART_HOME/settings.xml  ~/.m2/settings.xml
            For Windows: copy QUICKSTART_HOME/settings.xml "\Documents and Settings\USER_NAME\.m2\settings.xml"
                    -or- copy QUICKSTART_HOME/settings.xml "\Users\USER_NAME\.m2\settings.xml"

_Note:_ If you do not wish to configure the Maven settings, you must pass the configuration setting on every Maven command as follows: ` -s QUICKSTART_HOME/settings.xml`
            

Configure Maven - For Use with JBoss Developer Studio
-----------------------------------------------------

Maven is distributed with JBoss Developer Studio, so it is not necessary to install it separately. However, you must configure Maven for use by the Java EE Web Project wizard for deployments to JBoss Enterprise Application Server 6.x.

1. Start JBoss Developer Studio.
2. Choose menu option `Window` --> `Preferences`.
3. Expand `JBoss Tools` and select `JBoss Maven Integration`.
4. Keep the default selections and click the `Configure Maven Repositories...` button.
5. Click `Add Repository` to configure the `JBoss GA Tech Preview` Maven repository and complete the form as follows: 

        Profile
          Profile ID: jboss-ga-repository
        Repository
          ID:     jboss-ga-repository
          Name:   jboss-ga-repository
          URL:    http://maven.repository.redhat.com/techpreview/all/

    Also check the `Active by default` checkbox to enable the Maven repository. Then click `OK`.

5. Click `Add Repository` to configure the `JBoss Early Access` Maven repository and complete the form as follows: 

        Profile
          Profile ID: jboss-earlyaccess-repository
        Repository
          ID:     jboss-earlyaccess-repository
          Name:   jboss-earlyaccess-repository
          URL:    http://maven.repository.redhat.com/earlyaccess/all/

    Also check the `Active by default` checkbox to enable the Maven repository. Then click `OK`.

6. Review the newly added repositories and click `Finish`. You are prompted with the message "Are you sure you want to update the file 'MAVEN_HOME/settings.xml'?". Click `Yes` to update the settings. Click `OK` to close the dialog.

The JBoss EAP Maven repository is now configured for use with JBoss Developer Studio.JBoss Developer Studio configures the `MAVEN_HOME/settings.xml` file for you.


Use of Maven Profiles in POM Files
----------------------------------

Profiles are used by Maven to customize the build environment. The `pom.xml` in the root of some quickstart directories may define some of the following profiles.

_NOTE:_ Some profiles in this list may not be used by some product quickstart projects.

* The `default` profile defines the list of modules or quickstarts that require nothing but JBoss Enterprise Application Platform.
* The `requires-postgres` profile lists the quickstarts that require PostgreSQL to be running when the quickstart is deployed.
* The `complex-dependency` profile lists quickstarts that require manual configuration that can not be automated.
* The `requires-full` profile lists quickstarts the require you start the JBoss EAP server using the full profile.
* The `requires-xts` profile lists quickstarts the require you start the JBoss EAP server using the xts profile.
* The `non-maven` profile lists quickstarts that do not require Maven, for example, quickstarts that depend on deployment of other quickstarts or those that use other Frameworks such as Forge.
* The `functional-tests` profile lists quickstarts that provide functional tests.

[Back to top](#configure-maven-to-build-and-deploy-the-quickstarts)
