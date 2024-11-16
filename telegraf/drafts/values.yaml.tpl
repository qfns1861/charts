global:
  namespace:
    name: {{ .global.namespace.name }}
  pool:
    name: {{ .global.pool.name }}
    type: {{ .global.pool.type }}
  service:
    name: {{ .global.service.name }}
  location:
    name: {{ .global.location.name }}
  ingress:
    name: {{ .global.ingress.name }}
  cluster:
    name: {{ .global.cluster.name }}

k8s:
  replicaCount: {{ .k8s.replicaCount }}

  image:
    repo: {{ .k8s.image.repo }}
    tag: {{ .k8s.image.tag }}
    meta:
      pullPolicy: {{ .k8s.image.meta.pullPolicy }}

  podAnnotations: {}

  podLabels: {}

  imagePullSecrets: []

  prometheus_client:
    listen: {{ .app.prometheus_client.listen | default 9273 }}

  args: []

{{- if .k8s.env }}
  env:
  {{- range .k8s.env }}
    - name: {{ .name }}
      value: {{ .value }}
  {{- end }}
{{- end }}

  resources: {}

  nodeSelector: {}

  affinity: {}

  tolerations: []

  updateStrategy: {}

  service:
    enabled: true
    type: ClusterIP
    annotations: {}

  rbac:
    create: false
    clusterWide: false
    rules: []

  serviceAccount:
    create: false
    name:
    annotations: {}

  pdb:
    create: true
    minAvailable: 1

app:
  cpu:
    percpu: {{ .app.cpu.percpu }}
    totalcpu: {{ .app.cpu.totalcpu }}
    collect_cpu_time: {{ .app.cpu.collect_cpu_time }}
    report_active: {{ .app.cpu.report_active }}
    core_tags: {{ .app.cpu.core_tags }}
  agent:
    prometheus_client:
      listen: {{ .app.agent.prometheus_client.listen }}

  {{- $location := .location }}
  {{- $services := .app.net_response.services }}
  net_response:
  {{- if .app.net_response.enabled }}
    enabled: true
    services:
    {{- range $service := $services }}
      - address: {{ index  $location $service "host" }}:{{ index $location $service "port" }}
        tags: {{ $service }}
    {{- end }}
  {{- else }}
    enabled: false
  {{- end }}
