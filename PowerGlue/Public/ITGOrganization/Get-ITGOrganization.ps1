function Get-ITGOrganization {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $False)]
        [string]$Name
    )

    BEGIN {
        $VerbosePrefix = "Get-ITGOrganization:"
        $ReturnObject = @()
    }

    PROCESS {
        $QueryParams = @{}
        $QueryParams.UriPath = 'organizations'
        $QueryParams.Query = @{}

        if ($Name) {
            $QueryParams.Query.'filter[name]' = $Name
        }

        $Query = Invoke-ITGApiQuery @QueryParams

        foreach ($entry in $Query.data) {
            $New = New-ITGOrganization
            $New.Id = $entry.id
            $New.Name = $entry.attributes.name
            $New.OrganizationType = $entry.attributes.'organization-type-name'
            $New.OrganizationStatus = $entry.attributes.'organization-status-name'
            $New.ShortName = $entry.attributes.'short-name'
            $New.Description = $entry.attributes.description
            $New.QuickNotes = $entry.attributes.'quick-notes'
            $New.Alert = $entry.attributes.alert

            $ReturnObject += $New
        }
    }

    END {
        $ReturnObject
    }
}
