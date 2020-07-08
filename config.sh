    #!/bin/sh

    # First, update the OS and the repos

    git clone https://github.com/Ishiven/taskstack
    cd taskstack
    sudo yum update -y
    sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
    sudo yum install -y https://rpmfind.net/linux/centos/7.5.1804/os/x86_64/Packages/scl-utils-20130529-18.el7_4.x86_64.rpm
    sudo yum install -y https://rpmfind.net/linux/centos/7.5.1804/os/x86_64/Packages/libedit-3.0-12.20121213cvs.el7.x86_64.rpm


    # Second, install the necessary apps

    sudo yum install -y php73 php-mysqlnd mysql httpd git python python-devel python-pip openssl

    #Third, install boto and botocore

     pip install boto3 botocore

    #Fourth, go into the directory and download wordpress fileset

    wget -P /var/www/html http://wordpress.org/latest.tar.gz

    tar -xvf /var/www/html/latest.tar.gz -c /var/www/html/wordpress

    #Fifth, we select a region for our AWS CLI tool

    export AWS_DEFAULT_REGION=eu-west-1
    
    aws configure set default.region eu-west-1

    #Sixth, we generate the AMI from our instance.

    aws ec2 create-image --region eu-west-1 --instance-id `curl 169.254.169.254/latest/meta-data/instance-id` --name "test-image" --no-reboot
    sleep 60

    #Seventh, replace the default AMI with our provided AMI

    sudo sed -i -e "s/ami-08935252a36e25f85/$(aws ec2 describe-images --owners self | grep "ImageId:*" | awk -F':' '{ print $2 }' | sed 's/\"//g' | sed 's/\,//g' | grep -v "ami-07273f1a8d9bb49c7")/g" main.yml