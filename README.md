# Helm for Home

[![Release Charts](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/release.yml/badge.svg)](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/release.yml)
[![CI](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/ci.yml/badge.svg)](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/ci.yml)
[![Security Scan](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/security.yml/badge.svg)](https://github.com/HomeOpsHub/helm-for-home/actions/workflows/security.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A curated collection of Helm charts for deploying self-hosted applications on home Kubernetes clusters.

## Table of Contents

- [Helm for Home](#helm-for-home)
  - [Table of Contents](#table-of-contents)
  - [Quick Start](#quick-start)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Available Charts](#available-charts)
    - [Stable](#stable)
    - [Beta](#beta)
  - [Usage](#usage)
    - [Installing a Chart](#installing-a-chart)
    - [Upgrading a Release](#upgrading-a-release)
    - [Uninstalling a Release](#uninstalling-a-release)
    - [Customizing Values](#customizing-values)
  - [Repository Structure](#repository-structure)
  - [Contributing](#contributing)
  - [License](#license)

## Quick Start

### Prerequisites

- A running Kubernetes cluster ([k3s](https://k3s.io/), [MicroK8s](https://microk8s.io/), or similar)
- [Helm](https://helm.sh/docs/intro/install/) v3.12+

### Installation

#### From GHCR (OCI)

```bash
# No repo setup needed — install directly from GHCR
helm install uptime-kuma oci://ghcr.io/homeopshub/charts/uptime-kuma --version 0.7.0
```

#### From Helm Repository

```bash
# Add the repository
helm repo add helm-for-home https://homeopshub.github.io/helm-for-home/
helm repo update

# Search available charts
helm search repo helm-for-home

# Install a chart (example: uptime-kuma)
helm install uptime-kuma helm-for-home/uptime-kuma
```

## Available Charts

### Stable

Production-ready charts that have been tested and validated.

| Chart | Description |
|-------|-------------|
| [adguard-home](charts/stable/adguard-home) | AdGuard Home - network-wide ad blocking |
| [airsonic](charts/stable/airsonic) | Airsonic - personal music streaming server |
| [bazarr](charts/stable/bazarr) | Bazarr - automatic subtitle management |
| [bitwarden](charts/stable/bitwarden) | Vaultwarden - lightweight Bitwarden server |
| [booksonic](charts/stable/booksonic) | Booksonic - audiobook streaming server |
| [calibre](charts/stable/calibre) | Calibre - e-book management |
| [calibreweb](charts/stable/calibreweb) | Calibre-Web - web-based e-book reader |
| [cloudbeaver](charts/stable/cloudbeaver) | CloudBeaver - web-based database manager |
| [cloudcmd](charts/stable/cloudcmd) | Cloud Commander - web file manager |
| [cloudflare-ddns](charts/stable/cloudflare-ddns) | Cloudflare DDNS - dynamic DNS updater |
| [code-server](charts/stable/code-server) | Code-Server - VS Code in the browser |
| [couchdb](charts/stable/couchdb) | CouchDB - NoSQL document database |
| [couchpotato](charts/stable/couchpotato) | CouchPotato - movie download manager |
| [custom-error-pages](charts/stable/custom-error-pages) | Custom error pages (tarampampam/error-pages) |
| [dashy](charts/stable/dashy) | Dashy - feature-rich dashboard |
| [ddns-updater](charts/stable/ddns-updater) | DDNS Updater - dynamic DNS update client |
| [deluge](charts/stable/deluge) | Deluge - lightweight BitTorrent client |
| [dokuwiki](charts/stable/dokuwiki) | DokuWiki - simple wiki engine |
| [drone-ci](charts/stable/drone-ci) | Drone CI - continuous integration platform |
| [duplicacy](charts/stable/duplicacy) | Duplicacy - cloud backup tool |
| [duplicati](charts/stable/duplicati) | Duplicati - free backup client |
| [emby](charts/stable/emby) | Emby - personal media server |
| [esphome](charts/stable/esphome) | ESPHome - ESP device management |
| [firefly](charts/stable/firefly) | Firefly III - personal finance manager |
| [flaresolverr](charts/stable/flaresolverr) | FlareSolverr - proxy for Cloudflare |
| [freshrss](charts/stable/freshrss) | FreshRSS - self-hosted RSS feed aggregator |
| [get-iplayer](charts/stable/get-iplayer) | get_iplayer - BBC iPlayer downloader |
| [gitea](charts/stable/gitea) | Gitea - lightweight Git hosting |
| [gitlab](charts/stable/gitlab) | GitLab CE - DevOps platform |
| [glances](charts/stable/glances) | Glances - system monitoring tool |
| [gotify](charts/stable/gotify) | Gotify - push notification server |
| [guacamole](charts/stable/guacamole) | Apache Guacamole - remote desktop gateway |
| [headlamp](charts/stable/headlamp) | Headlamp - Kubernetes Web UI |
| [healthchecks](charts/stable/healthchecks) | Healthchecks - cron job monitoring |
| [heimdall](charts/stable/heimdall) | Heimdall - application dashboard |
| [homeassistant](charts/stable/homeassistant) | Home Assistant - home automation |
| [homebridge](charts/stable/homebridge) | Homebridge - HomeKit bridge |
| [homepage](charts/stable/homepage) | Homepage - application dashboard |
| [ispyagentdvr](charts/stable/ispyagentdvr) | iSpy Agent DVR - video surveillance |
| [it-tools](charts/stable/it-tools) | IT-Tools - developer utilities |
| [jackett](charts/stable/jackett) | Jackett - torrent indexer proxy |
| [jellyfin](charts/stable/jellyfin) | Jellyfin - free software media system |
| [joomla](charts/stable/joomla) | Joomla - content management system |
| [komga](charts/stable/komga) | Komga - comics and manga server |
| [krusader](charts/stable/krusader) | Krusader - web file manager |
| [lidarr](charts/stable/lidarr) | Lidarr - music collection manager |
| [loki](charts/stable/loki) | Grafana Loki - log aggregation |
| [mealie](charts/stable/mealie) | Mealie - recipe manager |
| [minecraft-bedrock](charts/stable/minecraft-bedrock) | Minecraft Bedrock Server |
| [minecraft-server](charts/stable/minecraft-server) | Minecraft Java Server |
| [minidlna](charts/stable/minidlna) | MiniDLNA - lightweight DLNA server |
| [miniflux](charts/stable/miniflux) | Miniflux - minimalist RSS reader |
| [minio](charts/stable/minio) | MinIO - S3-compatible object storage |
| [mosquitto](charts/stable/mosquitto) | Eclipse Mosquitto - MQTT broker |
| [mumble](charts/stable/mumble) | Mumble - voice chat server |
| [mylar](charts/stable/mylar) | Mylar3 - comic book downloader |
| [n8n](charts/stable/n8n) | n8n - workflow automation |
| [navidrome](charts/stable/navidrome) | Navidrome - music server and streamer |
| [netbootxyz](charts/stable/netbootxyz) | netboot.xyz - network boot server |
| [netdata](charts/stable/netdata) | Netdata - real-time performance monitoring |
| [nextcloud](charts/stable/nextcloud) | Nextcloud - self-hosted cloud platform |
| [nomad](charts/stable/nomad) | HashiCorp Nomad - workload orchestrator |
| [nzbget](charts/stable/nzbget) | NZBGet - Usenet downloader |
| [octoprint](charts/stable/octoprint) | OctoPrint - 3D printer management |
| [ombi](charts/stable/ombi) | Ombi - media request manager |
| [open-wearables](charts/stable/open-wearables) | Open Wearables - wearable health data platform |
| [openhab](charts/stable/openhab) | openHAB - home automation bus |
| [organizr](charts/stable/organizr) | Organizr - HTPC dashboard |
| [outline](charts/stable/outline) | Outline - team wiki and knowledge base |
| [overseerr](charts/stable/overseerr) | Overseerr - media request management |
| [paperless-ng](charts/stable/paperless-ng) | Paperless-ngx - document management |
| [piwigo](charts/stable/piwigo) | Piwigo - photo gallery |
| [plex](charts/stable/plex) | Plex Media Server |
| [portainer](charts/stable/portainer) | Portainer - container management UI |
| [promtail](charts/stable/promtail) | Promtail - log collector for Loki |
| [prowlarr](charts/stable/prowlarr) | Prowlarr - indexer manager |
| [pyload](charts/stable/pyload) | pyLoad - download manager |
| [radarr](charts/stable/radarr) | Radarr - movie collection manager |
| [romm](charts/stable/romm) | RomM - ROM manager |
| [rssbridge](charts/stable/rssbridge) | RSS-Bridge - RSS feed generator |
| [sabnzbd](charts/stable/sabnzbd) | SABnzbd - binary newsreader |
| [sickchill](charts/stable/sickchill) | SickChill - TV show automation |
| [silverbullet](charts/stable/silverbullet) | SilverBullet - note-taking and wiki |
| [sonarr](charts/stable/sonarr) | Sonarr - TV show collection manager |
| [speedtest-tracker](charts/stable/speedtest-tracker) | Speedtest Tracker - internet speed monitoring |
| [spotify](charts/stable/spotify) | Spotify - web-based Spotify client |
| [syncthing](charts/stable/syncthing) | Syncthing - continuous file sync |
| [tautulli](charts/stable/tautulli) | Tautulli - Plex media server monitoring |
| [teslamate](charts/stable/teslamate) | TeslaMate - Tesla vehicle data logger |
| [thelounge](charts/stable/thelounge) | The Lounge - web IRC client |
| [threadfin](charts/stable/threadfin) | Threadfin - M3U proxy for Plex |
| [tiddlywiki](charts/stable/tiddlywiki) | TiddlyWiki - non-linear personal notebook |
| [timemachine](charts/stable/timemachine) | Time Machine - macOS backup server |
| [traefik](charts/stable/traefik) | Traefik - cloud-native reverse proxy |
| [transmission](charts/stable/transmission) | Transmission - BitTorrent client |
| [ubooquity](charts/stable/ubooquity) | Ubooquity - comics and ebook server |
| [uptime-kuma](charts/stable/uptime-kuma) | Uptime Kuma - self-hosted monitoring tool |
| [valheim](charts/stable/valheim) | Valheim - dedicated game server |
| [vitasync](charts/stable/vitasync) | VitaSync - wearable health data platform |
| [wallabag](charts/stable/wallabag) | Wallabag - read-it-later app |
| [watchtower](charts/stable/watchtower) | Watchtower - container update automation |
| [whoogle](charts/stable/whoogle) | Whoogle - self-hosted Google search proxy |
| [wireshark](charts/stable/wireshark) | Wireshark - network protocol analyzer |
| [woodpecker-ci](charts/stable/woodpecker-ci) | Woodpecker CI - continuous integration |
| [youtubedl-material](charts/stable/youtubedl-material) | YoutubeDL-Material - YouTube downloader |
| [znc](charts/stable/znc) | ZNC - IRC bouncer |

### Beta

Charts under active development. May have breaking changes between versions.

| Chart | Description |
|-------|-------------|
| [plex](charts/beta/plex) | Plex Media Server (experimental) |
| [teslamate](charts/beta/teslamate) | TeslaMate (experimental) |

## Usage

### Installing a Chart

```bash
# Install with default values
helm install <release-name> helm-for-home/<chart-name>

# Install with custom values
helm install <release-name> helm-for-home/<chart-name> -f my-values.yaml

# Install in a specific namespace
helm install <release-name> helm-for-home/<chart-name> -n <namespace> --create-namespace
```

### Upgrading a Release

```bash
helm repo update
helm upgrade <release-name> helm-for-home/<chart-name>
```

### Uninstalling a Release

```bash
helm uninstall <release-name>
```

### Customizing Values

Each chart includes a `values.yaml` with documented defaults. To see all configurable options:

```bash
helm show values helm-for-home/<chart-name>
```

## Repository Structure

```
charts/
  stable/       # Production-ready charts
  beta/         # Charts under development
common/         # Shared templates and helpers
scripts/        # Utility scripts
docs/           # Additional documentation
```

## Contributing

Contributions are welcome! To add or improve a chart:

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/my-chart`)
3. Make your changes — ensure charts pass `helm lint`
4. Submit a pull request against `main`

All pull requests are automatically validated with linting, chart-testing, and security scanning.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
