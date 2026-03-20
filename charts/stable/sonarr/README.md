# sonarr

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.0.12.2823](https://img.shields.io/badge/AppVersion-4.0.12.2823-informational?style=flat-square)

A Helm chart for Sonarr — a TV show collection manager and PVR

**Homepage:** <https://sonarr.tv>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| HomeOpsHub |  | <https://github.com/HomeOpsHub> |

## Source Code

* <https://github.com/Sonarr/Sonarr>
* <https://github.com/linuxserver/docker-sonarr>

## Description

Sonarr is a PVR for Usenet and BitTorrent users. It monitors RSS feeds for new episodes of your favorite TV shows, grabs them, sorts, and renames them. Originally deployed via [ansible-nas](https://github.com/davestephens/ansible-nas), this chart migrates Sonarr to a Kubernetes-native Helm deployment.

### Features

- Automatic TV show episode monitoring and downloading
- Integration with Prowlarr, SABnzbd, Transmission, and more
- Flexible media volume mounting (hostPath, PVC, NFS)
- Quality profile and release group management
- Calendar view and notifications

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Pod affinity rules |
| autoscaling.enabled | bool | `false` | Enable HPA |
| autoscaling.maxReplicas | int | `3` | Maximum replicas |
| autoscaling.maxReplicas | int | `5` | Maximum replicas |
| autoscaling.minReplicas | int | `1` | Minimum replicas |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilization |
| env.PGID | string | `"1000"` | Group ID for file permissions |
| env.PUID | string | `"1000"` | User ID for file permissions |
| env.TZ | string | `"UTC"` | Timezone |
| extraEnv | list | `[]` | Additional environment variables |
| image.repository | string | `"linuxserver/sonarr"` |  |
| image.tag | string | `""` | Overrides appVersion |
| ingress.enabled | bool | `false` |  |
| ingressRoute.enabled | bool | `false` | Enable Traefik IngressRoute |
| mediaVolumes | list | `[]` | Media library volumes (hostPath, PVC, or NFS) |
| persistence.config.enabled | bool | `true` | Enable config persistence |
| persistence.config.size | string | `"1Gi"` |  |
| resources | object | `{}` |  |
| service.port | int | `8989` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
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
