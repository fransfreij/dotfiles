#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Use alt-q/w/e to center mouse cursor at screens 1 / 2 / 3


!w::WPA_MoveMouseToMonitor(1)
!q::WPA_MoveMouseToMonitor(2)
!e::WPA_MoveMouseToMonitor(3)

WPA_MoveMouseToMonitor(md)
{
    SysGet, mc, MonitorCount
    if (md<1 or md>mc)
        return
    
    Loop, %mc%
        SysGet, mon%A_Index%, MonitorWorkArea, %A_Index%
    
    ; Destination monitor
    mdx := mon%md%Left
    mdy := mon%md%Top
    mdw := mon%md%Right - mdx
    mdh := mon%md%Bottom - mdy
    
    mdxc := mdx+mdw/2, mdyc := mdy+mdh/2
    
    CoordMode, Mouse, Screen
    MouseMove, mdxc, mdyc, 0
}