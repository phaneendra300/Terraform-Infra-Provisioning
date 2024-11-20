# Terraform for Infra Provisioning and Configuration Management:
This project shows how to set up infra structure and do configuration management on top of it.

# # Steps to setup
1. Install Terraform
   + Use this link to install terraform - https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
2. Write Terraform Code
   + Create a file called main.tf with terraform configuration to create the infra and to do configuration managment
   + We can get the sample terraform configuration from offical website - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
3. Run Terraform Code
   + terraform init - This command will download the required provider plugins to interact with cloud service API's
   + terraform fmt - This command will format the terraform configuration with right indentation
   + terraform validate - This command will validate the terraform configuration
   + terraform plan - This command will show the dry run output,the output contains the plan which is going to be applied after we execute terraform apply
   + terraform apply - This command will create actual infrastructure and do configuration management
4. Access Nginx Web Server
   + We can access the nginx web server using the public ip of the ec2 instance - http://<public_ip>
5. Clean Up the infrastructure
   + terraform destroy - This command will destroy the infrastructure that got created when we execute terraform apply.
