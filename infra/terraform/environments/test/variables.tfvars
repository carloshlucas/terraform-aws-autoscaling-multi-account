### General
region      = "us-east-1"
environment = "tst"

### Autoscaling Group
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
vpc_id                = "vpc-0cd6029888b3dbcdd"
subnetid_aza          = "subnet-009e52dcc4254eccd"
subnetid_azb          = "subnet-0fa613bd00620a7f5"
subnetid_azc          = "subnet-09825ee2398f2977f"
load_balancer_arn     = "arn:aws:elasticloadbalancing:us-east-1:692222659737:loadbalancer/app/ddd/319ca6c30adccbdd"
wait_for_elb_capacity = 2

### Tags
owner       = "Marketing"