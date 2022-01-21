variable "stripe_key" {
    description = "stripe api key"
    type = string
    sensitive = true
}

variable "fivetran_group_id" {
    description = "set destination for connector"
    type = string
    sensitive = true
}

variable "fivetran_api_key" {
    description = "Fivetran API Key"
    type = string
    sensitive = true
}

variable "fivetran_api_secret" {
    description = "Fivetran API Secret"
    type = string
    sensitive = true
}

variable "stripe_connector_name" {
    description = "name for the connector"
    type = string
}
