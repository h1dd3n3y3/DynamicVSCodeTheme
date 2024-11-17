$dark_theme_hour_start = 17
$light_theme_hour_start = 7

$settings_json = $env:APPDATA + '\Code\User\settings.json'

$content = Get-Content $settings_json
$content_custom_object = Get-Content -Raw $settings_json | ConvertFrom-Json # Convert single JSON Object (-Raw) to Custom Object (PSObject)

$current_theme_object = $content_custom_object.PSObject.Properties | Where-Object {$PSItem.Name -eq 'workbench.colorTheme'} # Get current theme NoteProperty
$current_theme = $current_theme_object.Value # Get current theme value

$prefered_dark_theme_object = $content_custom_object.PSObject.Properties | Where-Object {$PSItem.Name -eq 'workbench.preferredDarkColorTheme'} # Get prefered dark theme NoteProperty
$prefered_dark_theme = $prefered_dark_theme_object.Value # Get prefered dark theme value

$prefered_light_theme_object = $content_custom_object.PSObject.Properties | Where-Object {$PSItem.Name -eq 'workbench.preferredLightColorTheme'} # Get prefered light theme NoteProperty
$prefered_light_theme = $prefered_light_theme_object.Value # Get prefered light theme value


[int]$current_hour = (Get-Date).Hour


if (($null -eq $prefered_dark_theme) -or ($null -eq $prefered_light_theme)) {

    if ($null -eq $prefered_dark_theme) {

        $settings_json + ': ''workbench.preferredDarkColorTheme'' missing or has empty value.'

    } elseif ($null -eq $prefered_light_theme) {

        $settings_json + ': ''workbench.preferredLightColorTheme'' missing or has empty value.'
    }
    
} else {

    if ($current_theme -eq $prefered_dark_theme) {

        if (($current_hour -ge $light_theme_hour_start) -and ($current_hour -lt $dark_theme_hour_start)) {
            
            'Dark theme is enabled.'
            'Changing to prefered light theme.'
        
            $src = '"workbench.colorTheme": ' + '"' + $current_theme + '"'
            $dst = '"workbench.colorTheme": ' + '"' + $prefered_light_theme + '"'
        
            $content.Replace($src, $dst) | Set-Content $settings_json
        }

    } elseif ($current_theme -eq $prefered_light_theme) {

        if (($current_hour -ge $dark_theme_hour_start) -or ($current_hour -lt $light_theme_hour_start)) {

            'Light theme is enabled.'
            'Changing to prefered dark theme.'
        
            $src = '"workbench.colorTheme": ' + '"' + $current_theme + '"'
            $dst = '"workbench.colorTheme": ' + '"' + $prefered_dark_theme + '"'

            $content.Replace($src, $dst) | Set-Content $settings_json
        }
    }
}
