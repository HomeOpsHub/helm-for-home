{{/*
Expand the name of the chart or use the fullnameOverride if defined.
*/}}
{{- define "spotify.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a full name by appending the release name to the chart name.
*/}}
{{- define "spotify.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains .Release.Name $name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Define common labels to be used in all Kubernetes objects.
*/}}
{{- define "spotify.labels" -}}
app.kubernetes.io/name: {{ include "spotify.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{/*
Define selector labels to be used in Deployments, Services, etc.
*/}}
{{- define "spotify.selectorLabels" -}}
app.kubernetes.io/name: {{ include "spotify.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
