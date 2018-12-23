#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; try to put four fertilizer
; and then set the plant x on 'high'

MButton::

;MouseGetPos, OutputVarX, OutputVarY, OutputVarWin, OutputVarControl, 1
;MsgBox %OutputVarX% %OutputVarY% %OutputVarWin% %OutputVarControl%

; fertilizer

;Send e
;sleep 500
;Send e
;sleep 500
;Send e
;sleep 500
;Send e
;sleep 500





Send {e down}
sleep 500

MouseGetPos, OutputVarX, OutputVarY, OutputVarWin, OutputVarControl, 1

;debugging purpose
;MsgBox %OutputVarX% %OutputVarY% %OutputVarWin% %OutputVarControl%

Xres := 1280
Yres := 800

Xpos_center := Xres / 2
Ypos_center := Yres / 2


sleep 500


MouseClick, X1, Xpos_center - 150 , Ypos_center - 150 , 1, 0

sleep 500

MouseClick, left


sleep 200

MouseClick, X1, Xpos_center + 150 , Ypos_center, 1, 0


sleep 500

Send {e up}
