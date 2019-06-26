#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



MButton::

	test := 0
	
	;en permanence
	While(test<100000){
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
		
		send {e down}
		sleep 100
		
		send {e up}
		sleep 100
		
		if(Mod(test,20)=0){
			sleep, 100
				
			send {h down}
			sleep 100
			
		
			send {F12}
			sleep 100
			send {h up}
		}
	}
return