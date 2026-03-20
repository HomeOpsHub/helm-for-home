{{/*
Derive the expected service name that the upstream headlamp subchart will create.

The upstream chart's fullname template is:
  if release name contains "headlamp" → <release-name>
  else                                 → <release-name>-headlamp

We mirror that logic here so the IngressRoute can reference it automatically
when .Values.ingressRoute.spec.routes[].services[].name is left at the default.
*/}}
{{- define "headlamp.subchartServiceName" -}}
{{- $chartName := "headlamp" }}
{{- if contains $chartName .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $chartName | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
