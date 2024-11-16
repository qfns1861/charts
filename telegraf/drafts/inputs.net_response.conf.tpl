{{- range .Values.app.net_response.services }}
[[inputs.net_response]]
  protocol = {{ .tcp | default "tcp" | quote }}
  address = {{ .address | quote }}
  timeout = {{ .timeout | default "5s" | quote }}
  read_timeout = {{ .read_timeout | default "5s" |quote }}
  [inputs.net_response.tags]
    tags = {{ .tags | quote }}
{{- end }}