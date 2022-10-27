# Java-Mysql-Simple-Login-Web-application

This is a simple demonstration project of login and register to showcase CICD of Infra provisiong of Azure VM with tomcat and Azure Mysql databse to deploy Java web application with mysql connection on a container.

# Tools Used

Jenkins
Nexus
Sonarqube
Terraform
docker

# Step by Step Procedure

## Create Pipelines in Jenkins:

* java-CI - Build, Sonar Analysis, Upload war to Nexus

Go to Jenkins -> Click on New Item -> Provide name "java-CI" -> choose pipeline -> Create -> Provide the repo url and branch -> Choose pipeline script from SCM -> path as pipeline/Jenkinsfile-CI

* java-CD - Infra Provisioning, Fetch Public IP of VM, Download Artifact Form Nexus, Deploy

Go to Jenkins -> Click on New Item -> Provide name "java-CD" -> choose pipeline -> Create -> Provide the repo url and branch -> Choose pipeline script from SCM -> path as pipeline/Jenkinsfile-CD   


