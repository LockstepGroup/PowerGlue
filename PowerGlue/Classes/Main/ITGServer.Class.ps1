Class ITGServer {
    [string]$BaseFqdn = 'api.itglue.com'
    [string]$UriPath
    [string]$ApiKey

    #region Tracking
    ########################################################################

    hidden [bool]$Connected
    [array]$UrlHistory
    [array]$RawQueryResultHistory
    [array]$QueryHistory
    $LastError
    $LastResult

    ########################################################################
    #endregion Tracking

    # Create query string
    static [string] createQueryString ([hashtable]$hashTable) {
        $i = 0
        $queryString = "?"
        foreach ($hash in $hashTable.GetEnumerator()) {
            $i++
            $queryString += $hash.Name + "=" + $hash.Value
            if ($i -lt $HashTable.Count) {
                $queryString += "&"
            }
        }
        return $queryString
    }

    # Generate Api URL
    [String] getApiUrl([string]$formattedQueryString) {
        if ($this.BaseFqdn) {
            $url = "https://" + $this.BaseFqdn + '/' + $this.UriPath + $formattedQueryString
            return $url
        } else {
            return $null
        }
    }

    #region processQueryResult
    ########################################################################

    [psobject] processQueryResult ($unprocessedResult) {
        <#         $result = $null

        switch ($unprocessedResult.response.status) {
            'success' {
                $result = $unprocessedResult
            }
            'error' {
                if ($unprocessedResult.response.msg.line) {
                    if ($unprocessedResult.response.msg.line.'#cdata-section') {
                        $Message = $unprocessedResult.response.msg.line.'#cdata-section' -join "`r`n"
                        Write-Verbose "line and #cdata-section detected: $Message"
                    } else {
                        $Message = $unprocessedResult.response.msg.line -join "`r`n"
                        Write-Verbose "line detected: $Message"
                    }
                } else {
                    $Message = $unprocessedResult.response.msg
                    Write-Verbose "line not detected: $Message"
                }
                Throw $Message
            }
            'unauth' {
                $Message = $unprocessedResult.response.msg.line
                Throw $Message
            }
        } #>

        return $unprocessedResult
    }

    ########################################################################
    #endregion processQueryResult

    #region invokeApiQuery
    ########################################################################

    [psobject] invokeApiQuery([hashtable]$queryString) {

        # ITG uses the query string as a body attribute, keeping this function as is for now and just using an empty querystring
        $url = $this.getApiUrl('')

        # Populate Query/Url History
        $this.UrlHistory += $url
        $this.QueryHistory += $queryString

        # try query
        try {
            $QueryParams = @{}
            $QueryParams.Uri = $url
            #$QueryParams.UseBasicParsing = $true
            $QueryParams.ContentType = 'application/vnd.api+json'
            $QueryParams.Body = $queryString
            $QueryParams.Headers = @{
                'cache-control' = 'no-cache'
                'x-api-key'     = $this.ApiKey
            }

            $rawResult = Invoke-WebRequest @QueryParams
        } catch {
            Throw $_
        }

        $this.RawQueryResultHistory += $rawResult

        # ITG returns Content in a byte array when using Invoke-WebRequest for some reason
        $result = [System.Text.Encoding]::ASCII.GetString($rawResult.Content) | ConvertFrom-Json
        $this.LastResult = $result

        $proccessedResult = $this.processQueryResult($result)

        return $proccessedResult
    }

    ########################################################################
    #endregion invokeApiQuery

    #region Initiators
    ########################################################################

    # empty initiator
    ITGServer() {
    }

    ########################################################################
    #endregion Initiators
}
