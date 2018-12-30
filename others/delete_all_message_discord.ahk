#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MButton::

i := 0

;while(i<100){
Loop, 50
{
	Send {Up}
	send, ^a
	send, {BS}
	send, {Enter}
	send, {Enter}
	sleep,500
	i := i + 1
}
;}