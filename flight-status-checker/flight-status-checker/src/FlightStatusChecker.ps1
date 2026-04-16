# FlightStatusChecker.ps1

# Main entry point for the Flight Status Checker application

# Import the necessary modules
Import-Module -Name "./Modules/FlightStatusModule.psm1"

function Start-FlightStatusChecker {
    param (
        [string]$FlightNumber
    )

    if (-not $FlightNumber) {
        Write-Host "Please provide a flight number."
        return
    }

    # Get the flight status
    $status = Get-FlightStatus -FlightNumber $FlightNumber

    if ($status) {
        Write-Host "The current status of flight $FlightNumber is: $status"
    } else {
        Write-Host "Could not retrieve the status for flight $FlightNumber."
    }
}

# Handle user input
$flightNumber = Read-Host "Enter the flight number to check status"
Start-FlightStatusChecker -FlightNumber $flightNumber