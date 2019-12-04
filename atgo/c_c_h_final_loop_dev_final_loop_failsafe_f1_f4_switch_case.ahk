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
	
	MsgBox %whatMenuIsCurrentlyON%


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
	
	;PixelGetColor, colorCinq, 146, 46, RGB
	PixelGetColor, colorCinq, 54, 28, RGB
	MsgBox colorCinq:%colorCinq%
	
	if(	( colorCinq = "0x151515" )){
		MsgBox "greypixel"
	}
	
	;MsgBox whatMenuIsCurrentlyON:oui7
	if(	( colorUn = "0xDE1400" ) AND ( colorDeux = "0xDE1400" ) ){
		;MsgBox whatMenuIsCurrentlyON:oui8
		if(	( colorTrois = "0xDE1400" ) AND ( colorQuatre = "0xDE1400" ) ){
			if(	( colorCinq = "0xE11400" )){
				;end of race screen here
				return "BettingScreen"
			}
		}
	}
	
	
	
	
	;TODO: remove conflict with BetAndRulesScreen
	;MsgBox whatMenuIsCurrentlyON:oui3
	if(	( colorUn = "0xDE1400" ) AND ( colorDeux = "0xDE1400" ) ){
		;MsgBox whatMenuIsCurrentlyON:oui4
		if(	( colorTrois = "0xDE1400" ) AND ( colorQuatre = "0xDE1400" ) ){
		;end of race screen here
		return "ResutsScreeen"
		}
	}
	
	;TODO: remove conflict with ResutsScreeen
	;MsgBox whatMenuIsCurrentlyON:oui5
	if(	( colorUn = "0x12002F" ) AND ( colorDeux = "0x12002F" ) ){
		;MsgBox whatMenuIsCurrentlyON:oui6
		if(	( colorTrois = "0x130030" ) AND ( colorQuatre = "0x130030" ) ){
		;end of race screen here
		return "BetAndRulesScreen"
		}
	}


	;TODO
	return 0
}