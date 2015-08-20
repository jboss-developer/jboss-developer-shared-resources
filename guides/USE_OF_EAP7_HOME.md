Use of EAP7_HOME and JBOSS_HOME Variables
=============================

The developer guides and quickstart README files use the *replaceable* value `EAP7_HOME` to denote the path to the Red Hat JBoss Enterprise Application Platform 6 installation. When you encounter this value in a README file or guide, be sure to replace it with the actual path to your JBoss EAP 7 installation. 

* If you installed JBoss EAP using the ZIP, the install directory is the path you specified when you ran the command.

* If you installed JBoss EAP using the RPM, the install directory is `/var/lib/jbossas/`.

* If you used the installer to install JBoss EAP, the default path for `EAP7_HOME` is `${user.home}/EAP-7.0.0`. 

        For Linux: /home/USER_NAME/EAP-7.0.0/
        For Windows: "C:\Users\USER_NAME\EAP-7.0.0\"

* If you used the JBoss Developer Studio installer to install and configure the JBoss EAP Server, the default path for `EAP7_HOME` is `${user.home}/jbdevstudio/runtimes/jboss-eap`.

        For Linux: /home/USER_NAME/jbdevstudio/runtimes/jboss-eap/
        For Windows: "C:\Users\USER_NAME\jbdevstudio\runtimes\jboss-eap" or "C:\Documents and Settings\USER_NAME\jbdevstudio\runtimes\jboss-eap\" 

The `JBOSS_HOME` *environment* variable, which is used in scripts, continues to work as it has in the past.



