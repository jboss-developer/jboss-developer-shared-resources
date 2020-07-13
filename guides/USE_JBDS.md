# Use Red Hat Red Hat CodeReady Studio or Eclipse to Run the Quickstarts


You can deploy many of the quickstarts and run the Arquillian tests from Eclipse using JBoss tools. However, the EJB Client currently has limited support in the Eclipse Web Tools Platform (WTP). For that reason, some quickstarts that ship with Red Hat JBoss Enterprise Application Platform are not supported in Red Hat CodeReady Studio.

This guide includes the following information.

* [Where to Find Information](#where-to-find-information)
* [Important Special Instructions](#important-special-instructions)
* [Deploying and Undeploying Quickstarts and Running the Arquillian Tests](#deploying-and-undeploying-quickstarts-and-running-the-arquillian-tests)
    * [Deploy and Undeploy a Quickstart WAR Project](#deploy-and-undeploy-a-quickstart-war-project)
    * [Deploy and Undeploy a Quickstart EAR Project](#deploy-and-undeploy-a-quickstart-ear-project)
    * [Deploy and Undeploy a Quickstart Containing Server and Java Client Projects](#deploy-and-undeploy-a-quickstart-containing-server-and-java-client-projects)
    * [Deploy and Undeploy a Quickstart Consisting of Multiple Interdependent Projects](#deploy-and-undeploy-a-quickstart-consisting-of-multiple-interdependent-projects)
    * [Run a Quickstart's Arquillian Tests](#run-a-quickstarts-arquillian-tests)
* [Known Issues for JBoss EAP Quickstarts](#known-issues-for-jboss-eap-quickstarts)

## Where to Find Information

See [Setting Up the Development Environment](https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.3/html-single/development_guide/#setting_up_the_development_environment) in the _Development Guide_ for JBoss EAP for information about how to download and install  Red Hat CodeReady Studio and how to add the JBoss EAP server to the configuration.

For information about how to configure Maven and  Red Hat CodeReady Studio for use with the quickstarts, see [Configure Maven for Use with Red Hat Red Hat CodeReady Studio](https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.3/html-single/development_guide/#configure_maven_for_use_with_red_hat_jboss_developer_studio) in the _Development Guide_ for JBoss EAP.

For information about how to deploy and run the quickstarts and to run the Arquillian tests in Red Hat CodeReady Studio, see [Run the Quickstarts in Red Hat CodeReady Studio](https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.3/html-single/getting_started_guide/index#using_the_quickstart_examples) in the _Getting Started Guide_ for JBoss EAP.

For instructions to run the Arquillian tests using the Maven command line, see [Run the Arquillian Tests](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/RUN_ARQUILLIAN_TESTS.md#run-the-arquillian-tests).

See [Red Hat Red Hat CodeReady Studio](https://developers.redhat.com/products/codeready-studio/overview/ "Get Started") on the Red Hat Developer Program website for additional information.

## Important Special Instructions

1. Your quickstart project folder must be located outside of your IDE workspace. If your quickstart project folder is located within the IDE workspace when you import it into Red Hat CodeReady Studio, the IDE generates an invalid project name and an invalid WAR archive name. Be sure your quickstart project folder is located outside the IDE workspace before you begin!

2. Be sure to follow the instructions in the quickstart `README.md` file to add any required application users or make the appropriate server configuration changes.

3. More complex quickstarts may require special instructions to run properly in Red Hat CodeReady Studio. This document describes some of these special situations.

4. If you see errors or warnings when you import or run a quickstart, see the list of [Known Issues for JBoss EAP Quickstarts](#known-issues-for-jboss-eap-quickstarts) below for an explanation.

## Deploying and Undeploying Quickstarts and Running the Arquillian Tests

### Deploy and Undeploy a Quickstart WAR Project

For WAR projects, you simply deploy the project.

1. Right-click on the project, and choose `Run As` --> `Run on Server`.
2. Choose the server and click `Finish`.
3. This starts the server, deploys the application, and opens a browser window that accesses the running application.
4. To undeploy the project, right-click on the project and choose `Run As` --> `Maven build`. Enter `wildfly:undeploy` for the `Goals` and click `Run`.


### Deploy and Undeploy a Quickstart EAR Project

For EAR projects, you simply deploy the EAR subproject. The subproject name is usually appended with "-ear-ear".

1. Right-click on the EAR subproject, and choose `Run As` --> `Run on Server`.
2. Choose the server and click `Finish`.
3. This starts the server, deploys the application, and opens a browser window that accesses the running application.
4. To undeploy the project, right-click on the EAR subproject and choose `Run As` --> `Maven build`. Enter `wildfly:undeploy` for the `Goals` and click `Run`.

### Deploy and Undeploy a Quickstart Containing Server and Java Client Projects

You must deploy the server project before running the client. More detailed instructions be found in the `shopping-cart` quickstart.

1. Right-click on the server project and choose `Run As` --> `Run on Server`.
2. Right-click on the Java client project and choose `Run As` --> `Java Application`. In the `Select Java Application` window, choose the client class and click `OK`.
3. The client output displays in the `Console` window.
4. To undeploy the project, right-click on the server subproject and choose `Run As` --> `Maven build`. Enter `wildfly:undeploy` for the `Goals` and click `Run`.

### Deploy and Undeploy a Quickstart Consisting of Multiple Interdependent Projects

To deploy a quickstart that consists of multiple projects containing interdependencies on each other without opening a browser and running the application, use the following steps. More detailed instructions be found in the `inter-app` quickstart.

1. In the `Servers` tab, right-click on the JBoss EAP server and choose `Start`.
2. Deploy the projects in one of the following ways.
   * `Drag and Drop` mode: Click to multi-select the projects, then drag and drop them on the running JBoss EAP server. This deploys the projects to the server without opening the browser.
   * `Batch` mode: In the `Servers` tab, right-click on the server and choose `Add and Remove`. If the quickstart projects are the only projects in the list, click `Add All`. Otherwise, use multi-select to select them and click `Add`. Then click `Finish`.
3. Right-click on the individual projects and choose `Run As` --> `Run on Server`. A browser window appears that accesses the running application.
4. To undeploy the projects, right-click on the subprojects in the reverse order of how they were deployed, and choose `Run As` --> `Maven build`. Enter `wildfly:undeploy` for the `Goals` and click `Run`.


### Run a Quickstart's Arquillian Tests

You can run the Arquillian tests that are included with many of the JBoss EAP 7.3 quickstarts by following the steps below. See [Run the Arquillian Tests](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/RUN_ARQUILLIAN_TESTS.md#run-the-arquillian-tests) for more complete information about running the Arquillian tests and for instructions for older versions of the quickstarts.

1. In the `Servers` tab, right-click on the JBoss EAP server and choose `Start`.
2. Right-click on the quickstart project in the `Project Explorer` tab and choose `Run As` -> `Maven Build`.
3. Enter `clean verify -Parq-remote` in the `Goals` input field and click `Run`.

## Known Issues for JBoss EAP Quickstarts

You may see one or more of the following errors or warnings when you import quickstart projects into Red Hat CodeReady Studio.

* **JRE System Library Problem: Build path specifies execution environment JavaSE-1.6. There are no JREs installed in the workspace that are strictly compatible with this environment.**

    The JBoss EAP 6 quickstarts demonstrate Java EE 6 features and are built on Java SE 6. Red Hat CodeReady Studio requires Java 8 to run, but is still capable of launching runtimes with various versions of Java. You can ignore this warning, or you can install a JDK 6 on your machine and add it to the Eclipse Java Runtime Environment by choosing `Preferences` --> `Java` --> `Installed JREs`.

* **JPA Problem: No connection specified for project. No database-specific validation will be performed.**

    If the quickstart project uses JPA to access a database, you will see the following warning when you import the project into Eclipse. You can ignore this warning as it only applies to the local connection in the Eclipse development environment and does not affect the JBoss EAP runtime deployment. To eliminate this warning, you must configure the database connection in the Eclipse project settings.

* **Failed while installing JPA 2.0.   org.osgi.service.prefs.BackingStoreException: Resource '/PROJECT_NAME/SUBPROJECT_NAME/.settings' does not exist**

     This error can occur with quickstart projects that are composed of multiple subprojects. This is a known issue. See https://bugs.eclipse.org/bugs/show_bug.cgi?id=459810.

* **Maven Configuration Problem: Project configuration is not up-to-date with pom.xml. Run Maven->Update Project or use Quick Fix.**

      This error can occur with quickstart projects that are composed of multiple subprojects. The import of a project on one thread may trigger Eclipse to refresh a project on another thread making the project state appear to be inconsistent. To resolve the errors, right-click on the parent project in Red Hat CodeReady Studio and choose `Maven` --> `Update Project`. Make sure all the projects are selected and click `OK`. This should resolve the errors.

* **Maven Configuration Problem: Endorsed directory QUICKSTART_HOME/some-path/target/endorsed' is missing. You may need to a perform a Maven command line build in order to create it.**

    This error occurs if endorsed directories are defined in the `maven-compiler-plugin` configuration of the quickstart POM file. To resolve the error, right-click on error in the Red Hat CodeReady Studio `Problems` window and choose `Quick Fix`. This opens a window with the fix `Run 'mvn process-sources' to execute dependency:copy` selected. Click `Finish` to resolve the error. For more information, see [JBoss Maven Integration](http://docs.jboss.org/tools/whatsnew/maven/maven-news-3.3.0.CR1.html).

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

    You can ignore this error. This is a known Eclipse issue. See <https://bugs.eclipse.org/bugs/show_bug.cgi?id=415786>. To turn off WSDL validation in Red Hat CodeReady Studio, choose `Windows` --> `Preferences`, select `Validation`, find `WSDL Validator` in the list, and uncheck the `Manual` and `Build` selections.

* **WSDL Problem: WS-I: (BP2402) The wsdl:binding element does not use a soapbind:binding element as defined in section "3 SOAP Binding." of the WSDL 1.1 specification.**

    You can ignore this error. This is a known Eclipse issue. See <https://bugs.eclipse.org/bugs/show_bug.cgi?id=415786>. To turn off WSDL validation in Red Hat CodeReady Studio, choose `Windows` --> `Preferences`, select `Validation`, find `WSDL Validator` in the list, and uncheck the `Manual` and `Build` selections.

* **EJB Problem: An EJB module must contain one or more enterprise beans.**

     Eclipse Web Tools Platform (WTP) can not deploy simple JARs to the JBoss EAP server. For this reason, quickstart subprojects that would normally deploy shared artifacts as JARs deploy them instead as EJB JARs. You can ignore this warning.

* **Knowledge Base Builder Problem: JBoss Tools Knowledge Base problem: Nature is not installed on required Java project `<project-name>`. Use Quick Fix to include artifacts declared in that project into Content Assistant and Validation.**

     Quickstarts that require Knowledge Base capabilities to be enabled on the project display this warning. To resolve it, right-click on the warning message in the in the Red Hat CodeReady Studio `Problems` window and choose `Quick Fix`. This opens a window with the fix `Enable Knowledge Base capabilities on project <project-name>` selected. Make sure all projects are selected and click `Finish` to resolve the warning.

* **JPA Problem: Console configuration QUICKSTART_HOME does not exist. Hibernate specific validation and content assist will be limited.**

    This warning is intermittent and can occur with any quickstart project that uses Hibernate. This is a known issue. For more information, see <https://issues.jboss.org/browse/JBIDE-17483>.
