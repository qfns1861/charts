{{- range $name, $cfg := .Values.cfg.net_response.services }}
[[inputs.net_response]]
  protocol = {{ default "tcp" (index $cfg "tcp") | quote }}
  address = {{ default (print $name ":80") (index $cfg "address") | quote }}
  timeout = {{ default "5s" (index $cfg "timeout") | quote }}
  read_timeout = {{ default "5s" (index $cfg "read_timeout") | quote }}
  [inputs.net_response.tags]
    name = {{ $name | quote }}
{{- end }}
