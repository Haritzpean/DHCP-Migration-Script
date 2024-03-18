<#
.SYNOPSIS
Ce script migre la configuration DHCP d'un serveur source vers un serveur de destination.

.DESCRIPTION
Ce script exporte les paramètres DHCP d'un serveur source vers un fichier XML, puis les importe vers un serveur de destination. Il assure ainsi la migration en douceur de la configuration DHCP d'un serveur à un autre.

.EXAMPLE
.\Migrer-DHCPServer.ps1
Ce script demandera à l'utilisateur de saisir le nom ou l'adresse IP du serveur DHCP source, puis il exportera les paramètres DHCP du serveur source vers un fichier XML et les importera vers le serveur local.

.NOTES
Auteur : Johan Cherel
Date de création : 18/06/2024
Version : 1.0
#>

do {
    # Demander à l'utilisateur de saisir le nom ou l'adresse IP du serveur DHCP source
    $sourceServer = Read-Host "Entrez le nom ou l'adresse IP du serveur DHCP source (Q pour quitter)"

    # Vérifier si l'utilisateur a entré "Q" pour quitter
    if ($sourceServer -eq "Q") {
        Write-Host "Quitter le script."
        break
    }

    # Vérifier la connectivité avec le serveur DHCP source
    if (-not (Test-Connection -ComputerName $sourceServer -Count 1 -Quiet)) {
        Write-Warning "Impossible de se connecter au serveur DHCP source. Veuillez vérifier l'adresse IP ou le nom du serveur et assurez-vous qu'il est accessible."
    } else {
        # Exporter les paramètres DHCP du serveur source
        Export-DhcpServer -ComputerName $sourceServer -File "C:\sauvegardeDHCP.xml" -Leases -Force

        # Importer les paramètres DHCP vers ce serveur
        Import-DhcpServer -File "C:\sauvegardeDHCP.xml" -BackupPath "C:\Temp\BackupDHCP.xml" -Force

        # Supprimer la sauvegarde temporaire
        Remove-Item "C:\sauvegardeDHCP.xml"
    }
} while ($true)

