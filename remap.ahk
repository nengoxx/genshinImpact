
;----------------------------------------------------------------------
#IfWinActive Genshin Impact
#SingleInstance force
#NoEnv
#Warn
#Persistent

botting := true
lastbotting := true
autoE := false
stickyF := false

pressed1 := false
pressed2 := false
pressed3 := false
pressed4 := false
pressedF := false
pressedE := false
pressedSpace := false

Loop {
	if (not WinActive("Genshin Impact")) {
		if (botting) {
			lastbotting := true
			botting := false
		}
		;~ botting := false
		pressed1 := false
		pressed2 := false
		pressed3 := false
		pressed4 := false
		pressedF := false
		pressedE := false
		pressedSpace := false
	} 
	else {
		if (lastbotting) {
			botting := true
			lastbotting := false
		}
		;~ botting := true
	}
	Sleep 20
	if (botting) {
		gosub SpamSwitch
	}
}

F5::
	botting := not botting
	return
	
~$+f::
	stickyF := not stickyF
	if (stickyF) {
		pressedF := not pressedF
	}
	return
	
~<::
	autoE := not autoE
	return

;----------------------------------------------------------------------
;~ ~$f::
	;~ if (stickyF) {
		;~ pressedF := not pressedF
	;~ } else {
		;~ pressedF := true
	;~ }
	;~ return
	
~$f::
	pressedF := true
	return
	
~$f up::
	if (not stickyF) {
		pressedF := false
	}
	return
	
~$e::
	pressedE := true
	return
	
~$e up::
	pressedE := false
	return

~$Space::
	pressedSpace := true
	return
	
~$Space up::
	pressedSpace := false
	return

~$1::
	pressed1:=true
	;~ Sleep 1100
	return
	
~$1 up::
	pressed1:=false
	return
	
~$2::
	pressed2:=true
	;~ Random, VariableDelay, 120, 200
	;~ Sleep, %VariableDelay%
	;~ gosub checkState
	if (botting and autoE and pressed2) {
		SetTimer, SpamE, Off
		SetTimer, SpamE, -1
	}
	return
	
~$2 up::
	pressed2:=false
	return
 	
~$3::
	pressed3:=true
	;~ Sleep 1100
	;~ Random, VariableDelay, 120, 200
	;~ Sleep, %VariableDelay%
	;~ if (botting) {
		;~ SetTimer, SpamE, -1
	;~ }
	return
	
~$3 up::
	pressed3:=false
	return
 
~$4::
	pressed4:=true
	if (botting and autoE and pressed4) {
		SetTimer, SpamE, Off
		SetTimer, SpamE, -1
	}
	return
	
~$4 up::
	pressed4 := false
	return
	
;~ +4::
	;~ SendInput, {4}
	;~ Random, VariableDelay, 120, 200
	;~ Sleep, %VariableDelay%
	;~ if (botting) {
		;~ SetTimer, SpamQ, -1
		;~ Random, VariableDelay, 1800, 2000
		;~ Sleep, %VariableDelay%
		;~ SetTimer, Spam1, -1
	;~ }
	;~ return
	
;~ ~!4::
	;~ Random, VariableDelay, 120, 200
	;~ Sleep, %VariableDelay%
	;~ if (botting) {
		;~ Random, VariableDelay, 1800, 2000
		;~ Sleep, %VariableDelay%
		;~ SetTimer, Spam1, -1
	;~ }
	;~ return

;------------------------------------------------------------------------

checkState:
	pressed1 := GetKeyState("1","P")
	pressed2 := GetKeyState("2","P")
	pressed3 := GetKeyState("3","P")
	pressed4 := GetKeyState("4","P")
	pressedF := GetKeyState("f","P")
	pressedE := GetKeyState("e","P")
	return
	
checkStateFalse:
	if (not GetKeyState("1","P")) { 
	pressed1 := false 
	}
	if (not GetKeyState("2","P")) { 
	pressed2 := false 
	}
	if (not GetKeyState("3","P")) { 
	pressed3 := false 
	}
	if (not GetKeyState("4","P")) { 
	pressed4 := false 
	}
	if (not GetKeyState("f","P") and not stickyF) {
	pressedF := false 
	}
	if (not GetKeyState("e","P")) { 
	pressedE := false 
	}
	return

SpamSwitch:
if (botting) {
	gosub checkStateFalse
	if (pressedF) {
		Random, VariableDelay, 50, 80
		Sleep, %VariableDelay%
		gosub PressF
	}
	;~ if (pressed1) {
		;~ Random, VariableDelay, 50, 100
		;~ Sleep, %VariableDelay%
		;~ SendInput, {1}
		;~ gosub PressSwitch
	;~ } else if (pressed2) {
		;~ Random, VariableDelay, 50, 100
		;~ Sleep, %VariableDelay%
		;~ SendInput, {2}
		;~ gosub PressSwitch
	;~ } else if (pressed3) {
		;~ Random, VariableDelay, 50, 100
		;~ Sleep, %VariableDelay%
		;~ SendInput, {3}
		;~ gosub PressSwitch
	;~ } else if (pressed4) {
		;~ Random, VariableDelay, 50, 100
		;~ Sleep, %VariableDelay%
		;~ SendInput, {4}
		;~ gosub PressSwitch
	;~ } else if (pressedF) {
		;~ Random, VariableDelay, 50, 80
		;~ Sleep, %VariableDelay%
		;~ gosub PressF
		;~ SetTimer,PressF, -%VariableDelay%
	;~ } else if (pressedE) {
		;~ Random, VariableDelay, 50, 80
		;~ Sleep, %VariableDelay%
		;~ gosub PressE
	;~ }
	;~ else if (pressedSpace) {
		;~ Random, VariableDelay, 50, 80
		;~ Sleep, %VariableDelay%
		;~ SendInput, {SPACE}
	;~ }
}
	return
	
PressSpace:
if(botting){
	;~ gosub checkState
	if (pressedSpace) {
		SendInput, {SPACE}
	}
}
	return
	
PressF:
if(botting){
	;~ gosub checkState
	if (pressedF) {
		SendInput, {f}
	}
}
	return
	
PressE:
if(botting){
	;~ gosub checkState
	if (pressedE) {
		SendInput, {e}
	}
}
	return
	
PressSwitch:
if(botting){
	gosub checkStateFalse
	if (pressed1) {
		SendInput, {1}
	} else if (pressed2) {
		SendInput, {2}
	} else if (pressed3) {
		SendInput, {3}
	} else if (pressed4) {
		SendInput, {4}
	}
}
	return
	

;------------------------------------------------------------------------

SpamE:
	Random, VariableDelay, 120, 200
	Sleep, %VariableDelay%
    kDown := A_TickCount
    While ((A_TickCount - kDown) < 250) {
        SendInput, {e}
        Random, VariableDelay, 100, 120
		Sleep, %VariableDelay%
		SendInput, {e}
		Random, VariableDelay, 100, 120
		Sleep, %VariableDelay%
    }
	return

SpamQ:
    kDown := A_TickCount
    While ((A_TickCount - kDown) < 250) {
        SendInput, {q}
        Random, VariableDelay, 100, 120
		Sleep, %VariableDelay%
		SendInput, {q}
		Random, VariableDelay, 100, 120
		Sleep, %VariableDelay%
    }
	return
	
Spam1:
    kDown := A_TickCount
    While ((A_TickCount - kDown) < 1000) {
        SendInput, {1}
        Random, VariableDelay, 100, 120
		Sleep, %VariableDelay%
		SendInput, {1}
		Random, VariableDelay, 100, 120
		Sleep, %VariableDelay%
    }
	return
	
SpamQ_return1:
    kDown := A_TickCount
	spamtime := 250
    While ((A_TickCount - kDown) < spamtime) {
        SendInput, {q}
        Random, VariableDelay, 100, 120
		Sleep, %VariableDelay%
		SendInput, {q}
		Random, VariableDelay, 100, 120
    }
	Sleep 1000
	SetTimer, Spam1, -1
	return

;----------------------------------------------------------------
;Disabled keys:

;~ $LShift::
	;~ if(botting) {
		;~ SendInput, {LAlt down}
	;~ } else {
		;~ SendInput, {LShift down}
	;~ }
	;~ return
	
;~ $LShift up::
	;~ SendInput, {LAlt up}
	;~ SendInput, {LShift up}
	;~ return

;----------------------------------------------------------------