# Contributing

We welcome contributions! Whether it's a new chart, a bug fix, or documentation improvement.

## How to Contribute

### 1. Fork & Clone

```bash
git clone https://github.com/<your-username>/helm-for-home.git
cd helm-for-home
```

### 2. Create a Branch

```bash
git checkout -b feat/my-new-chart
```

### 3. Make Changes

- Add or modify charts in `charts/stable/` or `charts/beta/`
- Always bump `version` in `Chart.yaml` for every change
- Run `helm-docs` to regenerate README files
- Ensure `helm lint` passes

### 4. Submit a Pull Request

Push your branch and open a PR against `main`. The CI pipeline will automatically:

- **Lint** changed charts with chart-testing
- **Test** changed charts by installing on a Kind cluster
- **Validate** that chart READMEs are up to date
- **Security scan** templates with Trivy
- Request a **Copilot code review**

## PR Checklist

- [ ] Chart.yaml `version` bumped (SemVer)
- [ ] `helm lint` passes locally
- [ ] `helm-docs` run and README committed
- [ ] `helm template` renders without errors
- [ ] values.yaml has sensible defaults

## Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: add paperless-ngx chart
fix: correct default port for jellyfin
docs: update uptime-kuma values documentation
chore: bump adguard-home appVersion to 0.107.58
```

## Release Process

When your PR merges to `main`, the release workflow automatically:

1. Detects which charts have changed
2. Packages and publishes to **GHCR** as OCI artifacts
3. Publishes to **GitHub Pages** via chart-releaser
4. Enhances per-chart GitHub releases with install commands
5. Builds and deploys the documentation site

## Labels

PRs are automatically labeled based on changed files:

| Label | Trigger |
|-------|---------|
| `backend` | Go files, internal/, cmd/ |
| `frontend` | web/ files |
| `docker` | Dockerfiles, docker-compose |
| `helm` | charts/ directory |
| `ci` | .github/ directory |
| `docs` | docs/ and markdown files |

## Code of Conduct

Be respectful and constructive. We're building tools for the homelab community — keep it friendly and inclusive.

## Questions?

Open a [GitHub Issue](https://github.com/HomeOpsHub/helm-for-home/issues) or start a [Discussion](https://github.com/HomeOpsHub/helm-for-home/discussions).
