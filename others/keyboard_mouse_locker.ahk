;https://www.autohotkey.com/boards/viewtopic.php?t=33925
global AllKeys := get_AllKeys()
global Message := "Keyboard and mouse are locked!`nPress Alt+F2 to unlock."
Return ; end of auto-execute section


!F1:: Disable_Keys(True)    ; disable keys
!F2:: Disable_Keys(False)   ; enable keys



;-------------------------------------------------------------------------------
get_AllKeys() { ; return a pipe delimited list of all keys
;-------------------------------------------------------------------------------
    Keys := "NumpadEnter|Home|End|PgUp|PgDn|Left|Right|Up|Down|Del|Ins"

    Loop, 254
        If KeyName := GetKeyName(Format("VK{:X}", A_Index))
            Keys .= "|" KeyName

    For key, val in {Control: "Ctrl", Escape: "Esc"}
        Keys := StrReplace(Keys, key, val)

    Return, Keys
}



;-------------------------------------------------------------------------------
Disable_Keys(BOOL := False) { ; (en/dis) -able all keys
;-------------------------------------------------------------------------------
    global Block := BOOL ? "On" : "Off"

    For each, KeyName in StrSplit(AllKeys, "|")
        Hotkey, *%KeyName%, Block_Input, %Block% UseErrorLevel

    Block_Input:
        If (Block = "On") {
            ;Progress, B1 ZH0, %Message%
            Sleep, 2000
            ;Progress, Off
        }
    Return
}