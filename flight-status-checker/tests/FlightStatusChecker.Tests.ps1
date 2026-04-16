$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Import-Module -Name (Join-Path $ScriptDir "..\src\Modules\FlightStatusModule.psm1") -Force

Describe "Flight Status Checker Module" {
    It "returns status for a known flight number" {
        $flightNumber = "AA123"
        $actualStatus = Get-FlightStatus -FlightNumber $flightNumber

        $actualStatus | Should -Be "On Time"
    }

    It "returns null for an unknown flight number" {
        $flightNumber = "UNKNOWN"
        $actualStatus = Get-FlightStatus -FlightNumber $flightNumber

        $actualStatus | Should -Be $null
    }

    It "returns status by date for a known flight" {
        $flightNumber = "AA123"
        $date = [datetime]"2026-04-15"
        $actualStatus = Get-FlightStatusByDate -FlightNumber $flightNumber -Date $date

        $actualStatus | Should -Be "On Time"
    }
}
