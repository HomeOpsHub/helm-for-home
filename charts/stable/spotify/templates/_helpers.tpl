{{/*
Define the name of the chart.
*/}}
{{- define "spotify.name" -}}
spotify
{{- end }}

{{/*
Create a fully qualified app name.
*/}}
{{- define "spotify.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := "spotify" }}
{{- if contains .Release.Name $name }}
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
app.kubernetes.io/name: "{{ include "spotify.name" . }}"
app.kubernetes.io/instance: "{{ .Release.Name }}"
app.kubernetes.io/version: "{{ .Chart.AppVersion }}"
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
{{- end }}

{{/*
Selector labels for Kubernetes objects like Deployments, Services, etc.
*/}}
{{- define "spotify.selectorLabels" -}}
app.kubernetes.io/name: "{{ include "spotify.name" . }}"
app.kubernetes.io/instance: "{{ .Release.Name }}"
{{- end }}
