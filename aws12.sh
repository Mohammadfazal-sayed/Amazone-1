aws ec2 run-instances \
    --image-id ami-02b5fbc2cb28b77b8 \
    --instance-type t2.micro \
    --subnet-id subnet-d41d1bbc \
    --security-group-ids sg-0818a63fb117aafbc \
    --associate-public-ip-address \
    --key-name mumbai \
    --region ap-south-1
