{{/*
Expand the name of the chart.
*/}}
{{- define "kotlin-native-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kotlin-native-app.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "kotlin-native-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kotlin-native-app.labels" -}}
helm.sh/chart: {{ include "kotlin-native-app.chart" . }}
{{ include "kotlin-native-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kotlin-native-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kotlin-native-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "kotlin-native-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "kotlin-native-app.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "kotlin-native-app.envVars" -}}
- name: "FIRST_CUSTOM_VAR"
  value: "KOTLIN-NATIVE_VALUE_ONE"
- name: "SECOND_CUSTOM_VAR"
  value: "KOTLIN-NATIVE_VALUE_TWO"
- name: SPECIAL_TYPE_KEY
  valueFrom:
    configMapKeyRef:
      name: config-map-entity-kn
      key: test
{{- end }}