function New-ITGFlexibleAssetType {
    [CmdletBinding()]
    Param (
    )

    BEGIN {
        $VerbosePrefix = "New-ITGFlexibleAssetType:"
    }

    PROCESS {
        $ReturnObject = [ITGFlexibleAssetType]::new()
    }


    END {
        $ReturnObject
    }
}
