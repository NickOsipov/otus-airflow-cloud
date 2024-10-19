output "service_account_id" {
  value = yandex_iam_service_account.sa.id
  description = "ID of the created service account"
}

output "static_key_id" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.id
  description = "ID of the static access key"
}

output "sa_key_file_path" {
  value = local_file.sa-key-file.filename
  description = "Path to the file containing the service account static key"
}