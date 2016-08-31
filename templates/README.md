OpenShift JBoss EAP Application Templates
===

The `jboss-openshift` [application templates repository](https://github.com/jboss-openshift/application-templates/tree/ose-v1.3.2/eap) defines build configurations for [binary type builds](https://docs.openshift.com/enterprise/3.2/dev_guide/builds.html#binary-source). These templates allow you to consume source code located on a local file system instead files hosted on a remote GitHub repository.

Follow these instructions to configure your OpenShift environment to use a quickstart located on your local file system.

1. Download and extract the JBoss EAP 7 quickstarts from the Customer Portal. For more information, see [Download the Quickstarts](https://access.redhat.com/documentation/en/red-hat-jboss-enterprise-application-platform/version-7.0/getting-started-guide/#download_the_quickstarts) in the _Getting Started Guide_ for JBoss EAP 7.
2. Navigate to the root directory of the downloaded `greeter` quickstart.
3. Follow the instructions to [Create the Secrets](https://github.com/jboss-developer/jboss-developer-shared-resources/blob/master/guides/DEPLOY_TO_OPENSHIFT_JBOSS_EAP7.md#create_the_secrets).
4. If necessary, create the necessary image streams.
5. Create the service account for the binary build by typing the following command in a terminal.

        oc create -f https://raw.githubusercontent.com/jboss-developer/jboss-developer-shared-resources/master/templates/eap70-postgresql-binary-s2i.json

6. Create the new OpenShift application.

        oc new-app --template=eap70-postgresql-binary-s2i -p \
        SOURCE_REPOSITORY_URL=https://github.com/josefkarasek/jboss-eap-quickstarts,\
        SOURCE_REPOSITORY_REF=7.1.x-develop,\
        CONTEXT_DIR=greeter,\
        DB_JNDI=java:jboss/datasources/GreeterQuickstartDS,\
        DB_DATABASE=USERS,\
        HTTPS_NAME=jboss,\
        HTTPS_PASSWORD=mykeystorepass,\
        JGROUPS_ENCRYPT_NAME=secret-key,\
        JGROUPS_ENCRYPT_PASSWORD=password

6. Binary type builds can not leverage any web hooks or triggers provided by the Git hosting infrastructure, so you must trigger the build manually by typing the following command in a terminal. Be sure to replace QUICKSTART_HOME with the path to your local `greeter` quickstart.

        oc start-build eap-app --QUICKSTART_HOME . --follow
