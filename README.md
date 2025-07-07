# Learn Terraform: the IaC tool.

> Made in 2014 but popular around 2017 as opnsourse 
> change open source to BSL in 2023
> Then in 2025 IBM acquired terraform

- Why Terraform?
- Quick deployment with automation, less human error consistency in infra...

### Set Up on the Ubuntu Machine.
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

#### creating s3 @ 1:27:14
#### Interpolation,
- .......