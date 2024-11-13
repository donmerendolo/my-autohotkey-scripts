#Requires AutoHotkey >=2.0
#SingleInstance Force

; Definir rutas de los íconos
iconMonitor := 'D:\Documents\AutoHotkey\iconos\monitor.ico'
iconCascos := 'D:\Documents\AutoHotkey\iconos\cascos.ico'

; Nombres de los dispositivos de audio
monitor := 'T22D390' ; El nombre del primer dispositivo de salida
cascos := 'Philips Fidelio X2HR' ; El nombre del segundo dispositivo de salida

; Establecer la salida predeterminada a "monitor" y configurar el ícono inicial
Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 0')
Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 1')
Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 2')
currentDevice := monitor
TraySetIcon(iconMonitor) ; Establecer el ícono inicial al monitor

ScrollLock::SwitchAudioDevice() ; La tecla para alternar el dispositivo de salida

SwitchAudioDevice() {
    global currentDevice, monitor, cascos, iconMonitor, iconCascos
    if (currentDevice = monitor) {
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' cascos '" 0')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' cascos '" 1')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' cascos '" 2')
        currentDevice := cascos
        TraySetIcon(iconCascos) ; Cambia el ícono a cascos
    } else if (currentDevice = cascos) {
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 0')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 1')
        Run('C:\Program Files\NirSoft\nircmd\nircmd.exe setdefaultsounddevice "' monitor '" 2')
        currentDevice := monitor
        TraySetIcon(iconMonitor) ; Cambia el ícono a monitor
    }
}

Persistent
