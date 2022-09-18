# 0. Prerequisite
* Install Homebrew
* Install AWS CLI

# 1. Install Terraform with Homebrew on macOS
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

# 3. zzz

```sh

```
