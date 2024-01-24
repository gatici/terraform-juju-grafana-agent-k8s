resource "juju_model" "test" {
  name = var.model_name
}

resource "juju_application" "grafana-agent-k8s" {
  name = "grafana-agent-k8s"
  model = juju_model.test.name

  charm {
    name = "grafana-agent-k8s"
    channel = var.channel
    base = "ubuntu@22.04"
  }

  units = 1
  trust = true
}

resource "juju_integration" "prometheus-remote-write" {
  count = var.metrics_remote_write_offer_url != "" ? 1 : 0
  model = juju_model.test.name

  application {
    name     = juju_application.grafana-agent-k8s.name
    endpoint = "send-remote-write"
  }

  application {
    offer_url = var.metrics_remote_write_offer_url
  }
}

resource "juju_integration" "loki-logging" {
  count = var.logging_offer_url != "" ? 1 : 0
  model = juju_model.test.name

  application {
    name     = juju_application.grafana-agent-k8s.name
    endpoint = "logging-consumer"
  }

  application {
    offer_url = var.logging_offer_url
  }
}

