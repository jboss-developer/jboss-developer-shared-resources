
JBoss Developer Contributing Guide
==============================

This document contains information targeted for developers who want to contribute to Red Hat JBoss Enterprise Application Platform developer projects.

* [Join the Mailing list](#join-the-mailing-list): Sign up for the JBoss developer mailing list.
* [Contribute a Quickstart](#contribute-a-quickstart): Find out how to contribute a quickstart.
* [Create a Quickstart Cheat Sheet](#create-a-quickstart-cheat-sheet): See how to create a 'cheat sheet' for your quickstart.

Join the Mailing list
---------------------

To monitor and participate in the latest development discussions, join the JBoss developer mailing list here: <https://lists.jboss.org/mailman/listinfo/jbossdeveloper>


Contribute a Quickstart
-----------------------

### Purpose of the quickstarts


- To demonstrate Java EE 6 technologies

- To provide developers with working examples and instructions that are easy to follow .

- To allow examples to be copied by developers and used as the basis for their own projects.

### Basic Steps

To contribute to the quickstarts, fork the quickstart repository to your own Git, clone your fork, checkout code from the latest `-develop` branch, commit your work on topic branches, and submit pull requests back to the latest `-develop` branch.

If you don't have the GitHub client (`git`), get it from: <http://git-scm.com/>

This document details the steps needed to contribute to the JBoss EAP quickstarts. For other quickstarts, you need to replace the GitHub repository URL with the correct repository location.

1. Fork the quickstart repository for the appropriate product. This creates the project in your own Git. The following table lists the product quickstart repository URLs and the resulting GitHub URL created by the fork.

    | **Product Repository URL** | **Forked Repository URL** |
    |:-----------|:-----------|
    | https://github.com/jboss-developer/jboss-eap-quickstarts | https://github.com/YOUR_USER_NAME/jboss-eap-quickstarts.git |
    | https://github.com/jboss-developer/jboss-wfk-quickstarts | https://github.com/YOUR_USER_NAME/jboss-wfk-quickstarts.git |
    | https://github.com/jboss-developer/jboss-brms-quickstarts | https://github.com/YOUR_USER_NAME/jboss-brms-quickstarts.git |
    | https://github.com/jboss-developer/jboss-jdg-quickstarts | https://github.com/YOUR_USER_NAME/jboss-jdg-quickstarts.git |
    | https://github.com/jboss-developer/jboss-mobile-quickstarts | https://github.com/YOUR_USER_NAME/jboss-mobile-quickstarts.git |
    | https://github.com/jboss-developer/jboss-on-quickstarts | https://github.com/YOUR_USER_NAME/jboss-on-quickstarts.git |
    | https://github.com/jboss-developer/jboss-picketlink-quickstarts | https://github.com/YOUR_USER_NAME/jboss-picketlink-quickstarts.git |
    | https://github.com/jboss-developer/jboss-portal-quickstarts | https://github.com/YOUR_USER_NAME/jboss-portal-quickstarts.git |
    | https://github.com/jboss-developer/jboss-sandbox-quickstarts | https://github.com/YOUR_USER_NAME/jboss-sandbox-quickstarts.git |

2. Clone your forked repository. This creates and populates a directory. for example `jboss-eap-quickstart/` on your local file system with the default remote repository name 'origin'.
   For example:

        git clone https://github.com/YOUR_USER_NAME/jboss-eap-quickstarts.git
3. Change to the newly created directory, for example 

        cd jboss-eap-quickstarts/
4. Add the remote `upstream` repository so you can fetch any changes to the original forked repository.

        git remote add upstream https://github.com/jboss-developer/jboss-eap-quickstarts.git
5. Get the latest files from the `upstream` repository.

        git fetch upstream
6. Create a local topic branch to work with your new quickstart, features, changes, or fixes. 

   * _IMPORTANT:_ Always work with the current developer branch of the quickstart repository. The is the branch that automatically displays in the dropdown when you browse to product quickstart directory, for example: <https://github.com/jboss-developer/jboss-eap-quickstarts>
   * Checkout the latest source code from the current `-develop` branch into your own branch using the following syntax:
   
            git checkout -b  <topic-branch-name> upstream/<current-development-branch> 
   * If you are fixing a Bugzilla or JIRA, it is a good practice to use the number in the branch name. For new quickstarts or other fixes, try to use a good description for the branch name. 
   * The following are examples of Git checkout commands:

            git checkout -b Bz-98765432 upstream/6.4.x-develop
            git checkout -b JDF-9876543 upstream/6.4.x-develop
            git checkout -b add-xyz-quickstart upstream/6.4.x-develop
7. Contribute new code or make changes to existing files. Make sure that you follow the [General Guidelines](#general-guidelines) below.

8. To verify if your code followed the General Guidelines you can run [QS Tools](http://jboss-developer.github.io/maven-qstools-plugin/) on your project.
   * To run QS Tools, go to your quickstart project root and execute:
   
           mvn -U org.jboss.maven.plugins:maven-qstools-plugin:check
   This will generate a report on `QUICKSTART_HOME/target/site/qschecker.html`. Review the report to determine if your quickstart project violates any item in the *General Guidelines*.

9. Test your changes in 2 ways.
   * Run the Maven command line to build and deploy the quickstart.
   * Import the quickstart into Red Hat JBoss Developer Studio and make sure it builds and deploys with no errors or warnings.

10. Use the `git add` command to add new or changed file contents to the staging area.
   * If you create a new quickstart, you can add files using the subfolder and file names. The following is an example of new quickstart folders and files you may want to stage:
   
            git add src/
            git add pom.xml
            git add README.md
   _Note:_ It is probably best not to add the entire quickstart root folder because you may unintentionally add classes or other target files that should not be in source control.
   * If you only modified a few files, use `git add <filename>` for every file you create or change. For example:

            git add README.md       
11. Use the git status command to view the status of the files in the directory and in the staging area and ensure that all modified files are properly staged:

        git status        
12. Commit your changes to your local topic branch. 

        git commit -m 'Description of change...'
13. Update your branch with any changes made upstream since you started.
   * Fetch the latest changes from upstream

        git fetch upstream
   * Apply those changes to your branch
   
        git rebase upstream/<current-development-branch>
   * If anyone has commited changes to files that you have also changed, you may see conflicts. 
   Resolve the conflicted files, add them using `git add`, and continue the rebase:
   
        git add <conflicted-file-name>
        git rebase --continue
   * If there were conflicts, it is a good idea to test your changes again to make they still work.
        
14. Push your local topic branch to your GitHub forked repository. This will create a branch on your Git fork repository with the same name as your local topic branch name. 

        git push origin HEAD            
   _Note:_ The above command assumes your remote repository is named 'origin'. You can verify your forked remote repository name using the command `git remote -v`.
15. Browse to the <topic-branch-name> branch on your forked Git repository and [open a Pull Request](http://help.github.com/send-pull-requests/). Give it a clear title and description.


### General Guidelines

* The sample project should be formatted using the JBoss AS profiles found at <http://github.com/jboss/ide-config/tree/master/>

 - Code should be well documented with good comments. Please add an author tag (@author) to credit yourself for writing the code.
 - You should use readable variable names to make it easy for users to read the code.

* The package must be `org.jboss.quickstarts.<product-type>`, for example: org.jboss.quickstarts.eap, org.jboss.quickstarts.wfk, org.jboss.quickstarts.jdg, org.jboss.quickstarts.brms, org.jboss.quickstarts.fuse, etc.

* The quickstart project or folder name should match the quickstart name. Each sample project should have a unique name, allowing easy identification by users and developers.

* The quickstart project or folder name should be located in the root directory of the product quickstarts repository and should not be nested under other quickstarts or folders. For example, if you create quickstart "foo" for the JBoss EAP quickstarts, it should appear here: `YOUR_PATH/jboss-eap-quickstarts/foo`.

* The quickstart directory structure should follow standard Java project rules:

 - All directories and packages containing Java source files should be placed in a `src/main/java/` directory, 
 - All Java source files should use package names.
 - Index pages, JSF, and HTML files should be placed in a `src/main/webapp/` directory.
 - Any `beans.xml`, `faces-config.xml`, and other related configuration files should be placed in a `src/main/webapp/WEB-INF/` directory.
 - Resources such as images and stylesheets and the  should be placed in the `src/main/webapp/resources` directory.

* The `<name>` in the quickstart `pom.xml` file should follow the template: `JBoss <target-product> Quickstart: <quickstart-name> < - optional-subfolder-name>` where `target-product` is the `Target Product` metadata specified in the README.md file,  `quickstart-name` is the quickstart folder name, and `optional-subfolder-name` is the name of any nested subfolder containing a `pom.xml` file. The following are a few examples of quickstart pom files and the correct name tags:

        greeter/pom.xml ==> `JBoss EAP Quickstart: greeter`
        helloworld-errai/pom.xml ==> `JBoss WFK Quickstart: helloworld-errai`
        kitchensink-ear/pom.xml ==> `JBoss EAP Quickstart: kitchensink-ear`
        kitchensink-ear/ear/pom.xml --> `JBoss EAP Quickstart: kitchensink-ear - ear`
        kitchensink-ear/ejb/pom.xml ==> `JBoss EAP Quickstart: kitchensink-ear - ejb`
        kitchensink-ear/web/pom.xml ==> `JBoss EAP Quickstart: kitchensink-ear - web`

* The `<artifactId>` in the quickstart `pom.xml` file should follow the template: `jboss-<target-product>-<quickstart-name>`. For example, the `<artifactId>` for the `greeter` quickstart in the EAP project is `jboss-greeter`. The `<artifactId>` for `errors` quickstart in the Fuse project is `jboss-fuse-errors`.

* The JBoss developer Maven repository, which contains newly *staged* artifacts, is located at [jboss-developer.github.io](http://jboss-developer.github.io/temp-maven-repo/). See [Configure Maven](#configure-maven) below for instructions how to configure your settings to use this repository.

* If you create a quickstart that uses a database table, make sure the name you use for the table is unique across all quickstarts. 

* The project must follow the structure used by existing quickstarts such as [numberguess](https://github.com/jboss-developer/jboss-eap-quickstarts/tree/7.0.x-develop/numberguess). A good starting point would be to copy the `numberguess` project.

* The sample project should be importable into JBoss Developer Studio/JBoss Tools and be deployable from there.

* Maven POMs must be used. No other build system is allowed unless the purpose of the quickstart is to show another build system in use. If using Maven it should:

 - Not inherit from another POM (no parent POM)
 - Maven POMs must use the Java EE spec BOM/POM imports
 - The POMs must be commented, with a comment each item in the POM
 - Import the various BOMs, either directly from a project, or from [JBoss BOMs](http://www.jboss.org/developer-materials/#!formats=jbossdeveloper_bom&sys_type=jbossdeveloper_bom), to determine version numbers. You should aim to have no dependencies declared directly. If you do, work with the jdf team to get them added to a BOM.
 - Use the WildFly Maven Plugin to deploy the example

* The sample project must contain a `README.md` file using the `template/README.md` file as a guideline

* Don't forget to update the `pom.xml` in the quickstart root directory. Add your quickstart to the 'modules' section.

* The project must target Java EE 7

 - CDI should be used as the programming model
 - Avoid using a web.xml if possible. Use faces-config.xml to activate JSF if needed.
 - Any tests should use Arquillian.

* If the quickstart persists to a database, you must use a unique datasource JNDI name and connection URL for the application and for any Arquillian tests that it provides. Do not use the JNDI name `java:jboss/datasources/ExampleDS`. Failure to use unique names can result in a `DuplicateServiceException` when more than one quickstart is deployed to the same server.

* Be sure to test the quickstart in JBoss Developer Studio, which strictly enforces Java EE coding rules!

* If possible, create a cheat sheet for the quickstart to guide users and developers through the example. See [Create a Quickstart Cheat Sheet](#create-a-quickstart-cheat-sheet) for more information.

### Kitchensink variants

  There are multiple quickstarts based on the kitchensink example.  Each showcases different technologies and techniques including pure EE6, JSF, HTML5, and GWT.

  If you wish to contribute a kitchensink variant is it important that you follow the look and feel of the original so that useful comparisons can be made.  This does not mean that variants can not expand, and showcase additional functionality.  Multiple variants already do that.  These include mobile interfaces, push updates, and more.

  Below are rules for the *look and feel* of the variants:

  * Follow the primary layout, style, and graphics of the original.

  * Projects can have 3-4 lines directly under the EAP banner in the middle section to describe what makes this variant different.
     * How projects use that space is up to them, but options include plain text, bullet points, etc....

  * Projects can have their logo in the left side of the banner.
    * The sidebar area can contain a section with links to the related projects, wiki, tutorials, etc...
       * This should be below any EAP link areas.

    If appropriate for the technology the application should expose RESTful endpoints following the example of the original kitchensink quickstart.  This should also include the RESTful links in the member table.
    
### Setup your environment

The quickstart README.md files are converted to HTML using markdown. We recommend using redcarpet, as that is what GitHub uses, but you can use any markdown tool really.

There are two scripts, `dist/github-flavored-markdown.rb`, that will convert an individual file, and `dist/release-utils.sh -m`, that will convert all the files.

To setup the environment you need to follow these steps.

1. Install Ruby *1.9.X*

    For RHEL you can use this [spec](https://github.com/lnxchk/ruby-1.9.3-rpm)
    
    In general, you're better off not relying on your OSs ruby install, they are often quite broken.

2. Install Ruby GEMs

        gem install nokogiri pygments.rb redcarpet fileutils

3. Install Python Eggs

    You'll need python eggs installed, which often isn't available on OS installs of python. Google to find out how to install it

4. Install pygments

            sudo easy_install pygments

### Configure Maven

_Note:_ Maven 3.2.2 introduced a bug that breaks resolution of the JBoss EAP BOM dependencies because it ignores additional repositories during artifact resolution. For more information about this bug, see <https://jira.codehaus.org/browse/MNG-5663>. Make sure to use Maven 3.2.3 or later.

If you are working with quickstarts currently under development in the current development branch, you need access to artifacts currently under development. The JBoss developer Maven repository, which contains newly staged artifacts, is located at [jboss-developer.github.io](http://jboss-developer.github.io/temp-maven-repo/).

To access these artifacts, do one of the following:

  * You can simply copy the `contributor-settings.xml` located in the root of the quickstart directory to your `${user.home}/.m2/` and rename it to `settings.xml`. 
  
  * Or, assuming you followed the instructions to [Configure Maven to Build and Deploy the Quickstarts](CONFIGURE_MAVEN.md#configure-maven-to-build-and-deploy-the-quickstarts), you can manually edit the settings and copy the following profile to your `settings.xml` file.

        <profile>
            <id>jboss-developer-repository</id>
            <repositories>
                <repository>
                    <id>jboss-developer-repository</id>
                    <url>http://jboss-developer.github.io/temp-maven-repo/</url>
                    <releases>
                       <enabled>true</enabled>
                    </releases>
                    <snapshots>
                      <enabled>false</enabled>
                    </snapshots>
                </repository>
            </repositories>
            <pluginRepositories>
                <pluginRepository>
                    <id>jboss-developer-plugin-repository</id>
                    <url>http://jboss-developer.github.io/temp-maven-repo/</url>
                    <releases>
                      <enabled>true</enabled>
                    </releases>
                    <snapshots>
                      <enabled>false</enabled>
                    </snapshots>
                </pluginRepository>
            </pluginRepositories>
        </profile>

      Then add `<activeProfile>jboss-developer-repository</activeProfile>` to the `<activeProfiles>` section of the file.

_Note:_ Regardless of the method you choose to configure your Maven settings, you should also delete the existing `${user.home}/.m2/repository/`.


### Configure Maven on OpenShift

_Note:_ This section will be updated to use Openshift V3

### License Information and Contributor Agreement

  JBoss Developer Framework is licensed under the Apache License 2.0, as we believe it is one of the most permissive Open Source license. This allows developers to easily make use of the code samples in JBoss Developer Framework. 

  There is no need to sign a contributor agreement to contribute to JBoss Developer Framework. You just need to explicitly license any contribution under the AL 2.0. If you add any new files to JBoss Developer Framework, make sure to add the correct header.

#### Java,  Javascript and CSS files 

      /** 
       * JBoss, Home of Professional Open Source
       * Copyright 2013, Red Hat, Inc. and/or its affiliates, and individual
       * contributors by the @authors tag. See the copyright.txt in the 
       * distribution for a full listing of individual contributors.
       *
       * Licensed under the Apache License, Version 2.0 (the "License");
       * you may not use this file except in compliance with the License.
       * You may obtain a copy of the License at
       * http://www.apache.org/licenses/LICENSE-2.0
       * Unless required by applicable law or agreed to in writing, software
       * distributed under the License is distributed on an "AS IS" BASIS,  
       * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
       * See the License for the specific language governing permissions and
       * limitations under the License.
       */

#### HTML, XML, XSD and XHTML files

      <!--
       JBoss, Home of Professional Open Source
       Copyright 2013, Red Hat, Inc. and/or its affiliates, and individual
       contributors by the @authors tag. See the copyright.txt in the 
       distribution for a full listing of individual contributors.

       Licensed under the Apache License, Version 2.0 (the "License");
       you may not use this file except in compliance with the License.
       You may obtain a copy of the License at
       http://www.apache.org/licenses/LICENSE-2.0
       Unless required by applicable law or agreed to in writing, software
       distributed under the License is distributed on an "AS IS" BASIS,  
       WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
       See the License for the specific language governing permissions and
       limitations under the License.
       -->

#### Properties files and Bash Scripts

       # JBoss, Home of Professional Open Source
       # Copyright 2013, Red Hat, Inc. and/or its affiliates, and individual
       # contributors by the @authors tag. See the copyright.txt in the 
       # distribution for a full listing of individual contributors.
       #
       # Licensed under the Apache License, Version 2.0 (the "License");
       # you may not use this file except in compliance with the License.
       # You may obtain a copy of the License at
       # http://www.apache.org/licenses/LICENSE-2.0
       # Unless required by applicable law or agreed to in writing, software
       # distributed under the License is distributed on an "AS IS" BASIS,  
       # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
       # See the License for the specific language governing permissions and
       # limitations under the License.

#### SQL files

      --
      -- JBoss, Home of Professional Open Source
      -- Copyright 2013, Red Hat, Inc. and/or its affiliates, and individual
      -- contributors by the @authors tag. See the copyright.txt in the
      -- distribution for a full listing of individual contributors.
      --
      -- Licensed under the Apache License, Version 2.0 (the "License");
      -- you may not use this file except in compliance with the License.
      -- You may obtain a copy of the License at
      -- http://www.apache.org/licenses/LICENSE-2.0
      -- Unless required by applicable law or agreed to in writing, software
      -- distributed under the License is distributed on an "AS IS" BASIS,
      -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
      -- See the License for the specific language governing permissions and
      -- limitations under the License.
      --

#### JSP files

      <%--
      JBoss, Home of Professional Open Source
      Copyright 2013, Red Hat, Inc. and/or its affiliates, and individual
      contributors by the @authors tag. See the copyright.txt in the
      distribution for a full listing of individual contributors.

      Licensed under the Apache License, Version 2.0 (the "License");
      you may not use this file except in compliance with the License.
      You may obtain a copy of the License at
      http://www.apache.org/licenses/LICENSE-2.0
      Unless required by applicable law or agreed to in writing, software
      distributed under the License is distributed on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
      See the License for the specific language governing permissions and
      limitations under the License.
      --%>
      

Create a Quickstart Cheat Sheet
-------------------------------

### Purpose of the Cheat Sheets

- Cheat sheets function as a tutorial and provide a step by step guide through a quickstart. 
- They provide a way to step through and explain the code in an interactive way.
- They can provide an in-depth analysis of specific sections of code.


### Basic Steps to Create a Cheat Sheet

You can create a cheat sheet using the Eclipse Wizard or you can copy and modify an existing cheat sheet from another quickstart. This section describes how to create a cheat sheet using the Eclipse wizard.

_Note:_ Be sure your project folder is located outside of the Eclipse workspace before you begin this process.

1.  Import your quickstart into JBoss Developer Studio (JDBS)
    1.  From the menu, choose `File` --> `Import` --> `Maven` --> `Existing Maven Projects`, then click `Next`.
    2.  Navigate to your quickstart, select it, then click `OK`.
    3.  Click `Finish`.
2.  Create the cheat sheet.
    1.  Select the imported quickstart project.
    2.  From the menu, choose `File` --> `New` --> `Other` --> `User Assistance` --> `Cheat Sheet`, then click `Next`.
    3.  Select the quickstart folder, give it a name 'cheatsheet.xml', and choose `Simple Cheat Sheet`.
    4.  Click `Finish`. When it prompts you to open the cheatsheet for the quickstart project, click `Yes`.
3.  Populate the cheatsheet with useful information to help a user understand the quickstart.
    1.  Expand the `Title` in the content section on the left. 
    2.  Select the `Title` field and modify it to something useful, for example: `helloworld`
    3.  Select the `intro` field and add introduction text to the `Body`, for example: `This quickstart demonstrates the use of CDI 1.0 and Servlet 3.0. It is a simple application that can be used to verify the JBoss EAP server is configured and running correctly.`
    4.  Select `item`, then under `Command`, click `browse` and select 'Get current project' under `Uncategorized`. This adds the following XML to the cheat sheet: 
    
            <command 
            required="true" 
            returns="currentProject"
            serialization="org.jboss.tools.project.examples.cheatsheet.getProjectForCheatsheet"/>
    This command allows you to use the variable `${currentProject}` instead of a hard-coded path name and ensures your cheat sheet will work regardless of the project location.
         
    5.  Add an `item` for each file or class you want to describe. 
        *  This is dependent on the quickstart features you plan to demonstrate.
        *  Provide a good description.
        *  Add subitems to describe code sections and provide the line numbers that are referenced.
4. Test your cheat sheet by opening it in JDBS.
    1.  Go through each step and make sure the descriptions are valid.
    2.  Click on each link to make sure it opens the file and highlights the correct lines of code.
5. When you finish testing the cheat sheet, rename the file from `cheatsheet.xml` to `.cheatsheet.xml` and make sure it is located in the root directory of the quickstart.
6. Add the `.cheatsheet.xml` file using `git add`, commit the change, push it to your forked repository, and issue a pull.
7. If your cheat sheet is for the quickstart based on an archetype, it will automatically generate the cheat sheet for the archetype. However, you must add an `<include>.cheatsheet.*</include>` to the fileset for the root directory in the corresponding archetype's `archetype-metadata.xml` file. See the `jboss-javaee6-webapp-archetype` archetype for an example.


### General Guidelines

* If your project folder is located in the Eclipse workspace when you generate your cheat sheet using the Eclipse wizard, it will generate an invalid project name and attempts to open source code will fail. Be sure your project folder is located outside the Eclipse workspace before you begin.
* The cheat sheet should be created in the root of the quickstart directory and named `.cheatsheet.xml`. Eclipse will not let you name the file with a leading '.', so you will need to rename it after it is created.
* Make sure you add the 'Get current project' command and use the replaceable `${currentProject}`  value to avoid hard-coding the project path. This ensures that if the quickstart folder is moved, the cheat sheet will work as expected.
* Do not use the `<action>` tag if it can be avoided. It is more fragile than the `<command>` tag, which uses parameters names instead of indexes.
* Try to highlight the most important features and code for the quickstart. Pay particular attention to areas that might confuse developers. Cheat sheets require that users execute or skip each step, so you don't want to bore developers with the code that has no impact on the purpose of the quickstart.
* Make sure `<?xml version="1.0" encoding="UTF-8"?>` is the first line in the `.cheatsheet.xml` file, before the license information. This enables the cheat sheet to open automatically when you import the project into JBoss Developer Studio.

### Find Help

You can find additional help about cheat sheets at the following locations:

* [Eclipse Help: Cheat sheets](http://help.eclipse.org/kepler/index.jsp?topic=%2Forg.eclipse.platform.doc.isv%2Fguide%2Fua_cheatsheet.htm&resultof=%22cheat%22%20%22sheet%22%20)
* [Recommended Work Flow for Cheat Sheet Development](http://www.eclipse.org/pde/pde-ui/articles/cheat_sheet_dev_workflow/)
* [Max's cheat sheet example](https://github.com/maxandersen/cheatsheet-helloworld)


Copy a Quickstart to Another Repository and Preserve Its History
-----------------------------------------------------------------

The following instructions are based on information in this blog: <http://blog.neutrino.es/2012/git-copy-a-file-or-directory-from-another-repository-preserving-history/>

1. Navigate to the parent directory of the quickstart you want to move. 

        cd ~/jboss-sandbox-quickstarts

2. Make sure you have downloaded the latest source, then checkout a branch to work in. For example:

        git fetch upstream
        git checkout -b copy-xyz-quickstart upstream/master

2. Create a temporary directory to contain the quickstart patch files.

        mkdir -p ~/temp/qsPatchFolder

3. Create a `QS_SOURCE` environment variable that defines the quickstart source path.

        export QS_SOURCE=~/jboss-sandbox-quickstarts/xyz-quickstart/

4. Execute the following command to create the quickstart patch files in the temporary quickstart patch folder.

        git format-patch -o ~/temp/qsPatchFolder $(git log $QS_SOURCE|grep ^commit|tail -1|awk '{print $2}')^..HEAD $QS_SOURCE

5. Navigate to quickstarts parent directory where you want to move the quickstart.

        cd ~/jboss-eap-quickstarts

6. Checkout a branch to work in.

        git fetch upstream
        git checkout -b merge-xyz-quickstart upstream/7.0.x-develop 

7. Merge the patches into the destination directory.

        git am ~/temp/qsPatchFolder/*.patch

8. Push the changes to your own Git. 

   * Verify that the target quickstarts directory now contains the `xyz-quickstart` folder and files.
   * Verify that the commit history is included. 
   
9. Issue a pull to the upstream repository.


Request JBoss Central and jboss.org Update to the Latest Release
-----------------------------------------------------------------

The following instructions are based on information : <https://github.com/jboss-developer/www.jboss.org/blob/master/CONTRIBUTING.md#updating-developer-materials-versions/>

1. Be sure to tag the release.

2. Open a JIRA for the Red Hat Developer (RHD) project asking them to update JBoss Central and jboss.org sites to point to the latest tagged release:

        https://issues.jboss.org/secure/RHD/CreateIssue.jspa



