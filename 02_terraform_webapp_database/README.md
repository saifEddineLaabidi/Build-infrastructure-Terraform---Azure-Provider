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
# output
azurerm_sql_server.sql: Creating...
azurerm_app_service.web_app: Creating...
azurerm_sql_server.sql: Still creating... [10s elapsed]
azurerm_app_service.web_app: Still creating... [10s elapsed]
azurerm_app_service.web_app: Still creating... [20s elapsed]
azurerm_sql_server.sql: Still creating... [20s elapsed]
azurerm_sql_server.sql: Still creating... [30s elapsed]
azurerm_app_service.web_app: Still creating... [30s elapsed]
azurerm_sql_server.sql: Still creating... [40s elapsed]
azurerm_app_service.web_app: Still creating... [40s elapsed]
azurerm_app_service.web_app: Creation complete after 40s Microsoft.Web/sites/terraform-app-app]
azurerm_sql_server.sql: Still creating... [50s elapsed]
azurerm_sql_server.sql: Still creating... [1m0s elapsed]
azurerm_sql_server.sql: Still creating... [1m10s elapsed]
azurerm_sql_server.sql: Creation complete after 1m12s Sql/servers/terraform-sql-name-server]
azurerm_sql_database.database: Creating...
azurerm_sql_database.database: Still creating... [10s elapsed]
azurerm_sql_database.database: Still creating... [20s elapsed]
azurerm_sql_database.database: Still creating... [30s elapsed]
azurerm_sql_database.database: Still creating... [40s elapsed]
azurerm_sql_database.database: Still creating... [50s elapsed]
azurerm_sql_database.database: Still creating... [1m0s elapsed]
azurerm_sql_database.database: Creation complete after 1m3s Microsoft.Sql/servers/terraform-sql-name-server/databases/ProductsDB]
```

5. **delete the infra**
```terraform
terraform destroy
```