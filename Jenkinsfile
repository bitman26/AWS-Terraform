pipeline {
    agent any
    environment { 
        action2 = '${action}'
    }
    stages {
        stage('GIT Stage') {
            steps {
               git branch: 'jenkins_test', credentialsId: 'jenkins-token', url: 'https://github.com/bitman26/AWS-Terraform.git'   
            }
        }
        stage('Terraform Deploy') {
            steps {
                dir("terraform") { 
                    withAWS(credentials: 'jekins-aws') {
                            sh 'terraform init'
                            sh 'terraform env.action2  --auto-approve'
                    }
                }
            } 
        }
        stage('Terraform Output > Ansible') {
            steps {
                script {
                    if (env.action2 == 'apply') {
                        dir("terraform") { 
                            sh "terraform output aws_eip | sed -e 's/\"//g' >> /var/lib/jenkins/workspace/AWS-Provisioning/ansible/inventory/webservers"                  
                        }

                    }   else {
                            exit
                    }
                }
            }
        }
        stage('Ansible Provisioning') {
            steps {
                script {
                    if (env.action2 == 'apply'){
                            dir("ansible") { 
                                 ansiblePlaybook credentialsId: 'ssh-aws', installation: 'ansible', inventory: 'inventory/webservers', playbook: 'playbook/webservers.yml'
                            }              
                    }   else {
                            exit
                    }
                }
            }
        }
    } 
}