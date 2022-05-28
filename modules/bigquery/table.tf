resource "google_bigquery_table" "table" {
  for_each = var.tables

  table_id   = each.key
  dataset_id = google_bigquery_dataset.dataset.dataset_id

  dynamic "time_partitioning" {
    for_each = each.value.time_partitioning == null ? [] : [each.value.time_partitioning]

    content {
      expiration_ms = time_partitioning.value.expiration_ms
      field         = time_partitioning.value.field
      type          = time_partitioning.value.type
    }
  }

  schema              = file("${path.module}/resources/schemas/${each.value.schema}")
  deletion_protection = each.value.deletion_protection
}
