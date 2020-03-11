function New-ITGOrganization {
    [CmdletBinding()]
    Param (
    )

    BEGIN {
        $VerbosePrefix = "New-ITGOrganization:"
    }

    PROCESS {
        $ReturnObject = [ITGOrganization]::new()
    }

    END {
        $ReturnObject
    }
}
