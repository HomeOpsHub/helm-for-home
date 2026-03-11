# Helm for Home

[![Release Charts](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/release.yml/badge.svg)](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/release.yml)
[![Validate Charts](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/lint.yml/badge.svg)](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/lint.yml)
[![Security Scan](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/security.yml/badge.svg)](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/security.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A curated collection of Helm charts for deploying self-hosted applications on home Kubernetes clusters.

## Table of Contents

- [Helm for Home](#helm-for-home)
  - [Table of Contents](#table-of-contents)
  - [Quick Start](#quick-start)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Available Charts](#available-charts)
    - [Stable](#stable)
    - [Beta](#beta)
  - [Usage](#usage)
    - [Installing a Chart](#installing-a-chart)
    - [Upgrading a Release](#upgrading-a-release)
    - [Uninstalling a Release](#uninstalling-a-release)
    - [Customizing Values](#customizing-values)
  - [Repository Structure](#repository-structure)
  - [Contributing](#contributing)
  - [License](#license)

## Quick Start

### Prerequisites

- A running Kubernetes cluster ([k3s](https://k3s.io/), [MicroK8s](https://microk8s.io/), or similar)
- [Helm](https://helm.sh/docs/intro/install/) v3.12+

### Installation

```bash
# Add the repository
helm repo add helm-for-home https://homeopshub.github.io/helm-for-home/
helm repo update

# Search available charts
helm search repo helm-for-home

# Install a chart (example: uptime-kuma)
helm install uptime-kuma helm-for-home/uptime-kuma
```

## Available Charts

### Stable

Production-ready charts that have been tested and validated.

| Chart | Description |
|-------|-------------|
| [adguard-home](charts/stable/adguard-home) | AdGuard Home - network-wide ad blocking |
| [cloudbeaver](charts/stable/cloudbeaver) | CloudBeaver - web-based database manager |
| [custom-error-pages](charts/stable/custom-error-pages) | Custom error pages (tarampampam/error-pages) |
| [freshrss](charts/stable/freshrss) | FreshRSS - self-hosted RSS feed aggregator |
| [glances](charts/stable/glances) | Glances - system monitoring tool |
| [gotify](charts/stable/gotify) | Gotify - server for sending and receiving messages |
| [it-tools](charts/stable/it-tools) | IT-Tools - collection of useful developer utilities |
| [netdata](charts/stable/netdata) | Netdata - real-time performance monitoring |
| [open-wearables](charts/stable/open-wearables) | Open Wearables - unified wearable health data platform |
| [outline](charts/stable/outline) | Outline - team wiki and knowledge base |
| [plex](charts/stable/plex) | Plex Media Server |
| [spotify](charts/stable/spotify) | Spotify - web-based Spotify client |
| [teslamate](charts/stable/teslamate) | TeslaMate - Tesla vehicle data logger |
| [uptime-kuma](charts/stable/uptime-kuma) | Uptime Kuma - self-hosted monitoring tool |
| [whoogle](charts/stable/whoogle) | Whoogle - self-hosted Google search proxy |

### Beta

Charts under active development. May have breaking changes between versions.

| Chart | Description |
|-------|-------------|
| [plex](charts/beta/plex) | Plex Media Server (experimental) |
| [teslamate](charts/beta/teslamate) | TeslaMate (experimental) |

## Usage

### Installing a Chart

```bash
# Install with default values
helm install <release-name> helm-for-home/<chart-name>

# Install with custom values
helm install <release-name> helm-for-home/<chart-name> -f my-values.yaml

# Install in a specific namespace
helm install <release-name> helm-for-home/<chart-name> -n <namespace> --create-namespace
```

### Upgrading a Release

```bash
helm repo update
helm upgrade <release-name> helm-for-home/<chart-name>
```

### Uninstalling a Release

```bash
helm uninstall <release-name>
```

### Customizing Values

Each chart includes a `values.yaml` with documented defaults. To see all configurable options:

```bash
helm show values helm-for-home/<chart-name>
```

## Repository Structure

```
charts/
  stable/       # Production-ready charts
  beta/         # Charts under development
common/         # Shared templates and helpers
scripts/        # Utility scripts
docs/           # Additional documentation
```

## Contributing

Contributions are welcome! To add or improve a chart:

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/my-chart`)
3. Make your changes — ensure charts pass `helm lint`
4. Submit a pull request against `main`

All pull requests are automatically validated with linting, chart-testing, and security scanning.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
