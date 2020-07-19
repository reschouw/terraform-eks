# terraform-eks

This repo contains all the needed configuration to stand up an AWS EKS cluster from scratch, including the VPC and subnet configuration.


## Purpose
Experiment and learn the process to set up an EKS cluster. This implementation is not intended for production use, as instances and endpoints can be hit from the open internet and have not been locked down with security groups. 

## Installation
If you're familiar with the basics of Terraform and have it already installed, all that should be needed is for you to update the terraform.tf files with your provider information and run a terraform apply in the corresponding directory. 

Installation instructions for Terraform can be found [here](https://learn.hashicorp.com/terraform/getting-started/install.html).

Installation instructions for aws-vault (An excellent AWS Access Key manager) can be found [here](https://github.com/99designs/aws-vault)

## Lessons Learned

 - Subnets with EKS nodes in them are required to have a tag with the name of the cluster. This is created by EKS automagically, but needs to be put in the config for the subnets to avoid accidentally overwriting the tag on running a subsequent terraform apply. See [subnets.tf](https://github.com/reschouw/terraform-eks/blob/master/vpc/subnets.tf)
 - Subnet route tables will automatically include the default local route and as such do not need to be included in the terraform config. See [subnets.tf](https://github.com/reschouw/terraform-eks/blob/master/vpc/subnets.tf)
 - EKS worker nodes need to have open communication with the EKS control plane created by AWS. In this particular implementation the worker nodes are talking over the open internet. This should be changed for any production implementations. 
 - Setting this up was surprisingly easy thanks to EKS doing the heavy lifting. There are really only two important resources in the terraform config: The cluster itself and the worker nodes. See [cluster.tf](https://github.com/reschouw/terraform-eks/blob/master/eks/cluster.tf) and [nodes.tf](https://github.com/reschouw/terraform-eks/blob/master/eks/nodes.tf)

### Author
Ryan Schouweiler:x
