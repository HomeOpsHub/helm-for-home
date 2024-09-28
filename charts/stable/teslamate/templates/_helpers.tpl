{{/*
Expand the name of the chart.
*/}}
{{- define "teslamate.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "teslamate.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "teslamate.labels" -}}
helm.sh/chart: {{ include "teslamate.chart" . }}
app.kubernetes.io/name: {{ include "teslamate.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "teslamate.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
