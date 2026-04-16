$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$helperPath = Join-Path $ScriptDir "..\Helpers\ApiHelper.ps1"

if (Test-Path $helperPath) {
    . $helperPath
} else {
    throw "Missing helper file: $helperPath"
}

function Get-FlightStatus {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FlightNumber
    )

    if ([string]::IsNullOrWhiteSpace($FlightNumber)) {
        throw "FlightNumber cannot be empty."
    }

    $response = Invoke-FlightApiCall -FlightNumber $FlightNumber
    if ($null -eq $response) {
        return $null
    }

    return $response.Status
}

function Get-FlightStatusByDate {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FlightNumber,
        [Parameter(Mandatory = $true)]
        [datetime]$Date
    )

    if ([string]::IsNullOrWhiteSpace($FlightNumber)) {
        throw "FlightNumber cannot be empty."
    }

    $response = Invoke-FlightApiCall -FlightNumber $FlightNumber -Date $Date
    if ($null -eq $response) {
        return $null
    }

    return $response.Status
}

Export-ModuleMember -Function Get-FlightStatus, Get-FlightStatusByDate