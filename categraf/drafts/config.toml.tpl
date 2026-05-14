[global]
# whether print configs
print_configs = {{ .Values.cfg.global.print_configs }}

# add label(agent_hostname) to series
hostname = "{{ .Values.cfg.global.hostname }}"

[http]
# 是否启用 http 服务，用于暴露 metrics
enable = {{ .Values.cfg.http.enable }}
# 监听地址
address = ":{{ .Values.cfg.http.port }}"
# 是否打印访问日志
print_access = {{ .Values.cfg.http.print_access }}
# 是否开启 pprof
pprof = {{ .Values.cfg.http.pprof }}
# 超时时间
timeout = {{ .Values.cfg.http.timeout }}

# will not add label(agent_hostname) if true
omit_hostname = {{ .Values.cfg.global.omit_hostname }}

# s | ms
precision = "{{ .Values.cfg.global.precision }}"

# global collect interval
interval = {{ .Values.cfg.global.interval }}

[writer_opt]
# default: 2000
batch = {{ .Values.cfg.writer.batch }}
# channel(as queue) size
chan_size = {{ .Values.cfg.writer.chan_size }}

[[writers]]
url = "{{ .Values.cfg.writer.url }}"

# Basic auth username
basic_auth_user = "{{ .Values.cfg.writer.basic_auth_user }}"

# Basic auth password
basic_auth_pass = "{{ .Values.cfg.writer.basic_auth_pass }}"

# timeout settings, unit: ms
timeout = {{ .Values.cfg.writer.timeout }}
dial_timeout = {{ .Values.cfg.writer.dial_timeout }}
max_idle_conns_per_host = {{ .Values.cfg.writer.max_idle_conns_per_host }}
