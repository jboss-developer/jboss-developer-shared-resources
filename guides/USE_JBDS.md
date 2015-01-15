Use Red Hat JBoss Developer Studio or Eclipse to Run the Quickstarts
============================================================

You can also deploy most of the quickstarts or run the Arquillian tests from Eclipse using JBoss tools. However, EJB Client currently has limited support in the Eclipse Web Tools Platform (WTP). For that reason, some quickstarts that ship with Red Hat JBoss Enterprise Application Platform are not supported in Red Hat JBoss Developer Studio.

For information on how to configure Maven and Red Hat JBoss Developer Studio for use with the quickstarts, see the [Getting Started Guide](https://access.redhat.com/site/documentation/en-US/JBoss_Enterprise_Application_Platform/6.3/html-single/Getting_Started_Guide/index.html "Getting Started Guide") for Red Hat JBoss Enterprise Application Platform. 

See [Get Started](http://www.jboss.org/get-started/ "Get Started") on the JBoss Developer web site for additional information.

_Note:_ You may see one or more of the following errors or warnings or when you import quickstart projects into Red Hat JBoss Developer Studio.

* **JPA Problem: No connection specified for project. No database-specific validation will be performed.**

    If the quickstart project uses JPA to access a database, you will see the following warning when you import the project into Eclipse. You can ignore this warning as it only applies to the local connection in the Eclipse development environment and does not affect the JBoss EAP runtime deployment. To eliminate this warning, you must configure the database connection in the Eclipse project settings.

* **Maven Configuration Problem: Project configuration is not up-to-date with pom.xml. Run Maven->Update Project or use Quick Fix.**

    This error can occur with quickstart projects that are composed of multiple subprojects. The import of a project on one thread may trigger Eclipse to refresh a project on another thread making the project state appear to be inconsistent. To resolve the errors, right-click on the parent project in JBoss Developer Studio and choose `Maven` --> `Update Project`. Make sure all the projects are selected and click `OK`. This should resolve the errors.

* **Maven Configuration Problem: Endorsed directory QUICKSTART_HOME/some-path/target/endorsed' is missing. You may need to a perform a Maven command line build in order to create it.**
   
    This error occurs if endorsed directories are defined in the `maven-compiler-plugin` configuration of the quickstart POM file. To resolve the error, right-click on error in the JBoss Developer Studio `Problems` window and choose `Quick Fix`. This opens a window with the fix `Run 'mvn process-sources' to execute dependency:copy` selected. Click `Finish` to resolve the error. For more information, see [JBoss Maven Integration](http://docs.jboss.org/tools/whatsnew/maven/maven-news-3.3.0.CR1.html).
    
* **XML Problem: Referenced file contains errors (jar:file:PATH-TO-jbdevstudio/studio/plugins/org.jboss.tools.as.catalog_3.0.0.Final-v20141016-1911-B95.jar!/schema/xsd/jboss-ejb3-2_0.xsd).  For more information, right click on the message in the Problems View and select "Show Details..."**

    This is a known issue. See https://issues.jboss.org/browse/JBIDE-18316
 
* **Knowledge Base Builder Problem: JBoss Tools Knowledge Base problem: Nature is not installed on required Java project jboss-ejb-throws-exception-ejb-api. Use Quick Fix to include artifacts declared in that project into Content Assistant and Validation.**
 
     Quickstarts that require Knowledge Base capabilities to be enabled on the project display this warning. To resolve it, right-click on the warning message in the in the JBoss Developer Studio `Problems` window and choose `Quick Fix`. This opens a window with the fix `Enable Knowledge Base capabilities on project <project-name>` selected. Make sure all projects are selected and click `Finish` to resolve the warning.

* **EJB Problem: An EJB module must contain one or more enterprise beans.** 
 
     Eclipse Web Tools Platform can not deploy simple JARs to the JBoss EAP server. For this reason, quickstarts subprojects that would normally deploy shared artifacts as JARs deploy them instead as EJB JARs. You can ignore this warning.
     

