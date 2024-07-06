
key_Skip = Z
key_Skip2 = C
key_AFKatk = V
WindowFocus = ahk_class UnityWndClass

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
DetectHiddenWindows, On
DetectHiddenText, On
CoordMode Mouse, Screen
CoordMode Pixel, Screen
SetTitleMatchMode, 2
Process, Priority,, High
Setbatchlines,-1
SetKeyDelay,-1, -1
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay,-1
CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) 
{
	Try 
	{
		If (A_IsCompiled) 
			Run *RunAs "%A_ScriptFullPath%" /restart
		Else 
			Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
	}
	ExitApp
}




Hotkey, *~$%key_Skip%, Label_Skip, on
Hotkey, *~$%key_Skip2%, Label_Skip2, on
Hotkey, *~$%key_AFKatk%, Label_AFKatk, on

Menu,Tray,NoStandard
Menu,Tray,DeleteAll
Menu,Tray, add, Reload, MetkaMenu4
Menu,Tray, Icon, Reload, shell32.dll, 239, 16
Menu,Tray, Default, Reload
Menu,Tray, add
Menu,Tray, add, Exit, MetkaMenu1
Menu,Tray, Icon, Exit, shell32.dll,28, 16
Menu,Tray, Icon, imageres.dll, 80
Return



Label_AFKatk:
IfWinNotActive, %WindowFocus%
	Return
ToggleR1 := !ToggleR1
if (ToggleR1)
    SetTimer, SpamKeys, 100
else
    SetTimer, SpamKeys, Off
ToolTip,,,0,2
Return
SpamKeys:
	Tooltip, Afk Atk`nPres %key_AtkFarm%,round(A_ScreenWidth * .5 - 50),0,2
    SendInput, {vk1}
	Sleep 200
    SendInput, {vk20}
	Sleep 200
    SendInput, {vk45}
	Sleep 200
    SendInput, {vk51}
	Sleep 200
if FuncCursorVisible()
{
	ToggleR1 := !ToggleR1
	SetTimer, SpamKeys, Off
	ToolTip,,,0,2
}
return


Label_Skip:
IfWinNotActive, %WindowFocus%
	Return
ToggleR2 := !ToggleR2
if (ToggleR2)
    SetTimer, SetTimerSkip, 100
else
    SetTimer, SetTimerSkip, Off
ToolTip,,,0,2
return
SetTimerSkip:
Tooltip, Скип диалогов`nPres %key_Skip%,round(A_ScreenWidth * .5 - 50),0,2
x1:=round(A_ScreenWidth * (2093 / 2560))
y1:=round(A_ScreenHeight * (997 / 1440))
Click %x1%, %y1%
Sleep 1
x1:=round(A_ScreenWidth * (1491 / 2560))
y1:=round(A_ScreenHeight * (1119 / 1440))
Click %x1%, %y1%
Sleep 1
x1:=round(A_ScreenWidth * (1478 / 2560))
y1:=round(A_ScreenHeight * (1050 / 1440))
Click %x1%, %y1%
Sleep 1
x1:=round(A_ScreenWidth * (2019 / 2560))
y1:=round(A_ScreenHeight * (250 / 1440))
Click %x1%, %y1%
Sleep 1
x1:=round(A_ScreenWidth * (1485 / 2560))
y1:=round(A_ScreenHeight * (704 / 1440))
Click %x1%, %y1%
Sleep 1
if !FuncCursorVisible()
{
	ToggleR2 := !ToggleR2
	SetTimer, SetTimerSkip, Off
	ToolTip,,,0,2
}
return



Label_Skip2:
IfWinNotActive, %WindowFocus%
	Return
Sleep 50
x1:=round(A_ScreenWidth * (2344 / 2560))
y1:=round(A_ScreenHeight * (179 / 1440))
Click %x1%, %y1%
Sleep 550
x1:=round(A_ScreenWidth * (2344 / 2560))
y1:=round(A_ScreenHeight * (179 / 1440))
Click %x1%, %y1%
Sleep 660
x1:=round(A_ScreenWidth * (1485 / 2560))
y1:=round(A_ScreenHeight * (911 / 1440))
Click %x1%, %y1%
Return

*~$End::
MetkaMenu1:
ExitApp
Return
*~$Home::
MetkaMenu4:
Reload
Return




;============================Функция: есть курсор мышки - 1, нет курсора - 0
FuncCursorVisible()
{
	StructSize1337 := A_PtrSize + 16
	VarSetCapacity(InfoStruct1337, StructSize1337)
	NumPut(StructSize1337, InfoStruct1337)
	DllCall("GetCursorInfo", UInt, &InfoStruct1337)
	Result1337 := NumGet(InfoStruct1337, 8)
	if (Result1337 <> 0)
		CursorVisible := 1
	Else
		CursorVisible := 0
	Return CursorVisible
}






