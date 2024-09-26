; Map Capslock to Control
; Map press & release of Capslock with no other key to Esc
; Press both shift keys together to toggle Capslock

*Capslock::
    Send {Blind}{LControl down}
    CapsDownTime := A_TickCount
    keyWait, Capslock

    Send {Blind}{LControl up}
    if A_PRIORKEY = CapsLock
    {
        if (A_TickCount - CapsDownTime) < 250
        {
                Send {Esc}
        }

    }
    return

ToggleCaps(){
    ; this is needed because by default, AHK turns CapsLock off before doing Send
    SetStoreCapsLockMode, Off
    Send {CapsLock}
    SetStoreCapsLockMode, On
    return
}
LShift & RShift::ToggleCaps()
RShift & LShift::ToggleCaps()

; ^!r::Reload
