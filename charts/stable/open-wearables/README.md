# open-wearables

![Version: 0.6.0](https://img.shields.io/badge/Version-0.6.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.3](https://img.shields.io/badge/AppVersion-0.3-informational?style=flat-square)

A Helm chart for deploying Open Wearables - a self-hosted platform to unify wearable health data through one AI-ready API.

**Homepage:** <https://github.com/the-momentum/open-wearables>

## Source Code

* <https://github.com/the-momentum/open-wearables>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| backend | object | `{"command":["/bin/bash","scripts/start/app.sh"],"containerPorts":[{"containerPort":8000,"name":"http","protocol":"TCP"}],"extraEnv":[],"image":{"pullPolicy":"IfNotPresent","repository":"ghcr.io/atulmgupta/open-wearables-backend","tag":"v1.0.0"},"livenessProbe":{"httpGet":{"path":"/health","port":"http"},"initialDelaySeconds":30,"periodSeconds":10},"readinessProbe":{"httpGet":{"path":"/health","port":"http"},"initialDelaySeconds":15,"periodSeconds":5},"replicaCount":1,"resources":{},"service":{"port":8000,"type":"ClusterIP"}}` | --------------------------------------------------------- |
| beat | object | `{"command":["celery","-A","app.celery_app","beat","--loglevel=debug"],"enabled":true,"extraEnv":[],"image":{"pullPolicy":"IfNotPresent","repository":"ghcr.io/atulmgupta/open-wearables-backend","tag":"v1.0.0"},"replicaCount":1,"resources":{}}` | --------------------------------------------------------- |
| configmap | object | `{"data":{},"enabled":false}` | --------------------------------------------------------- |
| externalPostgresql | object | `{"database":"open_wearables","host":"postgresql","password":"","port":5432,"username":"open_wearables"}` | --------------------------------------------------------- |
| frontend | object | `{"containerPorts":[{"containerPort":3000,"name":"http","protocol":"TCP"}],"enabled":true,"extraEnv":[],"image":{"pullPolicy":"IfNotPresent","repository":"ghcr.io/atulmgupta/open-wearables-frontend","tag":"2cf67f8"},"livenessProbe":{"httpGet":{"path":"/","port":"http"},"initialDelaySeconds":20,"periodSeconds":10},"readinessProbe":{"httpGet":{"path":"/","port":"http"},"initialDelaySeconds":10,"periodSeconds":5},"replicaCount":1,"resources":{},"service":{"port":3000,"type":"ClusterIP"}}` | --------------------------------------------------------- |
| fullnameOverride | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress | object | `{}` | --------------------------------------------------------- |
| ingressRoute.annotations | object | `{}` |  |
| ingressRoute.enabled | bool | `true` |  |
| ingressRoute.entryPoints | list | `[]` |  |
| ingressRoute.namespace | string | `"default"` |  |
| ingressRoute.routes | list | `[]` |  |
| ingressRoute.tls.certResolver | string | `""` |  |
| ingressRoute.tls.domains | list | `[]` |  |
| ingressRoute.tls.enabled | bool | `false` |  |
| ingressRoute.tls.secretName | string | `""` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistentVolumeClaims | object | `{"claims":[],"enabled":false}` | --------------------------------------------------------- |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql | object | `{"auth":{"database":"open_wearables","password":"changeme","postgresPassword":"changeme","username":"open_wearables"},"containerPorts":[{"containerPort":5432,"name":"postgres","protocol":"TCP"}],"enabled":true,"image":{"pullPolicy":"IfNotPresent","repository":"postgres","tag":"16-alpine"},"persistence":{"accessModes":["ReadWriteOnce"],"enabled":false,"size":"5Gi","storageClassName":""},"resources":{},"service":{"port":5432,"type":"ClusterIP"}}` | --------------------------------------------------------- |
| redis | object | `{"containerPorts":[{"containerPort":6379,"name":"redis","protocol":"TCP"}],"enabled":true,"image":{"pullPolicy":"IfNotPresent","repository":"redis","tag":"7-alpine"},"persistence":{"accessModes":["ReadWriteOnce"],"enabled":false,"size":"1Gi","storageClassName":""},"resources":{},"service":{"port":6379,"type":"ClusterIP"}}` | --------------------------------------------------------- |
| secret | object | `{"data":{"SECRET_KEY":"changeme-replace-with-a-strong-random-key"},"enabled":true,"type":"Opaque"}` | --------------------------------------------------------- |
| securityContext | object | `{}` |  |
| serviceAccount | object | `{}` |  |
| tolerations | list | `[]` |  |
| worker | object | `{"command":["celery","-A","app.celery_app","worker","--loglevel=debug"],"enabled":true,"extraEnv":[],"image":{"pullPolicy":"IfNotPresent","repository":"ghcr.io/atulmgupta/open-wearables-backend","tag":"v1.0.0"},"replicaCount":1,"resources":{}}` | --------------------------------------------------------- |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
