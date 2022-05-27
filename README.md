# Terraform GCP template

Terraform code and basic configuration for some Google Cloud resources:

- APIs
- App Engine/Firestore
- BigQuery
- Service accounts
- Storage

## Pre-requisites

- Terraform version >= 1.2.1

## Deployment

Set environment variables

| Variable         | Description                                |
|------------------|--------------------------------------------|
| TF_CLI_ARGS_init | Terraform backend configuration            |
| TF_WORKSPACE     | Terraform workspace, e.g. dev, stage, prod |
| TF_VAR_project   | GCP project                                |

### Deploy infrastructure

Initialize working directory

```bash
terraform init
```

Make plan

```bash
terraform plan -out tfplan
```

Apply plan

```bash
terraform apply tfplan
```
