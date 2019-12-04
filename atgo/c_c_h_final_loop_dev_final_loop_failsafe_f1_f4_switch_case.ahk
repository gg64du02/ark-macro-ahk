#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


F1::
	Reload

F4::

test := 0

While(test<100){

	test := test + 1

	Xres := 1024
	Yres := 768

	Xpos_center := Xres / 2
	Ypos_center := Yres / 2

	;adjust to allow recovery
	sleep 5000
	
	whatMenuIsCurrentlyON := whatMenuIsCurrentlyON()
	
	;MsgBox %whatMenuIsCurrentlyON%
	
	if(whatMenuIsCurrentlyON="BettingScreen"){
		;TODO: bet here
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

		sleep 35000

		Send {LButton up}
	}
	
	
	if(whatMenuIsCurrentlyON="BetAndRulesScreen"){
		;TODO: click on replay here
	}


	if(whatMenuIsCurrentlyON="ResutsScreeen"){
		;TODO: click on replay here
		;===============================
		;click replay
		;===============================

		MouseMove,  Xpos_center + 0 , Ypos_center +350 , 100

		sleep 1000

		Send {LButton down}

		sleep 1000

		Send {LButton down}
	}


}
	
;==================FUNCTION==============
whatMenuIsCurrentlyON(){

	PixelGetColor, colorUn, 3, 26, RGB
	PixelGetColor, colorDeux, 4, 26, RGB
	PixelGetColor, colorTrois, 3, 27, RGB
	PixelGetColor, colorQuatre, 4, 27, RGB


	;MsgBox whatMenuIsCurrentlyON:oui1
	if(	( colorUn = "0x828B9B" ) AND ( colorDeux = "0x828B9B" ) ){
		;MsgBox whatMenuIsCurrentlyON:oui2
		if(	( colorTrois = "0xB8C5DB" ) AND ( colorQuatre = "0xB8C5DB" ) ){
		;end of race screen here
		return "EndOfRace"
		}
	}
	
	;146 56 151515
	;25+3 28+26 141618
	;1+3 150+26 8F918F
	
	;PixelGetColor, colorCinq, 146, 46, RGB
	;PixelGetColor, colorCinq, 54, 28, RGB
	PixelGetColor, colorCinq, 4, 176, RGB
	;MsgBox colorCinq:%colorCinq%
	
	if(	( colorCinq = "0x151515" )){
		;MsgBox "greypixel"
	}
	
	;TODO: remove conflict with ResutsScreeen
	;MsgBox whatMenuIsCurrentlyON:oui7
	if(	( colorUn = "0xDE1400" ) AND ( colorDeux = "0xDE1400" ) ){
		;MsgBox whatMenuIsCurrentlyON:oui8
		if(	( colorTrois = "0xDE1400" ) AND ( colorQuatre = "0xDE1400" ) ){
			if(	( colorCinq = "0xE92400" )){
				;end of race screen here
				return "BettingScreen"
			}
		}
	}
	
	
	;DONE: remove conflict with BetAndRulesScreen
	;MsgBox whatMenuIsCurrentlyON:oui3
	if(	( colorUn = "0xDE1400" ) AND ( colorDeux = "0xDE1400" ) ){
		;MsgBox whatMenuIsCurrentlyON:oui4
		if(	( colorTrois = "0xDE1400" ) AND ( colorQuatre = "0xDE1400" ) ){
			if(	( colorCinq = "0x8F918F" )){
				;end of race screen here
				return "ResutsScreeen"
			}	
		}
	}
	
	;DONE: remove conflict with ResutsScreeen
	;MsgBox whatMenuIsCurrentlyON:oui5
	if(	( colorUn = "0x12002F" ) AND ( colorDeux = "0x12002F" ) ){
		;MsgBox whatMenuIsCurrentlyON:oui6
		if(	( colorTrois = "0x130030" ) AND ( colorQuatre = "0x130030" ) ){
			if(	( colorCinq = "0x210044" )){
				;end of race screen here
				return "BetAndRulesScreen"
			}
		}
	}
	
	;TODO: detect rules screen when miss-click ?


	;TODO
	return 0
}