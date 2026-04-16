# FlightStatusChecker.Tests.ps1

# This file contains unit tests for the FlightStatusChecker application.
# It tests the functionality of the main script and the module functions to ensure they work as expected.

Describe "Flight Status Checker Tests" {
    # Test for the Get-FlightStatus function
    It "Should return flight status for a valid flight number" {
        $flightNumber = "AA123"
        $expectedStatus = "On Time"  # Example expected status

        # Call the function from the FlightStatusModule
        $actualStatus = Get-FlightStatus -FlightNumber $flightNumber

        # Assert that the actual status matches the expected status
        $actualStatus | Should -Be $expectedStatus
    }

    # Test for the Get-FlightStatus function with an invalid flight number
    It "Should return an error for an invalid flight number" {
        $flightNumber = "INVALID"

        # Call the function from the FlightStatusModule
        $actualStatus = Get-FlightStatus -FlightNumber $flightNumber

        # Assert that the actual status indicates an error
        $actualStatus | Should -Be "Flight not found"
    }

    # Additional tests can be added here for other functionalities
}