#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Esc::ExitApp

v::

test := 0

while(test<10){
;Loop, 1000
;{

	click 1590 480

	sleep, 200
	
	click 1021 603
	
	sleep, 500
	
	click 104 629
	
	sleep, 500
	
	click 104 629
	
	sleep, 500
	
	send, {Shift down}
	send, {F5}
	send, {Shift up}
	
	sleep, 5000
	
	test := test+ 1
}
;}