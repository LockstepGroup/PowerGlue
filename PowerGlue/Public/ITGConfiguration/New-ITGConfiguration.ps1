function New-ITGConfiguration {
    [CmdletBinding()]
    Param (
    )

    BEGIN {
        $VerbosePrefix = "New-ITGConfiguration:"
    }

    PROCESS {
        $ReturnObject = [ITGConfiguration]::new()
    }

    END {
        $ReturnObject
    }
}
