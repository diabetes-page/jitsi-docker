terraform {
  backend "gcs" {
    bucket = "diabetes-page-production-tfstate"
    prefix = "env/production"
  }
}
