#!/usr/bin/env bash
# Add external Helm repositories required by chart dependencies.
# This script is called by CI workflows before 'helm dependency build'.
set -euo pipefail

helm repo add headlamp https://kubernetes-sigs.github.io/headlamp/ --force-update
helm repo update
