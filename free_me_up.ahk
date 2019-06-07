#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



MButton::

	test := 0
	
	;en permanence
	While(test<10){
		;delay in ms
		Sleep, 200
		;Sleep, 10
		
		test := test + 1
		
		if(test = 20){
			;msgbox %test%
		}
		
		send 1
		sleep 500
		
		send 0
		sleep 500
		
		send {NumpadAdd}
		sleep 500
		
		DllCall("SetCursorPos", int, 500 int, 500)
		
		bottomCount := 0
		
		While(bottomCount<400){
			MouseMove,0,1,0,R
			sleep 10
			bottomCount := bottomCount+1
		}
		
		sleep 500
		
		send e
		sleep 500
		
	}
return