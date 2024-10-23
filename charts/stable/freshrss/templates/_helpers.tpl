{{/*
Generate the full name of the release.
*/}}
{{- define "freshrss.fullname" -}}
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
{{- define "freshrss.labels" -}}
app.kubernetes.io/name: {{ include "freshrss.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Generate selector labels.
*/}}
{{- define "freshrss.selectorLabels" -}}
app.kubernetes.io/name: {{ include "freshrss.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Generate service account name.
*/}}
{{- define "freshrss.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "freshrss.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Generate ConfigMap name.
*/}}
{{- define "freshrss.configMapName" -}}
{{- printf "%s-config" (include "freshrss.fullname" .) }}
{{- end }}

{{/*
Generate Secret name.
*/}}
{{- define "freshrss.secretName" -}}
{{- printf "%s-secret" (include "freshrss.fullname" .) }}
{{- end }}

{{/*
Include the chart name.
*/}}
{{- define "freshrss.name" -}}
{{- .Chart.Name }}
{{- end }}

{{/*
Define the MariaDB host.
*/}}
{{- define "freshrss.mariadbHost" -}}
{{- printf "%s-mariadb" .Release.Name }}
{{- end }}

{{/*
Define the MariaDB secret name.
*/}}
{{- define "freshrss.mariadbSecretName" -}}
{{- printf "%s-mariadb" .Release.Name }}
{{- end }}
