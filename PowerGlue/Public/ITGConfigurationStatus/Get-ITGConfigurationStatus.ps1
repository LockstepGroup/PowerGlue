function Get-ITGConfigurationStatus {
    [CmdletBinding()]
    Param (
    )

    BEGIN {
        $VerbosePrefix = "Get-ITGConfigurationStatus:"
        $ReturnObject = @()
    }

    PROCESS {
        $QueryParams = @{}
        $QueryParams.UriPath = 'configuration_statuses'
        $QueryParams.Query = @{}

        $Query = Invoke-ITGApiQuery @QueryParams

        foreach ($entry in $Query.data) {
            $New = New-ITGConfigurationStatus
            $New.Id = $entry.id
            $New.Name = $entry.attributes.name
            $New.CreateDate = $entry.attributes.'created-at'
            $New.UpdateDate = $entry.attributes.'updated-at'

            $ReturnObject += $New
        }
    }

    END {
        $ReturnObject
    }
}
