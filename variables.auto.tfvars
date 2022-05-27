apis = [
  "cloudbuild.googleapis.com",
  "cloudfunctions.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "dataflow.googleapis.com",
  "firestore.googleapis.com",
  "iam.googleapis.com",
  "pubsub.googleapis.com",
  "run.googleapis.com",
  "secretmanager.googleapis.com",
  "sqladmin.googleapis.com"
]

app_engine = {
  location = "europe-west"
}

bigquery_datasets = {
  raw = {
    tables = {
      events = {
        schema = "raw/events.json"
        time_partitioning = {
          type = "DAY"
        }
        deletion_protection = false
      }
    }
    delete_contents_on_destroy = true
  }
}

service_accounts = {
  cloud-functions = {
    display_name = "Cloud Functions Service Account"
    roles = [
      "bigquery.dataEditor",
      "bigquery.jobUser",
      "storage.objectViewer"
    ]
  }
  cloud-run = {
    display_name = "Cloud Run Service Account"
  }
  dataflow = {
    display_name = "Dataflow Service Account"
    roles = [
      "dataflow.worker",
      "bigquery.dataEditor",
      "bigquery.jobUser",
      "datastore.user",
      "storage.objectAdmin"
    ]
  }
}
