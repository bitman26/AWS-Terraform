pipeline {
    agent any

    stages {
        stage('GIT Stage') {
            steps {
               git branch: 'main', credentialsId: 'jenkins-token', url: 'https://github.com/bitman26/AWS-Terraform.git'   
            }
        }
        stage('Terraform init') {
            steps {
                withAWS(credentials: 'jekins-aws' ) {
                    sh 'aws iam get-user'
                }
            }
        }
    
    } 
}
