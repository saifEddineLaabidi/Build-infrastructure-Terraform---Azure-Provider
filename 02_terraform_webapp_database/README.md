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