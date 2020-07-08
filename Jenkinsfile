pipeline {
    agent any

    stages {

        stage('Prepare the AMI with a shell script') {
            steps {
                sh 'chmod +x first_batch.sh'
                sh 'sudo ./first_batch.sh'
            }
        }
    }
}
