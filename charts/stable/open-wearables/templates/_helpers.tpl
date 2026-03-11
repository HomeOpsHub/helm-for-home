{{/*
Include the chart name.
*/}}
{{- define "open-wearables.name" -}}
{{- .Chart.Name }}
{{- end }}

{{/*
Generate the full name of the release.
*/}}
{{- define "open-wearables.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Generate labels common to all resources.
*/}}
{{- define "open-wearables.labels" -}}
app.kubernetes.io/name: {{ include "open-wearables.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Generate selector labels.
*/}}
{{- define "open-wearables.selectorLabels" -}}
app.kubernetes.io/name: {{ include "open-wearables.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Generate service account name.
*/}}
{{- define "open-wearables.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "open-wearables.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Generate ConfigMap name.
*/}}
{{- define "open-wearables.configMapName" -}}
{{- printf "%s-config" (include "open-wearables.fullname" .) }}
{{- end }}

{{/*
Generate Secret name.
*/}}
{{- define "open-wearables.secretName" -}}
{{- printf "%s-secret" (include "open-wearables.fullname" .) }}
{{- end }}

{{/*
Redis host.
*/}}
{{- define "open-wearables.redisHost" -}}
{{- if .Values.redis.enabled }}
{{- printf "%s-redis" .Release.Name }}
{{- else }}
{{- .Values.redis.externalHost | default "redis" }}
{{- end }}
{{- end }}

{{/*
PostgreSQL host.
*/}}
{{- define "open-wearables.postgresqlHost" -}}
{{- if .Values.postgresql.enabled }}
{{- printf "%s-postgresql" .Release.Name }}
{{- else }}
{{- .Values.externalPostgresql.host | default "postgresql" }}
{{- end }}
{{- end }}

{{/*
PostgreSQL port.
*/}}
{{- define "open-wearables.postgresqlPort" -}}
{{- if .Values.postgresql.enabled }}
{{- toString .Values.postgresql.service.port }}
{{- else }}
{{- toString .Values.externalPostgresql.port }}
{{- end }}
{{- end }}

{{/*
PostgreSQL database name.
*/}}
{{- define "open-wearables.postgresqlDatabase" -}}
{{- if .Values.postgresql.enabled }}
{{- .Values.postgresql.auth.database }}
{{- else }}
{{- .Values.externalPostgresql.database }}
{{- end }}
{{- end }}

{{/*
PostgreSQL username.
*/}}
{{- define "open-wearables.postgresqlUsername" -}}
{{- if .Values.postgresql.enabled }}
{{- .Values.postgresql.auth.username }}
{{- else }}
{{- .Values.externalPostgresql.username }}
{{- end }}
{{- end }}

{{/*
PostgreSQL password.
*/}}
{{- define "open-wearables.postgresqlPassword" -}}
{{- if .Values.postgresql.enabled }}
{{- .Values.postgresql.auth.password | default "" }}
{{- else }}
{{- .Values.externalPostgresql.password | default "" }}
{{- end }}
{{- end }}

{{/*
Database URL.
*/}}
{{- define "open-wearables.databaseUrl" -}}
{{- printf "postgresql://%s:%s@%s:%s/%s" (include "open-wearables.postgresqlUsername" .) (include "open-wearables.postgresqlPassword" .) (include "open-wearables.postgresqlHost" .) (include "open-wearables.postgresqlPort" .) (include "open-wearables.postgresqlDatabase" .) }}
{{- end }}

{{/*
Celery broker URL (Redis).
*/}}
{{- define "open-wearables.celeryBrokerUrl" -}}
{{- printf "redis://%s:%s/0" (include "open-wearables.redisHost" .) (toString .Values.redis.service.port) }}
{{- end }}
