#Requires Autohotkey >=2.0
#SingleInstance Force

; Completely disable original CapsLock functionality and make it work as Esc
*CapsLock::Esc

; When physical ESC key is pressed, play sound and toggle Caps Lock
*Esc:: {
    ; Play a sound when ESC is pressed
    ;SoundPlay("*64")
    SoundBeep(500, 100)
    SoundBeep(400, 100)

    ; Toggle Caps Lock
    ;SetCapsLockState(!GetKeyState("CapsLock", "T"))
}

; Prevent any default CapsLock behavior
SetCapsLockState "AlwaysOff"

;; Swap Caps Lock and Escape
;CapsLock::Esc
;Esc::CapsLock

Persistent