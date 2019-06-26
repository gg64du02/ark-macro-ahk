#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; use it to pick to click 'tranfer all'

MButton::

MouseClick, left

sleep 100

MouseClick, right

MouseGetPos, OutputVarX, OutputVarY, OutputVarWin, OutputVarControl, 1

;debugging purpose
;MsgBox %OutputVarX% %OutputVarY% %OutputVarWin% %OutputVarControl%

Xres := 1280
Yres := 720

Xpos_center := Xres / 2
Ypos_center := Yres / 2

;ok 500
sleep 200

MouseClick, X1, OutputVarX + 0 , OutputVarY + 100 , 1, 0

sleep 200

MouseClick, X1, OutputVarX + 30 , OutputVarY + 130 , 1, 0

sleep 200

MouseClick, left

sleep 100

MouseClick, X1, OutputVarX + 0 , OutputVarY + 0 , 1, 0

;end