function New-ITGFlexibleAssetField {
    [CmdletBinding()]
    Param (
    )

    BEGIN {
        $VerbosePrefix = "New-ITGFlexibleAssetField:"
    }

    PROCESS {
        $ReturnObject = [ITGFlexibleAssetField]::new()
    }

    END {
        $ReturnObject
    }
}
