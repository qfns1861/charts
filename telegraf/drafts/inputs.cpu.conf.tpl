# Read metrics about cpu usage
[[inputs.cpu]]
  percpu = {{ .Values.app.cpu.percpu }}
  totalcpu = {{ .Values.app.cpu.totalcpu }}
  collect_cpu_time = {{ .Values.app.cpu.collect_cpu_time }}
  report_active = {{ .Values.app.cpu.report_active }}
  core_tags = {{ .Values.app.cpu.core_tags }}
