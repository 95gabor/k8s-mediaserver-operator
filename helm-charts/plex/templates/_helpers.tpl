{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "plex.name" -}}
{{- default .Chart.Name | trunc 63 }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "plex.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "plex.labels" -}}
helm.sh/chart: {{ include "plex.chart" . }}
{{ include "plex.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "plex.selectorLabels" -}}
app.kubernetes.io/name: {{ include "plex.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

