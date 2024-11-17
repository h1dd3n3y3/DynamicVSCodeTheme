# VS Code Theme Toggle Script

This PowerShell script automatically toggles between dark and light themes in Visual Studio Code based on the time of execution.

- **Dark theme** activates after a specified hour.  
- **Light theme** activates until the start of the dark theme.

## Features

- Detects and updates the current theme in your VS Code settings.  
- Works seamlessly with your existing VS Code setup.  
- Customizable time thresholds for dark and light themes.

## Requirements

To use this script, ensure you have the following:

1. **Visual Studio Code**: Installed on your system.  
2. **PowerShell Environment**: Compatible with both PowerShell 5.1 & 7 versions.  
3. **Access to VS Code's settings.json**: Located at `%APPDATA%\Code\User\settings.json`.

## Usage

1. **Setup**: Save the script to a location on your system (e.g., `set_vs_code_theme.ps1`).  
2. **Run**: Execute the script in PowerShell:  
   ```powershell
   .\set_vs_code_theme.ps1
