# Java-Mysql-Simple-Login-Web-application

This is a simple demonstration project of login and register to showcase CICD of Infra provisiong of Azure VM with tomcat and Azure Mysql databse to deploy Java web application with mysql connection on a container.

# Prerequistites

* Open an Azure Account 
*	Install Java - [Download and Install - https://www.java.com/en/download/help/windows_manual_download.html]
*	Install Maven - [Download - https://maven.apache.org/download.cgi, Install - https://maven.apache.org/install.html]
*	Install Jenkins - [Downlload and Install - https://www.jenkins.io/doc/book/installing/windows/]
*	Install Sonarqube - [Download and Install - https://docs.sonarqube.org/latest/setup/install-server/]
*	Install Nexus Repository Manager - [Download - https://help.sonatype.com/repomanager3/product-information/download, Install - https://help.sonatype.com/repomanager3/installation-and-upgrades/installation-methods ]
*	Install Azure CLI - [Download - https://aka.ms/installazurecliwindows]
*	Install Git [Git bash included in package] - [Download and Install - https://git-scm.com/download/win]
*	Install Terraform -[Download - https://www.terraform.io/downloads]


# Step by Step Procedure

## Configure Global Tool Configuration

Manage Jenkins -> Global Tool Configuration -> Provide the tools location for JDK, Git, Terraform, Maven

## Configure Shared Library in Jenkins

Manage Jenkins -> Configure System -> Global Pipeline Libraries -> Add -> gIve name -> Give Url for the Shared Library (https://github.com/ranjitaws2020/java-shared-library.git) -> version as 'main'

## Create Credentials in Jenkins

Manage Jenkins -> Manage Credenials -> Add Credentials -> Create credentials for Azure Service Principal Connection , Create Credetials for nexus login, Create Credentials for Azure vm, Credentials for Sonar login 

Make Sure the ID which you are providing in Jenkins for these above credentials should be same as the one in Jenkinsfile-CI and Jenkinsfile-CD files.

## Install Plugins

Go to Jenkins -> Manage pLugins -> Search for SSH Pipeline Steps , Azure Crentials, Terraform and install it

## Create Pipelines in Jenkins:

* java-CI - Build, Sonar Analysis, Upload war to Nexus

Go to Jenkins -> Click on New Item -> Provide name "java-CI" -> choose pipeline -> Create -> Provide the repo url and branch -> Choose pipeline script from SCM -> path as pipeline/Jenkinsfile-CI

* java-CD - Infra Provisioning, Fetch Public IP of VM, Download Artifact Form Nexus, Deploy

Go to Jenkins -> Click on New Item -> Provide name "java-CD" -> choose pipeline -> Create -> Provide the repo url and branch -> Choose pipeline script from SCM -> path as pipeline/Jenkinsfile-CD 

## Modify Shared Library accordingly.

* SonarApp.groovy - Provide the Url of your sonarqube instance. Dont change if your sonarqube is hotsed locally
* FetchPublicIp.groovy - Provide the Resource Group Name and VM name as per your requirement.
* DownloadFromNexus.groovy - Provide the nexus url as per your desired artifact.

## Execute The pipeline

Click on Build Now for the Pipeline java-CI

Click on Build Now for the Pipeline java-CD

Once completed. Browse http://ipadress/login



