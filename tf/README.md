# Terraform IaC Configuration for Google Cloud

This module contains the Infrastructure defined in Terraform for the Jitsi Kubernetes cluster hosted in the Google Cloud.

## Structure

```
.
├── environments -> The different environments (one environment per project)
│   ├── development
│   └── production
└── modules -> The modules containing the infrastructure code (they are referenced by the different environments)
    ├── gke -> Google Kubernetes Engine Cluster for the Jitsi Docker containers
    └── vpc -> Virtual Private Cloud network in which the cluster lives
```

## Usage from work machine

### Google Cloud SDK authentication

Make sure to authenticate with the `gcloud` SDK.
```sh
gcloud auth login
```

Check that you have selected the correct project
```sh
gcloud config get-value project
```

### Terraform usage

Go to the environment's folder you want to work on, for example

```sh
cd environments/development
```

Initialize Terraform
```sh
terraform init
```

Make your changes and verify with
```sh
terraform plan
```

Apply them to remote with
```sh
terraform apply
```

## Adding an environment

Each environment should define a remote state backend for the Terraform state. This ensures that all developers see the latest state of infrastructure.

```sh
PROJECT_ID=$(gcloud config get-value project) # Make sure this is a clean project
gsutil mb gs://${PROJECT_ID}-tfstate # Creates a GCS bucket
gsutil versioning set on gs://${PROJECT_ID}-tfstate # Enables versioning on the bucket
```

Enable Google Cloud APIs for compute and containers
```sh
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
```

Next, create your environment by copying a pre-existing one as template
```sh
cp -r environments/development environments/new_environment
```

Do not forget to update the project id in the `terraform.tfvars` and `backend.tf` files.
