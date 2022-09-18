# 0. Prerequisite
* Install Homebrew
* Install AWS CLI

# 1. Install Terraform with Homebrew on macOS
FYI:
https://learn.hashicorp.com/tutorials/terraform/install-cli

```sh
% brew tap hashicorp/tap
% brew tap | grep hashicorp
hashicorp/tap
% 
% brew install hashicorp/tap/terraform

Warning: hashicorp/tap/terraform 1.2.9 is already installed and up-to-date.
To reinstall 1.2.9, run:
  brew reinstall terraform
% 
% brew list | grep terraform
terraform
% 
% which terraform
/opt/homebrew/bin/terraform
% 
% terraform -version
Terraform v1.2.9
on darwin_arm64
% 
% brew update
Already up-to-date.
% brew upgrade hashicorp/tap/terraform
Warning: hashicorp/tap/terraform 1.2.9 already installed
% 
```

# 2. Install kubectl with Homebrew on macOS
FYI:
https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/#install-with-homebrew-on-macos

```sh
% brew install kubectl
% which kubectl
/opt/homebrew/bin/kubectl
% kubectl version --output=yaml
clientVersion:
  buildDate: "2022-09-14T19:40:59Z"
  compiler: gc
  gitCommit: e4d4e1ab7cf1bf15273ef97303551b279f0920a9
  gitTreeState: clean
  gitVersion: v1.25.1
  goVersion: go1.19.1
  major: "1"
  minor: "25"
  platform: darwin/arm64
kustomizeVersion: v4.5.7

The connection to the server localhost:8080 was refused - did you specify the right host or port?
% 
```

# 3. Building VPC resources using Terraform
* Execute the `terraform <subcommand>` command in the `terraform` directory.

FYI:
https://www.terraform.io/cli/commands

```sh
% cd terraform
# The `terraform init` command performs several different initialization steps
# in order to prepare the current # working directory for use with Terraform.
% 
% terraform init

Initializing modules...

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.31.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
% 
% ls -a
.                       .gitignore              .terraform.lock.hcl     modules
..                      .terraform              main.tf
% 
# The `terraform plan` command creates an execution plan,
# which lets you preview the changes that Terraform plans to make to your infrastructure.
% terraform plan -json | jq -r '.' > terraform-plan-output.json
% 
% ls | grep terraform-plan-output.json
terraform-plan-output.json
% 
# The terraform apply command executes the actions proposed in a Terraform plan.
% terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:
...
...
Plan: 16 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.k8s-vpc.module.k8s-vpc.aws_eip.nat[0]: Creating...
...
...
module.k8s-vpc.module.k8s-vpc.aws_route.private_nat_gateway[0]: Creation complete after 1s [id=r-rtb-06050378aeb063c441080289494]

Apply complete! Resources: 16 added, 0 changed, 0 destroyed.
% 
```
## Appendix: terraform validate/destroy

```sh
% terraform validate
Success! The configuration is valid.

% 
% terraform destroy
...
...
Plan: 0 to add, 0 to change, 16 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: 

Destroy cancelled.
% 
```


# 2. Building EKS resources using Terraform
* Execute the `terraform <subcommand>` command in the `terraform` directory.

FYI:
https://www.terraform.io/cli/commands

```sh
% cd terraform
# The `terraform init` command performs several different initialization steps
# in order to prepare the current # working directory for use with Terraform.
% 
% terraform init -upgrade 
Upgrading modules...
...
...
Initializing the backend...
...
...

Initializing provider plugins...
...
...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
% 