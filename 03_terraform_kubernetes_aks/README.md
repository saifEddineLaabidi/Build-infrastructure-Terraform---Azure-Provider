# AKS
Azure Kubernetes Service (AKS) is a container management service provided by Microsoft Azure. It simplifies the deployment, management and scalability of containerized applications using Kubernetes, an open source container orchestrator. Here are some key points to know about AKS
# ACR 
Azure Container Registry (ACR) is an Azure service that enables developers to store and manage Docker container images for application deployments in Azure. Here are some key points to know about ACR 

1. **initialize terraform Azure modules**
```terraform
terraform init
```

2. **plan and save the infra changes into tfplan file**
```terraform
terraform plan -out tfplan
```

3. **show the tfplan file**
```terraform
terraform show -json tfplan
terraform show -json tfplan >> tfplan.json
```

4. **apply the infra changes**
```terraform
terraform apply tfplan
```

5. **delete the infra**
```terraform
terraform destroy
```