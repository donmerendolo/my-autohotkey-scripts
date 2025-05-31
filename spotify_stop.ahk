#Requires AutoHotkey >=2.0
#SingleInstance Force

StopSpotifyRunning := false

Launch_Media:: {
    if !StopSpotifyRunning {
        SetTimer(StopSpotify, -1) ; Run once
    }
}

StopSpotify() {
    global StopSpotifyRunning
    StopSpotifyRunning := true
    try {
        Title := WinGetTitle("ahk_exe spotify.exe") ; Get the current song title
    }
    loop {
        Sleep 10
        try {
            NewTitle := WinGetTitle("ahk_exe spotify.exe") ; Get the new song title
            if NewTitle != Title { ; If the song has changed
                Send "{Media_Play_Pause}" ; Pause Spotify
                break
            }
        }
    }
    StopSpotifyRunning := false
}

Persistent