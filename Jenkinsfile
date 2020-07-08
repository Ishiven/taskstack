pipeline {
    agent any

    stages {

        stage('Prepare the AMI with a shell script') {
            steps {
                sh 'chmod +x first_batch.sh'
                sh 'sudo ./first_batch.sh'
                sh 'aws ec2 describe-images --region eu-west-1 --owners self | grep "ImageId:*" | awk -F':' '{ print $2 }' | sed 's/\"//g' | sed 's/\,//g' | sed 's/^[[:space:]]*//g' |  grep -v "ami-07273f1a8d9bb49c7"'
            }
        }
        stage('Deploy the network stack') {
            steps {
                sh 'aws cloudformation create-stack --region eu-west-1 --stack-name networkstack --template-body file://network.yml'
                sh 'sleep 240s'
            }
        }
        stage('Deploy the content stack') {
            steps {
                sh 'sleep 240s'
                sh 'aws cloudformation create-stack --region eu-west-1 --stack-name contentstack --template-body file://main.yml'
            }
        }
    }
}
