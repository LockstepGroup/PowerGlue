function Get-ITGConfiguration {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $False)]
        [string]$Organization
    )

    BEGIN {
        $VerbosePrefix = "Get-ITGConfiguration:"
    }

    PROCESS {
        $test = $itg.invokeApiQuery(@{'filter[name]' = 'Fulton*'})
    }

    END {
    }
}
