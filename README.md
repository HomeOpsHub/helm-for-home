# 🏠 Helm for Home

<div align="center">

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Charts](https://img.shields.io/badge/charts-20+-green.svg)]()
[![Home Lab](https://img.shields.io/badge/home%20lab-friendly-orange.svg)]()
[![Kubernetes](https://img.shields.io/badge/kubernetes-1.20+-blue.svg)]()

**Curated Helm charts for self-hosted applications and home lab environments**

</div>

Welcome to **Helm for Home**! This repository contains a comprehensive collection of curated Helm charts specifically designed for deploying and managing self-hosted applications and services on home servers and personal Kubernetes clusters. Whether you're a home lab enthusiast, self-hosting advocate, or just getting started with Kubernetes, these charts will help you deploy your favorite applications with ease.

## 🌟 Features

- **📦 20+ Applications**: Ready-to-deploy charts for popular home lab applications
- **🔧 Home Lab Optimized**: Configurations tailored for small-scale environments
- **🚀 Easy Deployment**: One-command installation with sensible defaults
- **📊 Monitoring Ready**: Built-in support for Prometheus and Grafana
- **🔒 Security First**: Best practices for secrets management and security
- **📖 Comprehensive Documentation**: Detailed README for each chart
- **🏷️ Semantic Versioning**: Proper versioning and release management

## 📋 Table of Contents

- [🏠 Helm for Home](#-helm-for-home)
  - [🌟 Features](#-features)
  - [📋 Table of Contents](#-table-of-contents)
  - [🚀 Quick Start](#-quick-start)
  - [📦 Available Charts](#-available-charts)
  - [🛠️ Prerequisites](#️-prerequisites)
  - [⚙️ Installation](#️-installation)
  - [💡 Usage Examples](#-usage-examples)
  - [🏗️ Chart Architecture](#️-chart-architecture)
  - [🤝 Contributing](#-contributing)
  - [📞 Support](#-support)
  - [📄 License](#-license)

## 🚀 Quick Start

Add the repository and install your first chart:

```bash
# Add the Helm repository
helm repo add homelab https://homeops.github.io/helm-for-home/

# Update repository
helm repo update

# Install an application (e.g., Plex)
helm install plex homelab/plex

# Or with custom values
helm install plex homelab/plex --values my-values.yaml
```

## 📦 Available Charts

### 🌟 Stable Charts
| Chart | Description | Version | App Version |
|-------|-------------|---------|-------------|
| **adguard-home** | Network-wide ad blocker | ![Version](https://img.shields.io/badge/version-1.0.0-blue) | ![App Version](https://img.shields.io/badge/app-latest-green) |
| **plex** | Media server | ![Version](https://img.shields.io/badge/version-1.0.0-blue) | ![App Version](https://img.shields.io/badge/app-latest-green) |
| **freshrss** | RSS feed aggregator | ![Version](https://img.shields.io/badge/version-0.2.0-blue) | ![App Version](https://img.shields.io/badge/app-1.20.1-green) |
| **gotify** | Self-hosted push notification server | ![Version](https://img.shields.io/badge/version-0.2.0-blue) | ![App Version](https://img.shields.io/badge/app-2.1.5-green) |
| **uptime-kuma** | Uptime monitoring | ![Version](https://img.shields.io/badge/version-0.4.0-blue) | ![App Version](https://img.shields.io/badge/app-1.0.0-green) |
| **netdata** | Real-time performance monitoring | ![Version](https://img.shields.io/badge/version-1.0.0-blue) | ![App Version](https://img.shields.io/badge/app-latest-green) |
| **glances** | Cross-platform system monitoring | ![Version](https://img.shields.io/badge/version-0.1.0-blue) | ![App Version](https://img.shields.io/badge/app-latest-green) |
| **whoogle** | Privacy-focused Google search proxy | ![Version](https://img.shields.io/badge/version-1.0.0-blue) | ![App Version](https://img.shields.io/badge/app-latest-green) |
| **it-tools** | Collection of online tools | ![Version](https://img.shields.io/badge/version-1.0.0-blue) | ![App Version](https://img.shields.io/badge/app-latest-green) |

### 🧪 Beta Charts
| Chart | Description | Status |
|-------|-------------|--------|
| **teslamate** | Tesla data logger | Beta |
| **outline** | Team knowledge base | Beta |

### 📂 Chart Categories
- **🎬 Media**: Plex, Jellyfin
- **📊 Monitoring**: Uptime Kuma, Netdata, Glances
- **🔒 Security**: AdGuard Home
- **📰 Information**: FreshRSS, Outline
- **🔧 Utilities**: IT Tools, Whoogle
- **📱 Notifications**: Gotify

## 🛠️ Prerequisites

Before you begin, ensure you have:

- **Kubernetes cluster** (1.20+) - Works with:
  - [k3s](https://k3s.io/) *(recommended for home lab)*
  - [MicroK8s](https://microk8s.io/)
  - [Docker Desktop](https://www.docker.com/products/docker-desktop)
  - Any standard Kubernetes distribution

- **Helm 3.0+** - [Installation guide](https://helm.sh/docs/intro/install/)

- **Storage provider** (optional but recommended):
  - [Longhorn](https://longhorn.io/) *(recommended for home lab)*
  - Local storage
  - NFS storage

- **Ingress controller** (optional but recommended):
  - [Traefik](https://traefik.io/) *(recommended for home lab)*
  - [NGINX Ingress](https://kubernetes.github.io/ingress-nginx/)

## ⚙️ Installation

### Method 1: Using Helm Repository (Recommended)

```bash
# Add the repository
helm repo add homelab https://homeops.github.io/helm-for-home/

# Update repository information
helm repo update

# Search for available charts
helm search repo homelab

# Install a chart
helm install my-app homelab/chart-name
```

### Method 2: From Source

```bash
# Clone the repository
git clone https://github.com/HomeOpsHub/helm-for-home.git
cd helm-for-home

# Install directly from source
helm install my-app ./charts/stable/chart-name
```

## 💡 Usage Examples

### Basic Installation

```bash
# Install AdGuard Home with defaults
helm install adguard homelab/adguard-home

# Install Plex with custom storage
helm install plex homelab/plex \
  --set persistence.enabled=true \
  --set persistence.size=100Gi
```

### Advanced Configuration

```yaml
# values.yaml
image:
  repository: plex/plex-server
  tag: latest

persistence:
  enabled: true
  size: 500Gi
  storageClass: longhorn

ingressRoute:
  enabled: true
  host: plex.home.local
  tls:
    enabled: true

resources:
  requests:
    cpu: 1000m
    memory: 2Gi
  limits:
    cpu: 4000m
    memory: 8Gi
```

```bash
# Install with custom values
helm install plex homelab/plex -f values.yaml
```

### Using with Traefik (Common Home Lab Setup)

```yaml
# traefik-values.yaml
ingressRoute:
  enabled: true
  host: myapp.home.local
  metadata:
    annotations:
      traefik.ingress.kubernetes.io/router.middlewares: default-auth@kubernetescrd
  spec:
    entryPoints:
      - web
      - websecure
  tls:
    enabled: true
    secretName: home-tls
```

## 🏗️ Chart Architecture

This repository follows a standardized architecture:

```
charts/
├── common/              # Shared library chart
│   ├── templates/       # Reusable templates
│   └── values.yaml     # Default values schema
├── stable/             # Production-ready charts
│   ├── app-name/
│   │   ├── Chart.yaml
│   │   ├── values.yaml
│   │   └── templates/
└── beta/               # Beta/testing charts
    └── app-name/
```

### Key Features:
- **🔄 Reusable Components**: Common library reduces duplication
- **📝 Standardized Values**: Consistent configuration across charts
- **🧪 Testing**: Automated linting and testing
- **📊 Monitoring**: Built-in ServiceMonitor for Prometheus
- **🔒 Security**: Pod Security Standards compliance

## Why Use Helm for Home?

- **Curated for Home Labs**: All charts are specifically crafted for small-scale, personal Kubernetes environments.
- **Pre-Configured and Easy to Use**: Get started quickly with ready-to-use configurations, or customize them to suit your specific needs.
- **Wide Range of Applications**: Includes charts for various self-hosted applications, such as media servers, file sharing, home automation, and more.
- **Community-Driven**: Contribute your own charts or improvements, and benefit from updates and enhancements from others.

## Getting Started

### Prerequisites

Before you start using the Helm charts from this repository, ensure you have the following:

- A running Kubernetes cluster (e.g., [k3s](https://k3s.io/), [MicroK8s](https://microk8s.io/), or any other Kubernetes distribution)
- [Helm](https://helm.sh/docs/intro/install/) installed on your local machine

### Installation

1. **Add the Helm Repository**

   To add this repository to your Helm setup, run:

   ```bash   
   helm repo add myhelm https://homeopshub.github.io/helm-for-home/
   helm repo update
   ```

2. **Install a Chart**

   To install a chart from this repository, use:

   ```bash
   helm install <release-name> myhelm/<chart-name>
   ```

   For example, to install the `plex` chart:

   ```bash
   helm install plex myhelm/plex
   ```

3. **Customization**

   You can customize the deployment by providing your own values file:

   ```bash
   helm install <release-name> myhelm/<chart-name> -f custom-values.yaml
   ```

## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

### 🐛 Report Issues
- Found a bug? [Open an issue](https://github.com/HomeOpsHub/helm-for-home/issues)
- Have a feature request? [Create a feature request](https://github.com/HomeOpsHub/helm-for-home/issues/new?template=feature_request.md)

### 💻 Code Contributions

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/new-chart`
3. **Follow the chart standards**:
   - Use the common library chart
   - Include proper documentation
   - Add tests where applicable
   - Follow semantic versioning
4. **Test your changes**: `helm lint charts/stable/your-chart`
5. **Submit a pull request**

### 📊 Chart Development Guidelines

- **Use the common library**: All charts should extend the common library
- **Document everything**: Include README, values schema, and examples
- **Test thoroughly**: Ensure charts work in realistic home lab environments
- **Follow conventions**: Use consistent naming and structure
- **Security first**: Follow Kubernetes security best practices

### 🔍 Testing Your Charts

```bash
# Lint your chart
helm lint charts/stable/your-chart

# Test installation
helm install test-release charts/stable/your-chart --dry-run --debug

# Test with values
helm install test-release charts/stable/your-chart -f test-values.yaml --dry-run
```

## 📞 Support

### 📖 Documentation
- [Chart Documentation](./charts/README.md)
- [Common Library Guide](./charts/common/README.md)
- [Deployment Examples](./docs/examples/)

### 💬 Community Support
- [GitHub Discussions](https://github.com/HomeOpsHub/helm-for-home/discussions)
- [Issue Tracker](https://github.com/HomeOpsHub/helm-for-home/issues)

### 🆘 Getting Help
1. Check the [FAQ](./docs/FAQ.md)
2. Search existing [issues](https://github.com/HomeOpsHub/helm-for-home/issues)
3. Join our [Discord community](https://discord.gg/homeops)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Thanks to all contributors who help improve this project
- Special thanks to the Kubernetes and Helm communities
- Inspired by the amazing self-hosting and home lab communities

---

<div align="center">

**Made with ❤️ for the Home Lab Community**

[⭐ Star this repo](https://github.com/HomeOpsHub/helm-for-home) • [🍴 Fork it](https://github.com/HomeOpsHub/helm-for-home/fork) • [📢 Share it](https://twitter.com/intent/tweet?text=Check%20out%20this%20awesome%20collection%20of%20Helm%20charts%20for%20home%20labs!&url=https://github.com/HomeOpsHub/helm-for-home)

</div>
