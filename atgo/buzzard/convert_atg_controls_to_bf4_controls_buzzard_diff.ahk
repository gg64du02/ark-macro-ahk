﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
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
		
		if(debug=1){
			MsgBox | xpos:%xpos% ypos:%ypos% | diff_xpos:%diff_xpos% diff_ypos:%diff_ypos% | tmp_xpos:%tmp_xpos% tmp_ypos:%tmp_ypos% 
		}
		
		
		if(diff_xpos=0){
			;don't change anything
		}
		else{
			;push the d or the qkey (integration) (un peu trop ample en movement)
			;d_pwm:=d_pwm-diff_xpos/2
			;q_pwm:=q_pwm+diff_xpos/2
			
			d_pwm:=d_pwm-diff_xpos/4
			q_pwm:=q_pwm+diff_xpos/4
			
			;equals to:
			;d_pwm:=diff_xpos*10
			;q_pwm:=diff_xpos*10
			
			if(diff_xpos>0){
				;increase pwm for the x axis
				
				;push the d key
			}
			else{
				;decrease pwm for the x axis
				
				;push the q key
			}
		}
		
		if(diff_ypos=0){
			;don't change anything
		}
		else{
			;eight_pwm:=eight_pwm-diff_ypos/4
			;five_pwm:=five_pwm+diff_ypos/4
			if(diff_ypos>0){
				;increase pwm for the y axis
				;push the 8 key
			}
			else{
				;decrease pwm for the y axis
				;push the 5 key
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
		
		if(debug=2){
			MsgBox d_pwm:%d_pwm% q_pwm:%q_pwm%
		}
		
		;doing pwm onto controls
		pwm_loop_time:=0
		while(pwm_loop_time<2){
			;issuing controls based on time
			if(d_pwm>pwm_loop_time*10){
				;Send {d down}
			}
			else{
				;Send {d up}
			}
			if(q_pwm>pwm_loop_time*10){
				;Send {q down}
			}
			else{
				;Send {q up}
			}
			sleep 1
			
			
			;time elapsing
			pwm_loop_time:=pwm_loop_time+1
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
	
