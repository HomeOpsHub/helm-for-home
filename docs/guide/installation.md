# Installation

Helm for Home charts are published to two registries. Use whichever method fits your workflow.

## GHCR — OCI Artifacts

Charts are published as OCI artifacts to GitHub Container Registry. This is the recommended method for direct installs — no repository setup needed.

### Install a Chart

```bash
helm install <release-name> oci://ghcr.io/homeopshub/charts/<chart-name> --version <version>
```

**Examples:**

```bash
# Uptime Kuma — self-hosted monitoring
helm install uptime-kuma oci://ghcr.io/homeopshub/charts/uptime-kuma --version 0.7.0

# AdGuard Home — network-wide ad blocking
helm install adguard oci://ghcr.io/homeopshub/charts/adguard-home --version 0.13.0

# Home Assistant — home automation
helm install hass oci://ghcr.io/homeopshub/charts/homeassistant --version 0.1.0
```

### View Chart Values

```bash
helm show values oci://ghcr.io/homeopshub/charts/<chart-name> --version <version>
```

### Pull Without Installing

```bash
helm pull oci://ghcr.io/homeopshub/charts/<chart-name> --version <version>
```

## Helm Repository

Charts are also published to a traditional Helm repository hosted on GitHub Pages.

### Add the Repository

```bash
helm repo add helm-for-home https://homeopshub.github.io/helm-for-home/
helm repo update
```

### Search Charts

```bash
# List all charts
helm search repo helm-for-home

# Search by keyword
helm search repo helm-for-home/media
```

### Install a Chart

```bash
helm install <release-name> helm-for-home/<chart-name>

# With a specific version
helm install <release-name> helm-for-home/<chart-name> --version <version>

# In a specific namespace
helm install <release-name> helm-for-home/<chart-name> -n <namespace> --create-namespace
```

## Upgrade & Rollback

```bash
# Upgrade to latest version
helm repo update
helm upgrade <release-name> helm-for-home/<chart-name>

# Upgrade with OCI
helm upgrade <release-name> oci://ghcr.io/homeopshub/charts/<chart-name> --version <new-version>

# Rollback if needed
helm rollback <release-name> <revision>
```

## Uninstall

```bash
helm uninstall <release-name>
```

## Custom Values

### Inline Overrides

```bash
helm install uptime-kuma helm-for-home/uptime-kuma \
  --set persistence.enabled=true \
  --set persistence.size=5Gi \
  --set ingress.enabled=true \
  --set ingress.hosts[0].host=uptime.home.local
```

### Values File

Create a `values.yaml`:

```yaml
persistence:
  enabled: true
  size: 5Gi
  storageClass: longhorn

ingress:
  enabled: true
  className: traefik
  hosts:
    - host: uptime.home.local
      paths:
        - path: /
          pathType: Prefix
  tls:
    - secretName: uptime-tls
      hosts:
        - uptime.home.local
```

```bash
helm install uptime-kuma helm-for-home/uptime-kuma -f values.yaml
```

### Traefik IngressRoute

Every chart supports Traefik's IngressRoute CRD as an alternative to standard ingress:

```yaml
ingressRoute:
  enabled: true
  host: uptime.home.local
  entryPoints:
    - websecure
  tls:
    certResolver: letsencrypt
  middlewares:
    - name: auth-middleware
      namespace: traefik
```
