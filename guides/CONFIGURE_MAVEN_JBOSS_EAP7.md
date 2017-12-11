Configure Maven to Build and Deploy the Quickstarts
===============

Overview
--------

The artifacts and dependencies needed to build and deploy applications to Red Hat JBoss Enterprise Application Platform 7 are hosted in public repositories. JBoss EAP 6 required that you configure your Maven `settings.xml` file to use those repositories when building the quickstarts. In JBoss EAP 7, this has changed. Maven is now configured in the quickstart project POM files. This method of configuration is provided to make it easier to get started with the quickstarts, however, is generally not recommended for production projects because it can slow down your build. You may even end up with artifacts that are not from the expected repository.  For more information, see the [Product Documentation](https://access.redhat.com/documentation/en/jboss-enterprise-application-platform/) for Red Hat JBoss Enterprise Application Platform.

You can skip these instructions if you meet one of the following criteria:

* You plan to use Maven command line and have already installed Maven 3.2.0 or later. In this case, you should already be configured to build and deploy the quickstarts.
* You plan to use Red Hat JBoss Developer Studio 9.1 or later to build and deploy the quickstarts. These IDEs embed Maven 3.2.1 so you do not need to install it separately.

Some common profiles are defined and may be used in some quickstart POM files. These profiles are described here: [Use of Maven Profiles in POM Files](#use-of-maven-profiles-in-pom-files)

Download and Install Maven
--------------------------

If you plan to use the command line and have not yet done so, you must download and install Maven 3.2.0 or later.

1. Go to [Apache Maven Project - Download Maven](http://maven.apache.org/download.html) and download the latest distribution for your operating system.
2. See the Maven documentation for information on how to download and install Apache Maven for your operating system.
 
_IMPORTANT_: There is a known issue with the checkstyle plugin for Maven versions 3.2.1 through 3.3.3 that results in build failure if you attempt to build the quicktarts using the `mvn install` command. You can disable the checkstyle plugin by adding the `-Dcheckstyle.skip=true` argument on the command line, for example: `mvn clean install -Dcheckstyle.skip=true`. The checkstyle plugin is not an issue if you run with Maven 3.3.9 or later. For more information, see [JBEAP-13943](https://issues.jboss.org/browse/JBEAP-13943).

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
