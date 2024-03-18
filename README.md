# Migration d'un serveur DHCP sous Windows

## Introduction

la migration d'un serveur DHCP sous Windows peut être réalisée en utilisant l'outil `Export-DhcpServer` et `Import-DhcpServer` qui permet d'exporter et d'importer les configurations du serveur DHCP.

la migration peut être réalisée en 2 étapes:

- Exporter les configurations du serveur **source**
- Importer les configurations sur le serveur de **destination**

```txt
"Notez que ces deux étapes peuvent être réalisées aussi bien depuis le serveur source que depuis le serveur de destination."
```

## installation du service DHCP

1. Ouvrir une session PowerShell en tant qu'administrateur
2. Exécuter la commande suivante pour installer le service DHCP:

```powershell
Install-WindowsFeature -Name DHCP -IncludeManagementTools
```

## Export/import des configurations du serveur DHCP

1. Ouvrir une session PowerShell en tant qu'administrateur
2. Exécuter le script: [dhcp_migration](DHCP_migration.ps1) suivre les instructions pour exporter les configurations du serveur DHCP
3. Vérrifier que les etendues ont bien été exportées

## Désactiver les etendues sur l'ancien serveur DHCP
  
```pwsh
# Désactiver toutes les étendues DHCP sur le serveur
Get-DhcpServerv4Scope | Set-DhcpServerv4Scope -State Inactive
```

## Prérequis

Autorisations suffisantes pour exporter et importer la configuration DHCP

## Avertissement

Ce script est destiné à être exécuté sur le serveur DHCP de destination, qui doit déjà être membre du domaine. Assurez-vous d'avoir sauvegardé votre configuration DHCP existante avant d'exécuter ce script.

## Contribution
Les contributions sont les bienvenues ! Si vous trouvez des bogues ou avez des suggestions d'amélioration, veuillez ouvrir une issue ou envoyer une pull request.
