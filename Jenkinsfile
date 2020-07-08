pipeline {
    agent any

    stages {

        stage('Prepare the AMI with a shell script') {
            steps {
                sh 'chmod +x first_batch.sh'
                sh 'sudo ./first_batch.sh'
                sh 'sleep 300s'
            }
        }
        stage('Deploy the network stack') {
            steps {
                sh 'aws cloudformation create-stack --region eu-west-1 --stack-name networkstack --template-body file://taskstack/network.yml'
                sh 'sleep 240s'
            }
        }
        stage('Deploy the content stack') {
            steps {
                sh 'sleep 240s'
                sh 'aws cloudformation create-stack --region eu-west-1 --stack-name contentstack --template-body file://taskstack/main.yml'
            }
        }
    }
}
