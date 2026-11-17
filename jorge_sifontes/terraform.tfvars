# Replace these values with your own before running terraform apply
aws_region        = "us-east-1"
instance_name     = "jorge-sifontes-ec2"
instance_type     = "t3.micro"
ami_id            = "ami-0c02fb55956c7d316" # Amazon Linux 2023 - us-east-1
key_name          = "your-key-pair-name"
vpc_id            = "vpc-xxxxxxxxxxxxxxxxx"
subnet_id         = "subnet-xxxxxxxxxxxxxxxxx"
root_volume_size  = 20
environment       = "dev"
ssh_allowed_cidrs = ["0.0.0.0/0"]
