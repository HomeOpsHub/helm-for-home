{{/* Import common helpers */}}
{{- define "glances.name" -}}
{{- include "common.name" . -}}
{{- end }}

{{- define "glances.fullname" -}}
{{- include "common.fullname" . -}}
{{- end }}

{{- define "glances.chart" -}}
{{- include "common.chart" . -}}
{{- end }}

{{- define "glances.labels" -}}
{{- include "common.labels" . -}}
{{- end }}

{{- define "glances.selectorLabels" -}}
{{- include "common.selectorLabels" . -}}
{{- end }}

{{- define "glances.serviceAccountName" -}}
{{- include "common.serviceAccountName" . -}}
{{- end }}
