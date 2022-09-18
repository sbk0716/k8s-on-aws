# 1. Project Overview
* Build Kubernetes cluster on AWS cloud using Terraform.

## (1)Project Features
* Build VPC resources using Terraform.
* Build EKS resources using Terraform.

## (2)Project Structure
```sh
.
├── README.md
├── history
│   └── build-eks.md            <- Describe the work history.
└── terraform
    ├── main.tf                 <- Describe module definitions for creating resources.
    └── modules
        ├── eks
        │   ├── main.tf         <- Describe module definitions for creating resources related to EKS.
        │   └── variables.tf    <- Variables that are inputs to the module (like function arguments).
        └── vpc
            ├── main.tf         <- Describe module definitions for creating resources related to VPC.
            └── outputs.tf      <- Describe variables that output the results of the module (like the return value of a function)
```

# 2. Usage
## 2.0. Prerequisite
* Install Homebrew
* Install AWS CLI

## 2.1. Building AWS resources using Terraform
* Execute the `terraform <subcommand>` command in the `terraform` directory.

```sh
% terraform init
% terraform plan
% terraform apply
```

## 2.2. Confirmation of Kubernetes operation

```sh
% aws eks --region ap-northeast-1 update-kubeconfig --name sample-cluster
% kubectl get namespaces
% kubectl cluster-info
% kubectl get node
```

## Appendix: Cleaning up AWS resources using Terraform
* Execute the `terraform <subcommand>` command in the `terraform` directory.

```sh
% terraform destroy
```

