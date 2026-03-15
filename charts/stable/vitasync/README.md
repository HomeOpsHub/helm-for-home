# VitaSync Helm Chart

A Helm chart for deploying [VitaSync](https://github.com/HomeOpsHub/vitasync) — a self-hosted wearable health data aggregation platform with a Fastify API, BullMQ worker, and Next.js dashboard.

## Components

| Component | Description | Default |
|-----------|-------------|---------|
| **API** | Fastify REST API | enabled |
| **Worker** | BullMQ background job processor | enabled |
| **Web** | Next.js dashboard | enabled |
| **Migration Job** | Drizzle schema push (pre-install/pre-upgrade hook) | enabled |
| **PostgreSQL** | Bundled PostgreSQL 16 pod | enabled |
| **Redis** | Bundled Redis 7 pod | enabled |

## Quick Start

```bash
helm install vitasync . \
  --set secrets.JWT_SECRET=$(openssl rand -hex 32) \
  --set secrets.ENCRYPTION_KEY=$(openssl rand -hex 32) \
  --set postgresql.auth.password=mysecretpassword \
  --set config.CORS_ORIGINS=http://localhost:3000 \
  --set config.OAUTH_REDIRECT_BASE_URL=http://localhost:3001 \
  --set config.NEXT_PUBLIC_API_URL=http://localhost:3001
```

## Using an External PostgreSQL

If you already have a PostgreSQL instance running in your cluster (or externally):

```yaml
# values-external-pg.yaml
postgresql:
  enabled: false

externalPostgresql:
  host: my-postgres.database.svc.cluster.local
  port: 5432
  database: vitasync
  username: vitasync
  password: mysecretpassword
```

## Using an External Redis

If you already have a Redis instance running in your cluster:

```yaml
# values-external-redis.yaml
redis:
  enabled: false

externalRedis:
  host: my-redis.cache.svc.cluster.local
  port: 6379
  password: ""  # leave empty if no AUTH
```

## Using a Pre-Existing Secret (Production)

For production deployments, create your own Kubernetes Secret and reference it.
The secret must contain at minimum: `DATABASE_URL`, `REDIS_URL`, `JWT_SECRET`, `ENCRYPTION_KEY`, `ADMIN_API_KEY`.

```bash
kubectl create secret generic vitasync-prod-secrets \
  --from-literal=DATABASE_URL='postgresql://vitasync:pass@pg:5432/vitasync' \
  --from-literal=REDIS_URL='redis://redis:6379' \
  --from-literal=JWT_SECRET=$(openssl rand -hex 32) \
  --from-literal=ENCRYPTION_KEY=$(openssl rand -hex 32) \
  --from-literal=ADMIN_API_KEY='vs_live_yourkey'
```

```yaml
# values-prod.yaml
secrets:
  existingSecret: vitasync-prod-secrets

postgresql:
  enabled: false  # managed externally

redis:
  enabled: false  # managed externally
```

## Enabling Ingress

```yaml
ingress:
  enabled: true
  className: nginx
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-prod
  api:
    host: api.vitasync.example.com
    tls: true
    secretName: vitasync-api-tls
  web:
    host: app.vitasync.example.com
    tls: true
    secretName: vitasync-web-tls

config:
  CORS_ORIGINS: "https://app.vitasync.example.com"
  OAUTH_REDIRECT_BASE_URL: "https://api.vitasync.example.com"
  NEXT_PUBLIC_API_URL: "https://api.vitasync.example.com"
```

## Enabling Persistence

By default persistence is **off** (data is lost on pod restart). Enable it for production:

```yaml
postgresql:
  persistence:
    enabled: true
    size: 20Gi
    storageClassName: longhorn  # or your StorageClass

redis:
  persistence:
    enabled: true
    size: 2Gi
    storageClassName: longhorn
```

## Enabling HPA / PDB

```yaml
api:
  autoscaling:
    enabled: true
    minReplicas: 2
    maxReplicas: 10
    targetCPUUtilizationPercentage: 70
  podDisruptionBudget:
    enabled: true
    minAvailable: 1
```

## Values Reference

See [values.yaml](values.yaml) for the full set of configurable values with inline documentation.

## Provider OAuth Credentials

Set whichever providers you have registered applications for:

```yaml
secrets:
  FITBIT_CLIENT_ID: "..."
  FITBIT_CLIENT_SECRET: "..."
  GARMIN_CONSUMER_KEY: "..."
  GARMIN_CONSUMER_SECRET: "..."
  WITHINGS_CLIENT_ID: "..."
  WITHINGS_CLIENT_SECRET: "..."
  POLAR_CLIENT_ID: "..."
  POLAR_CLIENT_SECRET: "..."
  STRAVA_CLIENT_ID: "..."
  STRAVA_CLIENT_SECRET: "..."
```
