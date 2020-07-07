    #!/bin/sh

    # First, update the OS

     yum update -y

    # Second, install the necessary apps

     yum install -y php73 php73-mysqlnd mysql httpd24 git python python-devel python-pip openssl

    #Third, install boto and botocore

     pip install -y boto3 botocore3

    #Fourth, go into the directory and download wordpress fileset

    cd /var/www/html

     wget http://wordpress.org/latest.tar.gz

     tar -xvf latest.tar.gz

    #Fifth, we select a region for our AWS CLI tool

    export AWS_DEFAULT_REGION=eu-west-1
    aws configure set default.region eu-west-1

    #Sixth, we generate the AMI from our instance.

    aws ec2 create-image --instance-id `aws ec2 describe-instance-status | grep "InstanceId":*"" | awk -F':' '{ print $2 }' | sed 's/\"//g' | sed 's/\,//g'` --name "test-image" --no-reboot
    sleep 60

    #Seventh, replace the default AMI with our provided AMI

    sed -i -e "s/ami-08935252a36e25f85/$(aws ec2 describe-images --owners self | grep "ImageId:*" | awk -F':' '{ print $2 }' | sed 's/\"//g' | sed 's/\,//g' | grep -v "ami-07273f1a8d9bb49c7")/g" main.yml
