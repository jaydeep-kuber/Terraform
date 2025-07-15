# Learn Terraform: the IaC tool

> Made in 2014 but popular around 2017 as opnsourse
> change open source to BSL in 2023
> Then in 2025 IBM acquired terraform

- Why Terraform?
- Quick deployment with automation, less human error consistency in infra...

## Set Up on the Ubuntu Machine

- [Terraform official download](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- Terraform use HashiCorp configuration language,

- HCL language general block:

```HCL
    <block> <Parameters> {
        args
    }
```

- We need to initilize terraform in work directory at once, below is the command for it.

```bash
    terraform init
```

- Next, After writing `tf` file we ned to validate this file, below is the command for it.

```bash
    terraform validate
```

- Next, **the planning** planning is some what like dry run of the code, what changes will be there after applying `tf` changes.

```bash
    terraform plan
```

- finally, we can apply for make permanent changes.

```bash
    terraform apply 
```

- To destroy the applied changes,

```bash
    terraform destroy
```

- while you are doing apply and destroy in terraform it ask for permission we can make it auto using below command,

```bash
    terraform apply -auto-approve
```

### creating s3

- very first we need AWS provider for create AWS resourse.

#### Steps to get AWS provider

- Go to [Terraform AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) ; this is a doc link
- on this page you will find code which we need. i also mention below.

```code
    terraform {
      required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.2.0"
        }
      }
    }
```

- Copy above code change version accorsding to mention on docs.
- Create a file `terraform.tf` paste this code with new/latest version.
- Run following command

```bash
    terraform init
```

- it will install AWS provder.

- To configure terraform we use `terraform.tf` file.

- To configure provider we use `provider.tf` file.

- After creating `s3.tf` and configure provider for aws in `provider.tf` use below command.

```bash
    terraform plan
```

#### Interpolation

- interpolation is way using you can inherit or extract property from terraform block.

#### meta arguments

1.count: this meta arg use to create 'n' number of ec

```python
    resource "aws_instance" "TF-ec" {
        count = 2 # create two EC.
        key_name = aws_key_pair.terra-key-ec2.key_name
        security_groups = [aws_security_group.terra-sg.name]
        instance_type = var.ec2_instance_type
        ami = var.ec2_ami_id # Ubuntu 24.04 LTS in ap-south-1 region
        user_data = file("install_nginx.sh") # Script to install nginx
        tags = {
            Name = "create-by-terra"
        }
    }
```

- if you have created `output.tf` then for multiple EC output you need to change it as below mentioned

```python
    output "ec2_public_ip"{
      value = aws_instance.TF-ec[*].public_ip
    }
```

- [*] this notaion tells ip of multiple EC

2.for_each: this is an other meta-arg key word.

```python
    
        resource "aws_instance" "TF-ec" {
        
        for_each = tomap({
            "Tf-ec-small" = "t2.small"
            "Tf-ec-mid" = "t2.medium"
        })

        key_name = aws_key_pair.terra-key-ec2.key_name
        security_groups = [aws_security_group.terra-sg.name]
        instance_type = each.key
        ami = var.ec2_ami_id # Ubuntu 24.04 LTS in ap-south-1 region
        user_data = file("install_nginx.sh") # Script to install nginx
        tags = {
            Name = each.value
        }
    }

```

- To make dependacy in terraform use one more meta arg,

```python
    depends_on = [aws_security_group.terra-sg]
```

- turnery in terraform like, if else

```python
    volume_size = var.ENV =="prod" ? var.ec2_root_volume_size : 8 # Size in GB
```

### Terraform state management with AWS

- What is a state?
- - a persistent record of the infrastructure managed by Terraform, acting as a map between the resources defined in configuration files and their real-world counterparts

```python
    # commands for terraform state.
    terraform state list
    terraform state show {res.ref_name}
    terraform state rm {res.ref_name} # this command will remove state management now actual res. 
    terraform import {res.ref_name} {id-from-aws} 
```

#### secure state management best practice

- will do tomorrow
