{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "jellyfin.name" -}}
{{- default .Chart.Name | trunc 63 }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "jellyfin.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "jellyfin.labels" -}}
helm.sh/chart: {{ include "jellyfin.chart" . }}
{{ include "jellyfin.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "jellyfin.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jellyfin.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

