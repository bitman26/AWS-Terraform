pipeline {
    agent any

    stages {
        stage('GIT Stage') {
            steps {
               git branch: 'main', credentialsId: 'jenkins-token', url: 'https://github.com/bitman26/AWS-Terraform.git'   
            }
        }
        stage('Terraform Deploy') {
            steps {
                withAWS(credentials: 'jekins-aws') {

                        sh 'terraform init'
                        sh 'terraform ${action}  --auto-approve'
                }
             }
        }
    }
    
} 
