function Get-ITGConfiguration {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $False, ValueFromPipeline = $true)]
        [ITGOrganization]$Organization
    )

    BEGIN {
        $VerbosePrefix = "Get-ITGConfiguration:"
        $ReturnObject = @()
    }

    PROCESS {
        $QueryParams = @{}
        $QueryParams.UriPath = 'configurations'
        $QueryParams.Query = @{}

        if ($Organization) {
            $QueryParams.Query.'organization_id' = $Organization.Id
        }

        $Query = Invoke-ITGApiQuery @QueryParams

        foreach ($entry in $Query.data) {
            $New = New-ITGConfiguration
            $New.Id = $entry.id
            $New.Name = $entry.attributes.name
            $New.Organization = $entry.attributes.'organization-name'
            $New.ConfigurationType = $entry.attributes.'configuration-type-name'
            $New.ConfigurationStatus = $entry.attributes.'configuration-status-name'
            $New.Hostname = $entry.attributes.hostname
            $New.PrimaryIpAddress = $entry.attributes.'primary-ip'
            $New.DefaultGateway = $entry.attributes.'default-gateway'
            $New.MacAddress = $entry.attributes.'mac-address'
            $New.SerialNumber = $entry.attributes.'serial-number'
            $New.AssetTag = $entry.attributes.'asset-tag'
            $New.Manufacturer = $entry.attributes.'manufacturer-name'
            $New.Model = $entry.attributes.'model-name'
            $New.OperatingSystem = $entry.attributes.'operating-system-name'
            $New.OperatingSystemNotes = $entry.attributes.'operating-system-notes'
            $New.Position = $entry.attributes.position
            $New.Notes = $entry.attributes.notes
            $New.InstalledBy = $entry.attributes.'installed-by'
            $New.PurchasedBy = $entry.attributes.'purchased-by'
            $New.Contact = $entry.attributes.'contact-name'
            $New.Location = $entry.attributes.'location-name'

            # dates
            if ($entry.attributes.'installed-at') {
                $New.InstallDate = $entry.attributes.'installed-at'
            }

            if ($entry.attributes.'purchased-at') {
                $New.PurchaseDate = $entry.attributes.'purchased-at'
            }

            if ($entry.attributes.'warranty-expires-at') {
                $New.WarrantyExpireDate = $entry.attributes.'warranty-expires-at'
            }

            $ReturnObject += $New
        }
    }

    END {
        $ReturnObject
    }
}
