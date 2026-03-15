# vitasync

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.2.0](https://img.shields.io/badge/AppVersion-0.2.0-informational?style=flat-square)

A Helm chart for deploying VitaSync — a self-hosted wearable health data aggregation platform with a Fastify API, BullMQ worker, and Next.js dashboard.

**Homepage:** <https://github.com/HomeOpsHub/vitasync>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| HomeOpsHub |  | <https://github.com/HomeOpsHub> |

## Source Code

* <https://github.com/HomeOpsHub/vitasync>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| api.affinity | object | `{}` |  |
| api.autoscaling.enabled | bool | `false` |  |
| api.autoscaling.maxReplicas | int | `10` |  |
| api.autoscaling.minReplicas | int | `1` |  |
| api.autoscaling.targetCPUUtilizationPercentage | int | `70` |  |
| api.enabled | bool | `true` |  |
| api.extraEnv | list | `[]` |  |
| api.image.pullPolicy | string | `"IfNotPresent"` |  |
| api.image.repository | string | `"ghcr.io/homeophub/vitasync-api"` |  |
| api.image.tag | string | `""` |  |
| api.livenessProbe.failureThreshold | int | `3` |  |
| api.livenessProbe.httpGet.path | string | `"/health"` |  |
| api.livenessProbe.httpGet.port | int | `3001` |  |
| api.livenessProbe.initialDelaySeconds | int | `15` |  |
| api.livenessProbe.periodSeconds | int | `10` |  |
| api.nodeSelector | object | `{}` |  |
| api.podAnnotations | object | `{}` |  |
| api.podDisruptionBudget.enabled | bool | `false` |  |
| api.podDisruptionBudget.minAvailable | int | `1` |  |
| api.podSecurityContext.fsGroup | int | `1001` |  |
| api.podSecurityContext.runAsNonRoot | bool | `true` |  |
| api.podSecurityContext.runAsUser | int | `1001` |  |
| api.readinessProbe.failureThreshold | int | `3` |  |
| api.readinessProbe.httpGet.path | string | `"/health"` |  |
| api.readinessProbe.httpGet.port | int | `3001` |  |
| api.readinessProbe.initialDelaySeconds | int | `10` |  |
| api.readinessProbe.periodSeconds | int | `5` |  |
| api.replicaCount | int | `1` |  |
| api.resources.limits.cpu | string | `"500m"` |  |
| api.resources.limits.memory | string | `"512Mi"` |  |
| api.resources.requests.cpu | string | `"100m"` |  |
| api.resources.requests.memory | string | `"256Mi"` |  |
| api.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| api.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| api.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| api.service.port | int | `3001` |  |
| api.service.type | string | `"ClusterIP"` |  |
| api.tolerations | list | `[]` |  |
| config.ADMIN_WORKSPACE_SLUG | string | `"default"` |  |
| config.CORS_ORIGINS | string | `""` |  |
| config.DATABASE_POOL_MAX | string | `"20"` |  |
| config.DATABASE_POOL_MIN | string | `"2"` |  |
| config.HOST | string | `"0.0.0.0"` |  |
| config.LOG_LEVEL | string | `"info"` |  |
| config.NEXT_PUBLIC_API_URL | string | `""` |  |
| config.NODE_ENV | string | `"production"` |  |
| config.OAUTH_REDIRECT_BASE_URL | string | `""` |  |
| config.PORT | string | `"3001"` |  |
| config.RATE_LIMIT_MAX | string | `"100"` |  |
| config.RATE_LIMIT_WINDOW_MS | string | `"60000"` |  |
| externalPostgresql.database | string | `"vitasync"` |  |
| externalPostgresql.host | string | `"postgresql"` |  |
| externalPostgresql.password | string | `""` |  |
| externalPostgresql.port | int | `5432` |  |
| externalPostgresql.username | string | `"vitasync"` |  |
| externalRedis.host | string | `"redis"` |  |
| externalRedis.password | string | `""` |  |
| externalRedis.port | int | `6379` |  |
| fullnameOverride | string | `""` |  |
| global | object | `{"imagePullSecrets":[],"imageRegistry":""}` | Global image settings |
| imagePullSecrets | list | `[]` | Additional image pull secrets |
| ingress.annotations | object | `{}` |  |
| ingress.api.host | string | `"api.vitasync.example.com"` |  |
| ingress.api.secretName | string | `"vitasync-api-tls"` |  |
| ingress.api.tls | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.web.host | string | `"app.vitasync.example.com"` |  |
| ingress.web.secretName | string | `"vitasync-web-tls"` |  |
| ingress.web.tls | bool | `false` |  |
| migrations.annotations."helm.sh/hook" | string | `"pre-install,pre-upgrade"` |  |
| migrations.annotations."helm.sh/hook-delete-policy" | string | `"hook-succeeded"` |  |
| migrations.annotations."helm.sh/hook-weight" | string | `"-5"` |  |
| migrations.enabled | bool | `true` |  |
| migrations.image.pullPolicy | string | `"IfNotPresent"` |  |
| migrations.image.repository | string | `"ghcr.io/homeophub/vitasync-api"` |  |
| migrations.image.tag | string | `""` |  |
| migrations.resources.limits.cpu | string | `"200m"` |  |
| migrations.resources.limits.memory | string | `"256Mi"` |  |
| migrations.resources.requests.cpu | string | `"50m"` |  |
| migrations.resources.requests.memory | string | `"128Mi"` |  |
| nameOverride | string | `""` | Override the release name |
| postgresql.auth.database | string | `"vitasync"` |  |
| postgresql.auth.password | string | `"changeme"` |  |
| postgresql.auth.username | string | `"vitasync"` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.image.pullPolicy | string | `"IfNotPresent"` |  |
| postgresql.image.repository | string | `"postgres"` |  |
| postgresql.image.tag | string | `"16-alpine"` |  |
| postgresql.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| postgresql.persistence.enabled | bool | `false` |  |
| postgresql.persistence.size | string | `"8Gi"` |  |
| postgresql.persistence.storageClassName | string | `""` |  |
| postgresql.resources | object | `{}` |  |
| postgresql.service.port | int | `5432` |  |
| postgresql.service.type | string | `"ClusterIP"` |  |
| redis.command[0] | string | `"redis-server"` |  |
| redis.command[1] | string | `"--appendonly"` |  |
| redis.command[2] | string | `"yes"` |  |
| redis.command[3] | string | `"--maxmemory-policy"` |  |
| redis.command[4] | string | `"noeviction"` |  |
| redis.enabled | bool | `true` |  |
| redis.image.pullPolicy | string | `"IfNotPresent"` |  |
| redis.image.repository | string | `"redis"` |  |
| redis.image.tag | string | `"7-alpine"` |  |
| redis.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| redis.persistence.enabled | bool | `false` |  |
| redis.persistence.size | string | `"1Gi"` |  |
| redis.persistence.storageClassName | string | `""` |  |
| redis.resources | object | `{}` |  |
| redis.service.port | int | `6379` |  |
| redis.service.type | string | `"ClusterIP"` |  |
| secrets.ADMIN_API_KEY | string | `"vs_live_changeme_for_production"` |  |
| secrets.ENCRYPTION_KEY | string | `"change-me-32-byte-hex-encoded-key"` |  |
| secrets.FITBIT_CLIENT_ID | string | `""` |  |
| secrets.FITBIT_CLIENT_SECRET | string | `""` |  |
| secrets.GARMIN_CONSUMER_KEY | string | `""` |  |
| secrets.GARMIN_CONSUMER_SECRET | string | `""` |  |
| secrets.JWT_SECRET | string | `"change-me-to-a-long-random-string"` |  |
| secrets.POLAR_CLIENT_ID | string | `""` |  |
| secrets.POLAR_CLIENT_SECRET | string | `""` |  |
| secrets.STRAVA_CLIENT_ID | string | `""` |  |
| secrets.STRAVA_CLIENT_SECRET | string | `""` |  |
| secrets.WITHINGS_CLIENT_ID | string | `""` |  |
| secrets.WITHINGS_CLIENT_SECRET | string | `""` |  |
| secrets.existingSecret | string | `""` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `false` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| web.affinity | object | `{}` |  |
| web.autoscaling.enabled | bool | `false` |  |
| web.autoscaling.maxReplicas | int | `5` |  |
| web.autoscaling.minReplicas | int | `1` |  |
| web.autoscaling.targetCPUUtilizationPercentage | int | `70` |  |
| web.enabled | bool | `true` |  |
| web.extraEnv | list | `[]` |  |
| web.image.pullPolicy | string | `"IfNotPresent"` |  |
| web.image.repository | string | `"ghcr.io/homeophub/vitasync-web"` |  |
| web.image.tag | string | `""` |  |
| web.livenessProbe.failureThreshold | int | `3` |  |
| web.livenessProbe.httpGet.path | string | `"/"` |  |
| web.livenessProbe.httpGet.port | int | `3000` |  |
| web.livenessProbe.initialDelaySeconds | int | `20` |  |
| web.livenessProbe.periodSeconds | int | `10` |  |
| web.nodeSelector | object | `{}` |  |
| web.podAnnotations | object | `{}` |  |
| web.podDisruptionBudget.enabled | bool | `false` |  |
| web.podDisruptionBudget.minAvailable | int | `1` |  |
| web.podSecurityContext.fsGroup | int | `1001` |  |
| web.podSecurityContext.runAsNonRoot | bool | `true` |  |
| web.podSecurityContext.runAsUser | int | `1001` |  |
| web.readinessProbe.failureThreshold | int | `3` |  |
| web.readinessProbe.httpGet.path | string | `"/"` |  |
| web.readinessProbe.httpGet.port | int | `3000` |  |
| web.readinessProbe.initialDelaySeconds | int | `15` |  |
| web.readinessProbe.periodSeconds | int | `5` |  |
| web.replicaCount | int | `1` |  |
| web.resources.limits.cpu | string | `"250m"` |  |
| web.resources.limits.memory | string | `"256Mi"` |  |
| web.resources.requests.cpu | string | `"50m"` |  |
| web.resources.requests.memory | string | `"128Mi"` |  |
| web.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| web.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| web.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| web.service.port | int | `3000` |  |
| web.service.type | string | `"ClusterIP"` |  |
| web.tolerations | list | `[]` |  |
| worker.affinity | object | `{}` |  |
| worker.autoscaling.enabled | bool | `false` |  |
| worker.autoscaling.maxReplicas | int | `5` |  |
| worker.autoscaling.minReplicas | int | `1` |  |
| worker.autoscaling.targetCPUUtilizationPercentage | int | `70` |  |
| worker.enabled | bool | `true` |  |
| worker.extraEnv | list | `[]` |  |
| worker.image.pullPolicy | string | `"IfNotPresent"` |  |
| worker.image.repository | string | `"ghcr.io/homeophub/vitasync-worker"` |  |
| worker.image.tag | string | `""` |  |
| worker.nodeSelector | object | `{}` |  |
| worker.podAnnotations | object | `{}` |  |
| worker.podDisruptionBudget.enabled | bool | `false` |  |
| worker.podDisruptionBudget.minAvailable | int | `1` |  |
| worker.podSecurityContext.fsGroup | int | `1001` |  |
| worker.podSecurityContext.runAsNonRoot | bool | `true` |  |
| worker.podSecurityContext.runAsUser | int | `1001` |  |
| worker.replicaCount | int | `1` |  |
| worker.resources.limits.cpu | string | `"500m"` |  |
| worker.resources.limits.memory | string | `"512Mi"` |  |
| worker.resources.requests.cpu | string | `"100m"` |  |
| worker.resources.requests.memory | string | `"256Mi"` |  |
| worker.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| worker.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| worker.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| worker.tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
