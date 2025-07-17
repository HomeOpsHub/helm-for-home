{{/*
Common labels
*/}}
{{- define "common.labels" -}}
helm.sh/chart: {{ include "common.chart" . }}
{{ include "common.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.commonLabels }}
{{ toYaml .Values.commonLabels }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "common.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the chart
*/}}
{{- define "common.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name
*/}}
{{- define "common.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label
*/}}
{{- define "common.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "common.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "common.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Common annotations
*/}}
{{- define "common.annotations" -}}
{{- if .Values.commonAnnotations }}
{{ toYaml .Values.commonAnnotations }}
{{- end }}
{{- end }}

{{/*
Pod annotations
*/}}
{{- define "common.podAnnotations" -}}
{{- if .Values.podAnnotations }}
{{ toYaml .Values.podAnnotations }}
{{- end }}
{{- end }}

{{/*
Image pull policy
*/}}
{{- define "common.imagePullPolicy" -}}
{{- .Values.image.pullPolicy | default "IfNotPresent" }}
{{- end }}

{{/*
Image repository and tag
*/}}
{{- define "common.image" -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion | toString }}
{{- printf "%s:%s" .Values.image.repository $tag }}
{{- end }}

{{/*
Container security context
*/}}
{{- define "common.securityContext" -}}
{{- if .Values.securityContext }}
{{ toYaml .Values.securityContext }}
{{- end }}
{{- end }}

{{/*
Pod security context
*/}}
{{- define "common.podSecurityContext" -}}
{{- if .Values.podSecurityContext }}
{{ toYaml .Values.podSecurityContext }}
{{- end }}
{{- end }}

{{/*
Resources
*/}}
{{- define "common.resources" -}}
{{- if .Values.resources }}
{{ toYaml .Values.resources }}
{{- end }}
{{- end }}

{{/*
Node selector
*/}}
{{- define "common.nodeSelector" -}}
{{- if .Values.nodeSelector }}
{{ toYaml .Values.nodeSelector }}
{{- end }}
{{- end }}

{{/*
Tolerations
*/}}
{{- define "common.tolerations" -}}
{{- if .Values.tolerations }}
{{ toYaml .Values.tolerations }}
{{- end }}
{{- end }}

{{/*
Affinity
*/}}
{{- define "common.affinity" -}}
{{- if .Values.affinity }}
{{ toYaml .Values.affinity }}
{{- end }}
{{- end }}

{{/*
Environment variables from values
*/}}
{{- define "common.env" -}}
{{- if .Values.env }}
{{ toYaml .Values.env }}
{{- end }}
{{- end }}

{{/*
Environment variables from configmap
*/}}
{{- define "common.envFromConfigMap" -}}
{{- if .Values.envFromConfigMap }}
- configMapRef:
    name: {{ .Values.envFromConfigMap }}
{{- end }}
{{- end }}

{{/*
Environment variables from secret
*/}}
{{- define "common.envFromSecret" -}}
{{- if .Values.envFromSecret }}
- secretRef:
    name: {{ .Values.envFromSecret }}
{{- end }}
{{- end }}

{{/*
Volume mounts
*/}}
{{- define "common.volumeMounts" -}}
{{- if .Values.volumeMounts }}
{{ toYaml .Values.volumeMounts }}
{{- end }}
{{- end }}

{{/*
Volumes
*/}}
{{- define "common.volumes" -}}
{{- if .Values.volumes }}
{{ toYaml .Values.volumes }}
{{- end }}
{{- end }}

{{/*
Ingress class name
*/}}
{{- define "common.ingressClassName" -}}
{{- if .Values.ingress.className }}
{{- .Values.ingress.className }}
{{- else if .Values.ingress.ingressClassName }}
{{- .Values.ingress.ingressClassName }}
{{- end }}
{{- end }}

{{/*
Ingress annotations
*/}}
{{- define "common.ingressAnnotations" -}}
{{- if .Values.ingress.annotations }}
{{ toYaml .Values.ingress.annotations }}
{{- end }}
{{- end }}

{{/*
Service type
*/}}
{{- define "common.serviceType" -}}
{{- .Values.service.type | default "ClusterIP" }}
{{- end }}

{{/*
Service port
*/}}
{{- define "common.servicePort" -}}
{{- .Values.service.port | default 80 }}
{{- end }}

{{/*
Target port
*/}}
{{- define "common.targetPort" -}}
{{- .Values.service.targetPort | default "http" }}
{{- end }}

{{/*
Validate required values
*/}}
{{- define "common.validateValues" -}}
{{- if not .Values.image.repository }}
{{- fail "image.repository is required" }}
{{- end }}
{{- end }}

{{/*
Probe configuration
*/}}
{{- define "common.livenessProbe" -}}
{{- if .Values.livenessProbe }}
{{ toYaml .Values.livenessProbe }}
{{- end }}
{{- end }}

{{- define "common.readinessProbe" -}}
{{- if .Values.readinessProbe }}
{{ toYaml .Values.readinessProbe }}
{{- end }}
{{- end }}

{{- define "common.startupProbe" -}}
{{- if .Values.startupProbe }}
{{ toYaml .Values.startupProbe }}
{{- end }}
{{- end }}

{{/*
Persistent Volume Claim
*/}}
{{- define "common.pvcName" -}}
{{- if .Values.persistence.existingClaim }}
{{- .Values.persistence.existingClaim }}
{{- else }}
{{- include "common.fullname" . }}
{{- end }}
{{- end }}

{{/*
Storage class
*/}}
{{- define "common.storageClass" -}}
{{- if .Values.persistence.storageClass }}
{{- if (eq "-" .Values.persistence.storageClass) }}
storageClassName: ""
{{- else }}
storageClassName: {{ .Values.persistence.storageClass | quote }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Init containers
*/}}
{{- define "common.initContainers" -}}
{{- if .Values.initContainers }}
{{ toYaml .Values.initContainers }}
{{- end }}
{{- end }}

{{/*
Sidecar containers
*/}}
{{- define "common.sidecarContainers" -}}
{{- if .Values.sidecarContainers }}
{{ toYaml .Values.sidecarContainers }}
{{- end }}
{{- end }}

{{/*
Pod labels
*/}}
{{- define "common.podLabels" -}}
{{- if .Values.podLabels }}
{{ toYaml .Values.podLabels }}
{{- end }}
{{- end }}

{{/*
Deployment strategy
*/}}
{{- define "common.deploymentStrategy" -}}
{{- if .Values.deploymentStrategy }}
{{ toYaml .Values.deploymentStrategy }}
{{- else }}
type: RollingUpdate
rollingUpdate:
  maxSurge: 1
  maxUnavailable: 1
{{- end }}
{{- end }}

{{/*
Priority class name
*/}}
{{- define "common.priorityClassName" -}}
{{- if .Values.priorityClassName }}
{{- .Values.priorityClassName }}
{{- end }}
{{- end }}

{{/*
Service monitor
*/}}
{{- define "common.serviceMonitor" -}}
{{- if .Values.serviceMonitor.enabled }}
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: {{ include "common.fullname" . }}
  labels:
    {{- include "common.labels" . | nindent 4 }}
    {{- with .Values.serviceMonitor.labels }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
spec:
  selector:
    matchLabels:
      {{- include "common.selectorLabels" . | nindent 6 }}
  endpoints:
  - port: {{ .Values.serviceMonitor.port | default "http" }}
    {{- if .Values.serviceMonitor.path }}
    path: {{ .Values.serviceMonitor.path }}
    {{- end }}
    {{- if .Values.serviceMonitor.interval }}
    interval: {{ .Values.serviceMonitor.interval }}
    {{- end }}
    {{- if .Values.serviceMonitor.scrapeTimeout }}
    scrapeTimeout: {{ .Values.serviceMonitor.scrapeTimeout }}
    {{- end }}
{{- end }}
{{- end }}
