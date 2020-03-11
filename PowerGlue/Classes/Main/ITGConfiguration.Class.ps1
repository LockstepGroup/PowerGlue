Class ITGConfiguration {
    [string]$Organization
    [string]$Name
    [string]$ConfigurationType
    [string]$ConfigurationStatus
    [string]$Hostname
    [string]$PrimaryIpAddress
    [string]$DefaultGateway
    [string]$MacAddress
    [string]$SerialNumber
    [string]$AssetTag
    [string]$Manufacturer
    [string]$Model
    [string]$OperatingSystem
    [string]$OperatingSystemNotes
    [string]$Position
    [string]$Notes
    [datetime]$InstallDate
    [string]$InstalledBy
    [datetime]$PurchaseDate
    [string]$PurchasedBy
    [datetime]$WarrantyExpireDate
    [string]$Contact
    [string]$Location

    #region Initiators
    ########################################################################

    # empty initiator
    ITGConfiguration() {
    }

    ########################################################################
    #endregion Initiators
}
