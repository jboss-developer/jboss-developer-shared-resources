Use Red Hat JBoss Developer Studio or Eclipse to Run the Quickstarts
============================================================

You can also deploy the quickstarts or run the Arquillian tests from Eclipse using JBoss tools. 

For information on how to configure Maven and Red Hat JBoss Developer Studio for use with the quickstarts, see the [Getting Started Guide](https://access.redhat.com/site/documentation/en-US/JBoss_Enterprise_Application_Platform/6.3/html-single/Getting_Started_Guide/index.html "Getting Started Guide") for Red Hat JBoss Enterprise Application Platform. 

See [Get Started](http://www.jboss.org/get-started/ "Get Started") on the JBoss Developer web site for additional information.

_Note:_ You may see one or more of the following errors or warnings or when you import quickstart projects into Red Hat JBoss Developer Studio.

* JPA Problem: No connection specified for project. No database-specific validation will be performed.

    If the quickstart project uses JPA to access a database, you will see the following warning when you import the project into Eclipse. You can ignore this warning as it only applies to the local connection in the Eclipse development environment and does not affect the JBoss EAP runtime deployment. To eliminate this warning, you must configure the database connection in the Eclipse project settings.

* Maven Configuration Problem: Project configuration is not up-to-date with pom.xml. Run Maven->Update Project or use Quick Fix.

    This error can occur with quickstart projects that are composed of multiple subprojects. The import of a project on one thread may trigger Eclipse to refresh a project on another thread making the project state appear to be inconsistent. To resolve the errors, right-click on the parent project in JBoss Developer Studio and choose `Maven` --> `Update Project`. Make sure all the projects are selected and click `OK`. This should resolve the errors.

