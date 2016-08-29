JBoss-OpenShift templates
===
[Template source repository](https://github.com/jboss-openshift/application-templates/tree/ose-v1.3.2/eap)
These templates define [Build Config](https://docs.openshift.com/enterprise/3.2/dev_guide/builds.html#binary-source) that uses binary build type, therefore users can consume source code from a local file system instead of git repository hosting, such as GitHub.

1. Download and extract a zip file with eap 7 quickstarts
2. Change dir to greeter quickstart
3. Create service account and secrets
4. If necessary, create image streams
5. Import the template for with the binary build:


```
oc create -f https://raw.githubusercontent.com/jboss-developer/jboss-developer-shared-resources/master/templates/eap70-postgresql-binary-s2i.json
```
```
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
```
Binary builds cannot leverage any webhooks or triggers provided by the git hosting infrastructure, so the build itself must be triggered manually.
```
oc start-build eap-app --from-dir . --follow
```
