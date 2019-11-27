#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

	
F1::
	;Send {}
	Send {q up}
	Send {d up}
	Reload

	
F2::
	;Send {Numpad9}
	loop_forever:=1
	
	;store previous value
	tmp_xpos:=0
	tmp_ypos:=0
	
	;diff the value from previous and current
	diff_xpos:=0
	diff_ypos:=0
	
	debug:=0
	
	;pwn for the 4 keys (0-100)
	;===y axis===
	z_8_pwm:=0
	s_8_pwm:=0
	;===x axis===
	q_pwm:=0
	d_pwm:=0
	
	
	
	while(loop_forever){
		MouseGetPos, xpos, ypos 
		
		diff_xpos:= tmp_xpos - xpos
		diff_ypos:= tmp_ypos - ypos
		
		if(diff_xpos=0){
			;don't change anything
		}
		else{
			;push the d or the qkey (integration)
			;d_pwm:=d_pwm-diff_xpos/2
			;q_pwm:=q_pwm+diff_xpos/2
			
			;equals to:
			d_pwm:=diff_xpos/2
			q_pwm:=diff_xpos/2
			
			if(diff_xpos>0){
				;increase pwm for the x axis
				
				;push the d key
			}
			else{
				;decrease pwm for the x axis
				
				;push the q key
			}
		}
		
		
		
		;making sure it max out
		if(d_pwm>100){
			d_pwm:=100
		}
		if(q_pwm>100){
			q_pwm:=100
		}
		
		;making sure it min out
		if(d_pwm<0){
			d_pwm:=0
		}
		if(q_pwm<0){
			q_pwm:=0
		}
		
		
		
		if(d_pwm>0){
			Send {q up}
			Send {d down}
		}
		
		if(q_pwm>0){
			Send {d up}
			Send {q down}
		}
		
		
		;updating the tmp values
		tmp_xpos:=xpos
		tmp_ypos:=ypos
	}
	
