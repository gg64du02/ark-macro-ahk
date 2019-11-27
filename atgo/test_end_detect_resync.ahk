#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

m::


;===========================================================================================
;end screen recync starts
;===========================================================================================
;3 26

PixelGetColor, colorUn, 3, 26, RGB
PixelGetColor, colorDeux, 4, 26, RGB
PixelGetColor, colorTrois, 3, 27, RGB
PixelGetColor, colorQuatre, 4, 27, RGB

;MsgBox colorUn: %colorUn%
;MsgBox colorDeux: %colorDeux%
;MsgBox colorTrois: %colorTrois%
;MsgBox colorQuatre: %colorQuatre%


;end_screen_displayed_for := 

end_screen_not_yet_diplayed :=0

while(end_screen_not_yet_diplayed  = 0)
{
	PixelGetColor, colorUn, 3, 26, RGB
	PixelGetColor, colorDeux, 4, 26, RGB
	PixelGetColor, colorTrois, 3, 27, RGB
	PixelGetColor, colorQuatre, 4, 27, RGB
	
	;MsgBox oui1
	if(	( colorUn = "0x828B9B" ) AND ( colorDeux = "0x828B9B" ) ){
		;MsgBox oui2
		if(	( colorTrois = "0xB8C5DB" ) AND ( colorQuatre = "0xB8C5DB" ) ){
			;MsgBox oui3
			end_screen_not_yet_diplayed :=1	
		}
	}
}

sleep 10000

PixelGetColor, colorUn, 3, 26, RGB
PixelGetColor, colorDeux, 4, 26, RGB
PixelGetColor, colorTrois, 3, 27, RGB
PixelGetColor, colorQuatre, 4, 27, RGB

;MsgBox oui1
if(	( colorUn = "0x828B9B" ) AND ( colorDeux = "0x828B9B" ) ){
	;MsgBox oui2
	if(	( colorTrois = "0xB8C5DB" ) AND ( colorQuatre = "0xB8C5DB" ) ){
		;MsgBox oui3
		end_screen_not_yet_diplayed :=1	
		
		Send {Esc down}
		sleep 3000
		Send {Esc up}
		sleep 2000
		
		
		Send {LButton down}
		sleep 2000
		Send {LButton up}
		sleep 2000
		
	}
}
;===========================================================================================
;end screen recync ends
;===========================================================================================