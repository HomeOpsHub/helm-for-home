{{- define "ddns_updater.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "ddns_updater.fullname" -}}
{{- include "ddns_updater.name" . }}-{{ .Release.Name }}
{{- end -}}

{{- define "ddns_updater.uniqueSuffix" -}}
{{- if .Values.uniqueSuffix -}}
{{ .Values.uniqueSuffix }}
{{- else -}}
{{- randAlphaNum 8 | lower -}}
{{- end -}}
{{- end -}}