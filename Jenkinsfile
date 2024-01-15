pipeline {
    stages {
        stage('GIT Stage') {
            steps {
               git branch: 'main', credentialsId: 'jenkins-token', url: 'https://github.com/bitman26/AWS-Terraform.git'   
            }
        }
        stage('Terraform Deploy') {
            steps {
                sh "cd ./terraform"
                withAWS(credentials: 'jekins-aws') {

                        sh 'terraform init'
                        sh 'terraform ${action}  --auto-approve'
                }
             }
        }
        stage('Terraform Output > Ansible') {
            steps {
                script {
                    if (${action} == 'apply') {
                        sh "terraform output aws_eip | sed -e 's/\"//g' >> ./ansible/hosts"
                    }   else {
                            exit
                         }
                }
             }
        }
        stage('Ansible Provisioning') {
            steps {
                script {
                    if (${action} == 'apply'){
                        sh "cd .."
                        sh "cd ./ansible"
                        ansiblePlaybook installation: 'ansible', inventory: 'inventory/webservers', playbook: 'playbook/webservers.yml', extras: '--extra-vars "password=${password} "'
                    }   else {
                            exit
                        }
                }
            }
        }
    } 
}