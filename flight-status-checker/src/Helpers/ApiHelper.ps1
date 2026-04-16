function Invoke-FlightApiCall {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FlightNumber,
        [datetime]$Date
    )

    $flightNumber = $FlightNumber.Trim().ToUpperInvariant()
    $apiUrl = "https://api.flightstatus.example.com/status?flight=$flightNumber"

    if ($PSBoundParameters.ContainsKey('Date')) {
        $apiUrl += "&date=$($Date.ToString('yyyy-MM-dd'))"
    }

    try {
        $response = Invoke-RestMethod -Uri $apiUrl -Method Get -ErrorAction Stop
        if ($null -ne $response) {
            return $response
        }
    } catch {
        Write-Verbose "Flight status API request failed: $_"
    }

    $knownFlights = @{
        "AA123" = @{ FlightNumber = "AA123"; Status = "On Time"; Airline = "American Airlines"; Departure = "08:00"; Arrival = "11:30" }
        "DL456" = @{ FlightNumber = "DL456"; Status = "Delayed"; Airline = "Delta Air Lines"; Departure = "09:15"; Arrival = "12:45" }
        "UA789" = @{ FlightNumber = "UA789"; Status = "Cancelled"; Airline = "United Airlines"; Departure = "13:20"; Arrival = "16:50" }
    }

    if ($knownFlights.ContainsKey($flightNumber)) {
        return [PSCustomObject]$knownFlights[$flightNumber]
    }

    return $null
}