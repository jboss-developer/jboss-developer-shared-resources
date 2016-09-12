Use Red Hat JBoss Developer Studio or Eclipse to Run the Quickstarts
============================================================

You can also deploy many of the quickstarts and run the Arquillian tests from Eclipse using JBoss tools. However, EJB Client currently has limited support in the Eclipse Web Tools Platform (WTP). For that reason, some quickstarts that ship with Red Hat JBoss Enterprise Application Platform are not supported in Red Hat JBoss Developer Studio.

For information on how to configure Maven and Red Hat JBoss Developer Studio for use with the quickstarts, see the _Getting Started Guide_ in the [Product Documentation](https://access.redhat.com/documentation/en/jboss-enterprise-application-platform/) for Red Hat JBoss Enterprise Application Platform.

See [Get Started](http://www.jboss.org/get-started/ "Get Started") on the JBoss Developer web site for additional information.

Important Special Instructions
------------

1. Your quickstart project folder must be located outside of your ID workspace. If your quickstart project folder is located within the IDE workspace when you import it into Red Hat JBoss Developer Studio, the IDE generates an invalid project name and an invalid WAR archive name. Be sure your quickstart project folder is located outside the IDE workspace before you begin!

2. Be sure to follow the instructions in the quickstart `README.md` file to add any required application users or make the appropriate server configuration changes.

3. More complex quickstarts may require special instructions to run properly in JBoss Developer Studio. This document describes some of these special situations.

4. If you see errors or warnings when you import or run a quickstart, see the list of [Known Issues for JBoss EAP Quickstarts](#known-issues-for-jboss-eap-quickstarts) below for an explanation.

### Quickstarts Containing an EAR

For EAR projects, you simply deploy the EAR subproject. The subproject name is usually appended with "-ear-ear".

1. Right-click on the EAR subproject, and choose `Run As` --> `Run on Server`.
2. Choose the server and click `Finish`.
3. This starts the server, deploys the application, and opens a browser window that accesses the running application.

### Quickstarts Containing a Server and Java Client

You must deploy the server project before running the client. More detailed instructions be found in the `shopping-cart` quickstart.

1. In the `Servers` tab, right-click on the JBoss EAP server and choose `Start`.
2. Right-click on the server project and choose `Run As` --> `Run on Server`.
3. Right-click on the Java client project and choose `Run As` --> `Java Application`. In the `Select Java Application` window, choose the client class and click `OK`.
4. The client output displays in the `Console` window.

### Quickstarts Consisting of Multiple Interdependent Projects

To deploy a quickstart that consists of multiple projects containing interdependencies on each other without opening a browser and running the application, use the following steps. More detailed instructions be found in the `inter-app` quickstart.

1. In the `Servers` tab, right-click on the JBoss EAP server and choose `Start`.
2. Deploy the projects in one of the following ways.
   * `Drag and Drop` mode: Click to multi-select the projects, then drag and drop them on the running JBoss EAP server. This deploys the projects to the server without opening the browser.
   * `Batch` mode: In the `Servers` tab, right-click on the server and choose `Add and Remove`. If the quickstart projects are the only projects in the list, click `Add All`. Otherwise, use multi-select to select them and click `Add`. Then click `Finish`.
3. Right-click on the individual projects and choose `Run As` --> `Run on Server`. A browser window appears that accesses the running application.


Known Issues for JBoss EAP Quickstarts
------------

You may see one or more of the following errors or warnings when you import quickstart projects into Red Hat JBoss Developer Studio.

* **JRE System Library Problem: Build path specifies execution environment JavaSE-1.6. There are no JREs installed in the workspace that are strictly compatible with this environment.**

    The JBoss EAP 6 quickstarts demonstrate Java EE 6 features and are built on Java SE 6. JBoss Developer Studio requires Java 8 to run, but is still capable of launching runtimes with various versions of Java. You can ignore this warning, or you can install a JDK 6 on your machine and add it to the Eclipse Java Runtime Environment by choosing `Preferences` --> `Java` --> `Installed JREs`.

* **JPA Problem: No connection specified for project. No database-specific validation will be performed.**

    If the quickstart project uses JPA to access a database, you will see the following warning when you import the project into Eclipse. You can ignore this warning as it only applies to the local connection in the Eclipse development environment and does not affect the JBoss EAP runtime deployment. To eliminate this warning, you must configure the database connection in the Eclipse project settings.

* **Failed while installing JPA 2.0.   org.osgi.service.prefs.BackingStoreException: Resource '/PROJECT_NAME/SUBPROJECT_NAME/.settings' does not exist**

     This error can occur with quickstart projects that are composed of multiple subprojects. This is a known issue. See https://bugs.eclipse.org/bugs/show_bug.cgi?id=459810.

* **Maven Configuration Problem: Project configuration is not up-to-date with pom.xml. Run Maven->Update Project or use Quick Fix.**

      This error can occur with quickstart projects that are composed of multiple subprojects. The import of a project on one thread may trigger Eclipse to refresh a project on another thread making the project state appear to be inconsistent. To resolve the errors, right-click on the parent project in JBoss Developer Studio and choose `Maven` --> `Update Project`. Make sure all the projects are selected and click `OK`. This should resolve the errors.

* **Maven Configuration Problem: Endorsed directory QUICKSTART_HOME/some-path/target/endorsed' is missing. You may need to a perform a Maven command line build in order to create it.**

    This error occurs if endorsed directories are defined in the `maven-compiler-plugin` configuration of the quickstart POM file. To resolve the error, right-click on error in the JBoss Developer Studio `Problems` window and choose `Quick Fix`. This opens a window with the fix `Run 'mvn process-sources' to execute dependency:copy` selected. Click `Finish` to resolve the error. For more information, see [JBoss Maven Integration](http://docs.jboss.org/tools/whatsnew/maven/maven-news-3.3.0.CR1.html).

* **Maven pom Loading Problem: Overriding managed version 1.0.2.Final for wildfly-maven-plugin pom.xml.**

    You can ignore this m2e warning. It can occur in child projects where the dependency versions are defined in the parent POM file. For more information, see [Bug 346725 - "Overriding managed version" in pom.xml should not be a warning severity ](https://bugs.eclipse.org/bugs/show_bug.cgi?id=346725).

* **XML Problem: Referenced file contains errors (jar:file:PATH-TO-jbdevstudio/studio/plugins/org.jboss.tools.as.catalog_3.0.0.Final-v20141016-1911-B95.jar!/schema/xsd/jboss-ejb3-2_0.xsd).  For more information, right click on the message in the Problems View and select "Show Details..."**

    You can ignore this error. This is a known issue with the `jboss-ejb3-spec-2_0.xsd` schema file. See <https://bugzilla.redhat.com/show_bug.cgi?id=1193543>.

* **XML Problem: Referenced file contains errors (jar:file:/PATH-TO-jbdevstudio/studio/plugins/org.jboss.tools.as.catalog_3.0.1.Final-v20141209-0156-B106.jar!/schema/xsd/jboss-ejb3-spec-2_0.xsd).  For more information, right click on the message in the Problems View and select "Show Details..."**

    You can ignore this error. This is a known issue with the `jboss-ejb3-spec-2_0.xsd` schema file. See <https://bugzilla.redhat.com/show_bug.cgi?id=1193543>.

* **XML Problem: cvc-complex-type.2.4.a: Invalid content was found starting with element 'iiop:iiop'. One of '{"http://java.sun.com/xml/ns/javaee":security-role, "http://java.sun.com/xml/ns/javaee":method-permission, "http://java.sun.com/xml/ns/javaee":container-transaction, "http://java.sun.com/xml/ns/javaee":interceptor-binding, "http://java.sun.com/xml/ns/javaee":message-destination, "http://java.sun.com/xml/ns/javaee":exclude-list, "http://java.sun.com/xml/ns/javaee":application-exception, "http://java.sun.com/xml/ns/javaee":assembly-descriptor-entry}' is expected.**

    You can ignore this error. This is a known issue with the ` jboss-ejb-iiop_1_0.xsd` schema file. See <https://bugzilla.redhat.com/show_bug.cgi?id=901186> and <https://bugzilla.redhat.com/show_bug.cgi?id=1192591>.

* **XML Problem: cvc-complex-type.2.4.a: Invalid content was found starting with element 'iiop:binding-name'. One of '{"urn:iiop":ejb-name}' is expected.**

    You can ignore this error. This is a known issue with the ` jboss-ejb-iiop_1_0.xsd` schema file. See <https://bugzilla.redhat.com/show_bug.cgi?id=901186> and <https://bugzilla.redhat.com/show_bug.cgi?id=1192591>.

* **XML Problem: cvc-complex-type.2.4.a: Invalid content was found starting with element 'jee:interceptor-binding'. One of '{"http://java.sun.com/xml/ns/javaee":description, "http://java.sun.com/xml/ns/javaee":ejb-name}' is expected.**

    You can ignore this error. This is a known issue with the `jboss-ejb-container-interceptors_1_0.xsd` schema file. See <https://issues.jboss.org/browse/WFLY-4365>.

* **WSDL Problem: WS-I: (AP2901) A description uses neither the WSDL MIME Binding as described in WSDL 1.1 Section 5 nor WSDL SOAP binding as described in WSDL 1.1 Section 3 on each of the wsdl:input or wsdl:output elements of a wsdl:binding.**

    You can ignore this error. This is a known Eclipse issue. See <https://bugs.eclipse.org/bugs/show_bug.cgi?id=415786>. To turn off WSDL validation in JBoss Developer Studio, choose `Windows` --> `Preferences`, select `Validation`, find `WSDL Validator` in the list, and uncheck the `Manual` and `Build` selections.

* **WSDL Problem: WS-I: (BP2402) The wsdl:binding element does not use a soapbind:binding element as defined in section "3 SOAP Binding." of the WSDL 1.1 specification.**

    You can ignore this error. This is a known Eclipse issue. See <https://bugs.eclipse.org/bugs/show_bug.cgi?id=415786>. To turn off WSDL validation in JBoss Developer Studio, choose `Windows` --> `Preferences`, select `Validation`, find `WSDL Validator` in the list, and uncheck the `Manual` and `Build` selections.

* **EJB Problem: An EJB module must contain one or more enterprise beans.**

     Eclipse Web Tools Platform (WTP) can not deploy simple JARs to the JBoss EAP server. For this reason, quickstart subprojects that would normally deploy shared artifacts as JARs deploy them instead as EJB JARs. You can ignore this warning.

* **Knowledge Base Builder Problem: JBoss Tools Knowledge Base problem: Nature is not installed on required Java project `<project-name>`. Use Quick Fix to include artifacts declared in that project into Content Assistant and Validation.**

     Quickstarts that require Knowledge Base capabilities to be enabled on the project display this warning. To resolve it, right-click on the warning message in the in the JBoss Developer Studio `Problems` window and choose `Quick Fix`. This opens a window with the fix `Enable Knowledge Base capabilities on project <project-name>` selected. Make sure all projects are selected and click `Finish` to resolve the warning.

* **JPA Problem: Console configuration QUICKSTART_HOME does not exist. Hibernate specific validation and content assist will be limited.**

    This warning is intermittent and can occur with any quickstart project that uses Hibernate. This is a known issue. For more information, see <https://issues.jboss.org/browse/JBIDE-17483>.
