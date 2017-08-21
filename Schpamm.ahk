#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxThreadsPerHotkey 2

;Menu, Tray, Icon, C:\Users\Matas\Desktop\PoGo\BotControl\18316-84.ico

; reikalingi variables
activeGUI=0

saved=0
started=0

; special spam arrays
OceanManArray := Object()
OceanManArray[0] := "🌊 OCEAN MAN 🌊 😍"
OceanManArray[1] := "Take me by the hand ✋"
OceanManArray[2] := "🏝️ lead me to the land 🏝️"
OceanManArray[3] := "that you understand 🙌"
OceanManArray[4] := "🌊 OCEAN MAN 🌊 😍"
OceanManArray[5] := "The voyage 🚲 to"
OceanManArray[6] := "the corner of the 🌎 globe "
OceanManArray[7] := "is a real trip 👌"
OceanManArray[8] := "🌊 OCEAN MAN 🌊 😍"
OceanManArray[9] := "The crust of a tan man "
OceanManArray[10] := "👳 imbibed by the sand 👍"
OceanManArray[11] := "💦 Soaking up the"
OceanManArray[12] := "💦 thirst of the land 💯"

GachiArray := Object()
GachiArray[0] := "♂ FUCK ♂ YOU ♂"
GachiArray[1] := "♂ I'LL SHOW YOU ♂"
GachiArray[2] := "♂ I'M THE DUNGEON MASTER ♂"
GachiArray[3] := "♂ I KNOW YOUR DEEP DARK FANTASIES ♂"
GachiArray[4] := "♂ SUCTION ♂"
GachiArray[5] := "♂ FUCKING SLAVE ♂"
GachiArray[6] := "♂ GET YOUR ASS BACK HERE ♂"
GachiArray[7] := "♂ TAKE IT, BOY ♂"
GachiArray[8] := "♂ YES ♂ SIR ♂"
GachiArray[9] := "♂ WOOP ♂"
GachiArray[10] := "♂ LUBE IT UP ♂"
GachiArray[11] := "♂ FISTING IS $300 ♂"
GachiArray[12] := "♂ THANK YOU SIR ♂"
GachiArray[13] := "♂ FUCKING SLAVE ♂"
GachiArray[14] := "♂ YOU RIPPED MY FUCKING PANTS ♂"
GachiArray[15] := "♂ FUCK ♂ YOU ♂"
GachiArray[16] := "♂ IT'S SO FUCKING DEEP ♂"
GachiArray[17] := "♂ COME ON COLLEGE BOY ♂"
GachiArray[18] := "♂ YES ♂ SIR ♂"
GachiArray[19] := "♂ FUCKING ♂ CUMMING ♂"
GachiArray[20] := "♂ AAAAAAAAAHHH ♂"
GachiArray[21] := "♂ OH ♂ MY ♂ SHOULDER ♂"
GachiArray[22] := "♂ FUCK YOU LEATHER MAN ♂"
GachiArray[23] := "♂ OH SHIT IM SORRY ♂"
GachiArray[24] := "♂ SORRY ♂ FOR ♂ WHAT? ♂"
GachiArray[25] := "♂ DO YOU LIKE WHAT YOU SEE? ♂"
GachiArray[26] := "♂ I DONT DO ANAL ♂"
GachiArray[27] := "♂ STICK YOUR FINGER IN MY ASS ♂"
GachiArray[28] := "♂ THATS ♂ AMAZING ♂"

WaveArray := Object()
WaveArray[0] := "-"
WaveArray[1] := "--"
WaveArray[2] := "---"
WaveArray[3] := "----"
WaveArray[4] := "-----"
WaveArray[5] := "------"
WaveArray[6] := "-------"
WaveArray[7] := "--------"
WaveArray[8] := "---------"
WaveArray[9] := "--------"
WaveArray[10] := "-------"
WaveArray[11] := "------"
WaveArray[12] := "-----"
WaveArray[13] := "----"
WaveArray[14] := "---"
WaveArray[15] := "--"
WaveArray[16] := "-"
WaveArray[17] := " "



; main GUI window: text spam and randomized spam
Gui, Main:New

GUI, Main:FONT, S30
GUI, Main:add, text, , Schpamm V0.4
GUI, Main:FONT, S15

Gui, Main:Add, Button,x500 y30 w100 h100 gSwitchToSpecial, Special spam

GUI, Main:add, text,x50 y100 , Config:
Gui, Main:Add, Edit,x50 w200 r1 vText, Text to spam
Gui, Main:Add, Edit,x50 y200 w100 r1 vDelay Number, 50

Gui, Main:Add, Edit,y270 x50 w60 r1 vRandLimit1 Number, 20
Gui, Main:Add, Edit,y270 x280 w60 r1 vRandLimit2 Number, 50

GUI, Main:FONT, S30
Gui, Main:Add, Button,x50 w500 h80 gStart , SAVE AND BEGIN
GUI, Main:FONT, S08
Gui, Main:Add, Checkbox, vUserandom, Use random shit instead of input (specify random length limits if you check this)
GUI, Main:add, text, , @2017 Matas Rastenis    |   F1 to start, F2 to stop, F3 to show GUI, F5 to quit |   Enjoy cyker
GUI, Main:add, text,x80 y65 , cuz scharkee get it huehuehhuuhu
GUI, Main:FONT, S15
GUI, Main:add, text,x160 y210 , Delay(ms)
GUI, Main:add, text,x260 y160 , Spam Text
GUI, Main:FONT, S10
GUI, Main:add, text,x120 y290 , Random Lower Char Limit
GUI, Main:add, text,x350 y290 , Random Upper Char Limit

GUI, Main:show

; second GUI reserved for specialized spam
Gui, Sec:New
GUI, Sec:FONT, S30
GUI, Sec:add, text, , Schpamm V0.4
GUI, Sec:FONT, S20
Gui, Sec:Add, Button,x400 y30 w140 h100 gSwitchToMain, Standard spam

Gui, Sec:Add, Radio,x50 y90 vOceanmanRadio Checked, Oceanman
Gui, Sec:Add, Radio,x50 y120 vWaveRadio, Wave
Gui, Sec:Add, Radio,x50 y150 vGachiRadio, Gachi fest
Gui, Sec:Add, Edit,x50 y250 w50 r1 vDelaySpecial Number, 100
GUI, Sec:add, text,x110 y250 , Speed(intervals in ms)
Gui, Sec:Add, Checkbox, vUserandomSpecial, Randomize order
Gui, Sec:Add, Button,x50 w500 h80 gStartSpecial , SAVE AND BEGIN
GUI, Sec:FONT, S08
GUI, Sec:add, text, , @2017 Matas Rastenis    |   F1 to start, F2 to stop, F3 to show GUI, F5 to quit |   Enjoy cyker

return


F1::

; MAIN SPAM
if activeGUI=0
{
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
}else ; SPECIAL SPAM
{
	if saved=1
	{
		started:=1
		SpamArray:=Object()
	
		if OceanmanRadio=1
		{
			SpamArray:=OceanManArray

			
		}else if WaveRadio=1
		{
			SpamArray:=WaveArray
		}else if GachiRadio=1
		{
			SpamArray:=GachiArray
		}

		currentLine=0
			
		length= % SpamArray.Length()

		if UserandomSpecial=1
		{
			Loop
			{
				Random, currentLine, 0,%length%
				Clipboard = % SpamArray[currentLine]
				Sleep, 5
				Send, ^v
				Sleep, %DelaySpecial%
				Send, {Enter}


				if GetKeyState("F2" , "P")
				{
					Clipboard:=
					started:=0
					Break
					
				}

			}

		}else{
			Loop
			{
				Clipboard = % SpamArray[currentLine]
				Sleep, 5
				Send, ^v
				Sleep, %DelaySpecial%
				Send, {Enter}

				if currentLine= %length% ; resets back to beginning
				{
					currentLine=0
				}
				currentLine++

				if GetKeyState("F2" , "P")
				{
					Clipboard:=
					started:=0
					Break
					
				}

			}
		}

			

			
	

	}else
	{
		MsgBox save the menuuu u feggit

	}

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

StartSpecial:

GuiControlGet, DelaySpecial
GuiControlGet, OceanmanRadio
GuiControlGet, WaveRadio
GuiControlGet, GachiRadio
GuiControlGet, UserandomSpecial

Gui,Sec:Hide

if DelaySpecial is not integer
{
      MsgBox ENTER A FUCKIN NUMBER U JEKASS ne srs stop breaking my shit
	  GUI, Sec:Show

}
saved:=1
return


SwitchToSpecial:
Gui,Main:Hide
Gui,Sec:Show
activeGUI=1

return

SwitchToMain:

Gui,Sec:Hide
Gui,Main:Show
activeGUI=0

return

F3::

if started=0
{
	if activeGUI=0
	{
    	Gui, Main:Show
	}else{
        Gui, Sec:Show
	}

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