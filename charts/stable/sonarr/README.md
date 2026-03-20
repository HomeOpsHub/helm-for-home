# sonarr

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.0.12.2823](https://img.shields.io/badge/AppVersion-4.0.12.2823-informational?style=flat-square)

A Helm chart for Sonarr — a PVR for Usenet and BitTorrent users to manage TV shows

**Homepage:** <https://sonarr.tv>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| HomeOpsHub |  | <https://github.com/HomeOpsHub> |

## Source Code

* <https://github.com/Sonarr/Sonarr>
* <https://github.com/linuxserver/docker-sonarr>

## Description

Sonarr is a PVR (Personal Video Recorder) for Usenet and BitTorrent users. It monitors multiple RSS feeds for new episodes of your favourite TV shows and automatically grabs, sorts, and renames them. Originally deployed via [ansible-nas](https://github.com/davestephens/ansible-nas), this chart migrates Sonarr to a Kubernetes-native Helm deployment.

### Features

- Automatic TV show monitoring and downloading
- Calendar view of upcoming episodes
- Manual search for missing episodes
- Full integration with popular download clients (SABnzbd, NZBGet, qBittorrent, Transmission, etc.)
- Support for multiple indexers (Newznab, Torznab)
- Automatic quality upgrades when better versions are available
- Failed download handling and retry
- Flexible media volume configuration (hostPath, NFS, existing PVCs)
- Persistent configuration storage
- Health checks via `/ping` endpoint
- Traefik IngressRoute and standard Kubernetes Ingress support

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
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"linuxserver/sonarr"` | Container image repository |
| image.tag | string | `""` | Overrides the image tag (default is chart appVersion) |
| imagePullSecrets | list | `[]` | Image pull secrets |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.className | string | `""` | Ingress class name |
| ingress.enabled | bool | `false` | Enable Kubernetes Ingress |
| ingress.hosts[0].host | string | `"sonarr.local"` | Default hostname |
| ingress.hosts[0].paths[0].path | string | `"/"` | Default path |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` | Path type |
| ingress.tls | list | `[]` | TLS configuration |
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
| livenessProbe | object | httpGet on `/ping` port `http` | Liveness probe configuration |
| mediaVolumes | list | `[]` | Media volumes for TV shows, downloads, etc. |
| nameOverride | string | `""` | Override the chart name |
| nodeSelector | object | `{}` | Node selector |
| persistence.config.accessModes | list | `["ReadWriteOnce"]` | PVC access modes |
| persistence.config.enabled | bool | `true` | Enable persistent storage for config |
| persistence.config.size | string | `"1Gi"` | PVC size |
| persistence.config.storageClass | string | `""` | Storage class name |
| podAnnotations | object | `{}` | Additional pod annotations |
| podLabels | object | `{}` | Additional pod labels |
| podSecurityContext | object | `{}` | Pod-level security context |
| readinessProbe | object | httpGet on `/ping` port `http` | Readiness probe configuration |
| replicaCount | int | `1` | Number of replicas |
| resources | object | `{}` | CPU/memory resource requests and limits |
| securityContext | object | `{}` | Container-level security context |
| service.port | int | `8989` | Service port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | ServiceAccount annotations |
| serviceAccount.automount | bool | `false` | Auto-mount API credentials |
| serviceAccount.create | bool | `true` | Create a ServiceAccount |
| serviceAccount.name | string | `""` | ServiceAccount name override |
| tolerations | list | `[]` | Pod tolerations |
| volumeMounts | list | `[]` | Additional volume mounts |
| volumes | list | `[]` | Additional volumes |

## Media Volumes

The `mediaVolumes` value allows you to mount media directories into the Sonarr container. This supports three backends:

### Host Path

```yaml
mediaVolumes:
  - name: tv
    mountPath: /tv
    hostPath: /mnt/media/tv
  - name: downloads
    mountPath: /downloads
    hostPath: /mnt/downloads
```

### Existing PVC

```yaml
mediaVolumes:
  - name: tv
    mountPath: /tv
    existingClaim: tv-shows-pvc
```

### NFS

```yaml
mediaVolumes:
  - name: media
    mountPath: /media
    nfs:
      server: 192.168.1.100
      path: /volume1/media
```

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
