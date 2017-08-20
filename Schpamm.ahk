#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxThreadsPerHotkey 2

;Menu, Tray, Icon, C:\Users\Matas\Desktop\PoGo\BotControl\18316-84.ico


saved=0
yo=1
started=0

; main GUI window: text spam and randomized spam
Gui, Main:New

GUI, Main:FONT, S40
GUI, Main:add, text, , Schpamm V0.4
GUI, Main:FONT, S20
Gui, Main:Add, Edit, w300 r1 vText, Text to spam
Gui, Main:Add, Edit,w200 r1 vDelay Number, 50

Gui, Main:Add, Edit,y250 x50 w60 r1 vRandLimit1 Number, 20
Gui, Main:Add, Edit,y250 x280 w60 r1 vRandLimit2 Number, 50

GUI, Main:FONT, S30
Gui, Main:Add, Button,x50 w500 h100 gStart , SAVE & BEGIN
GUI, Main:FONT, S08
Gui, Main:Add, Checkbox, vUserandom, Use random shit instead of input (specify random length limits if you check this)
GUI, Main:add, text, , @2017 Matas Rastenis    |   F1 to start, F2 to stop, F3 to show GUI, F5 to quit |   Enjoy cyker
GUI, Main:add, text,x80 y90 , cuz scharkee get it huehuehhuuhu
GUI, Main:FONT, S15
GUI, Main:add, text,x260 y200 , Delay
GUI, Main:FONT, S10
GUI, Main:add, text,x120 y260 , Random Lower Char Limit
GUI, Main:add, text,x350 y260 , Random Upper Char Limit

GUI, Main:show

; second GUI reserved for specialized spam
Gui, Sec:New
GUI, Sec:FONT, S40
GUI, Sec:add, text, , Schpamm V0.4
GUI, Sec:FONT, S20

return


F1::

if saved=1
{
started:=1
   Loop
   {
        if Userandom=1
		{
		    Random, rand1, RandLimit1,RandLimit2
			Text:=RandomStr(rand1,48,122)
		}
   
   
   
        Send, %Text%
		Sleep, %Delay%
		Send, {Enter}
		
		
		if GetKeyState("F2" , "P")
		{
		
		   started:=0
		   Break
		   
		}
		

   }

}else
{
    MsgBox save the menuuu u feggit

}

return

Start:

GuiControlGet, Text
GuiControlGet, Delay
GuiControlGet, Userandom
GuiControlGet, RandLimit1
GuiControlGet, RandLimit2

Gui,Main:Hide

if Delay is not integer
{
      MsgBox ENTER A FUCKIN NUMBER U JEKASS ne srs stop breaking my shit
	  GUI, Main:Show

}
saved:=1
return



F3::

if started=0
{
Gui, Main:Show
}




return



RandomStr(l , i , x ) { ; length, lowest and highest Asc value
	Loop, %l% {
		Random, r, i, x
		s .= Chr(r)
	}
	Return, s
}


Shutdown:
ExitApp


GuiClose:
ExitApp

F5::
ExitApp





return