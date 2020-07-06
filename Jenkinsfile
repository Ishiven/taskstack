pipeline {
    agent any

    stages {
        stage('Deploy the network stack') {
            steps {
                sh "export AWS_DEFAULT_REGION=eu-west-1"
                sh "aws cloudformation create-stack --template-body file://network.yml --stack-name networkstack --region eu-west-1"
                sh "sleep 300s"
            }
        }
        stage('Deploy the content stack') {
            steps {
                sh "sleep 300s"
                sh "export AWS_DEFAULT_REGION=eu-west-1"
                sh "aws cloudformation create-stack --template-body file://main.yml --stack-name contentstack --region eu-west-1"
            }
        }
    }
}
