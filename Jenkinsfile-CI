@Library('shared-library') _
pipeline {
    agent any
    stages {
    
       stage('Maven Build') {
           steps {
               BuildApp()               
           }
           }
        stage('Store war to Nexus') {
           steps {
               StoreToNexus()               
           }
           }
        stage('Sonar Analysis') {
           steps {
               SonarApp()               
           }
        }
    }
}  

