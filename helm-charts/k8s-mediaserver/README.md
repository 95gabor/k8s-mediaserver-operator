# k8s-mediaserver

![Version: 0.10.1](https://img.shields.io/badge/Version-0.10.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.10.0](https://img.shields.io/badge/AppVersion-0.10.0-informational?style=flat-square)

A Helm chart for Kubernetes mediaserver

## Chart Repo

Add the following repo to use the chart:

```bash
helm repo add k8s-mediaserver-operator https://95gabor.github.io/k8s-mediaserver-operator
helm repo update
```

### Installation

- Install/upgrade in a namespace (using local chart directory):

```bash
helm upgrade --install k8s-mediaserver . \
  -n k8s-mediaserver --create-namespace \
  -f values.yaml
```

- Or install from a chart repository:

```bash
helm upgrade --install k8s-mediaserver k8s-mediaserver-operator/k8s-mediaserver \
  -n k8s-mediaserver --create-namespace \
  -f values.yaml
```

- Uninstall:

```bash
helm uninstall k8s-mediaserver -n k8s-mediaserver
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| general.certificate.additionalHosts[0] | string | `"plex.example.com"` |  |
| general.certificate.additionalHosts[1] | string | `"sonarr.example.com"` |  |
| general.certificate.additionalHosts[2] | string | `"radarr.example.com"` |  |
| general.certificate.annotations | object | `{}` |  |
| general.certificate.domain | string | `"plex.example.com"` |  |
| general.certificate.duration | string | `""` |  |
| general.certificate.enabled | bool | `false` |  |
| general.certificate.issuer.group | string | `""` |  |
| general.certificate.issuer.kind | string | `""` |  |
| general.certificate.issuer.name | string | `""` |  |
| general.certificate.keystores.pkcs12.create | bool | `true` |  |
| general.certificate.keystores.pkcs12.passwordSecretRef.key | string | `"password"` |  |
| general.certificate.keystores.pkcs12.passwordSecretRef.name | string | `"cert-password"` |  |
| general.certificate.privateKey.algorithm | string | `"RSA"` |  |
| general.certificate.privateKey.encoding | string | `"PKCS1"` |  |
| general.certificate.privateKey.rotationPolicy | string | `"Never"` |  |
| general.certificate.privateKey.size | int | `2048` |  |
| general.certificate.renewBefore | string | `""` |  |
| general.certificate.secretName | string | `"k8s-mediaserver-tls"` |  |
| general.certificate.usages | list | `[]` |  |
| general.image_tag | string | `"latest"` |  |
| general.ingress.ingressClassName | string | `""` |  |
| general.ingress_host | string | `"k8s-mediaserver.k8s.test"` |  |
| general.jellyfin_ingress_host | string | `"k8s-jelly.k8s.test"` |  |
| general.nodeSelector | object | `{}` |  |
| general.pgid | int | `1000` |  |
| general.plex_ingress_host | string | `"k8s-plex.k8s.test"` |  |
| general.podDistribution | string | `"cluster"` |  |
| general.puid | int | `1000` |  |
| general.storage.accessMode | string | `""` |  |
| general.storage.customVolume | bool | `false` |  |
| general.storage.pvcName | string | `"mediaserver-pvc"` |  |
| general.storage.pvcStorageClass | string | `""` |  |
| general.storage.size | string | `"5Gi"` |  |
| general.storage.subPaths.config | string | `"config"` |  |
| general.storage.subPaths.downloads | string | `"downloads"` |  |
| general.storage.subPaths.movies | string | `"media/movies"` |  |
| general.storage.subPaths.sabnzbd | string | `"sabnzbd"` |  |
| general.storage.subPaths.transmission | string | `"transmission"` |  |
| general.storage.subPaths.tv | string | `"media/tv"` |  |
| general.storage.volumes | object | `{}` |  |
| jackett.container.image | string | `"docker.io/linuxserver/jackett"` |  |
| jackett.container.nodeSelector | object | `{}` |  |
| jackett.container.port | int | `9117` |  |
| jackett.container.tag | string | `"0.24.338"` |  |
| jackett.enabled | bool | `true` |  |
| jackett.ingress.annotations | object | `{}` |  |
| jackett.ingress.enabled | bool | `true` |  |
| jackett.ingress.path | string | `"/jackett"` |  |
| jackett.ingress.tls.enabled | bool | `false` |  |
| jackett.ingress.tls.secretName | string | `""` |  |
| jackett.resources | object | `{}` |  |
| jackett.service.extraLbService.annotations | object | `{}` |  |
| jackett.service.extraLbService.enabled | bool | `false` |  |
| jackett.service.extraLbService.loadBalancerIP | string | `nil` |  |
| jackett.service.extraLbService.port | int | `80` |  |
| jackett.service.nodePort | string | `nil` |  |
| jackett.service.port | int | `9117` |  |
| jackett.service.type | string | `"ClusterIP"` |  |
| jackett.volume | object | `{}` |  |
| jellyfin.container.image | string | `"docker.io/linuxserver/jellyfin"` |  |
| jellyfin.container.nodeSelector | object | `{}` |  |
| jellyfin.container.port | int | `8096` |  |
| jellyfin.container.tag | string | `"latest"` |  |
| jellyfin.enabled | bool | `false` |  |
| jellyfin.ingress.annotations | object | `{}` |  |
| jellyfin.ingress.enabled | bool | `true` |  |
| jellyfin.ingress.tls.enabled | bool | `false` |  |
| jellyfin.ingress.tls.secretName | string | `""` |  |
| jellyfin.replicaCount | int | `1` |  |
| jellyfin.resources | object | `{}` |  |
| jellyfin.service.extraLbService.annotations | object | `{}` |  |
| jellyfin.service.extraLbService.enabled | bool | `false` |  |
| jellyfin.service.extraLbService.loadBalancerIP | string | `nil` |  |
| jellyfin.service.extraLbService.port | int | `80` |  |
| jellyfin.service.nodePort | string | `nil` |  |
| jellyfin.service.port | int | `8096` |  |
| jellyfin.service.type | string | `"ClusterIP"` |  |
| jellyfin.volume | object | `{}` |  |
| plex.claim | string | `"CHANGEME"` |  |
| plex.container.image | string | `"docker.io/linuxserver/plex"` |  |
| plex.container.nodeSelector | object | `{}` |  |
| plex.container.port | int | `32400` |  |
| plex.container.tag | string | `"1.42.2"` |  |
| plex.enabled | bool | `true` |  |
| plex.externalSecret | string | `nil` |  |
| plex.ingress.annotations | object | `{}` |  |
| plex.ingress.enabled | bool | `true` |  |
| plex.ingress.tls.enabled | bool | `false` |  |
| plex.ingress.tls.secretName | string | `""` |  |
| plex.replicaCount | int | `1` |  |
| plex.resources | object | `{}` |  |
| plex.service.extraLbService.annotations | object | `{}` |  |
| plex.service.extraLbService.enabled | bool | `false` |  |
| plex.service.extraLbService.loadBalancerIP | string | `nil` |  |
| plex.service.extraLbService.port | int | `80` |  |
| plex.service.nodePort | string | `nil` |  |
| plex.service.port | int | `32400` |  |
| plex.service.type | string | `"ClusterIP"` |  |
| plex.volume | object | `{}` |  |
| prowlarr.container.image | string | `"docker.io/linuxserver/prowlarr"` |  |
| prowlarr.container.nodeSelector | object | `{}` |  |
| prowlarr.container.port | int | `9696` |  |
| prowlarr.container.tag | string | `"develop"` |  |
| prowlarr.enabled | bool | `true` |  |
| prowlarr.ingress.annotations | object | `{}` |  |
| prowlarr.ingress.enabled | bool | `true` |  |
| prowlarr.ingress.path | string | `"/prowlarr"` |  |
| prowlarr.ingress.tls.enabled | bool | `false` |  |
| prowlarr.ingress.tls.secretName | string | `""` |  |
| prowlarr.resources | object | `{}` |  |
| prowlarr.service.extraLbService.annotations | object | `{}` |  |
| prowlarr.service.extraLbService.enabled | bool | `false` |  |
| prowlarr.service.extraLbService.loadBalancerIP | string | `nil` |  |
| prowlarr.service.extraLbService.port | int | `80` |  |
| prowlarr.service.nodePort | string | `nil` |  |
| prowlarr.service.port | int | `9696` |  |
| prowlarr.service.type | string | `"ClusterIP"` |  |
| prowlarr.volume | object | `{}` |  |
| radarr.container.extraEnv | list | `[]` |  |
| radarr.container.image | string | `"docker.io/linuxserver/radarr"` |  |
| radarr.container.nodeSelector | object | `{}` |  |
| radarr.container.port | int | `7878` |  |
| radarr.container.tag | string | `"6.0.4"` |  |
| radarr.enabled | bool | `true` |  |
| radarr.ingress.annotations | object | `{}` |  |
| radarr.ingress.enabled | bool | `true` |  |
| radarr.ingress.path | string | `"/radarr"` |  |
| radarr.ingress.tls.enabled | bool | `false` |  |
| radarr.ingress.tls.secretName | string | `""` |  |
| radarr.resources | object | `{}` |  |
| radarr.service.extraLbService.annotations | object | `{}` |  |
| radarr.service.extraLbService.enabled | bool | `false` |  |
| radarr.service.extraLbService.loadBalancerIP | string | `nil` |  |
| radarr.service.extraLbService.port | int | `80` |  |
| radarr.service.nodePort | string | `nil` |  |
| radarr.service.port | int | `7878` |  |
| radarr.service.type | string | `"ClusterIP"` |  |
| radarr.volume | object | `{}` |  |
| sabnzbd.container.image | string | `"docker.io/linuxserver/sabnzbd"` |  |
| sabnzbd.container.nodeSelector | object | `{}` |  |
| sabnzbd.container.port.http | int | `8080` |  |
| sabnzbd.container.port.https | int | `9090` |  |
| sabnzbd.container.tag | string | `"latest"` |  |
| sabnzbd.enabled | bool | `true` |  |
| sabnzbd.ingress.annotations | object | `{}` |  |
| sabnzbd.ingress.enabled | bool | `true` |  |
| sabnzbd.ingress.path | string | `"/sabnzbd"` |  |
| sabnzbd.ingress.tls.enabled | bool | `false` |  |
| sabnzbd.ingress.tls.secretName | string | `""` |  |
| sabnzbd.resources | object | `{}` |  |
| sabnzbd.service.http.extraLBAnnotations | object | `{}` |  |
| sabnzbd.service.http.extraLBService | bool | `false` |  |
| sabnzbd.service.http.nodePort | string | `nil` |  |
| sabnzbd.service.http.port | int | `8080` |  |
| sabnzbd.service.http.type | string | `"ClusterIP"` |  |
| sabnzbd.service.https.extraLBAnnotations | object | `{}` |  |
| sabnzbd.service.https.extraLBService | bool | `false` |  |
| sabnzbd.service.https.nodePort | string | `nil` |  |
| sabnzbd.service.https.port | int | `9090` |  |
| sabnzbd.service.https.type | string | `"ClusterIP"` |  |
| sabnzbd.volume | object | `{}` |  |
| seerr.container.extraEnv | list | `[]` |  |
| seerr.container.image | string | `"ghcr.io/seerr-team/seerr"` |  |
| seerr.container.nodeSelector | object | `{}` |  |
| seerr.container.port | int | `5055` |  |
| seerr.container.tag | string | `"sha-bde322d"` |  |
| seerr.enabled | bool | `true` |  |
| seerr.ingress.annotations | object | `{}` |  |
| seerr.ingress.enabled | bool | `true` |  |
| seerr.ingress.path | string | `"/seerr"` |  |
| seerr.ingress.tls.enabled | bool | `false` |  |
| seerr.ingress.tls.secretName | string | `""` |  |
| seerr.resources | object | `{}` |  |
| seerr.service.extraLbService.annotations | object | `{}` |  |
| seerr.service.extraLbService.enabled | bool | `false` |  |
| seerr.service.extraLbService.loadBalancerIP | string | `nil` |  |
| seerr.service.extraLbService.port | int | `80` |  |
| seerr.service.nodePort | string | `nil` |  |
| seerr.service.port | int | `5055` |  |
| seerr.service.type | string | `"ClusterIP"` |  |
| seerr.volume | object | `{}` |  |
| sonarr.container.extraEnv | list | `[]` |  |
| sonarr.container.image | string | `"docker.io/linuxserver/sonarr"` |  |
| sonarr.container.nodeSelector | object | `{}` |  |
| sonarr.container.port | int | `8989` |  |
| sonarr.container.tag | string | `"4.0.16"` |  |
| sonarr.enabled | bool | `true` |  |
| sonarr.ingress.annotations | object | `{}` |  |
| sonarr.ingress.enabled | bool | `true` |  |
| sonarr.ingress.path | string | `"/sonarr"` |  |
| sonarr.ingress.tls.enabled | bool | `false` |  |
| sonarr.ingress.tls.secretName | string | `""` |  |
| sonarr.resources | object | `{}` |  |
| sonarr.service.extraLbService.annotations | object | `{}` |  |
| sonarr.service.extraLbService.enabled | bool | `false` |  |
| sonarr.service.extraLbService.loadBalancerIP | string | `nil` |  |
| sonarr.service.extraLbService.port | int | `80` |  |
| sonarr.service.nodePort | string | `nil` |  |
| sonarr.service.port | int | `8989` |  |
| sonarr.service.type | string | `"ClusterIP"` |  |
| sonarr.volume | object | `{}` |  |
| transmission.config.auth.enabled | bool | `false` |  |
| transmission.config.auth.password | string | `""` |  |
| transmission.config.auth.username | string | `""` |  |
| transmission.container.image | string | `"docker.io/linuxserver/transmission"` |  |
| transmission.container.nodeSelector | object | `{}` |  |
| transmission.container.port.peer | int | `51413` |  |
| transmission.container.port.utp | int | `9091` |  |
| transmission.container.tag | string | `"4.0.6"` |  |
| transmission.enabled | bool | `true` |  |
| transmission.ingress.annotations | object | `{}` |  |
| transmission.ingress.enabled | bool | `true` |  |
| transmission.ingress.path | string | `"/transmission"` |  |
| transmission.ingress.tls.enabled | bool | `false` |  |
| transmission.ingress.tls.secretName | string | `""` |  |
| transmission.resources | object | `{}` |  |
| transmission.service.peer.extraLBAnnotations | object | `{}` |  |
| transmission.service.peer.extraLBService | bool | `false` |  |
| transmission.service.peer.nodePort | string | `nil` |  |
| transmission.service.peer.nodePortUDP | string | `nil` |  |
| transmission.service.peer.port | int | `51413` |  |
| transmission.service.peer.type | string | `"ClusterIP"` |  |
| transmission.service.utp.extraLbService.annotations | object | `{}` |  |
| transmission.service.utp.extraLbService.enabled | bool | `false` |  |
| transmission.service.utp.extraLbService.loadBalancerIP | string | `nil` |  |
| transmission.service.utp.extraLbService.port | int | `80` |  |
| transmission.service.utp.nodePort | string | `nil` |  |
| transmission.service.utp.port | int | `9091` |  |
| transmission.service.utp.type | string | `"ClusterIP"` |  |
| transmission.volume | object | `{}` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
