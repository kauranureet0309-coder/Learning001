# Flight Status Checker

## Overview
The Flight Status Checker is a PowerShell application designed to retrieve flight status information for a given flight number. It uses a module-based architecture and includes a fallback sample data set so it can run without a live API.

## Project Structure
```
flight-status-checker
├── src
│   ├── FlightStatusChecker.ps1
│   ├── Modules
│   │   └── FlightStatusModule.psm1
│   └── Helpers
│       └── ApiHelper.ps1
├── tests
│   └── FlightStatusChecker.Tests.ps1
├── .gitignore
└── README.md
```

## Setup Instructions
1. Open PowerShell and navigate to the `flight-status-checker` directory.
2. Set the execution policy if required:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
3. Run the application:
   ```powershell
   .\src\FlightStatusChecker.ps1
   ```

## Usage
1. When prompted, enter a flight number such as `AA123`, `DL456`, or `UA789`.
2. The app will display the current status for that flight.
3. If the API endpoint is unavailable, the application uses local sample flight data.

## Commands
- Run the main app:
  ```powershell
  .\src\FlightStatusChecker.ps1
  ```
- Run unit tests with Pester:
  ```powershell
  .\tests\FlightStatusChecker.Tests.ps1
  ```

## Notes
- The application imports `FlightStatusModule.psm1` from the `src\Modules` folder.
- `ApiHelper.ps1` includes an offline fallback data set for known sample flights.

## Testing
The tests verify the module behavior for known and unknown flight numbers and date-based status retrieval.

## Contributing
Contributions are welcome. Open an issue or submit a pull request for enhancements and bug fixes.
