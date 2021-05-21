;TODO
;nach 10 min neue edelsteine herstelen/ wenn icon grau ist neue edelsteine herstellen
;Imagesearchtes nur laufen lassen wenn afk
;wenn monster da ist töten
;wenn grau / grün an bestimmter stelle neue wissenschaftler starten , wenn rot begraben
;screen höhe/breite und dann mousemove relativ dazu
;wenn im kampf nach grünen pixeln suchen und draufdrücken solange noch leben hat

^q::
        MouseGetPos, xpos, ypos 
        afk = false
        MsgBox,4,,, Script starten?
        IfMsgBox, Yes
        while(!afk){
                if GetKeyState("Esc","P")
                        ExitApp, 1
                Sleep, 31000 
                SearchForChests()
                SearchForMonster()
                SearchForScientists()
        }

        Else
                GuiClose:
        ExitApp, 2

}
Verkaufen(){
        MouseMove, 1615, 111 
        Sleep, 1
        MouseClick
        Sleep, 1
        MouseMove, 635, 792
        Sleep, 1
        MouseClick
        Sleep, 1
        MouseMove, 1413, 304
        Sleep, 1
        MouseClick
        Sleep, 1
        Return
}
SearchForChests(){
        PixelSearch, FoundX, FoundY, 100, 350, 140, 950, 0x295882,10,Fast
        if (ErrorLevel = 1)
        Return
If (FoundX){
        MouseMove, FoundX, FoundY+3
        sleep,1
        MouseClick
        Send,{Down}
        Send,{Down}
        Send,{Down}
        ShiftKlickLine()
        ShiftKlickLine()
        ShiftKlickLine()
        ShiftKlickLine()
        ShiftKlickLine()	
        Sleep, 10
        Verkaufen()
        SearchForChests()
}

}

ShiftKlickLine(){
        index = 0
        offsetX = 138
        While (index<10){

                MouseMove, 195+(index*offsetX), 625
                Send, {Shift down}
                MouseClick
                Send, {Shift up}
                Sleep, 2
                index++ 

                If (index == 10){
                        index = 0
                        Send,{Up}
                        break

                }

        }
        Return
}
SearchForMonster(){
        found = False
        If (found)
        KillMonster()
        Else
        Return
}
KillMonster(){

}
SearchForScientists(){
        SearchForScientistLeft()
        SearchForScientistMiddle()
        SearchForScientistRight()
        Return
}
SearchForScientistLeft(){
  found = False
        If (found)
        TakeRewardsAndGiveLeftQuest()
        Else
        Return
}
SearchForScientistMiddle(){
  found = False
        If (found)
        TakeRewardsAndGiveLeftQuest()
        Else
        Return
}
SearchForScientistRight(){
  found = False
        If (found)
        TakeRewardsAndGiveLeftQuest()
        Else
        Return
}
TakeRewardsAndGiveLeftQuest(){

}
MoveMouseTo(x,y){
        
}