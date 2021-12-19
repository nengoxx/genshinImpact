#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; F12 toggles on/off the script
; Set up your game path at bottom of script to enable F9 launching the game.
; Binding for Chat includes suspension, meaning keyboard returns to normal
; 	while in chat.
; ======MODIFIER LIST
; <^ Left Ctrl
; >^ Right Ctrl
; ^ Any Ctrl
; <+ Left Shift
; >+ Right Shift
; + Any Shift
; <! Left Alt
; >! Right Alt
; ! Any Alt
; ======EXTRA MOUSE
; XButton1 Fourth mousebutton
; XButton2 Fifth mousebutton
; ======First key is PRESSED, second is TRANSLATION TARGET

; ==CONFIGURATIONS==
; ==Start simpleentertoggle on/off. F10 will still toggle
; ==this on and off once the script has started.
simpleentertoggle:=false

if (WinActive("ahk_class UnityWndClass")) {

	; ==These are script functions, and not game keybinds
	F10::
		simpleentertoggle:=!simpleentertoggle
	return
	; == F10 should be used if you exit/alt-tab game
	; == to disable the enter functionality for ingame chat
	; == as pressing enter outside of the game will still
	; == toggle script suspension on and off.
	F12::
		Suspend, Permit
		Suspend
	return
	
	; ==KEYBINDS BELOW==
	; ==Forward==
	w::w	
	; ==Backward==
	s::s
	; ==Left==
	a::a
	; ==Right==
	d::d
	; ==Normal Attack==
	LButton::LButton
	; ==Elemental Skill==
	e::e
	; ==Sprint==
	RButton::RButton
	LShift::LShift
	; ==Jump==
	space::space
	; ==Elemental Burst==
	q::q
	; ==Open Inventory==
	b::b
	; ==Open Character Screen==
	c::c
	; ==Open Map==
	m::m
	; ==Open Wish Screen==
	F3::F3
	; ==Open Adventurer Handbook Screen==
	F1::F1
	; ==Open Paimon Menu==
	Esc::Esc
	; ==Open Quest Menu==
	j::j
	; ==Open Navigation==
	v::v
	; ==Open Notification Details==
	y::y
	; ==Open Co-Op Screen=
	F2::F2
	; ==Open Chat Screen==
	Enter::
		Suspend, Permit
		If (simpleentertoggle) {
			Suspend
			Sendinput, {Enter down}
			keywait, Enter
			Sendinput, {Enter up}
		} else {
			Sendinput, {Enter}
		}
		Return
	; ==Open Domain Screen==
	u::u
	; ==Elemental Sight==
	MButton::MButton
	; ==Party Member 1==
	1::1
	; ==Party Member 2==
	2::2
	; ==Party Member 3==
	3::3
	; ==Party Member 4==
	4::4
	; ==Party Member 5==
	5::5
	; ==Party Member 1 + Burst==
	<!1::<!1
	; ==Party Member 2 + Burst==
	<!2::<!2
	; ==Party Member 3 + Burst==
	<!3::<!3
	; ==Party Member 4 + Burst==
	<!4::<!4
	; ==Party Member 5 + Burst==
	<!5::<!5
	; ==Switch Aim Mode==
	r::r
	; ==Pick Up/Interact==
	f::f
	; ==Switch Walk/Run==
	LCtrl::LCtrl
	; ==Check Tutorial Details==
	g::g
	; ==Open Events Menu==
	F5::F5
	; ==Open Battle Pass Screen==
	F4::F4
	; ==Challenge Interrupted==
	p::p
}

; Game launcher
F9::
Run, C:\Program Files\Genshin Impact\launcher.exe, C:\Program Files\Genshin Impact
return