resource "yandex_iam_service_account" "sa" {
  name        = var.name
  description = "Service account for VM management"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.provider_config.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "Static access key for service account"
}

resource "local_file" "sa-key-file" {
  content  = jsonencode({
    id = yandex_iam_service_account_static_access_key.sa-static-key.id
    service_account_id = yandex_iam_service_account_static_access_key.sa-static-key.service_account_id
    created_at = yandex_iam_service_account_static_access_key.sa-static-key.created_at
    key_id = yandex_iam_service_account_static_access_key.sa-static-key.access_key
    secret = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  })
  filename = "${path.module}/sa-keys.json"
  file_permission = "0600"
}
