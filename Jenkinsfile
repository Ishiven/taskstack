pipeline {
    agent any

    stages {

        stage('Prepare the AMI with a shell script') {
            steps {
                sh 'chmod +x first_batch.sh'
                sh 'sudo ./first_batch.sh'
                sh "aws ec2 describe-images --region eu-west-1 --owners self | grep "ImageId:*" | awk -F':' '{ print $2 }' | sed 's/\"//g' | sed 's/\,//g' | sed 's/^[[:space:]]*//g' |  grep -v "ami-07273f1a8d9bb49c7""
            }
        }
    }
}
