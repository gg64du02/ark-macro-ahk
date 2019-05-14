#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MButton::

test := 0

while(test<10){
;Loop, 1000
;{
	Send {Up}
	send, ^a
	send, {BS}
	send, {Enter}
	send, {Enter}
	sleep, 500
	
	;MsgBox % Mod(test,3)
	
	if(Mod(test,10)=0){
		MsgBox %test%
		;click search bar
		click 1728 42
		;press enter
		sleep, 500
		send, {Enter}
		
		;click access
		sleep, 500
		click 1858 240
		
		sleep, 500
		click 985 985
	
	}
	
	test := test+ 1
}
;}

w::return