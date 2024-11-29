#Requires AutoHotkey >=2.0
#SingleInstance Force

; Launch Brave browser in incognito mode with clipboard URL when Pause key is pressed
Pause:: {
    Run '"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --inprivate ' . A_Clipboard
}

Persistent
