# Common Library Chart

This is a library chart that provides common templates and helper functions for all charts in the Home Lab collection.

## Overview

The common library chart centralizes:
- Template definitions for standard Kubernetes resources
- Helper functions for naming, labeling, and configuration
- Consistent defaults and best practices
- Security configurations

## Usage

To use this library in your chart, add it as a dependency in your `Chart.yaml`:

```yaml
apiVersion: v2
name: my-chart
version: 1.0.0
dependencies:
  - name: common
    version: 1.0.0
    repository: "file://../common"
```

Then in your templates, you can use the common templates:

```yaml
# templates/deployment.yaml
{{ include "common.deployment" . }}
```

## Available Templates

### Core Resources
- `common.deployment` - Standard Deployment template
- `common.service` - Standard Service template
- `common.serviceAccount` - ServiceAccount template
- `common.ingress` - Ingress template
- `common.ingressRoute` - Traefik IngressRoute template
- `common.persistentVolumeClaim` - PVC template
- `common.configMap` - ConfigMap template
- `common.secret` - Secret template
- `common.hpa` - HorizontalPodAutoscaler template

### Helper Functions
- `common.name` - Chart name
- `common.fullname` - Full resource name
- `common.chart` - Chart name and version
- `common.labels` - Standard labels
- `common.selectorLabels` - Selector labels
- `common.serviceAccountName` - Service account name
- `common.image` - Image reference with tag
- `common.imagePullPolicy` - Image pull policy

### Configuration Helpers
- `common.env` - Environment variables
- `common.volumeMounts` - Volume mounts
- `common.volumes` - Volumes
- `common.resources` - Resource limits and requests
- `common.nodeSelector` - Node selector
- `common.tolerations` - Tolerations
- `common.affinity` - Affinity rules

## Standard Values Schema

The common library expects a standardized values structure:

```yaml
# Image configuration
image:
  repository: my-app
  tag: latest
  pullPolicy: IfNotPresent

# Service configuration
service:
  type: ClusterIP
  port: 80
  targetPort: http

# Persistence
persistence:
  enabled: false
  size: 8Gi
  accessMode: ReadWriteOnce
  storageClass: ""

# Ingress
ingress:
  enabled: false
  className: ""
  annotations: {}
  hosts: []
  tls: []

# Traefik IngressRoute
ingressRoute:
  enabled: false
  host: ""
  tls:
    enabled: false

# Resources
resources:
  limits: {}
  requests: {}

# Autoscaling
autoscaling:
  enabled: false
  minReplicas: 1
  maxReplicas: 100

# Security contexts
podSecurityContext: {}
securityContext: {}

# Environment variables
env: []
envFromConfigMap: ""
envFromSecret: ""

# Home lab specific
homelab:
  timezone: UTC
  domain: home.local
  storageClass: longhorn
  ingressClass: traefik
```

## Examples

### Basic Usage

```yaml
# Chart.yaml
dependencies:
  - name: common
    version: 1.0.0
    repository: "file://../common"
```

```yaml
# templates/deployment.yaml
{{ include "common.deployment" . }}
```

```yaml
# templates/service.yaml
{{ include "common.service" . }}
```

### Custom Deployment with Sidecar

```yaml
# templates/deployment.yaml
{{- $deployment := include "common.deployment" . | fromYaml }}
{{- $_ := set $deployment.spec.template.spec "containers" (append $deployment.spec.template.spec.containers (dict "name" "sidecar" "image" "sidecar:latest")) }}
{{ toYaml $deployment }}
```

### Custom Values

```yaml
# values.yaml
image:
  repository: nginx
  tag: alpine

service:
  port: 80

ingressRoute:
  enabled: true
  host: nginx.home.local

persistence:
  enabled: true
  size: 1Gi
```

## Security Features

The common library includes security best practices:

- Non-root user containers by default
- Read-only root filesystem where possible
- Security contexts with appropriate capabilities
- Network policies (when enabled)
- Pod security standards compliance

## Home Lab Optimizations

Special features for home lab environments:

- **Traefik IngressRoute support** - Native Traefik v2 configuration
- **Longhorn storage** - Default storage class for persistent volumes
- **Local domain support** - Automatic domain generation for local access
- **Resource efficiency** - Optimized defaults for small-scale deployments

## Contributing

When modifying the common library:

1. Ensure backward compatibility
2. Update documentation
3. Test with multiple charts
4. Follow semantic versioning
5. Update dependent charts as needed

## Version History

- **1.0.0** - Initial release with core templates
  - Basic Deployment, Service, ConfigMap, Secret templates
  - Standard helper functions
  - Home lab optimizations
