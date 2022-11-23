# AWS Multi-account deployment with Btibucket and Terraform

This repositiory contains a set of Terraform scripts that deploy the AWS Autoscaling solution being trigged by a Bitbucket pipeline in an AWS Multi-Account scenario with Terraform remote backend.

---
## Prerequisities

This repository only covers the Autoscaling Group creation and the integration with Bitbucket Pipeline for AWS Multi-Account. There are some resources that need to be created beforehand.

1. **AWS (Steps)**
    - IAM Users
        - You need to create one user per account (Programmatic Access is more than enough), in our case Test, Staging and Production and assign the right policies (You can skip it if you already have the accounts created).

    - Subnets (3 az's)
        - Create 6 subnets and assign one for each Availability Zone.
        - Assign 3 for the public subnet
        - Assign the other 3 for the private subnet

    - Application Load Balancer
        - Create or reuse you application LB (It is required to create the listener inside it)

    - Nat Gateway
        - You need a NAT Gateway to provide internet to the instances inside the Private Subnets (Without it the packages cannot be installed and your instances will keep rebooting). Don't forget to add the Nat Gateway to the right route table.

    - S3 Bucket
        - You need a S3 bucket in order to save the terraform.tfstate.

2. **Terraform (Steps)**
    - You must edit some files in order to make it work as you wish, the files are inside infra/terraform/environments/
      - Each evironment has your own configuration, the files that you need to change with your own data are:
        - backend.conf
        - variables.tvars

3. **Bitbucket (Steps)**
    - Create an account (It's free with some deployment limitation, but this is enough to make it work)
    - Create a project
    - Enable the Multifactor Authentication for the account (If you skip this step you aren't able to enable the pipeline later)
    - Generate you SSH Key locally and copy the content of the public key to the Bitbucket
    - Go to Workspace Settings > Find the option Workspace Variables > Create 6 variables (2 for each environment).
        - **Test**
            - AWS_ACCESS_KEY_ID_TEST
            - AWS_SECRET_ACCESS_KEY_TEST (make sure that the box secure is marked)
        - **Staging**
            - AWS_ACCESS_KEY_ID_STAGING
            - AWS_SECRET_ACCESS_KEY_STAGING (make sure that the box secure is marked)
        - **Production**
            - AWS_ACCESS_KEY_ID_PRODUCTION
            - AWS_SECRET_ACCESS_KEY_PRODUCTION (make sure that the box secure is marked)

# Instructions
  - After covering all the prerquisites it is time to clone this repository, change the content of the files and push the changes to you own Bitbucket repository.
  - After pushing all the changes you now are capable to enable the Pipeline for the repository (Remember that you need to enable the Multifactor Authentication)
  - If everything went well, it is time to make your first deploy in your TST account.
  - Check the Target Group and check if the instances are in the Health state (It might take some minutes)
  - It is time to test you webserver application, in order to do that navigate to the AWS console, copy the Load Balancer DNS and paste it to your browser. You must be able to see this message "Hello World from Terraform module "Your Private IPs""