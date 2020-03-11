function Connect-ITGServer {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [string]$ApiKey
    )

    BEGIN {
        $VerbosePrefix = "Connect-ITGServer:"
    }

    PROCESS {
        $ReturnObject = New-ITGServer -ApiKey $ApiKey
        #TODO: need to add a test connection
    }

    END {
        $Global:ITGConnection = $ReturnObject
    }
}
