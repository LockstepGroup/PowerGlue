function Get-ITGFlexibleAssetField {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [int64]$Id
    )

    BEGIN {
        $VerbosePrefix = "Get-ITGFlexibleAssetField:"
        $ReturnObject = @()
    }

    PROCESS {
        $QueryParams = @{}
        $QueryParams.UriPath = 'flexible_asset_types/' + $Id + '/relationships/flexible_asset_fields'
        $QueryParams.Query = @{}

        $Query = Invoke-ITGApiQuery @QueryParams

        foreach ($entry in $Query.data) {
            $New = New-ITGFlexibleAssetField

            $New.Id = $entry.id
            $New.Name = $entry.attributes.name
            $New.Kind = $entry.attributes.kind
            $New.Hint = $entry.attributes.hint
            $New.Decimals = $entry.attributes.decimals
            $New.DefaultValue = $entry.attributes.'default-value'
            $New.TagType = $entry.attributes.'tag-type'
            $New.Required = $entry.attributes.required
            $New.Expiration = $entry.attributes.expiration
            $New.ShowInList = $entry.attributes.'use-for-title'
            $New.NameKey = $entry.attributes.'name-key'
            $New.TagType = $entry.attributes.'tag-type'
            $New.CreateDate = $entry.attributes.'created-at'
            $New.UpdateDate = $entry.attributes.'updated-at'

            $ReturnObject += $New
        }
    }

    END {
        $ReturnObject
    }
}
