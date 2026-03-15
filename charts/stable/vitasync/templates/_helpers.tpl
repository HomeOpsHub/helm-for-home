{{/*
Expand the name of the chart.
*/}}
{{- define "vitasync.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
Truncated at 63 chars to comply with DNS naming spec.
*/}}
{{- define "vitasync.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Chart label.
*/}}
{{- define "vitasync.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels applied to every resource.
*/}}
{{- define "vitasync.labels" -}}
helm.sh/chart: {{ include "vitasync.chart" . }}
{{ include "vitasync.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels (stable subset used in matchLabels / service selectors).
*/}}
{{- define "vitasync.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vitasync.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* ── Component-scoped labels ───────────────────────────────────────────── */}}

{{- define "vitasync.api.labels" -}}
{{ include "vitasync.labels" . }}
app.kubernetes.io/component: api
{{- end }}

{{- define "vitasync.api.selectorLabels" -}}
{{ include "vitasync.selectorLabels" . }}
app.kubernetes.io/component: api
{{- end }}

{{- define "vitasync.worker.labels" -}}
{{ include "vitasync.labels" . }}
app.kubernetes.io/component: worker
{{- end }}

{{- define "vitasync.worker.selectorLabels" -}}
{{ include "vitasync.selectorLabels" . }}
app.kubernetes.io/component: worker
{{- end }}

{{- define "vitasync.web.labels" -}}
{{ include "vitasync.labels" . }}
app.kubernetes.io/component: web
{{- end }}

{{- define "vitasync.web.selectorLabels" -}}
{{ include "vitasync.selectorLabels" . }}
app.kubernetes.io/component: web
{{- end }}

{{/* ── ServiceAccount name ─────────────────────────────────────────────── */}}

{{- define "vitasync.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "vitasync.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* ── Secret / ConfigMap names ────────────────────────────────────────── */}}

{{/*
Name of the Kubernetes Secret that holds sensitive env vars.
When secrets.existingSecret is set the chart skips secret creation and
references the user-supplied secret name here.
*/}}
{{- define "vitasync.secretName" -}}
{{- if .Values.secrets.existingSecret }}
{{- .Values.secrets.existingSecret }}
{{- else }}
{{- printf "%s-secrets" (include "vitasync.fullname" .) }}
{{- end }}
{{- end }}

{{- define "vitasync.configMapName" -}}
{{- printf "%s-config" (include "vitasync.fullname" .) }}
{{- end }}

{{/* ── Image tag helpers ───────────────────────────────────────────────── */}}

{{- define "vitasync.api.image" -}}
{{- $registry := .Values.global.imageRegistry | default "" }}
{{- $repo := .Values.api.image.repository }}
{{- $tag := .Values.api.image.tag | default .Chart.AppVersion }}
{{- if $registry }}
{{- printf "%s/%s:%s" $registry $repo $tag }}
{{- else }}
{{- printf "%s:%s" $repo $tag }}
{{- end }}
{{- end }}

{{- define "vitasync.worker.image" -}}
{{- $registry := .Values.global.imageRegistry | default "" }}
{{- $repo := .Values.worker.image.repository }}
{{- $tag := .Values.worker.image.tag | default .Chart.AppVersion }}
{{- if $registry }}
{{- printf "%s/%s:%s" $registry $repo $tag }}
{{- else }}
{{- printf "%s:%s" $repo $tag }}
{{- end }}
{{- end }}

{{- define "vitasync.web.image" -}}
{{- $registry := .Values.global.imageRegistry | default "" }}
{{- $repo := .Values.web.image.repository }}
{{- $tag := .Values.web.image.tag | default .Chart.AppVersion }}
{{- if $registry }}
{{- printf "%s/%s:%s" $registry $repo $tag }}
{{- else }}
{{- printf "%s:%s" $repo $tag }}
{{- end }}
{{- end }}

{{- define "vitasync.migrations.image" -}}
{{- $registry := .Values.global.imageRegistry | default "" }}
{{- $repo := .Values.migrations.image.repository }}
{{- $tag := .Values.migrations.image.tag | default .Chart.AppVersion }}
{{- if $registry }}
{{- printf "%s/%s:%s" $registry $repo $tag }}
{{- else }}
{{- printf "%s:%s" $repo $tag }}
{{- end }}
{{- end }}

{{/* ── imagePullSecrets helper ─────────────────────────────────────────── */}}

{{- define "vitasync.imagePullSecrets" -}}
{{- $secrets := concat (.Values.global.imagePullSecrets | default list) (.Values.imagePullSecrets | default list) }}
{{- if $secrets }}
imagePullSecrets:
{{- range $secrets }}
  - name: {{ . }}
{{- end }}
{{- end }}
{{- end }}

{{/* ── PostgreSQL connection helpers ──────────────────────────────────── */}}

{{- define "vitasync.postgresqlHost" -}}
{{- if .Values.postgresql.enabled }}
{{- printf "%s-postgresql" (include "vitasync.fullname" .) }}
{{- else }}
{{- .Values.externalPostgresql.host }}
{{- end }}
{{- end }}

{{- define "vitasync.postgresqlPort" -}}
{{- if .Values.postgresql.enabled }}
{{- toString .Values.postgresql.service.port }}
{{- else }}
{{- toString .Values.externalPostgresql.port }}
{{- end }}
{{- end }}

{{- define "vitasync.postgresqlDatabase" -}}
{{- if .Values.postgresql.enabled }}
{{- .Values.postgresql.auth.database }}
{{- else }}
{{- .Values.externalPostgresql.database }}
{{- end }}
{{- end }}

{{- define "vitasync.postgresqlUsername" -}}
{{- if .Values.postgresql.enabled }}
{{- .Values.postgresql.auth.username }}
{{- else }}
{{- .Values.externalPostgresql.username }}
{{- end }}
{{- end }}

{{- define "vitasync.postgresqlPassword" -}}
{{- if .Values.postgresql.enabled }}
{{- .Values.postgresql.auth.password | default "" }}
{{- else }}
{{- .Values.externalPostgresql.password | default "" }}
{{- end }}
{{- end }}

{{/*
Builds the full PostgreSQL connection URL from the appropriate source.
Only used when secrets.existingSecret is NOT set.
*/}}
{{- define "vitasync.databaseUrl" -}}
{{- printf "postgresql://%s:%s@%s:%s/%s"
    (include "vitasync.postgresqlUsername" .)
    (include "vitasync.postgresqlPassword" .)
    (include "vitasync.postgresqlHost" .)
    (include "vitasync.postgresqlPort" .)
    (include "vitasync.postgresqlDatabase" .) }}
{{- end }}

{{/* ── Redis connection helpers ────────────────────────────────────────── */}}

{{- define "vitasync.redisHost" -}}
{{- if .Values.redis.enabled }}
{{- printf "%s-redis" (include "vitasync.fullname" .) }}
{{- else }}
{{- .Values.externalRedis.host }}
{{- end }}
{{- end }}

{{- define "vitasync.redisPort" -}}
{{- if .Values.redis.enabled }}
{{- toString .Values.redis.service.port }}
{{- else }}
{{- toString .Values.externalRedis.port }}
{{- end }}
{{- end }}

{{/*
Builds the full Redis connection URL.
Includes Redis AUTH password when externalRedis.password is non-empty.
Only used when secrets.existingSecret is NOT set.
*/}}
{{- define "vitasync.redisUrl" -}}
{{- $host := include "vitasync.redisHost" . }}
{{- $port := include "vitasync.redisPort" . }}
{{- $pass := "" }}
{{- if not .Values.redis.enabled }}
{{- $pass = .Values.externalRedis.password | default "" }}
{{- end }}
{{- if and $pass (ne $pass "") }}
{{- printf "redis://:%s@%s:%s" $pass $host $port }}
{{- else }}
{{- printf "redis://%s:%s" $host $port }}
{{- end }}
{{- end }}
