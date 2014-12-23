Start the Red Hat JBoss Enterprise Application Platform Server
===========================

Before you deploy a quickstart using the Maven command line tool, in most cases you need a running Red Hat JBoss Enterprise Application Platform server. A few of the Arquillian tests do not require a running server. This will be noted in the README for that quickstart. 

The JBoss EAP server can be started the following ways.

* [Start the Default JBoss EAP Server](#start-the-default-jboss-eap-server): This is the default configuration. It defines minimal subsystems and services.
* [Start the JBoss EAP Server with the Full Profile](#start-the-jboss-eap-server-with-the-full-profile): This profile configures many of the commonly used subsystems and services.
* [Start the JBoss EAP Server with Custom Configuration Options](#start-the-jboss-eap-server-with-custom-configuration-options): Custom configuration parameters can be specified on the command line when starting the server.

The README for each quickstart specifies which configuration is required to run the example. 

A few [examples of commands to start the JBoss EAP server](#examples-of-commands-to-start-the-jboss-eap-server) are displayed at the end of this guide.

_NOTE: See [Use of EAP_HOME](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/USE_OF_EAP_HOME.md) for information about the JBoss EAP installation path._


Start the Default JBoss EAP Server
------------------------------

To start the default JBoss EAP server:

1. Open a terminal and navigate to the root of the JBoss EAP server directory.
2. The following shows the command to start the JBoss EAP server:

        For Linux:   EAP_HOME/bin/standalone.sh
        For Windows: EAP_HOME\bin\standalone.bat

Start the JBoss EAP Server with the Full Profile
------------------------------

To start JBoss EAP with the Full Profile:

1. Open a terminal and navigate to the root of the JBoss EAP server directory.
2. The following shows the command to start the JBoss EAP server with the full profile:

        For Linux:   EAP_HOME/bin/standalone.sh -c standalone-full.xml
        For Windows: EAP_HOME\bin\standalone.bat -c standalone-full.xml

Start the JBoss EAP Server with Custom Configuration Options
------------------------------

To start JBoss EAP with custom configuration options:

1. Open a terminal and navigate to the root of the JBoss EAP server directory.
2. The following shows the command to start the JBoss EAP server. Replace CUSTOM_OPTIONS with the custom optional parameters specified in the quickstart README file.

        For Linux:   EAP_HOME/bin/standalone.sh CUSTOM_OPTIONS
        For Windows: EAP_HOME\bin\standalone.bat CUSTOM_OPTIONS
       
   
Examples of Commands to Start the JBoss EAP Server
------------------------------

The following are a few examples of how to start the server with custom options:
   
   * Start the default server with a port offset of `100`:

        EAP_HOME/bin/standalone.sh -Djboss.socket.binding.port-offset=100

   * Start the server with the OSGI configuration option: 

        EAP_HOME/bin/standalone.sh  -c standalone-osgi.xml

   * Start the server with the XTS subsystem enabled:

        EAP_HOME/bin/standalone.sh --server-config=../../docs/examples/configs/standalone-xts.xml
 
   * Start the JBoss EAP server with the `full profile`, giving it the unique node ID `node1`:
   
        EAP_HOME/bin/standalone.sh -c standalone-full.xml -Djboss.tx.node.id=node1

