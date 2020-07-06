pipeline {
    agent any

    stages {
        stage('Deploy the network stack') {
            steps {
                sh "export AWS_DEFAULT_REGION=eu-west-1"
                sh "aws cloudformation create-stack --template-body file://network.yml --stack-name networkstack"
            }
        }
        stage('Deploy the content stack') {
            steps {
                sh "export AWS_DEFAULT_REGION=eu-west-1"
                sh "aws cloudformation create-stack --template-body file://main.yml --stack-name contentstack"
            }
        }
    }
}