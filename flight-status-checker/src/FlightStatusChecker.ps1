<#
.SYNOPSIS
    Main entry point for the Flight Status Checker application.
.DESCRIPTION
    Prompts the user for a flight number and displays the current flight status.
#>

param (
    [string]$FlightNumber
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$modulePath = Join-Path $ScriptDir "Modules\FlightStatusModule.psm1"

if (-not (Test-Path $modulePath)) {
    Write-Error "Could not find module at $modulePath"
    exit 1
}

Import-Module -Name $modulePath -Force

function Start-FlightStatusChecker {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FlightNumber
    )

    $status = Get-FlightStatus -FlightNumber $FlightNumber

    if ($null -eq $status) {
        Write-Host "Could not retrieve the status for flight $FlightNumber." -ForegroundColor Yellow
        return
    }

    Write-Host "Flight $FlightNumber status: $status" -ForegroundColor Green
}

if ($PSBoundParameters.ContainsKey('FlightNumber')) {
    Start-FlightStatusChecker -FlightNumber $FlightNumber
    return
}

$flightNumber = Read-Host "Enter the flight number to check status"
if (-not [string]::IsNullOrWhiteSpace($flightNumber)) {
    Start-FlightStatusChecker -FlightNumber $flightNumber.Trim()
} else {
    Write-Host "No flight number entered. Exiting." -ForegroundColor Yellow
}