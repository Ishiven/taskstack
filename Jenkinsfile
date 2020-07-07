pipeline {
    agent any

    stages {
        stage('Prepare the AMI with a shell script') {
            sh chmod +x script.sh
            sh ./script.sh
        }
        stage('Deploy the network stack') {
            steps {
                sh "aws cloudformation create-stack --template-body file://network.yml --stack-name networkstack"
                sh sleep 240s
            }
        }
        stage('Deploy the content stack') {
            steps {
                sh sleep 240s
                sh "aws cloudformation create-stack --template-body file://main.yml --stack-name contentstack"
            }
        }
    }
}