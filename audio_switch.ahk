#Requires AutoHotkey >=2.0
#SingleInstance Force

; Define icon paths
iconSpeakers := '.\icons\speaker.ico'
iconHeadphones := '.\icons\headphones.ico'

; Audio device names
speakers := 'Creative Pebble X Plus' ; Name of the first output device
headphones := 'Philips Fidelio X2HR' ; Name of the second output device

; Set default output to "speakers" and configure initial icon
Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' speakers '" 0')
Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' speakers '" 1')
Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' speakers '" 2')
currentDevice := speakers
TraySetIcon(iconSpeakers) ; Set initial icon to speakers

ScrollLock::SwitchAudioDevice() ; Key to toggle output device

SwitchAudioDevice() {
    global currentDevice, speakers, headphones, iconSpeakers, iconHeadphones
    if (currentDevice = speakers) {
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' headphones '" 0')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' headphones '" 1')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' headphones '" 2')
        currentDevice := headphones
        TraySetIcon(iconHeadphones) ; Change icon to headphones
    } else if (currentDevice = headphones) {
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' speakers '" 0')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' speakers '" 1')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' speakers '" 2')
        currentDevice := speakers
        TraySetIcon(iconSpeakers) ; Change icon to speakers
    }
}

Persistent
