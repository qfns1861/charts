# Charts

CICD 项目的配套 Helm Chart 仓库，用于管理 Kubernetes 部署所需的监控采集组件。

## Chart 列表

| Chart | 版本 | App 版本 | 说明 |
|-------|------|----------|------|
| [categraf](categraf/) | 1.0.0 | 0.3.72 | 开源指标采集 Agent（Categraf） |
| [telegraf](telegraf/) | 1.8.59 | 1.32.1 | 开源指标采集 Agent（Telegraf） |

## 目录结构

```
charts/
├── categraf/          # Categraf Helm Chart
│   ├── Chart.yaml
│   ├── deploy.yaml    # ArgoCD Application 部署描述
│   ├── templates/     # Helm 模板（Rollout、Service、PDB 等）
│   └── drafts/        # 配置文件模板
└── telegraf/          # Telegraf Helm Chart
    ├── Chart.yaml
    ├── templates/     # Helm 模板
    └── drafts/        # 配置文件模板（agent、cpu、net_response）
```

## 使用方式

通过 ArgoCD 部署（已提供 `deploy.yaml`），或手动使用 Helm：

```bash
helm install categraf ./categraf -n <namespace>
helm install telegraf ./telegraf -n <namespace>
```
