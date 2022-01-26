output "new_connector_name" {
  description = "Connector Info"
  value       = data.fivetran_connector.connector.schema
}
