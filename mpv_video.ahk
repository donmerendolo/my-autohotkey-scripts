#Requires AutoHotkey >=2.0
#SingleInstance Force

; Run mpv with the clipboard URL when Insert is pressed
Insert:: {
    if RegExMatch(A_Clipboard, 'i)instagram') {
        ; Remove any trackers from the URL by splitting at the first question mark
        A_Clipboard := StrSplit(A_Clipboard, '?')[1]

        ; Replace www.ddinstagram.com with www.instagram.com if present
        A_Clipboard := RegExReplace(A_Clipboard, 'ddinstagram\.com', 'instagram.com')
    }

    ; Run mpv with the modified clipboard URL as an argument
    Run('mpv --script-opts-append=ytdl_hook-try_ytdl_first=yes ' . A_Clipboard . ' --ontop')
}

Persistent
