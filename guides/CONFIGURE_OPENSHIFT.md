Configure Your OpenShift Environment
===============

If you have not yet done so, you must first configure your OpenShift environment to run the JBoss EAP quickstarts by following these instructions.

1. Review the [Red Hat xPaaS EAP Image](https://access.redhat.com/documentation/en/red-hat-xpaas/version-0/red-hat-xpaas-eap-image/) documentation for information about developing with the Red Hat Enterprise Application Platform Image.

2. Install and configure the Container Development Kit (CDK).

    * Download the [Container Development Kit](http://developers.redhat.com/products/cdk/download/).
    * For configuration instructions, see the Red Hat Container Development Kit [Installation Guide](https://access.redhat.com/documentation/en/red-hat-container-development-kit/2.1/paged/installation-guide/).

3. Download and configure the OpenShift Origin Client Tools.

    * Download and upzip the [OpenShift Origin Client Tools](https://github.com/openshift/origin/releases/latest) for your operating system.
    * Add the folder to your `PATH` environment variable.
    
      _Note: For Linux systems, if you prefer, you can copy the `oc` executable to `/usr/local/bin`._
          
    * Test the `oc` command by typing the following command in a terminal.

            $ oc version
           
4. Log in to your OpenShift instance as `openshift-dev` by typing the following command in the terminal.
    
        $ oc login 10.1.2.2:8443 -u openshift-dev -p devel

5. Create the quickstart project.

        $ oc new-project quickstart-project

6. Install the JBoss EAP xPaaS image by pasting the following text into a terminal.


        cat <<EOF | oc create -n quickstart-project -f -
        ---
          apiVersion: v1
          kind: ImageStream
          metadata:
            name: jboss-eap70-openshift
          spec:
            dockerImageRepository: registry.access.redhat.com/jboss-eap-7/eap70-openshift
        EOF

7. Install the PostgreSQL image by pasting the following text into a terminal.

        cat <<EOF | oc create -n quickstart-project -f -
        ---
          apiVersion: v1
          kind: ImageStream
          metadata:
            name: postgresql
          spec:
            dockerImageRepository: registry.access.redhat.com/openshift3/postgresql-92-rhel7
        EOF

8. Install the `eap70-postgresql-s2i` Template by typing the following two commands in a terminal.

        $ oc create -n quickstart-project -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/secrets/eap7-app-secret.json
        $ oc create  -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/eap/eap70-postgresql-s2i.json

You are now ready to follow the quickstart instructions to configure your project to deploy to OpenShift. 


