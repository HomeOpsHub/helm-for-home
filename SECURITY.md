# Security Policy

## Supported Versions

Only the latest version of each chart in the `charts/stable/` directory receives security fixes.
Beta charts (`charts/beta/`) are provided as-is without security guarantees.

| Channel | Supported |
|---------|-----------|
| `stable` (latest) | ✅ |
| `beta` | ❌ |
| Older chart versions | ❌ |

## Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub issues.**

If you discover a security vulnerability in this repository, please report it via [GitHub's private vulnerability reporting](https://github.com/HomeOpsHub/helm-for-home/security/advisories/new).

Alternatively, you can email the maintainers directly (see `Chart.yaml` `maintainers` field for contact details).

### What to Include

To help us triage the report quickly, please include:

- A description of the vulnerability and its impact
- Steps to reproduce the issue
- The affected chart name and version
- Any suggested mitigations or fixes

### Response Timeline

- **Acknowledgement**: within 48 hours
- **Initial assessment**: within 7 days
- **Fix / advisory**: as soon as reasonably possible, typically within 30 days

## Security Best Practices for Chart Users

When deploying charts from this repository:

1. **Never store secrets in `values.yaml` files** or version control. Use:
   - [External Secrets Operator](https://external-secrets.io/)
   - [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets)
   - [HashiCorp Vault](https://www.vaultproject.io/)
   - Kubernetes Secrets passed at deploy time with `--set`

2. **Pin image tags** — avoid `latest` or `stable` floating tags in production. Use a specific digest or version tag.

3. **Configure `securityContext`** — enable `runAsNonRoot: true`, drop capabilities, and use `readOnlyRootFilesystem: true` where the application supports it.

4. **Set resource limits** — always configure `resources.limits` to prevent resource exhaustion.

5. **Keep charts updated** — subscribe to releases to be notified of updates that include security fixes.

## Scope

This policy covers:

- Helm chart templates in this repository
- Default values that could lead to insecure deployments
- CI/CD pipeline configurations

This policy does **not** cover vulnerabilities in the upstream applications deployed by these charts. Please report those to the respective upstream projects.
