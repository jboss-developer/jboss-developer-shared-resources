Build and Deploy a Quickstart - to OpenShift
=====================

This guide contains the basic instructions to build and deploy a quickstart to OpenShift.

The instructions in this guide use the following *replaceable* values.

* `QUICKSTART_NAME`: This variable should be replaced with your quickstart name, for example:  *my-quickstart*
* `APPLICATION_NAME`: This value should be replaced with a unique variation of the quickstart name, for example: *myquickstart*
* `YOUR_DOMAIN_NAME`: This value should be replaced with your OpenShift domain name.

### Create an OpenShift Account and Domain

If you do not yet have an OpenShift account and domain, [Sign in to OpenShift](https://openshift.redhat.com/app/login) to create the account and domain. [Get Started with OpenShift](https://openshift.redhat.com/app/getting_started) will show you how to install the OpenShift Express command line interface.

### Create the OpenShift Application

_NOTE_: The domain name for this application will be `APPLICATION_NAME-YOUR_DOMAIN_NAME.rhcloud.com`. In these instructions, be sure to replace all instances of `YOUR_DOMAIN_NAME` with your own OpenShift account user name.

Open a shell command prompt and change to a directory of your choice. Enter the following command to create a Red Hat JBoss Enterprise Application Platform 6 application:

        rhc app create -a APPLICATION_NAME -t jbosseap-6

This command creates an OpenShift application named APPLICATION_NAME and will run the application inside the `jbosseap-6`  container. You should see some output similar to the following:

    Application Options
    -------------------
      Namespace:  YOUR_DOMAIN_NAME
      Cartridges: jbosseap-6 (addtl. costs may apply)
      Gear Size:  default
      Scaling:    no

    Creating application 'APPLICATION_NAME' ... done

    Waiting for your DNS name to be available ... done

    Cloning into 'APPLICATION_NAME'...
    Warning: Permanently added the RSA host key for IP address '54.237.58.0' to the list of known hosts.

    Your application 'APPLICATION_NAME' is now available.

      URL:        http://APPLICATION_NAME-YOUR_DOMAIN_NAME.rhcloud.com/
      SSH to:     52864af85973ca430200006f@APPLICATION_NAME-YOUR_DOMAIN_NAME.rhcloud.com
      Git remote: ssh://52864af85973ca430200006f@APPLICATION_NAME-YOUR_DOMAIN_NAME.rhcloud.com/~/git/APPLICATION_NAME.git/
      Cloned to:  CURRENT_DIRECTORY/APPLICATION_NAME

    Run 'rhc show-app APPLICATION_NAME' for more details about your app.

The create command creates a GitHub repository in the current directory with the same name as the application. Notice that the output also reports the URL at which the application can be accessed. Make sure it is available by typing the published url <http://APPLICATION_NAME-YOUR_DOMAIN_NAME.rhcloud.com/> into a browser or use command line tools such as curl or wget. Be sure to replace `YOUR_DOMAIN_NAME` with your OpenShift account domain name.

_Note_: There is a limit to the number of applications you can deploy concurrently to OpenShift. If the `rhc app create` command returns an error indicating you have reached that limit, you must delete an existing application before you continue. 

* To view the list of your OpenShift applications, type: `rhc domain show`
* To delete an application from OpenShift, type the following, substituting the application name you want to delete: `rhc app-delete -a APPLICATION_NAME_TO_DELETE`

### Migrate the Quickstart Source

Now that you have confirmed it is working you can migrate the quickstart source. You do not need the generated default application, so navigate to the new git repository directory and tell git to remove the source and pom files:

        cd APPLICATION_NAME
        git rm -r src pom.xml

Copy the source for the QUICKSTART_NAME quickstart into this new git repository:

        cp -r QUICKSTART_HOME/QUICKSTART_NAME/src .
        cp QUICKSTART_HOME/QUICKSTART_NAME/pom.xml .

### Configure the OpenShift Server

If you need to configure the server, you modify the XML in the hidden `APPLICATION_NAME/.openshift/config/standalone.xml` file. 

### Deploy the OpenShift Application

You can now deploy the changes to your OpenShift application using git as follows. 

1. Add the files to GitHub
    * Add the quickstart `src` directory and `pom.xml` file.

            git add src pom.xml
    * If you modified the server configuration, you must also add the hidden configuration file.

            git add .openshift/config/standalone.xml
2. Commit the changes.
 
        git commit -m "QUICKSTART_NAME quickstart on OpenShift"
3. Deploy the quickstart to OpenShift.

        git push

The final push command triggers the OpenShift infrastructure to build and deploy the changes. 

Note that OpenShift activates the `openshift` profile in the `pom.xml` file. The resulting WAR is copied to the `deployments/` directory and deployed without a context path.

### Test the OpenShift Application

When the push command returns you can test the application by getting the following URL either via a browser or using tools such as curl or wget. Be sure to replace the `YOUR_DOMAIN_NAME` in the URL with your OpenShift account domain name.

        http://APPLICATION_NAME-YOUR_DOMAIN_NAME.rhcloud.com 

You can use the OpenShift command line tools or the OpenShift web console to discover and control the application.

### View the JBoss EAP Server Log on OpenShift

Now you can look at the output of the server by running the following command:

        rhc tail -a APPLICATION_NAME

This will show the tail of the JBoss EAP server log.

_Note:_ You may see the following error in the log:

        2014/03/17 07:50:36,231 ERROR [org.jboss.as.controller.management-operation] (management-handler-thread - 4) JBAS014613: Operation ("read-resource") failed - address: ([("subsystem" => "deployment-scanner")]) - failure description: "JBAS014807: Management resource '[(\"subsystem\" => \"deployment-scanner\")]' not found"

This is a benign error that occurs when the status of the deployment is checked too early in the process. This process is retried, so you can safely ignore this error.

### Delete the OpenShift Application

When you are finished with the application you can delete it as follows:

        rhc app-delete -a APPLICATION_NAME


