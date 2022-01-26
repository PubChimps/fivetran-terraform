terraform {
  required_providers {
    fivetran = {
      source = "fivetran/fivetran"
      version = "0.2.3"
    }
  }
}

provider "fivetran" {
    api_key = var.fivetran_api_key
    api_secret = var.fivetran_api_secret
}


resource "fivetran_connector" "stripe_example_dev" {
    group_id = var.fivetran_group_id
    service = "stripe"
    sync_frequency = 60
    paused = false
    pause_after_trial = false
    schema = "new_stripe_example_dev"

    config {
        api_key = var.stripe_key
    }
}

resource "fivetran_connector" "stripe_example_test" {
    group_id = var.fivetran_group_id
    service = "stripe"
    sync_frequency = 60
    paused = false
    pause_after_trial = false
    schema = "new_stripe_example_test"

    config {
        api_key = var.stripe_key
    }
}

resource "fivetran_connector" "stripe_example_prod" {
    group_id = var.fivetran_group_id
    service = "stripe"
    sync_frequency = 60
    paused = false
    pause_after_trial = false
    schema = "new_stripe_example_prod"

    config {
        api_key = var.stripe_key
    }
}

data "fivetran_connector" "connector" {
    id = fivetran_connector.stripe_example_dev.id
}
