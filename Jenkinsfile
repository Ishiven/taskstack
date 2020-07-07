pipeline {
    agent any

    stages {
        stage('Prepare the AMI with a shell script') {
            sh chmod +x script.sh
            sh ./script.sh
        }
        stage('Deploy the network stack') {
            steps {
                sh "aws cloudformation create-stack --template-body https://github.com/Ishiven/taskstack/blob/master/network.yml --stack-name networkstack"
                sh sleep 240s
            }
        }
        stage('Deploy the content stack') {
            steps {
                sh sleep 240s
                sh "aws cloudformation create-stack --template-body https://github.com/Ishiven/taskstack/blob/master/main.yml --stack-name contentstack"
            }
        }
    }
}
