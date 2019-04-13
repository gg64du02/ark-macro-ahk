#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;use it with a theri to collect fiber

MButton::

	test := 0
	
	;en permanence
	While(test<100){
		;delay in ms
		Sleep, 150
		
		test := test + 1
		
		if(test = 20){
			;msgbox %test%
		}
		;send RButton
		
		MouseClick, right
	}
return