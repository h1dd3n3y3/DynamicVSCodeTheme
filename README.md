# VS Code Theme Toggle Script

This PowerShell script toggles between dark and light themes in Visual Studio Code based on the time of execution.

## Features

- Detects and updates the current theme in your VS Code settings.  
- Works seamlessly with your existing VS Code setup.  
- Customizable time thresholds for dark and light themes.

## Defaults

By default the script utilizes the below hour toggles:

- **Dark theme:** 17:00.
- **Light theme:** 07:00.

## Requirements

To use this script, ensure you have the following:

1. **Visual Studio Code**: Installed on your system.  
2. **PowerShell Environment**: Either PowerShell 5.1 or 7.  
3. **Access to VS Code's settings.json**: Located under `%APPDATA%\Code\User\settings.json`.
4. **Set preferred light & dark theme properties in settings.json:**
      - `"workbench.preferredLightColorTheme"`
      - `"workbench.preferredDarkColorTheme"`

## Usage

1. **Setup**: Save the script to a location on your system (e.g., `set_vs_code_theme.ps1`).  
2. **Run**: Execute the script in PowerShell:  
   ```
   powershell -Exec Bypass .\set_vs_code_theme.ps1
