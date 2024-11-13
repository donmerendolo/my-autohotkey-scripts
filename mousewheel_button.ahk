#Requires AutoHotkey >=2.0
#SingleInstance Force

; Disable the normal behavior of CapsLock
SetCapsLockState("AlwaysOff")

; Remap CapsLock to MouseWheel button
CapsLock::MButton

; Remap Shift+CapsLock to CapsLock
+CapsLock::CapsLock

Persistent
