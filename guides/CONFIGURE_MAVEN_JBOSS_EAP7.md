Configure Maven to Build and Deploy the Quickstarts
===============

Overview
--------

The artifacts and dependencies needed to build and deploy applications to Red Hat JBoss Enterprise Application Platform 7 are hosted in public repositories. JBoss EAP 6 required that you configure your Maven `settings.xml` file to use those repositories when building the quickstarts. In JBoss EAP 7, this has changed. Maven is now configured in the quickstart project POM files. This method of configuration is provided to make it easier to get started with the quickstarts, however, is generally not recommended for production projects because it can slow down your build. You may even end up with artifacts that are not from the expected repository.  For more information, see the [Product Documentation](https://access.redhat.com/documentation/en/jboss-enterprise-application-platform/) for Red Hat JBoss Enterprise Application Platform.

You can skip these instructions if you meet one of the following criteria:

* You plan to use Maven command line and have already installed Maven 3.1.1 or later. In this case, you should already be configured to build and deploy the quickstarts. If you installed Maven 3.2.2, you must update to Maven 3.2.3 or later. The reasons are described later under [Download and Install Maven](#download-and-install-maven).
* You plan to use Red Hat JBoss Developer Studio (8 or above) to build and deploy the quickstarts. These IDEs embed Maven 3.2.1 so you do not need to install it separately. If you plan to use JBoss Developer Studio 7.1.1, you must download and install a newer version of Maven and replace the embedded version of Maven.

Some common profiles are defined and may be used in some quickstart POM files. These profiles are described here: [Use of Maven Profiles in POM Files](#use-of-maven-profiles-in-pom-files)

Download and Install Maven
--------------------------

If you have not yet done so, you must download and install Maven.

1. Go to [Apache Maven Project - Download Maven](http://maven.apache.org/download.html) and download the latest distribution for your operating system.
2. See the Maven documentation for information on how to download and install Apache Maven for your operating system.

_Note:_ Maven 3.2.2 introduced a bug that breaks resolution of the JBoss EAP BOM dependencies because it ignores additional repositories during artifact resolution. For more information about this bug, see <https://jira.codehaus.org/browse/MNG-5663>. Be sure to use Maven 3.2.3 or later.
           

Configure the IDE to Use the Updated Maven
--------------------------

If you plan to use JBoss Developer Studio 7.1.1, follow this procedure to replace the embedded 3.0.4 version of Maven with the 3.2.3 or later version installed in the previous section.

 
Maven is distributed with JBoss Developer Studio, so it is not necessary to install it separately. However, you must configure Maven for use by the Java EE Web Project wizard for deployments to Red Hat JBoss Enterprise Application Platform 7.

1. From the menu, choose `Window` --> `Preferences`.
2. Expand `Maven` and click on `Installations`.
3. Uncheck `Embedded (3.0.4/1.4.0.20130531-2315)`
4. Click `Add` and navigate to your Maven install directory. Select it and click `OK`.
5. Be sure the new external Maven installation is checked and click `OK` to return to JBoss Developer Studio.


Use of Maven Profiles in POM Files
----------------------------------

Profiles are used by Maven to customize the build environment. The `pom.xml` in the root of some quickstart directories may define some of the following profiles.

_NOTE:_ Some profiles in this list may not be used by some product quickstart projects.

* The `default` profile defines the list of modules or quickstarts that require nothing but Red Hat JBoss Enterprise Application Platform.
* The `requires-postgres` profile lists the quickstarts that require PostgreSQL to be running when the quickstart is deployed.
* The `complex-dependency` profile lists quickstarts that require manual configuration that can not be automated.
* The `requires-full` profile lists quickstarts the require you start the JBoss EAP server using the full profile.
* The `requires-xts` profile lists quickstarts the require you start the JBoss EAP server using the xts profile.
* The `non-maven` profile lists quickstarts that do not require Maven, for example, quickstarts that depend on deployment of other quickstarts or those that use other Frameworks such as Forge.
* The `functional-tests` profile lists quickstarts that provide functional tests.

[Back to top](#configure-maven-to-build-and-deploy-the-quickstarts)
