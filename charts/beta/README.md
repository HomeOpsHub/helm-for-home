# Helm for Home

Welcome to **Helm for Home**! This repository contains a collection of curated Helm charts specifically designed for deploying and managing self-hosted applications and services on a home server or personal Kubernetes cluster. If you're a home lab enthusiast looking to streamline your Kubernetes deployments, you've come to the right place!

## Table of Contents
- [Introduction](#introduction)
- [Why Use Helm for Home?](#why-use-helm-for-home)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Available Charts](#available-charts)
- [Usage](#usage)
- [Contributing](#contributing)
- [Support](#support)
- [License](#license)

## Introduction

**Helm for Home** is designed to simplify the process of deploying, managing, and maintaining self-hosted applications in a home lab environment. With a focus on ease of use, these Helm charts are pre-configured to suit small-scale Kubernetes clusters, making them perfect for anyone looking to create a home server setup.

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
   helm repo add helm-for-home https://your-repo-url
   helm repo update
