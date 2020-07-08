    #!/bin/sh

    #Deploy an instance in selected region with custom script included in the local repo

        aws ec2 run-instances --image-id ami-0c3e74fa87d2a4227 --count 1 --key-name stack_key_pair --instance-type t2.micro  --security-group-ids sg-0b3df30e75c5ec04a --subnet-id subnet-0014b42dc6eb87008 --user-data file://config.sh --iam-instance-profile Name=adminrole