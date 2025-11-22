# Helm Charts

This directory contains Helm charts for deploying media server components on Kubernetes.

## Available Charts

### Umbrella Chart

- **[k8s-mediaserver](k8s-mediaserver/)** - Umbrella chart that deploys all services together with shared configuration

### Individual Service Charts

Each service can be installed independently:

- **[sonarr](sonarr/)** - TV series tracker and organizer
- **[radarr](radarr/)** - Movie tracker and organizer
- **[plex](plex/)** - Media server for organizing and streaming media
- **[jellyfin](jellyfin/)** - Alternative open-source media server
- **[jackett](jackett/)** - API interface for torrent trackers
- **[prowlarr](prowlarr/)** - Indexer manager/proxy for PVR apps
- **[transmission](transmission/)** - Fast and reliable torrent client
- **[sabnzbd](sabnzbd/)** - Free and easy binary newsreader
- **[seerr](seerr/)** - Media request and discovery manager

## Installation

### Install All Services (Umbrella Chart)

```bash
helm dependency update ./k8s-mediaserver
helm upgrade --install k8s-mediaserver ./k8s-mediaserver \
  -n k8s-mediaserver --create-namespace \
  -f ./k8s-mediaserver/values.yaml
```

### Install Individual Services

```bash
# Example: Install only Sonarr
helm upgrade --install sonarr ./sonarr \
  -n sonarr --create-namespace \
  -f ./sonarr/values.yaml

# Example: Install only Plex
helm upgrade --install plex ./plex \
  -n plex --create-namespace \
  -f ./plex/values.yaml
```

## Chart Repository

Charts are also available from the Helm repository:

```bash
helm repo add k8s-mediaserver-operator https://95gabor.github.io/k8s-mediaserver-operator
helm repo update

# Install umbrella chart
helm upgrade --install k8s-mediaserver k8s-mediaserver-operator/k8s-mediaserver \
  -n k8s-mediaserver --create-namespace

# Install individual service
helm upgrade --install sonarr k8s-mediaserver-operator/sonarr \
  -n sonarr --create-namespace
```

## Documentation

Each chart includes detailed documentation in its README.md file, generated from the values.yaml file. See individual chart directories for:

- Configuration options
- Installation instructions
- Examples and use cases

## Chart Structure

All charts follow a consistent structure:

- `Chart.yaml` - Chart metadata
- `values.yaml` - Default configuration values
- `README.md` - Generated documentation
- `README.md.gotmpl` - Documentation template
- `templates/` - Kubernetes manifest templates

The umbrella chart (`k8s-mediaserver`) includes all service charts as dependencies, allowing you to manage all services together or install them individually.
