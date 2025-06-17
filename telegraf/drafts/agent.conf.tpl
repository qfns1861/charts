[agent]
[[outputs.prometheus_client]]
listen = ":{{ .Values.cfg.agent.prometheus_client.listen }}"
