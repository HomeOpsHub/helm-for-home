{{- define "teslamate.name" -}}
teslamate
{{- end }}

{{- define "teslamate.fullname" -}}
{{ include "teslamate.name" . }}-{{ .Release.Name }}
{{- end }}

{{- define "teslamate.labels" -}}
helm.sh/chart: "{{ include "teslamate.chart" . }}"
app.kubernetes.io/name: "{{ include "teslamate.name" . }}"
app.kubernetes.io/instance: "{{ .Release.Name }}"
app.kubernetes.io/version: "{{ .Chart.AppVersion }}"
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
{{- end }}

{{- define "teslamate.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
