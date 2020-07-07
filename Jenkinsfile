pipeline {
    agent any

    stages {

        stage('Prepare the AMI with a shell script') {
            steps {
                sh 'chmod +x first_batch.sh'
                sh './first_batch.sh'
            }
        }
        stage('Deploy the network stack') {
            steps {
                sh 'aws cloudformation create-stack --stack-name networkstack --template-body file://network.yml'
                sh 'sleep 240s'
            }
        }
        stage('Deploy the content stack') {
            steps {
                sh 'sleep 240s'
                sh 'aws cloudformation create-stack --stack-name contentstack --template-body file://main.yml'
            }
        }
    }
}
