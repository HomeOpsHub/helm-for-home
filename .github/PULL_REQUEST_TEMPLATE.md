## Description

<!-- Describe what this PR does and why. Link to any related issues. -->

Fixes # (issue)

## Type of Change

- [ ] Bug fix (non-breaking change that fixes an issue)
- [ ] New chart (adds a new Helm chart)
- [ ] Chart update (non-breaking change to an existing chart)
- [ ] Breaking change (fix or feature that would cause existing installs to change behavior)
- [ ] Documentation update
- [ ] CI/CD improvement

## Chart Changes Checklist

If you are adding or modifying a chart, confirm the following:

- [ ] `Chart.yaml` version has been bumped following [Semantic Versioning](https://semver.org/)
- [ ] `appVersion` reflects the actual upstream application version
- [ ] `values.yaml` contains all necessary settings with sensible defaults
- [ ] No plaintext secrets or credentials are present in `values.yaml`
- [ ] Health probes (`livenessProbe` / `readinessProbe`) are configured
- [ ] `README.md` is generated/updated via `helm-docs`
- [ ] Templates pass `helm lint` with no errors or warnings
- [ ] `NOTES.txt` provides useful post-install guidance

## Testing

<!-- Describe how you tested these changes. -->

- [ ] `helm lint` passes on all modified charts
- [ ] Manually installed on a test cluster (if applicable)

## Additional Notes

<!-- Any additional context, screenshots, or information. -->
