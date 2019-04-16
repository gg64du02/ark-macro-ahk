#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;use to go forward

MButton::Send % "{w " . ( GetKeyState("w") ? "Up}" : "Down}" )

;MButton::Send % "{z " . ( GetKeyState("z") ? "Up}" : "Down}" )
