Use of EAP_HOME and JBOSS_HOME Variables
=============================

The developer guides and quickstart README files use the *replaceable* value `EAP_HOME` to denote the path to the Red Hat JBoss Enterprise Application Platform 7 installation. When you encounter this value in a README file or guide, be sure to replace it with the actual path to your JBoss EAP 7 installation. 

* If you installed JBoss EAP using the ZIP, the install directory is the path you specified when you ran the command.

* If you installed JBoss EAP using the RPM, the install directory is `/opt/rh/eap7/root/usr/share/wildfly/`.

* If you used the installer to install JBoss EAP, the default path for `EAP_HOME` is `${user.home}/jboss-eap-7.3/`. 

        For Linux: /home/USER_NAME/jboss-eap-7.3/
        For Windows: "C:\Users\USER_NAME\jboss-eap-7.3\"

* If you used the Red Hat CodeReady Studio installer to install and configure the JBoss EAP Server, the default path for `EAP_HOME` is `${user.home}/jboss-eap-7.3`.

        For Linux: /home/USER_NAME/jboss-eap-7.3/
        For Windows: "C:\Users\USER_NAME\jboss-eap-7.3\" or "C:\Documents and Settings\USER_NAME\jboss-eap-7.3\" 

The `JBOSS_HOME` *environment* variable, which is used in scripts, continues to work as it has in the past.



