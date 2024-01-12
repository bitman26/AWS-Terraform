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
                AWS_ACCESS_KEY_ID = credentialsId('AWS_ACCESS_KEY_ID')
                AWS_SECRET_ACCESS_KEY = credentialsId('AWS_SECRET_ACCESS_KEY')
            }
            steps {
                sh 'terraform init'
                sh 'terraform ${action}  --auto-approve'
            }
        }
    }
}
