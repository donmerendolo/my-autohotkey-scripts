#Requires AutoHotkey >=2.0
#SingleInstance Force

XButton1:: {
    SendInput "{XButton1 down}"  ; Mantiene el botón presionado
    KeyWait "XButton1"  ; Espera a que el botón se suelte
    Sleep 20  ; Mantiene el clic durante 20 ms después de soltar
    SendInput("{XButton1 up}")  ; Suelta el botón
}

Persistent
