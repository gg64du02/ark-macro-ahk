#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



MButton::

	test := 0
	
	send {e down}
	sleep 100
	
	send {e up}
	sleep 100
	
	;en permanence
	While(test<50){
	
		; So the user knows what is being typed for them
		ToolTip %test%
		
		;delay in ms
		;Sleep, 200
		
		test := test + 1
		
		if(test = 20){
			;msgbox %test%
		}
		
		
		send {NumpadAdd}
		sleep 500
		
		DllCall("SetCursorPos", int, 500 int, 500)
	
		send {e down}
		sleep 100

		send {e up}
		sleep 100
		
		
		bottomCount := 0
		
		While(bottomCount<165){
			MouseMove,-5,0,0,R
			sleep 10
			bottomCount := bottomCount+1
		}
		
		sleep 500
		;flush
		send {e down}
		sleep 100

		send {e up}
		sleep 100
		
		sleep 500
		
		;sit back on
		send {e down}
		sleep 100

		send {e up}
		sleep 100
		
		;must counter the move for the loop
		DllCall("SetCursorPos", int, 2000 int, 2000)
		
		MouseMove, 2000,0,0,R
		
	}
	
    ; Finished, clear the tooltip
    ToolTip
	
return