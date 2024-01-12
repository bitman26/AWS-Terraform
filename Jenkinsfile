pipeline {
    agent any

    stages {
        stage('GIT Stage') {
            steps {
               git branch: 'main', credentialsId: 'jenkins-token', url: 'https://github.com/bitman26/AWS-Terraform.git'   
            }
        }
        stage('Executando Automacao Terraform') {
            environment {
                AWS_SECRET_ACCESS_KEY = credentialsId {'AWS_SECRET_ACCESS_KEY'}
                AWS_ACCESS_KEY_ID = credentialsId {'AWS_ACCESS_KEY_ID'}
            }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Deploy') {
            steps {
                 sh 'terraform ${action}  --auto-approve'
            }
        }
     }
   } 
}
