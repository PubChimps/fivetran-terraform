# fivetran-terraform

This repo has code to create multiple modern data stacks with the [Fivetran Terraform provider](https://registry.terraform.io/providers/fivetran/fivetran/latest), and separate them into dev, test, and prod deployments. These deployments can be separated [within modules](#module), by [repositories](#repo), or [workspaces](#workspaces)

There are 4 files used in different ways 

#### *main.tf* - A terraform module that will create a Fivetran connector 

#### *outputs.tf* - Formats and generates output values from main.tf

#### *terraform.tfvars* - Contains value for each variable declared in variables.tf

#### *variables.tf* - Defines variables that are used in main.tf

After cloning this repo, terraform.tfvars the following lines will have to be edited, regardless of which option is used to separate deployments 

``` 
fivetran_api_key = "YOUR FIVETRAN API KEY"                  // Fivetran API key and secret can be found 
fivetran_api_secret = "YOUR FIVETRAN API SECRET"            // at https://fivetran.com/account/settings
fivetran_group_id = "YOUR FIVETRAN DESTINATION GROUP ID"    // Destination Group ID is at https://fivetran.com/dashboard/warehouse
stripe_key = "YOUR STRIPE KEY"                              // https://stripe.com/docs/keys , other connector types can be used
```

## In Module  <a name="module"></a>
The following commands close this repository and create Fivetran resources for each deployment in a single module. Before running, edit the in-module/terraform.tfvars file.

```
git clone https://github.com/PubChimps/fivetran-terraform
cd in-module        
terraform init
terraform plan
terraform apply
```


## Repositories  <a name="repo"></a>
The following commands clone this repository and create Fivetran resource with each of the subrepositories. Before running, edit the terraform.tfvars file in each repo.
```
git clone https://github.com/PubChimps/fivetran-terraform
cd repositories/dev         
terraform init
terraform plan
terraform apply
cd ../test
terraform plan
terraform apply
cd ../prod
terraform plan
terraform apply
```

## Workspaces  <a name="workspaces"></a>
The following commands clone this repository, create 3 Terraform workspaces and a Fivetran resource in each:

```
git clone https://github.com/PubChimps/fivetran-terraform
cd workspaces                 //edit workspaces/terraform.tfvars file
terraform init
terraform workspace new dev
terraform plan
terraform apply
terraform terraform workspace new test
terraform plan
terraform apply
terraform workspace new prod
terraform plan
terraform apply
```
