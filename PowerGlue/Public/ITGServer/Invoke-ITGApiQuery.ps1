function Invoke-ITGApiQuery {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$UriPath,

        [Parameter(Mandatory = $false, Position = 1)]
        [hashtable]$Query = @{}
    )

    BEGIN {
        $VerbosePrefix = "Invoke-ITGApiQuery:"
    }

    PROCESS {
        if (-not $Global:ITGConnection) {
            Throw "$VerbosePrefix no active connection to IT Glue, please use Connect-ITGServer to get started."
        } else {
            $Global:ITGConnection.UriPath = $UriPath
            $ReturnObject = $Global:ITGConnection.invokeApiQuery($Query)
        }
    }

    END {
        $ReturnObject
    }
}
