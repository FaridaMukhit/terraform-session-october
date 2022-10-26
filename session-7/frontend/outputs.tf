output "db_password" {
  value = data.terraform_remote_state.db.outputs.db_password
}