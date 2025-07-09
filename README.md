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
