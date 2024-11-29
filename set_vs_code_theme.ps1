$dark_theme_hour_start = 17
$light_theme_hour_start = 7

[int]$current_hour = (Get-Date).Hour

$settings_json = $env:APPDATA + '\Code\User\settings.json'

$content = Get-Content $settings_json
$content_custom_object = Get-Content -Raw $settings_json | ConvertFrom-Json # Convert JSON (-Raw helps parse it correctly) to Custom Object (PSObject)

$current_theme = $content_custom_object.'workbench.colorTheme' # Get current theme

$preferred_dark_theme = $content_custom_object.'workbench.preferredDarkColorTheme' # Get preferred dark theme
$preferred_light_theme = $content_custom_object.'workbench.preferredLightColorTheme' # Get preferred light theme


if (($null -eq $preferred_dark_theme) -or ($null -eq $preferred_light_theme)) {

    if ($null -eq $preferred_dark_theme) {

        $settings_json + ': ''workbench.preferredDarkColorTheme'' missing or has empty value.'

    } elseif ($null -eq $preferred_light_theme) {

        $settings_json + ': ''workbench.preferredLightColorTheme'' missing or has empty value.'
    }
    
} else {
    
    if (($current_hour -ge $light_theme_hour_start) -and ($current_hour -lt $dark_theme_hour_start)) {
        
        'Dark theme is enabled.'
        'Changing to preferred light theme.'
    
        $src = '"workbench.colorTheme": ' + '"' + $current_theme + '"'
        $dst = '"workbench.colorTheme": ' + '"' + $preferred_light_theme + '"'
    
        $content.Replace($src, $dst) | Set-Content $settings_json
    }

    elseif (($current_hour -ge $dark_theme_hour_start) -or ($current_hour -lt $light_theme_hour_start)) {

        'Light theme is enabled.'
        'Changing to preferred dark theme.'
    
        $src = '"workbench.colorTheme": ' + '"' + $current_theme + '"'
        $dst = '"workbench.colorTheme": ' + '"' + $preferred_dark_theme + '"'

        $content.Replace($src, $dst) | Set-Content $settings_json
    }
}
