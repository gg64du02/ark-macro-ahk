#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;use it with a 1x1 to deplete your food fast

MButton::

	test := 0
	
	;en permanence
	While(test<35){
		;delay in ms
		Sleep, 100
		;Sleep, 10
		
		test := test + 1
		
		if(test = 20){
			;msgbox %test%
		}
		;sleep  150
		send {Space down}
		sleep  150
		send {Space up}
		sleep  150
		;sleep  150
	}
return