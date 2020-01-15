#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;use it to not get kick, be carefull your business might get raided during that time, use it with caution


;reset
F1::Reload


F4::

	test := 0
	
	;en permanence
	While(test<1000){
		;delay in ms
		Sleep, 15000
		
		test := test + 1
		
		if(test = 20){
			;msgbox %test%
		}
		sleep 100
		send {LButton down}
		sleep 100
		send {LButton up}
		
		;MouseClick, left
	}
return