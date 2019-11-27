#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


F1::
	Reload

m::

test := 0

While(test<100){

test := test + 1

Xres := 1024
Yres := 768

Xpos_center := Xres / 2
Ypos_center := Yres / 2

;ok 500
sleep 1000

;MouseClick, X1, Xpos_center + 350 , Ypos_center - 200 , 1, 0

MouseClick, X1, Xpos_center + 100 , Ypos_center + 250 , 1, 0

sleep 100

MouseClick, left

sleep 100

Send {LButton down}

;===============================
;select which horse to bet onto (1st horse)
;===============================

sleep 100

Send {LButton up}

sleep 100

;===============================
;(1st horse)
;===============================
;MouseClick, X1, Xpos_center - 300 , Ypos_center - 150 , 1, 0

;===============
;horse 6
;===============
MouseClick, X1,  Xpos_center - 100, Ypos_center +325 , 100

sleep 100

Send {LButton down}

sleep 100

Send {LButton up}

;===============================
;start having fun
;===============================

;===============================
;find the right arrow for betting
;===============================
MouseClick, X1, Xpos_center + 275 , Ypos_center +0 , 1, 0

sleep 1000

Send {LButton down}

;===============================
;betting button
;===============================
sleep 200

;MouseClick, X1, Xpos_center + 150 , Ypos_center +200 , 1, 0

;MouseClickDrag, Left, Xpos_center + 275 , Ypos_center +0 , Xpos_center + 150 , Ypos_center +200 , 80

MouseMove,  Xpos_center + 150 , Ypos_center +200 , 100

sleep 1000

Send {Enter down}

sleep 1000

Send {Enter up}

sleep 22000

Send {LButton up}

sleep 15000

;523 734
;===============================
;click replay
;===============================

MouseMove,  Xpos_center + 0 , Ypos_center +350 , 100

sleep 1000

Send {LButton down}

sleep 1000

Send {LButton down}


	}