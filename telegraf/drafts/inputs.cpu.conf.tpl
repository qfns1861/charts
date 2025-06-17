# Read metrics about cpu usage
[[inputs.cpu]]
  percpu = {{ .Values.cfg.cpu.percpu }}
  totalcpu = {{ .Values.cfg.cpu.totalcpu }}
  collect_cpu_time = {{ .Values.cfg.cpu.collect_cpu_time }}
  report_active = {{ .Values.cfg.cpu.report_active }}
  core_tags = {{ .Values.cfg.cpu.core_tags }}
