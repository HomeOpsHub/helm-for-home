# bazarr

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.5.1](https://img.shields.io/badge/AppVersion-1.5.1-informational?style=flat-square)

A Helm chart for Bazarr — automatic subtitle management for Sonarr and Radarr

**Homepage:** <https://www.bazarr.media>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| HomeOpsHub |  | <https://github.com/HomeOpsHub> |

## Source Code

* <https://github.com/morpheus65535/bazarr>

## Description

Bazarr is a companion application to Sonarr and Radarr that manages and downloads subtitles based on your requirements. It automatically searches for missing subtitles and downloads them as soon as they become available. Originally deployed via [ansible-nas](https://github.com/davestephens/ansible-nas), this chart migrates Bazarr to a Kubernetes-native Helm deployment.

### Features

- Automatic subtitle search and download for movies and TV shows
- Integration with Sonarr and Radarr for seamless media management
- Support for multiple subtitle providers (OpenSubtitles, Subscene, etc.)
- Multi-language subtitle support
- Persistent storage for configuration and database
- Flexible media volume mounts (hostPath, PVC, NFS)

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Pod affinity rules |
| autoscaling.enabled | bool | `false` | Enable HPA |
| autoscaling.maxReplicas | int | `5` | Maximum replicas |
| autoscaling.minReplicas | int | `1` | Minimum replicas |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilization |
| env.PGID | string | `"1000"` | Group ID for file permissions |
| env.PUID | string | `"1000"` | User ID for file permissions |
| env.TZ | string | `"UTC"` | Timezone |
| extraEnv | list | `[]` | Additional environment variables |
| fullnameOverride | string | `""` | Override the fullname |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"linuxserver/bazarr"` |  |
| image.tag | string | `""` | Overrides the image tag (default is chart appVersion) |
| imagePullSecrets | list | `[]` | Image pull secrets |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` | Ingress class name |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"bazarr.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| ingressRoute.enabled | bool | `false` | Enable Traefik IngressRoute |
| ingressRoute.metadata.annotations | object | `{}` | IngressRoute annotations |
| ingressRoute.metadata.name | string | `""` | Override IngressRoute name |
| ingressRoute.metadata.namespace | string | `""` | Override IngressRoute namespace |
| ingressRoute.spec.entrypoints | list | `[]` | Traefik entrypoints |
| ingressRoute.spec.routes | list | `[]` | Traefik routing rules |
| ingressRoute.spec.tls.certResolver | string | `""` | Cert resolver (e.g. letsencrypt) |
| ingressRoute.spec.tls.domains | list | `[]` | TLS domain configuration |
| ingressRoute.spec.tls.enabled | bool | `false` | Enable TLS |
| ingressRoute.spec.tls.secretName | string | `""` | TLS secret name |
| livenessProbe | object | httpGet on `/` port `http` | Liveness probe configuration |
| mediaVolumes | list | `[]` | Media volumes for movies and TV directories |
| nameOverride | string | `""` | Override the chart name |
| nodeSelector | object | `{}` | Node selector |
| persistence.config.accessModes | list | `["ReadWriteOnce"]` | PVC access modes |
| persistence.config.enabled | bool | `true` | Enable persistent storage for config |
| persistence.config.size | string | `"1Gi"` | PVC size |
| persistence.config.storageClass | string | `""` | Storage class name |
| podAnnotations | object | `{}` | Additional pod annotations |
| podLabels | object | `{}` | Additional pod labels |
| podSecurityContext | object | `{}` | Pod-level security context |
| readinessProbe | object | httpGet on `/` port `http` | Readiness probe configuration |
| replicaCount | int | `1` | Number of replicas |
| resources | object | `{}` | CPU/memory resource requests and limits |
| securityContext | object | `{}` | Container-level security context |
| service.port | int | `6767` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | ServiceAccount annotations |
| serviceAccount.automount | bool | `false` | Auto-mount API credentials |
| serviceAccount.create | bool | `true` | Create a ServiceAccount |
| serviceAccount.name | string | `""` | ServiceAccount name override |
| tolerations | list | `[]` | Pod tolerations |
| volumeMounts | list | `[]` | Additional volume mounts |
| volumes | list | `[]` | Additional volumes |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
