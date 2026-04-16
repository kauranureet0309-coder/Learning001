# Flight Status Checker

## Overview
The Flight Status Checker is a PowerShell application that looks up the current status of flights by flight number. The app uses a module-based structure and includes fallback sample data so it works even without a live API.

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
└── README.md
```

## Setup Instructions
1. Open PowerShell and navigate to the `flight-status-checker\flight-status-checker` folder.
2. If needed, allow script execution:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
3. Run the app:
   ```powershell
   .\src\FlightStatusChecker.ps1
   ```

## Usage
1. When prompted, enter a flight number such as `AA123`, `DL456`, or `UA789`.
2. The app will display the current status for that flight.
3. If the remote API is unavailable, the app returns sample status data from the local fallback.

## Commands
- Run the main app:
  ```powershell
  .\src\FlightStatusChecker.ps1
  ```
- Run tests:
  ```powershell
  .\tests\FlightStatusChecker.Tests.ps1
  ```

## Notes
- The main script loads `FlightStatusModule.psm1` from `src\Modules`.
- `ApiHelper.ps1` provides `Invoke-FlightApiCall`, which uses sample data if the external service cannot be reached.

## Testing
The `tests\FlightStatusChecker.Tests.ps1` file uses Pester-style assertions to verify the flight status module behavior.

## Contributing
Contributions are welcome. Open an issue or submit a pull request for enhancements or fixes.
