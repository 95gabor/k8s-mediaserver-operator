{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "sabnzbd.name" -}}
{{- default .Chart.Name | trunc 63 }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sabnzbd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sabnzbd.labels" -}}
helm.sh/chart: {{ include "sabnzbd.chart" . }}
{{ include "sabnzbd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sabnzbd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sabnzbd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

