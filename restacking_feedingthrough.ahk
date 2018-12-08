#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; restacking the feeding through with MButton

MButton::


;========================================

Send f

MouseGetPos, OutputVarX, OutputVarY, OutputVarWin, OutputVarControl, 1

;debugging purpose
;MsgBox %OutputVarX% %OutputVarY% %OutputVarWin% %OutputVarControl%

Xres := 1280
Yres := 720

Xpos_center := Xres / 2
Ypos_center := Yres / 2

;ok 500
sleep 1000

MouseClick, X1, Xpos_center + 350 , Ypos_center - 200 , 1, 0

;ok 500
sleep 1000

MouseClick, left

;MsgBox 922 154

sleep 500

Send {Esc}

;========================================

;========================================

sleep 500

Send f

sleep 500

MouseClick, X1, Xpos_center - 390 , Ypos_center - 200 , 1, 0

MouseClick, left

sleep 500

Send {Esc}