terraform {
  backend "gcs" {
    bucket = "diabetes-page-development-tfstate"
    prefix = "env/development"
  }
}
