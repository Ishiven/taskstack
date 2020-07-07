pipeline {
    agent any

    stages {
        stage('Prepare the AMI with a shell script') {
            steps {
            sh chmod +x script.sh
            sh ./script.sh
            }
        }
        stage('Deploy the network stack') {
            steps {
                sh "aws cloudformation create-stack --stack-name networkstack --template-body file://github.com/Ishiven/taskstack/blob/master/network.yml"
                sh sleep 240s
            }
        }
        stage('Deploy the content stack') {
            steps {
                sh sleep 240s
                sh "aws cloudformation create-stack --stack-name contentstack --template-body file://github.com/Ishiven/taskstack/blob/master/main.yml "
            }
        }
    }
}
