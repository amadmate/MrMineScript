;TODO
;nach 10 min neue edelsteine herstelen/ wenn icon grau ist neue edelsteine herstellen
;Imagesearchtes nur laufen lassen wenn afk
;wenn monster da ist töten
;wenn grau / grün an bestimmter stelle neue wissenschaftler starten , wenn rot begraben
;screen höhe/breite und dann mousemove relativ dazu
;wenn im kampf nach grünen pixeln suchen und draufdrücken solange noch leben hat

^q::
        MouseGetPos, xpos, ypos 
        afk = 2
        x = 0
        y = 0
        x2 = 0
        y2 = 0 
        color = 0
        global Fx 
        global Fy 
        global what
        MsgBox,4,, Script starten?
        IfMsgBox Yes
        While (true){

                if(afk == 2){

                        if GetKeyState("Esc","P")
                                ExitApp, 1
                        SearchFor(1)
                        SearchFor(2)
                        SearchFor(3)
                        ;SearchFor(4)
                        ; SearchForPixels(0x295882)
                        ;SearchForPixels(0x00F9DD)
                        ;SearchForMonster()
                        ;SearchForScientists()
                        Sleep, 31000 

                }
                Else
                        ExitApp, 1 ;temp
        }

        Else
                MouseGetPos, MouseX, MouseY
        PixelGetColor, color, %MouseX%, %MouseY%
        MsgBox x %MouseX% y %MouseY%  c %color%
GuiClose:
ExitApp, 2

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
OpenChests(){
        if GetKeyState("Esc","P")
                ExitApp, 1
        MouseMove, Fx, Fy+3
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
        SearchFor(what) 
}
SearchForPixels(x,y,x2,y2,color,v){

        PixelSearch, FoundX, FoundY, x, y, x2, y2, color,v,Fast
        if (ErrorLevel = 1)
                Return
        Else 
                global Fx := FoundX
        global Fy := FoundY 
Return 1

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
                        Send,{Esc}
                        break

                }
                
        }
Return
}
SearchForMonster(){
        MouseMove, Fx, Fy+3
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
        KillMonster()
}

KillMonster(){
        alive = 1
        count = 0
        
        while(alive ==1){
                If (SearchForPixels(524, 226, 526, 227,0x111199,3)==1){
                if (SearchForPixels(563, 663, 1329, 847,0xADD7AE,20)==1){
                        
                        MouseMove, Fx+5, Fy+5
                        Sleep, 2
                        MouseClick
                        Sleep, 5
                        
                }
                }
                
                Else{
                alive = 2
                }
                
               
                

               
               
        }
        SearchFor(what)
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
;searchfor 1 = chest, 2 = gchest , 3 monster, 4 scientist, 5 oil, ...
SearchFor(thing){
        If (thing == 1){
                if (SearchForPixels(100, 350, 140, 950,0x295882,3)==1){
                global what = 1
                OpenChests()
                return
                }
                        
        }

        If (thing == 2) {
                if (SearchForPixels(100, 350, 140, 950,0x00F9DD,3)==1){
 global what = 2
                OpenChests()
                return
                }
                       
        } 

        If (thing ==3){
                If (SearchForPixels(100, 350, 140, 950,0x0000FF,3)==1){
global what = 3
                SearchForMonster()
                Return
                }
                        
        }
Return
        ;If (thing ==4)
        ; SearchForMonster(;green)

}