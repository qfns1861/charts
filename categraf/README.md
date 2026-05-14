# Categraf Helm Chart

## Introduction

This chart deploys [Categraf](https://github.com/flashcatcloud/categraf) on a Kubernetes cluster using the Helm package manager.

Categraf is an open-source, resource-aware agent for collecting, processing, aggregating, and sending metrics from systems and services. It is designed to work with [Nightingale](https://github.com/ccfos/nightingale) monitoring platform.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `my-categraf`:

```bash
helm install my-categraf ./categraf
```

## Configuration

The following table lists the configurable parameters of the Categraf chart and their default values.

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of replicas | `1` |
| `image.repo` | Image repository | `flashcatcloud/categraf` |
| `image.tag` | Image tag | `latest` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `service.enabled` | Enable service | `true` |
| `service.type` | Service type | `ClusterIP` |
| `service.port` | Service port | `9100` |
| `rbac.create` | Create RBAC resources | `true` |
| `pdb.create` | Create PodDisruptionBudget | `true` |
| `cfg.writer.url` | Nightingale writer URL | See values.yaml |
| `cfg.global.interval` | Collect interval in seconds | `15` |
| `cfg.prometheus.enable` | Enable prometheus scraping | `true` |

## Scrape Jobs

The chart supports the following scrape jobs (enabled via `cfg.scrape.jobs`):

- `apiserver` - Kubernetes API server metrics
- `controller-manager` - Kubernetes controller manager metrics
- `scheduler` - Kubernetes scheduler metrics
- `coredns` - CoreDNS metrics

## Uninstalling the Chart

To uninstall/delete the `my-categraf` deployment:

```bash
helm delete my-categraf
```
