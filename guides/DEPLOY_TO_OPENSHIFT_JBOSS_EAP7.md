Deploy the JBoss EAP 7 Quickstarts to OpenShift
===============

If you have not yet done so, you must first configure your OpenShift environment to run the JBoss EAP quickstarts by following these instructions.

### Overview

Before you begin, be sure to review the [Red Hat xPaaS EAP Image](https://access.redhat.com/documentation/en/red-hat-xpaas/version-0/red-hat-xpaas-eap-image/) documentation for information about developing with the Red Hat Enterprise Application Platform Image. Then follow the steps in the sections below to configure your OpenShift environment.

* [Download and Configure the OpenShift Client Tools](#install_client_tools)
* [Configure Your OpenShift Environment](#configure_openshift)
* [Create Your Project and Install the Required Images](#create_your_project_and_install_required_images)
* [Create the Service Account](#create_the_service_account)
* [Create the Secrets](#create_the_secrets)
* [Deploy the Quickstart to OpenShift](#deploy_the_quickstart_to_openshift)
* [Access the Running Application](#access_the_running_application)


### <a name="install_client_tools"></a>Download and Configure the OpenShift Client Tools.

1. Download and upzip the [OpenShift Client Tools](https://github.com/openshift/origin/releases/latest) for your operating system.
2. Add the folder to your `PATH` environment variable.

    _Note: For Linux systems, if you prefer you can simply copy the `oc` executable to `/usr/local/bin/` directory._

3. Test the `oc` command by typing the following command in a terminal.

          $ oc version

4.  For more information about this tool, see the [OpenShift CLI Reference](https://docs.openshift.com/enterprise/latest/cli_reference/index.html).

### <a name="configure_openshift"></a>Configure Your OpenShift Environment

You can choose to configure and run OpenShift using any of the following methods.

* You can use the [Public Cloud - Openshift Public](#use_public)
* You can run OpenShift locally using the [Container Development Kit](#use_cdk)

#### <a name="use_public"></a>Use the OpenShift Public Cloud

1. [Register](https://api.preview.openshift.com) for the OpenShift Public offering.
2. When you receive your login information by email, go to the OpenShift Public [console](https://console.preview.openshift.com/console/).
3. Click the question mark (?) icon in the right upper corner of the console and select `Command Line Tools`.
4. Review your login token and run the `oc login --token=...` command.

#### <a name="use_cdk"></a>Use the Container Development Kit to Run OpenShift Locally


1. Install and configure the Container Development Kit (CDK).

  * Download the [Container Development Kit](http://developers.redhat.com/products/cdk/download/).
  * See the Red Hat Container Development Kit [Installation Guide](https://access.redhat.com/documentation/en/red-hat-container-development-kit/2.1/paged/installation-guide/) for instructions to configure and start the CDK.
  * Upon successful startup, the login credentials are printed to the terminal.

2. Log in to your OpenShift instance as `openshift-dev` by typing the following command in the terminal.

        $ oc login 10.1.2.2:8443 -u openshift-dev -p devel


### <a name="create_your_project_and_install_required_images"></a>Create Your Project and Install the Required Images

1. Create a new OpenShift [project](https://docs.openshift.com/enterprise/latest/architecture/core_concepts/projects_and_users.html#projects) project named `quickstart-project`.

        $ oc new-project quickstart-project

    _NOTE: You can review the existing projects using the following command._

        $ oc get project

2. If you are using a local OpenShift instance, you must install the JBoss EAP xPaaS image, the PostgreSQL image, and the `eap70-postgresql-s2i` template. If you are using OpenShift Public, skip to the next step.

    a. Install the JBoss EAP xPaaS image by copying and pasting the following text into a terminal.

        cat <<EOF | oc create -n quickstart-project -f -
        ---
          apiVersion: v1
          kind: ImageStream
          metadata:
            name: jboss-eap70-openshift
          spec:
            dockerImageRepository: registry.access.redhat.com/jboss-eap-7/eap70-openshift
        EOF

    b. Install the PostgreSQL image by copying and pasting the following text into a terminal. If you're using OpenShift Public, you can skip this step.

        cat <<EOF | oc create -n quickstart-project -f -
        ---
          apiVersion: v1
          kind: ImageStream
          metadata:
            name: postgresql
          spec:
            dockerImageRepository: registry.access.redhat.com/openshift3/postgresql-92-rhel7
        EOF

### <a name="create_the_service_account"></a>Create the Service Account

Install the `eap70-postgresql-s2i` template by typing the following command in a terminal.

        $ oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/eap/eap70-postgresql-s2i.json

### <a name="create_the_secrets"></a>Create the Secrets

OpenShift provides support for distributing secrets, such as SSL certificates, among running containers. Import a self-signed certificate that will be used for encrypting HTTPS/TLS traffic. Create a certificate to be imported by JBoss EAP during the startup process b typing the following command in a terminal.

        $ oc create -n quickstart-project -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/secrets/eap7-app-secret.json

_IMPORTANT: This self-signed, [base64 encoded certificate](https://github.com/jboss-openshift/application-templates/blob/ose-v1.3.3/secrets/eap7-app-secret.json#L35) was created using the  [Oracle keytool](https://docs.oracle.com/javase/8/docs/technotes/tools/windows/keytool.html). It is meant to demonstrate how to use a certificate stored in a Java keystore and is not secure!_


### <a name="deploy_the_quickstart_to_openshift"></a>Deploy the Quickstart to OpenShift

You are now ready to follow the quickstart instructions to configure and deploy your project to OpenShift.

1. Be sure you are still logged in to the OpenShift instance.

2. Create and deploy the quickstart to the OpenShift instance using one of the following methods. Be sure to replace `QUICKSTART_HOME`. `QUICKSTART_NAME`, and  `QUICKSTART_DS` with the values provided in the quickstart instructions.

   * Use the `oc process` command.

            oc process -v \
            SOURCE_REPOSITORY_URL=QUICKSTART_HOME,\
            SOURCE_REPOSITORY_REF=7.1.x-develop,\
            CONTEXT_DIR=QUICKSTART_NAME,\
            DB_JNDI=java:jboss/datasources/QUICKSTART_DS,\
            DB_DATABASE=USERS,\
            HTTPS_NAME=jboss,\
            HTTPS_PASSWORD=mykeystorepass,\
            JGROUPS_ENCRYPT_NAME=secret-key,\
            JGROUPS_ENCRYPT_PASSWORD=password,\
            IMAGE_STREAM_NAMESPACE=quickstart-project eap70-postgresql-s2i | oc create -f -

   * Use the `oc new-app` command.

            oc new-app --template=eap70-postgresql-s2i -p \
            SOURCE_REPOSITORY_URL=QUICKSTART_HOME,\
            SOURCE_REPOSITORY_REF=7.1.x-develop,\
            CONTEXT_DIR=QUICKSTART_NAME,\
            DB_JNDI=java:jboss/datasources/QUICKSTART_DS,\
            DB_DATABASE=USERS,\
            HTTPS_NAME=jboss,\
            HTTPS_PASSWORD=mykeystorepass,\
            JGROUPS_ENCRYPT_NAME=secret-key,\
            JGROUPS_ENCRYPT_PASSWORD=password,\
            IMAGE_STREAM_NAMESPACE=quickstart-project

3. Wait for the build to finish. Check the status and view the logs using the following commands.

   * View the status of the containers.

            $ oc get pods -w

  * View the build logs. Replace `POD_NAME` with the name of the pod that displays in the previous command. In most cases, it is something similar to `eap-app-1-build` or `eap-app-1-06s0v`.

          $ oc logs -f POD_NAME

  * The log should display the following message when build has finished and the JBoss EAP server startup has completed.

          INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0025: JBoss EAP 7.0.0.GA (WildFly Core 2.1.2.Final-redhat-1) started in 26285ms - Started 542 of 866 services (513 services are lazy, passive or on-demand)

4. When the build completes, you are ready to access the running appliction.

### <a name="access_the_running_application"></a>Access the Running Application

You can access the application by using the OpenShift web console or by finding the URL using using`oc` tool.

#### Access the Application Using the OpenShift Web Console

1. Using a browser, access the OpenShift web console using the URL provided when you configured and started Openshift.

2. Click on the *quickstart-project* link.

3. On the left side of the page, click on *Browse*, then choose *Routes*. You should see something similar to the following.

    | **Name** | **Hostname** | **Routes To** | **Target Port** | **TLS Termination** |
    |:----|:--------|:-----|:-----------|:---------------|
    | eap-app | eap-app-sample-project.router.default.svc.cluster.local | eap-app | | |
    | secure-eap-app | secure-eap-app-sample-project.router.default.svc.cluster.local | secure-eap-app | | |

  Because we used a self-signed certificate, there are two routes available for this application, one unsecured `http` and one `https` secured.

4. Click on the secure *Hostname* link to access the running application, for example, `secure-eap-app-sample-project.router.default.svc.cluster.local`. Be sure to accept the self-signed certificate as trusted in your browser.

#### Access the Application Using the OpenShift Client Tool

1. Type the following command in a terminal.

        $ oc get route

2. You should see something like the following.

    | **NAME** | **HOST/PORT** | **PATH** | **SERVICE** | **TERMINATION** | **LABELS** |
    |:----|:--------|:-----|:-----------|:---------------|:-----|
    | eap-app | eap-app-sample-project.router.default.svc.cluster.local | | eap-app | | application=eap-app,template=eap70-postgresql-s2i,xpaas=1.3.2 |
    | secure-eap-app | secure-eap-app-sample-project.router.default.svc.cluster.local | | secure-eap-app | passthrough | application=eap-app,template=eap70-postgresql-s2i,xpaas=1.3.2 |

3. Copy the service address for the `secure-eap-app`, prefix it with `https://`, and paste it into a browser, for example:

      https://secure-eap-app-sample-project.router.default.svc.cluster.local
