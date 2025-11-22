# k8s-mediaserver

Your all-in-one Helm chart for your media needs!

A Helm chart for deploying a complete media server stack on Kubernetes, including:

- [Plex Media Server](https://www.plex.tv/) - A complete and fully functional mediaserver that allows you to render in a webUI your movies, TV Series, podcasts, video streams.
- [Jellyfin](https://jellyfin.org/) - An alternative to the proprietary Emby and Plex, to provide media from a dedicated server to end-user devices via multiple apps
- [Sonarr](https://sonarr.tv/) - A TV series and show tracker, that allows the integration with download managers for searching and retrieving TV Series, organizing them, schedule notifications when an episode comes up and much more.
- [Radarr](https://radarr.video/) - The same as **Sonarr**, but for movies!
- [Jackett](https://github.com/Jackett/Jackett) - An API interface that keeps easy your life interacting with trackers for torrents.
- [Prowlarr](https://github.com/Prowlarr/Prowlarr) - An indexer manager/proxy built on the popular \*arr .net/reactjs base stack to integrate with your various PVR apps. Prowlarr supports management of both Torrent Trackers and Usenet Indexers.
- [Transmission](https://transmissionbt.com/) - A fast, easy and reliable torrent client.
- [Sabnzbd](https://sabnzbd.org/) - A free and easy binary newsreader.
- [Seerr](https://github.com/seerr-team/seerr) - Media request and discovery manager for Jellyfin, Plex, and Emby.

All container images used by the chart are from [linuxserver.io](https://www.linuxserver.io/).

Each of the components can be **enabled** or **disabled** if you already have something in place in your lab!

## Introduction

This Helm chart provides a simple and minimalistic way to deploy a complete media server stack on Kubernetes, with customizations that are strictly related to usability and access, rather than complex customizations.

Each container has its _init container_ in order to initialize configurations on the PV before starting the actual pod and avoid restarting the pods.

## Prerequisites

- A Kubernetes cluster (1.19+)
- Helm 3.x
- A namespace where you want to deploy the chart
- Being able to provision an RWX PV where to store configurations, downloads, and all related stuff (suggested > 200GB). Persistent Volume **or** StorageClasses for dynamically provisioned volumes are **REQUIRED** (See below for NFS)

## QuickStart

### Installation

1. Add the Helm repository (if using a chart repository):

```bash
helm repo add k8s-mediaserver-operator https://95gabor.github.io/k8s-mediaserver-operator
helm repo update
```

2. Install the chart with default values:

```bash
# Using local chart directory
helm upgrade --install k8s-mediaserver ./helm-charts/k8s-mediaserver \
  -n k8s-mediaserver --create-namespace

# Or from chart repository
helm upgrade --install k8s-mediaserver k8s-mediaserver-operator/k8s-mediaserver \
  -n k8s-mediaserver --create-namespace
```

3. (Optional) Use custom values:

```bash
# Copy the default values file
cp ./helm-charts/k8s-mediaserver/values.yaml my-values.yaml

# Edit my-values.yaml with your custom settings

# Install with custom values
helm upgrade --install k8s-mediaserver ./helm-charts/k8s-mediaserver \
  -n k8s-mediaserver --create-namespace \
  -f my-values.yaml
```

### Upgrading

```bash
helm upgrade k8s-mediaserver ./helm-charts/k8s-mediaserver \
  -n k8s-mediaserver \
  -f my-values.yaml
```

### Uninstalling

```bash
helm uninstall k8s-mediaserver -n k8s-mediaserver
```

## Default Access URLs

With default settings, your applications will run at these paths:

| Service      | Link                                         |
| ------------ | -------------------------------------------- |
| Sonarr       | http://k8s-mediaserver.k8s.test/sonarr       |
| Radarr       | http://k8s-mediaserver.k8s.test/radarr       |
| Transmission | http://k8s-mediaserver.k8s.test/transmission |
| Jackett      | http://k8s-mediaserver.k8s.test/jackett      |
| Prowlarr     | http://k8s-mediaserver.k8s.test/prowlarr     |
| Sabnzbd      | http://k8s-mediaserver.k8s.test/sabnzbd      |
| Seerr        | http://k8s-mediaserver.k8s.test/seerr        |
| Jellyfin     | http://k8s-jelly.k8s.test/                   |
| PLEX         | http://k8s-plex.k8s.test/                    |

## Configuration

The chart is quite simple to configure, with a low number of parameters to avoid confusion, while still allowing customization to fit the resources inside your cluster.

See the [values.yaml](helm-charts/k8s-mediaserver/values.yaml) file for all available configuration options, or check the [Helm chart README](helm-charts/k8s-mediaserver/README.md) for detailed documentation.

### General Configuration

Key configuration options:

- `general.ingress_host` - The hostname to use in ingress definition (default: `k8s-mediaserver.k8s.test`)
- `general.plex_ingress_host` - The hostname for PLEX (default: `k8s-plex.k8s.test`)
- `general.jellyfin_ingress_host` - The hostname for JellyFin (default: `k8s-jelly.k8s.test`)
- `general.pgid` - The GID for the process (default: `1000`)
- `general.puid` - The UID for the process (default: `1000`)
- `general.storage.pvcName` - Name of the persistentVolumeClaim (default: `mediaserver-pvc`)
- `general.storage.size` - Size of the persistentVolume (default: `5Gi`)
- `general.storage.subPaths.*` - Subpaths for different media types

### Service Configuration

Each service can be enabled/disabled and configured individually:

- `{service}.enabled` - Enable or disable the service
- `{service}.container.image` - Container image
- `{service}.container.tag` - Container image tag (pinned versions recommended)
- `{service}.service.type` - Service type (ClusterIP/NodePort/LoadBalancer)
- `{service}.ingress.enabled` - Enable ingress
- `{service}.resources` - Resource limits and requests

## Helpful Use Cases

### Using a cluster-external NFS server

This assumes that you have a pre-configured NFS server set up on your network that is accessible from all nodes. If it is not accessible by all nodes, pods will not enter ready state when scheduled on nodes that do not have NFS access.

To add an NFS volume to each resource, edit your `values.yaml` to match the snippet below. You should change the `server:` and `path:` values to match your NFS.

```yaml
general:
  storage:
    customVolume: true
    volumes:
      nfs:
        server: { SERVER-IP }
        path: /mount/path/on/nfs/server/
```

### Adding annotations to the extra load balancer

If you need an extra load balancer on any service, you can either enable it like this:

```yaml
plex:
  service:
    extraLbService:
      enabled: true
```

or like this, if you need to add annotations to it (for use with cloud providers to configure the load balancer for example):

```yaml
plex:
  service:
    extraLbService:
      enabled: true
      annotations:
        service.beta.kubernetes.io/aws-load-balancer-additional-resource-tags: "Key=Value"
```

## Development

### Linting

```bash
make lint
```

### Template Rendering

```bash
make template
```

### Packaging

```bash
make package
```

## About the Project

This project is intended as an exercise, and absolutely for fun.
This is not intended to promote piracy.

Also feel free to contribute and extend it!
