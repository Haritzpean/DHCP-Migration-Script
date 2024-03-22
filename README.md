# Migration d'un serveur DHCP sous Windows

## Introduction

La migration d'un serveur DHCP sous Windows peut être réalisée en utilisant l'outil `Export-DhcpServer` et `Import-DhcpServer` qui permettent d'exporter et d'importer les configurations du serveur DHCP.

La migration peut être réalisée en 2 étapes :

- Exporter les configurations du serveur **source**
- Importer les configurations sur le serveur de **destination**

```txt
"Notez que ces deux étapes peuvent être réalisées aussi bien depuis le serveur source que depuis le serveur de destination."
```

## Migration du service DHCP (Service déjà installé)
Si le service DHCP est déjà installé sur le serveur de destination, vous pouvez utiliser le script [DHCP_migration.ps1](https://github.com/Haritzpean/DHCP-Migration-Script/blob/main/DHCP_migration.ps1) pour migrer les configurations DHCP.

### Instructions :
Ouvrir une session PowerShell en tant qu'administrateur.
Exécuter le script [DHCP_migration.ps1](https://github.com/Haritzpean/DHCP-Migration-Script/blob/main/DHCP_migration.ps1) et suivre les instructions pour exporter et importer les configurations du serveur DHCP.

## Migration du service DHCP (Service non installé)
Si le service DHCP n'est pas encore installé sur le serveur de destination et que vous souhaitez l'installer avec la configuration DHCP directement, vous pouvez utiliser le script [Installer-DHCPServerFromBackup.ps1](https://github.com/Haritzpean/DHCP-Migration-Script/blob/main/Installer-DHCPServerFromBackup.ps1).

### Instructions :
Ouvrir une session PowerShell en tant qu'administrateur.
Exécuter le script [Installer-DHCPServerFromBackup.ps1](https://github.com/Haritzpean/DHCP-Migration-Script/blob/main/Installer-DHCPServerFromBackup.ps1) et suivre les instructions pour spécifier le chemin du fichier de configuration XML ou pour migrer les configurations à partir d'un serveur source.

## Désactiver les étendues IPV4 sur l'ancien serveur DHCP

```pwsh
# Désactiver toutes les étendues DHCP sur le serveur
Get-DhcpServerv4Scope | Set-DhcpServerv4Scope -State Inactive
```

### Prérequis
Autorisations suffisantes pour exporter et importer la configuration DHCP.

### Avertissement
Assurez-vous d'avoir sauvegardé votre configuration DHCP existante avant d'exécuter ces scripts.

### Contribution
Les contributions sont les bienvenues ! Si vous trouvez des bogues ou avez des suggestions d'amélioration, veuillez ouvrir une issue ou envoyer une pull request.
