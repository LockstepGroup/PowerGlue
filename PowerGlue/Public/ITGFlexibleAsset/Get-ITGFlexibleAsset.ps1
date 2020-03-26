function Get-ITGFlexibleAsset {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ITGOrganization]$Organization,

        [Parameter(Mandatory = $true)]
        [int64]$FlexibleAssetId
    )

    BEGIN {
        $VerbosePrefix = "Get-ITGFlexibleAsset:"
        $ReturnObject = @()
    }

    PROCESS {
        $QueryParams = @{}
        $QueryParams.UriPath = 'flexible_assets'
        $QueryParams.Query = @{}

        # Organization
        if ($Organization) {
            $QueryParams.Query.'organization_id' = $Organization.Id
        }

        # StatusId
        if ($StatusId) {
            $QueryParams.Query.'filter[flexible-asset-type-id]' = $FlexibleAssetId
        }

        $Query = Invoke-ITGApiQuery @QueryParams

        foreach ($entry in $Query.data) {
            $New = New-ITGFlexibleAsset

            $New.Id = $entry.id
            $New.Name = $entry.attributes.name
            $New.CreateDate = $entry.attributes.'created-at'
            $New.UpdateDate = $entry.attributes.'updated-at'

            $New.OrganizationId = $entry.attributes.'organization-id'
            $New.OrganizationName = $entry.attributes.'organization-name'

            $New.ResourceUrl = $entry.attributes.'resource-url'

            $New.Restricted = $entry.attributes.'restricted'
            $New.MyGlue = $entry.attributes.'my-glue'

            $New.FlexibleAssetTypeId = $entry.attributes.'flexible-asset-type-id'
            $New.FlexibleAssetTypeName = $entry.attributes.'flexible-asset-type-name'

            $New.Trait = $entry.attributes.traits

            $ReturnObject += $New
        }
    }

    END {
        $ReturnObject
    }
}
