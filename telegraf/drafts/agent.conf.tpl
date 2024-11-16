[agent]
[[outputs.prometheus_client]]
listen = ":{{ .Values.app.agent.prometheus_client.listen }}"
