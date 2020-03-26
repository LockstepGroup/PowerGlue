function New-ITGFlexibleAsset {
    [CmdletBinding()]
    Param (
    )

    BEGIN {
        $VerbosePrefix = "New-ITGFlexibleAsset:"
    }

    PROCESS {
        $ReturnObject = [ITGFlexibleAsset]::new()
    }

    END {
        $ReturnObject
    }
}
