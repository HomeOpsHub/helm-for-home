{{/*
Define the name of the chart.
*/}}
{{- define "spotify.name" -}}
spotify
{{- end }}

{{/*
Create a full name by appending the release name. Safely check for fullnameOverride before using it.
*/}}
{{- define "spotify.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := default "spotify" .Values.nameOverride }}
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
app.kubernetes.io/name: spotify
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: "1.0"
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: spotify-0.1.0
{{- end }}

{{/*
Selector labels for Kubernetes objects like Deployments, Services, etc.
*/}}
{{- define "spotify.selectorLabels" -}}
app.kubernetes.io/name: spotify
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
