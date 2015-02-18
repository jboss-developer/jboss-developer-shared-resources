Use Red Hat JBoss Developer Studio or Eclipse to Run the Quickstarts
============================================================

You can also deploy many of the quickstarts and run the Arquillian tests from Eclipse using JBoss tools. However, EJB Client currently has limited support in the Eclipse Web Tools Platform (WTP). For that reason, some quickstarts that ship with Red Hat JBoss Enterprise Application Platform are not supported in Red Hat JBoss Developer Studio.

For information on how to configure Maven and Red Hat JBoss Developer Studio for use with the quickstarts, see [Run the Quickstarts in Red Hat JBoss Developer Studio](https://access.redhat.com/documentation/en-US/JBoss_Enterprise_Application_Platform/6.4/html-single/Getting_Started_Guide/index.html#Run_the_Quickstarts_in_JBoss_Developer_Studio1 "Run the Quickstarts in Red Hat JBoss Developer Studio") in the _Getting Started Guide_ for Red Hat JBoss Enterprise Application Platform. 

See [Get Started](http://www.jboss.org/get-started/ "Get Started") on the JBoss Developer web site for additional information.

_Note:_ You may see one or more of the following errors or warnings when you import quickstart projects into Red Hat JBoss Developer Studio.

* **JPA Problem: No connection specified for project. No database-specific validation will be performed.**

    If the quickstart project uses JPA to access a database, you will see the following warning when you import the project into Eclipse. You can ignore this warning as it only applies to the local connection in the Eclipse development environment and does not affect the JBoss EAP runtime deployment. To eliminate this warning, you must configure the database connection in the Eclipse project settings.

* **Failed while installing JPA 2.0.   org.osgi.service.prefs.BackingStoreException: Resource '/PROJECT_NAME/SUBPROJECT_NAME/.settings' does not exist**

     This error can occur with quickstart projects that are composed of multiple subprojects. This is a known issue. See https://bugs.eclipse.org/bugs/show_bug.cgi?id=459810.

* **Maven Configuration Problem: Project configuration is not up-to-date with pom.xml. Run Maven->Update Project or use Quick Fix.**

    This error can occur with quickstart projects that are composed of multiple subprojects. The import of a project on one thread may trigger Eclipse to refresh a project on another thread making the project state appear to be inconsistent. To resolve the errors, right-click on the parent project in JBoss Developer Studio and choose `Maven` --> `Update Project`. Make sure all the projects are selected and click `OK`. This should resolve the errors.

* **Maven Configuration Problem: Endorsed directory QUICKSTART_HOME/some-path/target/endorsed' is missing. You may need to a perform a Maven command line build in order to create it.**
   
    This error occurs if endorsed directories are defined in the `maven-compiler-plugin` configuration of the quickstart POM file. To resolve the error, right-click on error in the JBoss Developer Studio `Problems` window and choose `Quick Fix`. This opens a window with the fix `Run 'mvn process-sources' to execute dependency:copy` selected. Click `Finish` to resolve the error. For more information, see [JBoss Maven Integration](http://docs.jboss.org/tools/whatsnew/maven/maven-news-3.3.0.CR1.html).
    
* **XML Problem: Referenced file contains errors (jar:file:PATH-TO-jbdevstudio/studio/plugins/org.jboss.tools.as.catalog_3.0.0.Final-v20141016-1911-B95.jar!/schema/xsd/jboss-ejb3-2_0.xsd).  For more information, right click on the message in the Problems View and select "Show Details..."**

    You can ignore this error. This is a known issue. See <https://issues.jboss.org/browse/JBIDE-18316>.

* **XML Problem: Referenced file contains errors (jar:file:/home/sgilda/tools/jbdevstudio/studio/plugins/org.jboss.tools.as.catalog_3.0.1.Final-v20141209-0156-B106.jar!/schema/xsd/jboss-ejb3-spec-2_0.xsd).  For more information, right click on the message in the Problems View and select "Show Details..."**

    You can ignore this error. This is a known issue. See <https://issues.jboss.org/browse/JBIDE-18316>.

* **XML Problem: cvc-complex-type.2.4.a: Invalid content was found starting with element 'iiop:iiop'. One of '{"http://java.sun.com/xml/ns/javaee":security-role, "http://java.sun.com/xml/ns/javaee":method-permission, "http://java.sun.com/xml/ns/javaee":container-transaction, "http://java.sun.com/xml/ns/javaee":interceptor-binding, "http://java.sun.com/xml/ns/javaee":message-destination, "http://java.sun.com/xml/ns/javaee":exclude-list, "http://java.sun.com/xml/ns/javaee":application-exception, "http://java.sun.com/xml/ns/javaee":assembly-descriptor-entry}' is expected.**

    You can ignore this error. This is a known issue. See <https://bugzilla.redhat.com/show_bug.cgi?id=901186> and <https://bugzilla.redhat.com/show_bug.cgi?id=1192591>.
 
* **XML Problem: Referenced file contains errors (jar:file:/home/sgilda/tools/jbdevstudio/studio/plugins/org.jboss.tools.as.catalog_3.0.1.Final-v20141209-0156-B106.jar!/schema/xsd/jboss-ejb3-spec-2_0.xsd).  For more information, right click on the message in the Problems View and select "Show Details..."**

    You can ignore this error. This is a known issue. See <https://bugzilla.redhat.com/show_bug.cgi?id=1193543>.
 
* **WSDL Problem: WS-I: (AP2901) A description uses neither the WSDL MIME Binding as described in WSDL 1.1 Section 5 nor WSDL SOAP binding as described in WSDL 1.1 Section 3 on each of the wsdl:input or wsdl:output elements of a wsdl:binding.**

    You can ignore this error. This is a known Eclipse issue. See <https://bugs.eclipse.org/bugs/show_bug.cgi?id=415786>. To turn off WSDL validation in JBoss Developer Studio, choose `Windows` --> `Preferences`, select `Validation`, find `WSDL Validator` in the list, and uncheck the `Manual` and `Build` selections.

* **WSDL Problem: WS-I: (BP2402) The wsdl:binding element does not use a soapbind:binding element as defined in section "3 SOAP Binding." of the WSDL 1.1 specification.**

    You can ignore this error. This is a known Eclipse issue. See <https://bugs.eclipse.org/bugs/show_bug.cgi?id=415786>. To turn off WSDL validation in JBoss Developer Studio, choose `Windows` --> `Preferences`, select `Validation`, find `WSDL Validator` in the list, and uncheck the `Manual` and `Build` selections.

* **EJB Problem: An EJB module must contain one or more enterprise beans.** 
 
     Eclipse Web Tools Platform can not deploy simple JARs to the JBoss EAP server. For this reason, quickstart subprojects that would normally deploy shared artifacts as JARs deploy them instead as EJB JARs. You can ignore this warning.

* **Knowledge Base Builder Problem: JBoss Tools Knowledge Base problem: Nature is not installed on required Java project jboss-ejb-throws-exception-ejb-api. Use Quick Fix to include artifacts declared in that project into Content Assistant and Validation.**
 
     Quickstarts that require Knowledge Base capabilities to be enabled on the project display this warning. To resolve it, right-click on the warning message in the in the JBoss Developer Studio `Problems` window and choose `Quick Fix`. This opens a window with the fix `Enable Knowledge Base capabilities on project <project-name>` selected. Make sure all projects are selected and click `Finish` to resolve the warning.


