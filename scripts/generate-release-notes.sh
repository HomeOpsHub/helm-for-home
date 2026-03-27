#!/usr/bin/env bash
# Generate release notes for Helm for Home.
# Usage: ./scripts/generate-release-notes.sh [TAG]
set -uo pipefail

TAG="${1:-$(git describe --tags --abbrev=0 2>/dev/null || echo 'unreleased')}"
PREV_TAG=$(git tag --sort=-v:refname 2>/dev/null | grep -v "^${TAG}$" | head -1 || true)
REPO_ROOT="$(git rev-parse --show-toplevel)"

echo "## 🏠 Helm for Home — ${TAG}"
echo ""
echo "A curated collection of Helm charts for deploying self-hosted applications on home Kubernetes clusters."
echo ""

# Installation
echo "### 📦 Installation"
echo ""
echo "#### From GHCR (OCI)"
echo ""
echo '```bash'
echo "# Pull any chart directly from GHCR"
echo "helm install <release-name> oci://ghcr.io/homeopshub/charts/<chart-name> --version <version>"
echo '```'
echo ""
echo "#### From Helm Repository"
echo ""
echo '```bash'
echo "helm repo add helm-for-home https://homeopshub.github.io/helm-for-home/"
echo "helm repo update"
echo "helm search repo helm-for-home"
echo '```'
echo ""

# Chart inventory
stable_count=$(find "${REPO_ROOT}/charts/stable" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
beta_count=$(find "${REPO_ROOT}/charts/beta" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
echo "### 📊 Chart Inventory"
echo ""
echo "| Category | Count |"
echo "|----------|-------|"
echo "| Stable | ${stable_count} |"
echo "| Beta | ${beta_count} |"
echo "| **Total** | **$((stable_count + beta_count))** |"
echo ""

# Charts table
echo "### 📋 All Charts"
echo ""
echo "<details>"
echo "<summary>Click to expand (${stable_count} stable + ${beta_count} beta charts)</summary>"
echo ""
echo "| Chart | Version | App Version | Category |"
echo "|-------|---------|-------------|----------|"

for chart in "${REPO_ROOT}"/charts/stable/*/Chart.yaml "${REPO_ROOT}"/charts/beta/*/Chart.yaml; do
  if [ -f "$chart" ]; then
    name=$(grep '^name:' "$chart" | head -1 | awk '{print $2}' || true)
    version=$(grep '^version:' "$chart" | head -1 | awk '{print $2}' || true)
    appVersion=$(grep '^appVersion:' "$chart" | head -1 | awk '{print $2}' | tr -d '"' || true)
    category=$(grep 'category:' "$chart" | head -1 | awk '{print $2}' || true)
    dir=$(dirname "$chart")
    tier=$(echo "$dir" | grep -oE 'stable|beta' || echo "stable")
    echo "| ${name:-unknown} | ${version:-0.0.0} | ${appVersion:-latest} | ${category:-General} (${tier}) |"
  fi
done

echo ""
echo "</details>"
echo ""

# Changes since last tag
if [ -n "${PREV_TAG:-}" ] && [ "$TAG" != "unreleased" ]; then
  echo "### 🔄 Changes since \`${PREV_TAG}\`"
  echo ""
  git log "${PREV_TAG}..${TAG}" --oneline --no-merges --format="- %s" 2>/dev/null | head -50 || true
  echo ""
elif [ "$TAG" = "unreleased" ] && [ -n "${PREV_TAG:-}" ]; then
  echo "### 🔄 Changes since \`${PREV_TAG}\`"
  echo ""
  git log "${PREV_TAG}..HEAD" --oneline --no-merges --format="- %s" 2>/dev/null | head -50 || true
  echo ""
fi

# Features
cat << 'FEATURES'
### ⚡ Every Chart Includes

- **Deployment** with Recreate strategy and configurable replicas
- **Service** (ClusterIP default)
- **Ingress** with className and TLS support
- **IngressRoute** (Traefik CRD) with TLS, certResolver, and middleware support
- **PersistentVolumeClaim** with configurable storageClass and size
- **ServiceAccount** with automount control
- **HorizontalPodAutoscaler** (autoscaling/v2)
- **Liveness & Readiness probes**
- **Security contexts** (pod and container level)
- **Extra env vars, volumes, and volume mounts**

### 🔧 Quick Start

```bash
# Install from GHCR (OCI) — no repo setup needed
helm install <release-name> oci://ghcr.io/homeopshub/charts/<chart-name> --version <version>

# Or install from Helm repository
helm install <release-name> helm-for-home/<chart-name>

# Install with custom values
helm install <release-name> helm-for-home/<chart-name> -f my-values.yaml

# See all configurable values
helm show values oci://ghcr.io/homeopshub/charts/<chart-name> --version <version>
```

---
*Powered by [HomeOpsHub](https://github.com/HomeOpsHub) — self-hosted everything* 🏡
FEATURES
