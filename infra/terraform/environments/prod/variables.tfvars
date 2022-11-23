### General
region      = "us-east-1"
environment = "prd"

### Autoscaling
instance-name        = "webapp"
ami                  = "ami-09d3b3274b6c5d4aa"
instance_type        = "t2.micro"
monitoring           = true
desired_capacity     = 2
min_size             = 2
max_size             = 3
termination_policies = "OldestInstance"

### Storage
volume_size = 8
volume_type = "gp2"
encrypted   = true

### Network
vpc_id                = "vpc-05fedc6b77d795992"
subnetid_aza          = "subnet-03e592133473c3733"
subnetid_azb          = "subnet-0f76b3d2331dde8fc"
subnetid_azc          = "subnet-0b680ccd2b874a99b"
load_balancer_arn     = "arn:aws:elasticloadbalancing:us-east-1:850226433404:loadbalancer/app/ddddd/1fc6311b721278bf"
wait_for_elb_capacity = 2

### Tags
owner       = "Marketing"