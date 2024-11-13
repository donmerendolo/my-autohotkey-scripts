#Requires AutoHotkey >=2.0
#SingleInstance Force

; Run mpv with the clipboard URL when Insert is pressed
Insert:: {
    ; Process instagram, instagramez and ddinstagram links
    if RegExMatch(A_Clipboard, 'i)instagram') {
        ; Remove any trackers from the URL by splitting at the first question mark
        A_Clipboard := StrSplit(A_Clipboard, '?')[1]

        ; Replace www.ddinstagram.com with www.instagram.com if present
        A_Clipboard := RegExReplace(A_Clipboard, 'www\.ddinstagram\.com', 'instagram.com')

        ; Replace www.instagramez.com with www.instagram.com if present
        A_Clipboard := RegExReplace(A_Clipboard, 'www\.instagramez\.com', 'instagram.com')
    }

    ; Process tiktok and tnktok links
    if RegExMatch(A_Clipboard, 'i)instagram') {
        ; Remove any trackers from the URL by splitting at the first question mark
        A_Clipboard := StrSplit(A_Clipboard, '?')[1]
        
        ; Replace tnktok.com with tiktok.com if present
        A_Clipboard := RegExReplace(A_Clipboard, 'tnktok\.com', 'tiktok.com')
    }

    ; Run mpv with the modified clipboard URL as an argument
    Run('mpv --script-opts-append=ytdl_hook-try_ytdl_first=yes ' . A_Clipboard . ' --ontop')
}

Persistent
