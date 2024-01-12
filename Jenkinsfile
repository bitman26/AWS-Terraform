pipeline {
    agent any

    stages {
        stage('GIT Stage') {
            steps {
               git branch: 'main', credentialsId: 'jenkins-token', url: 'https://github.com/bitman26/AWS-Terraform.git'   
            }
        }
        stage('Executando Automacao Terraform') {
            withCredentials([string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY'), string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID')]) {
            // some block
            }
            steps {
                sh 'terraform init'
                sh 'terraform ${action}  --auto-approve'
            }
        }
    }
}
