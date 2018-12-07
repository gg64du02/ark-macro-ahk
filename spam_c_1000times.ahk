#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;use it on a theri to destroy structures/raft

MButton::

	test := 0
	
	;en permanence
	While(test<1000){
		;delay in ms
		Sleep, 500
		
		test := test + 1
		
		if(test = 20){
			;msgbox %test%
		}
		send c
	}
return