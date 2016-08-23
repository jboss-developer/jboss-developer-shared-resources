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

You are now ready to follow the quickstart instructions configure your project to deploy to OpenShift. 


