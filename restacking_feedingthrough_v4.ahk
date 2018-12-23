#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; restacking the feeding through with MButton

MButton::
	Loop, 10{
		restack_one_feeding_through()
		sleep 500
		send {d down}
		sleep 300
		send {d up}
		sleep 500
	}
	
	i := 0
	
	;while(1){
	;	if()
	;	i := i + 1
	;}

restack_one_feeding_through(){
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

	sleep 500
	MouseClick, X1, Xpos_center - 390 , Ypos_center - 200 , 1, 0
	MouseClick, left

	sleep 500
	Send {Esc}
}