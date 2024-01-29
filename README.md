# Grafana-agent-k8s Terraform Module

This Grafana-agent-k8s Terraform module aims to deploy the [grafana-agent-k8s charm](https://charmhub.io/grafana-agent-k8s) via Terraform.

## Getting Started

### Prerequisites

The following software and tools needs to be installed and should be running in the local environment.

- `microk8s`
- `juju 3.x`
- `terrafom`

### Deploy Grafana-agent-k8s using Terraform

Make sure that `storage` plugin is enabled for Microk8s:

```console
sudo microk8s enable hostpath-storage
```

Add a Juju model:

```console
juju add model <model-name>
```

Initialise the provider:

```console
terraform init
```

Customize the configuration inputs under `terraform.tfvars` file according to requirement.

Replace the `model-name` value in the `terraform.tfvars` file:

```yaml
model_name =<your model-name>
```

Run Terraform Plan by providing var-file:

```console
terraform plan -var-file="terraform.tfvars" 
```

Deploy the resources, skip the approval:

```console
terraform apply -auto-approve 
```

### Check the Output

Run `juju switch <juju model>` to switch to the target Juju model and observe the status of the application.

```console
juju status
```

The output should be similar to the following. The charm is blocked until the relations are joined.

```console
Model    Controller          Cloud/Region        Version  SLA          Timestamp
test  microk8s-localhost  microk8s/localhost  3.1.7    unsupported  15:57:12+03:00

App                Version  Status   Scale  Charm              Channel        Rev  Address         Exposed  Message
grafana-agent-k8s  0.32.1   waiting      1  grafana-agent-k8s  latest/stable   51  10.152.183.195  no       installing agent

Unit                  Workload  Agent  Address      Ports  Message
grafana-agent-k8s/0*  blocked   idle   10.1.146.47         Missing incoming ('requires') relation
```

### Clean Up

Remove the application:

```console
terraform destroy -auto-approve
```
