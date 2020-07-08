    #!/bin/sh

    #Deploy an instance in selected region with custom script included in the local repo

    aws ec2 run-instances --image-id ami-0c3e74fa87d2a4227 --count 1 --key-name stack_key_pair --region eu-west-1 --instance-type t2.micro  --security-group-ids sg-0b3df30e75c5ec04a --subnet-id subnet-0014b42dc6eb87008 --user-data file://config.sh --iam-instance-profile Name=adminrole
    
    #Replace the default AMI with our newly generated AMI
    
    aws ec2 describe-images --region eu-west-1 --owners self | grep "ImageId:*" | awk -F':' '{ print $2 }' | sed 's/\"//g' | sed 's/\,//g' | sed 's/^[[:space:]]*//g' |  grep -v "ami-07273f1a8d9bb49c7"

    # sudo sed -e "s/ami-08935252a36e25f85/$(aws ec2 describe-images --region eu-west-1 --owners self | grep "ImageId:*" | awk -F':' '{ print $2 }' | sed 's/\"//g' | sed 's/\,//g' | sed 's/^[[:space:]]*//g' |  grep -v "ami-07273f1a8d9bb49c7")/g" main.yml
