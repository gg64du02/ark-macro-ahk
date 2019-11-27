#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Xres := 1024
Yres := 768

Xpos_center := Xres / 2
Ypos_center := Yres / 2

m::
;===============
;horse 6
;===============
MouseMove,  Xpos_center - 100, Ypos_center +350 , 100