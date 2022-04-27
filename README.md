# Bind-EshamAaqib
Terraform and Ansible Scripts for the Bind Nodes (DNS)

> NOTE: BEFORE EXECUTING these scripts make sure that you run the "VCN and NAT Gateway" terraform Script in the [Kubernetes-Infrastructure](https://github.com/EshamAaqib/Kubernetes-Infrastructure) Repo 

> Three Instances will be deployed in across the three AD's in europe-north1 region. Each instance will act as a bind server (nameserver). All the ip addresses are reserved and assigned statically so upon reboot the ip addresses will not change. The diagram below will give a clear idea of how everything works. 

![bind drawio](https://user-images.githubusercontent.com/75664650/146055343-9db9379a-b8bd-43eb-a7c4-28e58cfe8272.png)

## Final Outcome 

![wso2](https://user-images.githubusercontent.com/75664650/146055380-34a1cb05-5917-4ac9-82b1-80efcb3d7911.gif)
