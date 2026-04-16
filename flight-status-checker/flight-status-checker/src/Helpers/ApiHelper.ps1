function Invoke-FlightApiCall {
    param (
        [string]$FlightNumber
    )

    $apiUrl = "https://api.flightstatus.com/status/$FlightNumber"
    
    try {
        $response = Invoke-RestMethod -Uri $apiUrl -Method Get -ErrorAction Stop
        return $response
    } catch {
        Write-Error "Failed to retrieve flight status: $_"
        return $null
    }
}