#Requires AutoHotkey >=2.0
#SingleInstance Force

XButton1:: {
    SendInput "{XButton1 down}"  ; Holds the button down
    KeyWait "XButton1"           ; Waits for button release
    Sleep 20                     ; Keeps click for 20ms after release
    SendInput("{XButton1 up}")   ; Releases the button
}

Persistent
