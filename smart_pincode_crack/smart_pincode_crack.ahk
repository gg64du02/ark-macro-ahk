/**
 * @Author: Stuart Bannerman
 * @Date:   2015-08-17 10:05:03
 * @Last Modified by: Stuart Bannerman
 * @Last Modified time: 2015-09-20 82:15:12
 * @Repository: https://github.com/m3talstorm/ArkPincodeCracker
 * @License: MIT
 * @Description: A bot written in AutoHotKey to brute force the pin code locks in ARK: Survival Evolved
 */


; Standard keybinds
+^R::Reload      ; Reloads Script: Control + Shift + R
+^P::Pause       ; (Un)Pauses  Script: Control + Shift + P
Ins::Suspend     ; Suspend Script: Insert
F1::ExitApp     ; Exit the Script: Escape


;list of ranked common pincode https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/four-digit-pin-codes-sorted-by-frequency-withcount.csv

; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv
; Stop multiple bots from running
#SingleInstance force
; Recommended for new scripts due to its superior speed and reliability.
SendMode Input
; Ensures a consistent starting directory.
SetWorkingDir %A_ScriptDir%
; Speed up script execution...hopefully: http://ahkscript.org/docs/commands/SetBatchLines.htm
SetBatchLines -1

; Outputs a value to a log file
Log(value)
{
    FileAppend,
    (

    %value%
    ), attempts.log
}

; Tries a pin code
Attempt(code)
{
    ; So the user knows what is being typed for them
    ToolTip %code%
    ; Open up the pin code window
    SendInput, e
    ; Wait for the window to 'load'
    Sleep, 650
    ; Simulate key presses of typing in the code
    SendInput, %code%
    ; Log the code that was tried
    Log(code)
    ; Wait for the window to close
    Sleep, 800
	;wait for the invisible cooldown after a wrong pin
    ;eSleep, 30000

    return
}

; Ctrl + Shift + Left mouse button
;+^LButton::
MButton::

    ; Ask the user where they want to start from and now many codes to try, as well as if they want to try the common pin codes first
	;start := 0
	
    InputBox, start1, Enter the pincode to resume at
	
	MsgBox start1: %start1%
	Loop
	{
		;MsgBox start1: %start1%
		;MsgBox start2: %start2%
		FileReadLine, line, four-digit-pin-codes-sorted-by-frequency-withcount.txt, %A_Index%
		if ErrorLevel
			break
		;MsgBox, 4, , Line #%A_Index% is "%line%".  Continue?
		;IfMsgBox, No
		;	return
		
		word_array := StrSplit(line, ",")  ; , splitting
		
		;MsgBox % "The 1st word is " word_array[1]
		;MsgBox % "The 2nd word is " word_array[2]
		
		; Pad the number with zeros if we need to
		code := word_array[1]
		
		;MsgBox code: %code%e
		
		if(start1==""){
			;MsgBox 1if(not (start1=="")){
			;MsgBox Attempt(code): %code%
			Attempt(code)
			
			
			sleep, 1000
			send, {Enter}
			sleep, 1000
			
			send, %code%
			sleep, 1000
			send, {Tab}
			sleep, 1000
			
			send {F12}
			sleep, 1000
			
			send {Esc}
			sleep, 1000
		}
		else{
			;MsgBox 1!if(not (start1=="")){
			if(start1==code){
				start1=
			}
			continue
		}
		
		
		
		start2 =%code%
		
	}
    ; Finished, clear the tooltip
    ToolTip
	

Return

