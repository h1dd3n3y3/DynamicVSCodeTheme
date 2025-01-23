# Dynamic VS Code Theme

A PowerShell script to switch between preferred light and dark themes in Visual Studio Code based on the time of execution.  
Pair that with Windows Task Scheduler and let the automation begin! 💯💪✈️

## Features

- Detects and updates the current theme in your VS Code settings.  
- Works seamlessly with your existing VS Code setup.  
- Customizable time thresholds for light and dark themes.

## Defaults

By default the script utilizes the below hour toggles:

- **Light theme:** 07:00.
- **Dark theme:** 17:00.

## Requirements

To use this script, ensure you have the following:

1. **Visual Studio Code**: Installed on your system.  
2. **PowerShell Environment**: Either PowerShell 5.1 or 7.  
3. **Access to VS Code's settings.json**: Located under `%APPDATA%\Code\User\settings.json`.
4. **Preferred light & dark theme properties in settings.json:**
      - `"workbench.preferredLightColorTheme"`
      - `"workbench.preferredDarkColorTheme"`
5. **Check JSON doesn't end with any commas.  
   It should <ins>NOT</ins> be like:**
      - ```
            {
               "this": "that",
               "some": "more",
            }```

## Usage

1. **Setup**: Save the script to a location on your system.
2. **Run**: Execute the script in PowerShell:  
   ```
   powershell -Exec Bypass .\set_vs_code_theme.ps1 
