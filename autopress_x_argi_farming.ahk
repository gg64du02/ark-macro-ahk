﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; a script to farm more easily with argi and doedi



while(1){
	KeyWait w
	KeyWait s
	KeyWait d
	KeyWait a
	Send {x down}
	sleep 200
	Send {x up}
}


;f12::
MButton::
Pause
Suspend
KeyWait MButton
sleep 500
return