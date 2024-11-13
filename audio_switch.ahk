#Requires AutoHotkey >=2.0
#SingleInstance Force

; Define icon paths
iconMonitor := '.\icons\monitor.ico'
iconHeadphones := '.\icons\headphones.ico'

; Audio device names
monitor := 'T22D390' ; Name of the first output device
headphones := 'Philips Fidelio X2HR' ; Name of the second output device

; Set default output to "monitor" and configure initial icon
Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 0')
Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 1')
Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 2')
currentDevice := monitor
TraySetIcon(iconMonitor) ; Set initial icon to monitor

ScrollLock::SwitchAudioDevice() ; Key to toggle output device

SwitchAudioDevice() {
    global currentDevice, monitor, headphones, iconMonitor, iconHeadphones
    if (currentDevice = monitor) {
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' headphones '" 0')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' headphones '" 1')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' headphones '" 2')
        currentDevice := headphones
        TraySetIcon(iconHeadphones) ; Change icon to headphones
    } else if (currentDevice = headphones) {
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 0')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 1')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 2')
        currentDevice := monitor
        TraySetIcon(iconMonitor) ; Change icon to monitor
    }
}

Persistent
