resource "juju_application" "grafana-agent-k8s" {
  name = "grafana-agent-k8s"
  model = var.model_name

  charm {
    name = "grafana-agent-k8s"
    channel = var.channel
    base = "ubuntu@22.04"
  }

  units = 1
  trust = true
}
