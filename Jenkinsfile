pipeline {
    agent any
    
    environment {
        AWS_CREDENTIALS_ID = 'aws-prod-credentials'
        AWS_REGION         = 'us-east-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraformcode') {
                    withCredentials([aws(credentialsId: "${env.AWS_CREDENTIALS_ID}", 
                                       accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                       secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'terraform init -reconfigure'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('environments/prod') {
                    withCredentials([aws(credentialsId: "${env.AWS_CREDENTIALS_ID}", 
                                       accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                       secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('environments/prod') {
                    withCredentials([aws(credentialsId: "${env.AWS_CREDENTIALS_ID}", 
                                       accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                       secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
