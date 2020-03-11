function New-ITGServer {
    [CmdletBinding()]
    Param (
    )

    BEGIN {
        $VerbosePrefix = "New-ITGServer:"
    }

    PROCESS {
        $ReturnObject = [ITGServer]::new()
    }

    END {
        $ReturnObject
    }
}
