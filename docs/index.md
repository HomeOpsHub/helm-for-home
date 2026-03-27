---
layout: home

hero:
  name: Helm for Home
  text: Self-Hosted Kubernetes Charts
  tagline: 160+ production-ready Helm charts for deploying self-hosted applications on your home Kubernetes cluster.
  actions:
    - theme: brand
      text: Get Started
      link: /guide/getting-started
    - theme: alt
      text: Browse Charts
      link: https://github.com/HomeOpsHub/helm-for-home/tree/main/charts/stable

features:
  - icon: 📦
    title: 160+ Charts
    details: From media servers to home automation, networking to development tools — everything you need for a self-hosted homelab.
  - icon: 🚀
    title: Two Install Methods
    details: Install from the traditional Helm repository or pull directly from GHCR as OCI artifacts — no repo setup needed.
  - icon: ⚡
    title: Production Ready
    details: Every chart includes ingress, persistence, health probes, security contexts, HPA, and service accounts out of the box.
  - icon: 🔒
    title: Security Scanned
    details: Automatically scanned with Trivy for misconfigurations and vulnerabilities on every release.
  - icon: 🏠
    title: Built for Home
    details: Designed for k3s, MicroK8s, and home clusters. Includes Traefik IngressRoute CRD support alongside standard ingress.
  - icon: 📝
    title: Auto-Generated Docs
    details: Every chart has comprehensive, auto-generated documentation with all configurable values via helm-docs.
---
