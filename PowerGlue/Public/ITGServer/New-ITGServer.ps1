function New-ITGServer {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $False)]
        [string]$ApiKey
    )

    BEGIN {
        $VerbosePrefix = "New-ITGServer:"
    }

    PROCESS {
        $ReturnObject = [ITGServer]::new()
        if ($ApiKey) {
            $ReturnObject.ApiKey = $ApiKey
        }
    }

    END {
        $ReturnObject
    }
}
