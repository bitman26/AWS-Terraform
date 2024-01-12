pipeline {
    agent any

    stages {
        stage('GIT Stage') {
            steps {
               git branch: 'main', credentialsId: 'jenkins-token', url: 'https://github.com/bitman26/AWS-Terraform.git'   
            }
        }
        stage('Terraform init') {
            withAWS(credentials: 'jekins-aws' ) {
            sh 'aws iam get-user'
        }
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
