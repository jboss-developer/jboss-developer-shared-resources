Configure Your OpenShift Environment
===============
If you have not yet done so, you must first configure your OpenShift environment to run the JBoss EAP quickstarts by following these instructions. Choose one of the following:

1. [Locally - Container Development Kit](#install_cdk)
2. [Locally - on Docker enabled machines you can use the oc binary tool to run Openshift cluster on your computer](#install_oc)
3. [Public cloud - Openshift Public](#public)

### General information
1. Review the [Red Hat xPaaS EAP Image](https://access.redhat.com/documentation/en/red-hat-xpaas/version-0/red-hat-xpaas-eap-image/) documentation for information about developing with the Red Hat Enterprise Application Platform Image.

2. Download and configure the OpenShift Client Tools.

  * Download and upzip the [OpenShift Client Tools](https://github.com/openshift/origin/releases/latest) for your operating system.
  * Add the folder to your `PATH` environment variable.

    _Note: For Linux systems, if you prefer, you can copy the `oc` executable to `/usr/local/bin`._

  * Test the `oc` command by typing the following command in a terminal.

          $ oc version

### <a name="install_cdk"></a>Instructions for installing Container Development Kit
1. Install and configure the Container Development Kit (CDK).

    * Download the [Container Development Kit](http://developers.redhat.com/products/cdk/download/).
    * For configuration instructions, see the Red Hat Container Development Kit [Installation Guide](https://access.redhat.com/documentation/en/red-hat-container-development-kit/2.1/paged/installation-guide/).
    * After successful startup login credentials get printed in the terminal

2. Log in to your OpenShift instance as `openshift-dev` by typing the following command in the terminal.

        $ oc login 10.1.2.2:8443 -u openshift-dev -p devel

### <a name="install_oc"></a>Instructions for installing OpenShift using the oc binary tool
1. On Docker enabled machine use the [oc binary tool](https://docs.openshift.com/enterprise/latest/cli_reference/index.html) and explore its capabilities for running local OpenShift cluster:

        $ oc cluster up --help

2. Create the cluster by running:

        $ oc cluster up
After successful startup login credentials get printed in the terminal.

3. The `oc` tool has also logged you in as the `developer` user.

### <a name="public"></a>Instructions for using OpenShift Public
1. [Register](https://api.preview.openshift.com) for the OpenShift Public offering.
2. Once you receive your login information via email go to the OpenShift Public [console](https://console.preview.openshift.com/console/).
3. Click the question mark icon in the right upper corner of the console and select `Command Line Tools`
4. Review your login token and run the `oc login --token=...` command.

### <a name="install_xpaas"></a> Prepare the EAP 7 xPaaS environment
1. Create a new OpenShift [project](https://docs.openshift.com/enterprise/latest/architecture/core_concepts/projects_and_users.html#projects) called `sample-project`.

        $ oc new-project sample-project
You can review existing projects using the following.
        $ oc get project

2. Install the JBoss EAP xPaaS image by pasting the following text into a terminal. (If you're using OpenShift Public skip this step)

        cat <<EOF | oc create -n sample-project -f -
        ---
          apiVersion: v1
          kind: ImageStream
          metadata:
            name: jboss-eap70-openshift
          spec:
            dockerImageRepository: registry.access.redhat.com/jboss-eap-7/eap70-openshift
        EOF

3. Install the PostgreSQL image by pasting the following text into a terminal. (If you're using OpenShift Public skip this step)

        cat <<EOF | oc create -n sample-project -f -
        ---
          apiVersion: v1
          kind: ImageStream
          metadata:
            name: postgresql
          spec:
            dockerImageRepository: registry.access.redhat.com/openshift3/postgresql-92-rhel7
        EOF

4. Install the `eap70-postgresql-s2i` template by typing the following command in a terminal. (If you're using OpenShift Public skip this step)

        $ oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/eap/eap70-postgresql-s2i.json

5. Openshift has a great support for distributing secrets, such as SSL certificates, among running containers. Let's import a self-signed certificate that will be used for encrypting https/TLS traffic. This certificate will be imported by EAP during its start up.

        $ oc create -n sample-project -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/secrets/eap7-app-secret.json
_Note: This certificate is self-signed and by no means can be considered secure. Its [base64 encoded version](https://github.com/jboss-openshift/application-templates/blob/ose-v1.3.3/secrets/eap7-app-secret.json#L35) represents certificate stored in a java keystore. We used [keytool](https://docs.oracle.com/javase/8/docs/technotes/tools/windows/keytool.html) to do that._


You are now ready to follow the quickstart instructions to configure your project to deploy to OpenShift.
