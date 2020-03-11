function New-ITGConfigurationStatus {
    [CmdletBinding()]
    Param (
    )

    BEGIN {
        $VerbosePrefix = "New-ITGConfigurationStatus:"
    }

    PROCESS {
        $ReturnObject = [ITGConfigurationStatus]::new()
    }

    END {
        $ReturnObject
    }
}
