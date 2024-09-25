{{/*
Expand the name of the chart.
*/}}
{{- define "spotify.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a full name by appending the release name.
*/}}
{{- define "spotify.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Define common labels to be used in resources.
*/}}
{{- define "spotify.labels" -}}
app.kubernetes.io/name: {{ include "spotify.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{/*
Selector labels for Kubernetes objects like Deployments, Services, etc.
*/}}
{{- define "spotify.selectorLabels" -}}
app.kubernetes.io/name: {{ include "spotify.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Service account name.
*/}}
{{- define "spotify.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "spotify.fullname" .) .Values.serviceAccount.name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
