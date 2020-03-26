function Get-ITGFlexibleAssetType {
    [CmdletBinding()]
    Param (
    )

    BEGIN {
        $VerbosePrefix = "Get-ITGFlexibleAssetType:"
        $ReturnObject = @()
    }

    PROCESS {
        $QueryParams = @{}
        $QueryParams.UriPath = 'flexible_asset_types/'
        $QueryParams.Query = @{}

        $Query = Invoke-ITGApiQuery @QueryParams

        foreach ($entry in $Query.data) {
            $New = New-ITGFlexibleAssetType

            $New.Id = $entry.id
            $New.Name = $entry.attributes.name

            $New.Description = $entry.attributes.description
            $New.Icon = $entry.attributes.icon
            $New.ShowInMenu = $entry.attributes.'show-in-menu'

            $New.CreateDate = $entry.attributes.'created-at'
            $New.UpdateDate = $entry.attributes.'updated-at'

            $ReturnObject += $New
        }
    }

    END {
        $ReturnObject
    }
}
