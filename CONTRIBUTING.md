# Contributing to helm-for-home

Thank you for considering contributing! This guide covers everything you need to know to get started.

## Table of Contents

- [Contributing to helm-for-home](#contributing-to-helm-for-home)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
  - [Development Setup](#development-setup)
    - [Prerequisites](#prerequisites)
    - [Lint a chart](#lint-a-chart)
    - [Run chart-testing lint](#run-chart-testing-lint)
    - [Generate documentation](#generate-documentation)
    - [Run integration tests (requires Kind)](#run-integration-tests-requires-kind)
  - [Adding a New Chart](#adding-a-new-chart)
  - [Modifying an Existing Chart](#modifying-an-existing-chart)
  - [Pull Request Guidelines](#pull-request-guidelines)
  - [Coding Standards](#coding-standards)
    - [values.yaml](#valuesyaml)
    - [templates/](#templates)
    - [Commit Messages](#commit-messages)

---

## Getting Started

1. **Fork** the repository and clone your fork.
2. Create a **feature branch**: `git checkout -b feat/my-new-chart`
3. Make your changes, commit, and push.
4. Open a **Pull Request** against `main`.

---

## Development Setup

### Prerequisites

| Tool | Version | Install |
|------|---------|---------|
| [Helm](https://helm.sh) | ≥ 3.12 | `brew install helm` |
| [helm-docs](https://github.com/norwoodj/helm-docs) | ≥ 1.14 | `brew install norwoodj/tap/helm-docs` |
| [chart-testing (ct)](https://github.com/helm/chart-testing) | ≥ 3.10 | `brew install chart-testing` |
| [kind](https://kind.sigs.k8s.io) | ≥ 0.20 | `brew install kind` |

### Lint a chart

```bash
helm lint charts/stable/<chart-name>/
```

### Run chart-testing lint

```bash
# Lint all changed charts against main
ct lint --target-branch main
```

### Generate documentation

```bash
# Regenerate README.md for all charts
helm-docs
```

### Run integration tests (requires Kind)

```bash
# Create a local cluster
kind create cluster --name helm-test

# Test changed charts
ct install --target-branch main

# Cleanup
kind delete cluster --name helm-test
```

---

## Adding a New Chart

1. **Stable charts** go in `charts/stable/`, **beta charts** in `charts/beta/`.
2. Scaffold a new chart: `helm create charts/stable/<name>`
3. Update `Chart.yaml`:
   - Accurate `description`
   - Correct `appVersion` (pin to a specific release, not `latest`)
   - Add `keywords`, `home`, `sources`, and `maintainers`
   - Add `annotations.category`
4. Update `values.yaml`:
   - Set `image.repository` to the correct upstream image (not `nginx`)
   - Add sensible resource requests/limits
   - Configure `livenessProbe` and `readinessProbe`
   - **Never** include real credentials as default values
5. Update templates:
   - Include `serviceAccountName`, `securityContext`, health probes, and resource limits in `deployment.yaml`
   - Follow existing chart structure for consistency
6. Generate docs: `helm-docs`
7. Lint: `helm lint charts/stable/<name>/ && ct lint --target-branch main`

---

## Modifying an Existing Chart

- **Always bump** `Chart.yaml` `version` (following [SemVer](https://semver.org/)) for every change.
- Run `helm-docs` after changing `Chart.yaml` or `values.yaml`.
- Run `helm lint` to verify no errors are introduced.

---

## Pull Request Guidelines

- Keep PRs focused — one chart per PR where possible.
- Fill in the PR template completely.
- Ensure all CI checks pass before requesting review.
- **Redact** all secrets and passwords from examples and test values.
- Reference any related issues using `Fixes #<issue>`.

---

## Coding Standards

### values.yaml

- Use empty string defaults for required secrets, not placeholder values.
- Add comments for non-obvious configuration options.
- Follow the structure of existing charts for consistency.

### templates/

- Use `{{- include "chart.name" . }}` helpers consistently.
- Always include `serviceAccountName`, `podSecurityContext`, and `securityContext` fields.
- Always include `livenessProbe` and `readinessProbe`.
- Use `{{- with }}` guards for optional blocks (annotations, nodeSelector, etc.).
- Port names must be ≤ 15 characters.

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
feat(chart): add new chart for paperless-ngx
fix(adguard-home): correct tls.enabled typo
chore(ci): bump actions/checkout to v4
docs(plex): update README via helm-docs
```
