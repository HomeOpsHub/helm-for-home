# Charts

This directory contains all Helm charts for the Home Lab collection.

## Structure

```
charts/
├── common/              # Shared library chart
├── stable/             # Production-ready charts
└── beta/               # Beta/testing charts
```

## Chart Categories

### 🎬 Media & Entertainment
- **plex**: Media server for organizing and streaming media content
- **spotify**: Self-hosted Spotify tracking and statistics

### 📊 Monitoring & Observability
- **uptime-kuma**: Beautiful and feature-rich uptime monitoring
- **netdata**: Real-time performance and health monitoring
- **glances**: Cross-platform system monitoring tool

### 🔒 Security & Privacy
- **adguard-home**: Network-wide ad and tracker blocker
- **whoogle**: Privacy-focused Google search proxy

### 📰 Information & Communication
- **freshrss**: Free RSS feed aggregator
- **gotify**: Simple server for sending and receiving messages
- **outline**: Team knowledge base and wiki

### 🔧 Utilities & Tools
- **it-tools**: Collection of handy online tools
- **custom-error-pages**: Customizable error pages for web services
- **cloudbeaver**: Universal database administration tool

### 🚗 Specialized Applications
- **teslamate**: Data logger for Tesla vehicles

## Chart Standards

All charts in this repository follow these standards:

### Required Files
- `Chart.yaml` - Chart metadata
- `values.yaml` - Default configuration values
- `templates/` - Kubernetes manifest templates
- `README.md` - Chart documentation

### Recommended Files
- `templates/_helpers.tpl` - Template helpers (if not using common library)
- `templates/tests/` - Chart tests
- `templates/NOTES.txt` - Post-installation notes

### Chart Dependencies
Most charts depend on the `common` library chart which provides:
- Standardized templates
- Common helper functions
- Consistent labeling and naming conventions
- Security best practices

## Using Charts

### Add Repository
```bash
helm repo add homelab https://homeops.github.io/helm-for-home/
helm repo update
```

### Install a Chart
```bash
# Basic installation
helm install my-app homelab/chart-name

# With custom values
helm install my-app homelab/chart-name -f values.yaml

# Override specific values
helm install my-app homelab/chart-name \
  --set image.tag=latest \
  --set persistence.enabled=true
```

### Upgrade a Chart
```bash
helm upgrade my-app homelab/chart-name
```

### Uninstall a Chart
```bash
helm uninstall my-app
```

## Development

### Creating a New Chart
1. Use the common library as a dependency
2. Follow the naming conventions
3. Include comprehensive documentation
4. Add appropriate tests
5. Follow semantic versioning

### Testing Charts
```bash
# Lint the chart
helm lint charts/stable/my-chart

# Test installation
helm install test-release charts/stable/my-chart --dry-run --debug

# Run chart tests
helm test test-release
```

### Chart Versioning
- Follow [Semantic Versioning](https://semver.org/)
- Increment patch version for bug fixes
- Increment minor version for new features
- Increment major version for breaking changes

## Contributing

We welcome contributions! Please see our [Contributing Guide](../README.md#contributing) for details.

## Support

For chart-specific issues:
1. Check the chart's README
2. Review the values.yaml for configuration options
3. Check existing issues in the repository
4. Create a new issue with detailed information
