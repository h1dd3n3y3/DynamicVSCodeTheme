# VS Code Theme Toggle Script

This PowerShell script automatically toggles between dark and light themes in Visual Studio Code based on the time of execution.
It is literally a toggle script unless you give it specific arguments.
Note that by default it won't change the theme from light to dark, or vice versa, if executed in each theme's specific hours.
That makes it easy to automate with Windows' Task Scheduler!

- **Dark theme** activates after a specified hour.
- **Light theme** activates until the start of the dark theme.

## Features

- Detects and updates the current theme in your VS Code settings.
- Works seamlessly with your existing VS Code setup.
- Customizable time thresholds for dark and light themes.

## Usage

1. **Setup**: Save the script to a location on your system.
2. **Run**: Execute the script in PowerShell:
   ```
   powershell -Exec Bypass .\set_vs_code_theme.ps1
