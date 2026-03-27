# Getting Started

Get up and running with Helm for Home in minutes.

## Prerequisites

- A running Kubernetes cluster ([k3s](https://k3s.io/), [MicroK8s](https://microk8s.io/), or similar)
- [Helm](https://helm.sh/docs/intro/install/) v3.12+

## Install Your First Chart

### Option 1: From GHCR (OCI)

No repository setup needed — pull charts directly from GitHub Container Registry:

```bash
helm install uptime-kuma oci://ghcr.io/homeopshub/charts/uptime-kuma --version 0.7.0
```

### Option 2: From Helm Repository

```bash
# Add the repository
helm repo add helm-for-home https://homeopshub.github.io/helm-for-home/
helm repo update

# Search available charts
helm search repo helm-for-home

# Install a chart
helm install uptime-kuma helm-for-home/uptime-kuma
```

## Customize Values

Every chart ships with sensible defaults. View all configurable options:

```bash
# From GHCR
helm show values oci://ghcr.io/homeopshub/charts/uptime-kuma --version 0.7.0

# From Helm repo
helm show values helm-for-home/uptime-kuma
```

Install with custom values:

```bash
helm install uptime-kuma helm-for-home/uptime-kuma -f my-values.yaml
```

## What Every Chart Includes

All charts in this collection share a consistent feature set:

| Feature | Description |
|---------|-------------|
| **Deployment** | Configurable strategy and replicas |
| **Service** | ClusterIP default, configurable type |
| **Ingress** | className and TLS support |
| **IngressRoute** | Traefik CRD with middleware and certResolver |
| **PersistentVolumeClaim** | Configurable storageClass and size |
| **ServiceAccount** | With automount control |
| **HPA** | autoscaling/v2 |
| **Health Probes** | Liveness and readiness |
| **Security Contexts** | Pod and container level |
| **Extra Resources** | env vars, volumes, and volume mounts |

## Chart Categories

Charts are organized into two tiers:

- **Stable** — Production-ready, tested, and validated charts (160+)
- **Beta** — Experimental charts under active development

Browse all charts on [GitHub](https://github.com/HomeOpsHub/helm-for-home/tree/main/charts).

## Next Steps

- [Installation Methods](/guide/installation) — detailed OCI and repo install docs
- [Chart Development](/guide/chart-development) — create your own charts
- [Contributing](/guide/contributing) — help grow the collection
