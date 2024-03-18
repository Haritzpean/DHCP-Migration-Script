# DHCP Migration Script

Ce script PowerShell facilite la migration de la configuration DHCP d'un serveur source vers un serveur de destination.  
Il permet d'exporter les paramètres DHCP d'un serveur source vers un fichier XML, puis de les importer vers un serveur de destination, assurant ainsi une migration en douceur de la configuration DHCP d'un serveur à un autre.

1. Exécutez le script Migrer-DHCPServer.ps1 à l'aide de PowerShell : `.\DHCP_migration.ps1`
2. Suivez les instructions à l'écran pour saisir le nom ou l'adresse IP du serveur DHCP source et effectuer la migration.


## Prérequis

PowerShell 5.1 ou version ultérieure
Autorisations suffisantes pour exporter et importer la configuration DHCP

## Avertissement

Ce script est destiné à être exécuté sur le serveur DHCP de destination, qui doit déjà être membre du domaine. Assurez-vous d'avoir sauvegardé votre configuration DHCP existante avant d'exécuter ce script.

## Contribution
Les contributions sont les bienvenues ! Si vous trouvez des bogues ou avez des suggestions d'amélioration, veuillez ouvrir une issue ou envoyer une pull request.
