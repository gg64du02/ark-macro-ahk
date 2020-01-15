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
	
	md:=new MouseDelta(func("xMonitor"))
	md.Start()
	fn:=Func("xMonitor").Bind("Timer")
	SetTimer, % fn, 100
	
	while(loop_forever){
	}
	


;code from https://www.autohotkey.com/boards/viewtopic.php?t=29215
;======================================================================
;================NOT MY CODE!=============================================
;======================================================================

xMonitor(id:=0,dx:=0,dy:=0){
	static X:=0
	X+=dx
	static Y:=0
	Y+=dy
	
	global xpos
	global ypos
	
	xpos:=dx
	ypos:=dY
	
	if (id="Timer") {
		CoordMode,ToolTip,Screen
		;ToolTip, % "The mouse moved: " X " " Y " pixels in the x-direction the last 50 ms.", 0,0
		;ToolTip, % "xpos,ypos " xpos " " ypos " pixels in the x-direction the last 50 ms.", 0,0
		
		
		
		loop_forever:=1
		
		;store previous value
		tmp_xpos:=0
		tmp_ypos:=0
		
		;diff the value from previous and current
		diff_xpos:=0
		diff_ypos:=0
		
		;initialize values
		global xpos := 0
		global ypos := 0
		

		
		debug:=0
		
		;pwn for the 4 keys (0-100)
		;===y axis===
		eight_pwm:=0
		five_pwm:=0
		;===x axis===
		static q_pwm:=0
		static d_pwm:=0
		
		
		;MouseGetPos, xpos, ypos 
		
		;xpos:=X
		;ypos:=Y
		
		;diff_xpos:= tmp_xpos - xpos
		;diff_ypos:= tmp_ypos - ypos
		
		diff_xpos:=X
		diff_ypos:=Y
		
		if(debug=1){
			;;MsgBox | xpos:%xpos% ypos:%ypos% | diff_xpos:%diff_xpos% diff_ypos:%diff_ypos% | tmp_xpos:%tmp_xpos% tmp_ypos:%tmp_ypos% 
			;ToolTip, xpos:%xpos% ypos:%ypos% | diff_xpos:%diff_xpos% diff_ypos:%diff_ypos% | tmp_xpos:%tmp_xpos% tmp_ypos:%tmp_ypos% , 0,0
			ToolTip, % "The mouse moved: " X " " Y " pixels in the x-direction the last 50 ms.", 0,0
		}
		
		
		if(diff_xpos=0){
			;don't change anything
		}
		else{
			;push the d or the qkey (integration) (un peu trop ample en movement)
			;d_pwm:=d_pwm-diff_xpos/2
			;q_pwm:=q_pwm+diff_xpos/2
			
			d_pwm:=d_pwm+diff_xpos/4
			q_pwm:=q_pwm-diff_xpos/4
			
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
			eight_pwm:=eight_pwm+diff_ypos/4
			five_pwm:=five_pwm-diff_ypos/4
			if(diff_ypos>0){
				;increase pwm for the y axis
				;push the 8 key
			}
			else{
				;decrease pwm for the y axis
				;push the 5 key
			}
		}
		
		
		;making sure it max out (x axis)
		if(d_pwm>100){
			d_pwm:=100
		}
		if(q_pwm>100){
			q_pwm:=100
		}
		;making sure it max out (y axis)
		if(eight_pwm>100){
			eight_pwm:=100
		}
		if(five_pwm>100){
			five_pwm:=100
		}
		
		;making sure it min out (x axis)
		if(d_pwm<0){
			d_pwm:=0
		}
		if(q_pwm<0){
			q_pwm:=0
		}
		;making sure it min out (y axis)
		if(eight_pwm<0){
			eight_pwm:=0
		}
		if(five_pwm<0){
			five_pwm:=0
		}
		
		
		if(debug=2){
			MsgBox d_pwm:%d_pwm% q_pwm:%q_pwm%
		}
		
		
		
		;x axis output
		if(d_pwm>0){
			Send {q up}
			Send {d down}
		}
		if(q_pwm>0){
			Send {d up}
			Send {q down}
		}
		
		;y axis output
		if(eight_pwm>0){
			Send {Numpad5 up}
			Send {Numpad8 down}
		}
		if(five_pwm>0){
			Send {Numpad8 up}
			Send {Numpad5 down}
		}
		
		
		;updating the tmp values
		tmp_xpos:=xpos
		tmp_ypos:=ypos
		
		X:=0
		Y:=0
		
		
	}
	return
}


; Instantiate this class and pass it a func name or a Function Object
; The specified function will be called with the delta move for the X and Y axes
; Normally, there is no windows message "mouse stopped", so one is simulated.
; After 10ms of no mouse movement, the callback is called with 0 for X and Y
Class MouseDelta {
	State := 0
	__New(callback){
		;~ this.TimeoutFn := this.TimeoutFunc.Bind(this)
		this.MouseMovedFn := this.MouseMoved.Bind(this)

		this.Callback := callback
	}

	Start(){
		static DevSize := 8 + A_PtrSize, RIDEV_INPUTSINK := 0x00000100
		; Register mouse for WM_INPUT messages.
		VarSetCapacity(RAWINPUTDEVICE, DevSize)
		NumPut(1, RAWINPUTDEVICE, 0, "UShort")
		NumPut(2, RAWINPUTDEVICE, 2, "UShort")
		NumPut(RIDEV_INPUTSINK, RAWINPUTDEVICE, 4, "Uint")
		; WM_INPUT needs a hwnd to route to, so get the hwnd of the AHK Gui.
		; It doesn't matter if the GUI is showing, it still exists
		Gui +hwndhwnd
		NumPut(hwnd, RAWINPUTDEVICE, 8, "Uint")
 
		this.RAWINPUTDEVICE := RAWINPUTDEVICE
		DllCall("RegisterRawInputDevices", "Ptr", &RAWINPUTDEVICE, "UInt", 1, "UInt", DevSize )
		OnMessage(0x00FF, this.MouseMovedFn)
		this.State := 1
		return this	; allow chaining
	}
	
	Stop(){
		static RIDEV_REMOVE := 0x00000001
		static DevSize := 8 + A_PtrSize
		OnMessage(0x00FF, this.MouseMovedFn, 0)
		RAWINPUTDEVICE := this.RAWINPUTDEVICE
		NumPut(RIDEV_REMOVE, RAWINPUTDEVICE, 4, "Uint")
		DllCall("RegisterRawInputDevices", "Ptr", &RAWINPUTDEVICE, "UInt", 1, "UInt", DevSize )
		this.State := 0
		return this	; allow chaining
	}
	
	SetState(state){
		if (state && !this.State)
			this.Start()
		else if (!state && this.State)
			this.Stop()
		return this	; allow chaining
	}

	Delete(){
		this.Stop()
		;~ this.TimeoutFn := ""
		this.MouseMovedFn := ""
	}
	
	; Called when the mouse moved.
	; Messages tend to contain small (+/- 1) movements, and happen frequently (~20ms)
	MouseMoved(wParam, lParam){
		Critical
		; RawInput statics
		static DeviceSize := 2 * A_PtrSize, iSize := 0, sz := 0, pcbSize:=8+2*A_PtrSize, offsets := {x: (20+A_PtrSize*2), y: (24+A_PtrSize*2)}, uRawInput
 
		static axes := {x: 1, y: 2}
 
		; Get hDevice from RAWINPUTHEADER to identify which mouse this data came from
		VarSetCapacity(header, pcbSize, 0)
		If (!DllCall("GetRawInputData", "UPtr", lParam, "uint", 0x10000005, "UPtr", &header, "Uint*", pcbSize, "Uint", pcbSize) or ErrorLevel)
			Return 0
		ThisMouse := NumGet(header, 8, "UPtr")

		; Find size of rawinput data - only needs to be run the first time.
		if (!iSize){
			r := DllCall("GetRawInputData", "UInt", lParam, "UInt", 0x10000003, "Ptr", 0, "UInt*", iSize, "UInt", 8 + (A_PtrSize * 2))
			VarSetCapacity(uRawInput, iSize)
		}
		sz := iSize	; param gets overwritten with # of bytes output, so preserve iSize
		; Get RawInput data
		r := DllCall("GetRawInputData", "UInt", lParam, "UInt", 0x10000003, "Ptr", &uRawInput, "UInt*", sz, "UInt", 8 + (A_PtrSize * 2))
 
		x := 0, y := 0	; Ensure we always report a number for an axis. Needed?
		x := NumGet(&uRawInput, offsets.x, "Int")
		y := NumGet(&uRawInput, offsets.y, "Int")
 
		this.Callback.(ThisMouse, x, y)
 
		;~ ; There is no message for "Stopped", so simulate one
		;~ fn := this.TimeoutFn
		;~ SetTimer, % fn, -50
	}
 
	;~ TimeoutFunc(){
		;~ this.Callback.("", 0, 0)
	;~ }
 
}

