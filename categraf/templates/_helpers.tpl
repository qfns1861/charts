{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "categraf.name" -}}
{{- .Values.fullnameOverride -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "categraf.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "categraf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "categraf.labels" -}}
helm.sh/chart: {{ include "categraf.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app: n9e
component: categraf
service: {{ .Values.k8s.service.type }}
{{ include "categraf.selectorLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "categraf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "categraf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app: n9e
component: categraf
cilium.io/policy: {{ include "categraf.name" . }}
{{- end -}}

{{/*
cilium Selector labels
*/}}
{{- define "cilium.selectorLabels" -}}
cilium.io/policy: {{ include "categraf.name" . }}
{{- end -}}

{{/*
Create the name of the cluster role to use
*/}}
{{- define "categraf.clusterRoleName" -}}
{{- printf "%s-role" (include "categraf.fullname" .) -}}
{{- end -}}

{{/*
Create the name of the cluster role binding to use
*/}}
{{- define "categraf.clusterRoleBindingName" -}}
{{- printf "%s-rolebinding" (include "categraf.fullname" .) -}}
{{- end -}}
