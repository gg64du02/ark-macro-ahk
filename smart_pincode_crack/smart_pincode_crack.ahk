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
Esc::ExitApp     ; Exit the Script: Escape

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
    ;Sleep, 30000

    return
}

; Ctrl + Shift + Left mouse button
;+^LButton::
MButton::

    ; Ask the user where they want to start from and now many codes to try, as well as if they want to try the common pin codes first
	;start := 0
	
    InputBox, start, The pin code to start at
    InputBox, amount, The amout of pin codes to go through
	
	Loop
	{
		FileReadLine, line, four-digit-pin-codes-sorted-by-frequency-withcount.txt, %A_Index%
		if ErrorLevel
			break
		;MsgBox, 4, , Line #%A_Index% is "%line%".  Continue?
		;IfMsgBox, No
		;	return
		
		word_array := StrSplit(line, ",")  ; , splitting
		
		MsgBox % "The 1st word is " word_array[1]
		;MsgBox % "The 2nd word is " word_array[2]
		
        ; Pad the number with zeros if we need to
        code := word_array[1]
        ; Try the code
		MsgBox code: %code%
        Attempt(code)
		;start++
		
		
		
		if(Mod(start,30)=0){
			send {Tab}
			
			sleep, 100
			send {BS}
			sleep, 100
			send {BS}
			send {BS}
			sleep, 100
			send {BS}
			send {BS}
			sleep, 100
			send {BS}
			sleep, 100
			
			send, %start%
			sleep, 100
			
			send {F12}
			
			
			send {Tab}
			sleep, 100
			send {Tab}
			sleep, 100
		
		}
    ; Finished, clear the tooltip
    ToolTip
		
	}
	MsgBox, The end of the file has been reached or there was a problem.
	return

    Log("================================= All ============================================")

    while start <= amount
    {
        ; Pad the number with zeros if we need to
        code = % SubStr("0000" start, -3)
        ; Try the code
        Attempt(code)
        ; Onto the next
        start++
		
		if(Mod(start,30)=0){
			send {Tab}
			
			sleep, 100
			send {BS}
			sleep, 100
			send {BS}
			send {BS}
			sleep, 100
			send {BS}
			send {BS}
			sleep, 100
			send {BS}
			sleep, 100
			
			send, %start%
			sleep, 100
			
			send {F12}
			
			
			send {Tab}
			sleep, 100
			send {Tab}
			sleep, 100
		
		}
	
    }
    ; Finished, clear the tooltip
    ToolTip


Return

