#Requires AutoHotkey >=2.0
#SingleInstance Force

; Launch Brave browser in incognito mode with clipboard URL when Pause key is pressed
Pause:: {
    Run '"C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe" --incognito ' . A_Clipboard
}

Persistent
