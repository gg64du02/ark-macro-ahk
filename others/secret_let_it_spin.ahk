#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


F1::ExitApp

v::

test := 0

sleep, 2000

while(test<10){
;Loop, 1000
;{

	click 89 401

	sleep, 1000
	
	click 515 660

	sleep, 20000
	
	send, {Esc down}
	sleep, 200
	send, {Esc up}
	sleep, 200
	
	click 618 277
	
	sleep, 5000
	
	test := test+ 1
}
;}