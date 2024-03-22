<#
.SYNOPSIS
Ce script installe le rôle DHCP sur un serveur en utilisant un fichier de configuration exporté à partir d'un autre serveur DHCP.

.DESCRIPTION
Ce script installe le rôle DHCP sur un serveur Windows en utilisant un fichier de configuration exporté à partir d'un autre serveur DHCP. Il exporte d'abord les paramètres DHCP à partir du serveur source, puis installe le rôle DHCP sur le serveur local en utilisant ce fichier.

.EXAMPLE
.\Installer-DHCPServer.ps1
Ce script demandera à l'utilisateur de saisir le nom ou l'adresse IP du serveur DHCP source, puis il exportera les paramètres DHCP du serveur source et les utilisera pour installer le rôle DHCP sur le serveur local.

.NOTES
Auteur : johan.cherel@protonmail.com
Date de création : 22/03/2024
Dernière mise à jour : 22/03/2024
Version : 1.0
#>

# Demander à l'utilisateur de saisir le nom ou l'adresse IP du serveur DHCP source
$sourceServer = Read-Host "Entrez le nom ou l'adresse IP du serveur DHCP source"

# Vérifier la connectivité avec le serveur DHCP source
if (-not (Test-Connection -ComputerName $sourceServer -Count 1 -Quiet)) {
    Write-Warning "Impossible de se connecter au serveur DHCP source. Veuillez vérifier l'adresse IP ou le nom du serveur et assurez-vous qu'il est accessible."
} else {
    # Exporter les paramètres DHCP du serveur source
    Export-DhcpServer -ComputerName $sourceServer -File "C:\sauvegardeDHCP.xml" -Leases -Force

    # Installer le rôle DHCP en utilisant le fichier de configuration XML exporté
    Install-WindowsFeature -Name DHCP -IncludeManagementTools -ConfigurationFilePath "C:\sauvegardeDHCP.xml"

    Write-Host "Le rôle DHCP a été installé avec succès en utilisant le fichier de configuration exporté du serveur DHCP source."
}
