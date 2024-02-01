
; Author: Usman 
; Program Name: PackMan
; Program Description: 
; Date

INCLUDE Irvine32.inc
INCLUDE macros.inc
Includelib Winmm.lib

BUFFER_SIZE = 501
BUFFER_SIZE1 = 5000
ExitProcess PROTO, dwExitCode:DWORD

.data

;Sound

music db 'D:\pacman_beginning.wav',0,0,0,0
music1 db 'D:\pacman_beginning.wav',0,0,0,0
music2 db 'D:\pacman_death.wav',0,0,0,0
music3 db 'D:\ghostkill.wav',0,0,0,0
music4 db 'D:\pacman_eatfruit.wav',0,0,0,0
PlaySound  PROTO, pszSound:PTR BYTE,hmod:DWORD,fdwSound:DWORD


ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
groundup BYTE "-------------------------------------------------------------",0
grounddown BYTE "-------------------------------------------------------------",0
groundup1 BYTE "----------------------------------------------------------",0
grounddown1 BYTE "----------------------------------------------------------",0

ground1 BYTE "|",0ah,0
ground2 BYTE "|",0
temp byte ?

name BYTE ?
yourname BYTE "Player Name: ",0
yourlevel BYTE "Player Level: ",0

whiteOnblack dd white (black*16)
strScore BYTE "Your score is: ",0
score dw 0

packman BYTE "Pac-Man Game!",0
coal Byte "Coal 23'",0

xPos BYTE 20
yPos BYTE 20

xCoinPos BYTE ?
yCoinPos BYTE ?

inputChar BYTE ?

key db 0
;Levels Completed

level1completed db "<<--Congratulations!!! Level #1 is completed move to the next Level-->> ",0
level2completed db "<<--Congratulations!!! Level #2 is completed move to the next Level-->> ",0
level db 1

;****************************************** Maze 1 Arrays for Coins  & Ghost **************************************

;Coin Collections Arrays

coinx1 BYTE 18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92
coiny1 BYTE 4


coinx2 BYTE 18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92
coiny2 BYTE 25

coiny3 BYTE 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24
coinx3 BYTE 18


coiny4 BYTE 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24
coinx4 BYTE 92

coin1y1 BYTE 6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
coin1x1 BYTE 11

coin1y2 BYTE 6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
coin1x2 BYTE 99

coin2y1 BYTE 10,11,12,13,14,15,16,17,18,19,20
coin2x1 BYTE 4

coin2y2 BYTE 8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
coin2x2 BYTE 108

coin3y2 BYTE 10,11,12,13,14,15,16,17,18,19,20
coin3x2 BYTE 115


scorechange db ?

lives BYTE 3
strLife BYTE "Lives: ",0
xPosG1 BYTE 25
xPosG2 BYTE 56
xPosG3 BYTE 85
yPosG1 BYTE 10
yPosG2 BYTE 10
yPosG3 BYTE 10
moveG1 BYTE 'u'
moveG2 BYTE 'u'
moveG3 BYTE 'u'



;****************************************** Maze 2 Arrays for Coins  & Ghost **************************************


;Coin Collections Arrays

coinx1Maze22 BYTE 24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92
coiny1Maze22 BYTE 4

coinx2Maze22 BYTE 24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92
coiny2Maze22 BYTE 25

coiny3Maze22 BYTE 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24
coinx3Maze22 BYTE 24


coiny4Maze22 BYTE 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24
coinx4Maze22 BYTE 92

coin1y1Maze22 BYTE 6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
coin1x1Maze22 BYTE 16

coin1y2Maze22 BYTE 6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
coin1x2Maze22 BYTE 101

coin2y1Maze22 BYTE 10,11,12,13,14,15,16,17,18,19,20
coin2x1Maze22 BYTE 4

coin3y2Maze22 BYTE 10,11,12,13,14,15,16,17,18,19,20
coin3x2Maze22 BYTE 115

coin2y2Maze22 BYTE 8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
coin2x2Maze22 BYTE 108

coin2y3Maze22 BYTE 8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
coin2x3Maze22 BYTE 10


;mid Block

coinx1Maze2 BYTE 36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80
coiny1Maze2 BYTE 7

coinx2Maze2 BYTE 36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80
coiny2Maze2 BYTE 22

coiny3Maze2 BYTE 8,9,10,11,12,13,14,15,16,17,18,19,20,21
coinx3Maze2 BYTE 36

coiny4Maze2 BYTE 8,9,10,11,12,13,14,15,16,17,18,19,20,21
coinx4Maze2 BYTE 80


coin1x1Maze2 BYTE 2,4,6,8,10,110,112,114,116
coin1y1Maze2 BYTE 2

coin1x2Maze2 BYTE 2,4,6,8,10,110,112,114,116
coin1y2Maze2 BYTE 28

coin1y3Maze2 BYTE 3,4,5,6,7,23,24,25,26,27
coin1x3Maze2 BYTE 2

coin1y4Maze2 BYTE 3,4,5,6,7,23,24,25,26,27
coin1x4Maze2 BYTE 117


fruitex1 BYTE 88
fruitey1 BYTE 5

fruitex2 BYTE 28
fruitey2 BYTE 24

fruitex3 BYTE 70
fruitey3 BYTE 17

fruitex4 BYTE 6
fruitey4 BYTE 4

fruitex5 BYTE 105
fruitey5 BYTE 15

fruites_score db "F",0

;Ghost 

xPosG1Maze2  BYTE 8
xPosG2Maze2  BYTE 30
xPosG3Maze2  BYTE 85
xPosG4Maze2  BYTE 111
yPosG1Maze2  BYTE 9
yPosG2Maze2  BYTE 14
yPosG3Maze2  BYTE 17
yPosG4Maze2  BYTE 9
moveG1Maze2  BYTE 'u'
moveG2Maze2  BYTE 'd'
moveG3Maze2  BYTE 'u'
moveG4Maze2  BYTE 'd'


;****************************************** Maze 3 Arrays for Coins  & Ghost **************************************

;Coin Collections Arrays


coin1y1Maze33 BYTE 6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
coin1x1Maze33 BYTE 16

coin1y2Maze33 BYTE 6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
coin1x2Maze33 BYTE 101

coin2y1Maze33 BYTE 10,11,12,13,14,15,16,17,18,19,20
coin2x1Maze33 BYTE 4

coin3y2Maze33 BYTE 10,11,12,13,14,15,16,17,18,19,20
coin3x2Maze33 BYTE 115

coin2y2Maze33 BYTE 8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
coin2x2Maze33 BYTE 108

coin2y3Maze33 BYTE 8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
coin2x3Maze33 BYTE 9


;mid Block

coin1x1Maze3 BYTE 2,4,6,8,10,110,112,114,116
coin1y1Maze3 BYTE 2

coin1x2Maze3 BYTE 2,4,6,8,10,110,112,114,116
coin1y2Maze3 BYTE 28

coin1y3Maze3 BYTE 3,4,5,6,7,23,24,25,26,27
coin1x3Maze3 BYTE 2

coin1y4Maze3 BYTE 3,4,5,6,7,23,24,25,26,27
coin1x4Maze3 BYTE 117


coinx11Maze2 BYTE 47,49,51,53,55,57,59,61,63,65,67
coiny11Maze2 BYTE 7

coinx22Maze2 BYTE 47,49,51,53,55,57,59,61,63,65,67
coiny22Maze2 BYTE 23

coinx55Maze2 BYTE 26,28,30,91,93,95
coiny55Maze2 BYTE 10

coinx66Maze2 BYTE 26,28,30,91,93,95
coiny66Maze2 BYTE 20

fruitex1Maze3 BYTE 100
fruitey1Maze3 BYTE 4
moveFruite1Maze3 db 'u'

fruitex2Maze3 BYTE 28
fruitey2Maze3 BYTE 24

fruitex3Maze3 BYTE 57
fruitey3Maze3 BYTE 14

fruitex4Maze3 BYTE 6
fruitey4Maze3 BYTE 4

fruitex5Maze3 BYTE 118
fruitey5Maze3 BYTE 27

fruitex6Maze3 BYTE 57
fruitey6Maze3 BYTE 4

fruitex7Maze3 BYTE 57
fruitey7Maze3 BYTE 26


fruites_score1Maze3 db "F",0
fruites_scoreMaze3 db "?",0

;Ghost 

xPosG1Maze3  BYTE 8
xPosG2Maze3  BYTE 33
xPosG3Maze3  BYTE 85
xPosG4Maze3  BYTE 109
xPosG5Maze3  BYTE 23
xPosG6Maze3  BYTE 27
xPosG7Maze3  BYTE 32
xPosG8Maze3  BYTE 80
yPosG1Maze3  BYTE 9
yPosG2Maze3  BYTE 16
yPosG3Maze3  BYTE 17
yPosG4Maze3  BYTE 11
yPosG5Maze3  BYTE 8
yPosG6Maze3  BYTE 22
yPosG7Maze3  BYTE 3
yPosG8Maze3  BYTE 27
moveG1Maze3  BYTE 'u'
moveG2Maze3  BYTE 'd'
moveG3Maze3  BYTE 'u'
moveG4Maze3  BYTE 'd'
moveG5Maze3  BYTE 'u'
moveG6Maze3  BYTE 'u'
moveG7Maze3  BYTE 'u'
moveG8Maze3  BYTE 'u'

;Player

stringstars db "*",0

;Maze Layout

stars db " . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ",0
pattern db " . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ",0
coin dd ".",0

mazelines dd 4
rows db ?

;Page 1

hammadshabbir db "Hammad Shabbir",0
rollNo db "22I-1140",0
section db "CS-F",0
level_of_the_game db "Level: ",0
cutting db "-----------",0
cutting1 db "|"

borderTopLeft db "*****",0
borderTopRight db "*****",0
borderLeft db "*****",0
borderRight db "*****",0

blackonGray dd black (gray*16)
userinput db "Enter Your Name: ",0
input db 20 DUP(?)  

menu1 db "-----------------------",0
menu2 db "--------------",0
menu3 db "------",0

;Page 2

menuofthegame db "<<<--------Menu Options-------->>>",0
instruction db "-> Instructions ",0
pausegame db "-> Pause Game",0
levels db "-> Levels",0
startgame db "-> Start Game",0

;Page 3

ghostmovement db "-> Player can moving upto 4 directions",0
wallscollision db "-> Player can stay away from walls. IF player and walls collide player can lost on live :(",0
enemycollision db "-> PLayer can also dogging from enemy",0
collectioncoins db "-> Player can move in that direction to collect coins and increase your score to win it!!! ",0 

;Page 4

level1 db "Level 1 - Simple maze layout & moving of  Ghost away from walls & collectiong coins and increase the score",0
level2 db "Level 2 - Complex maze layout and collection of fruits and add and extra score",0
level3 db "Level 3 - Fixed obstacles, hidden shortcuts, teleportation paths and add an extra ghosts",0


;page 5

gameover1 db "You Lost all Lives",0 
gameover db "<<------- Game Over :( ------->>",0

;Page 6

winner db "!!!!!Congratulations!!!!!",0

;Maze 

tiles1 db "------",0
tiles2 db "|",0
tiles3 db "---------",0

tileborder db "######",0


tiles5 db "#########################",0
tiles05 db "##############",0



tiles7 db "##############################",0

tiles8 db "#########################################################################",0

tiles11 db "#################",0


index dd 2

;File Handling



buffer1 BYTE BUFFER_SIZE DUP(?)

filename1 BYTE "gamescore.txt",0
fileHandle1 HANDLE ?
scoreStr BYTE 12 DUP(0) 

buffer BYTE BUFFER_SIZE DUP(?)
filename BYTE "output.txt",0
fileHandle HANDLE ?
errMsg BYTE "Cannot open file",0dh,0ah,0
sizesmall db "Buffer size is small",0
error db "Error for file reading. ",0

.code
main PROC
  
  ;Page 1

  Sart:
   
   ;draw PackMan Game on Screen &  Name of user as an input
   mov eax,black(gray*16)
   call SetTextColor
   call clrScr
   
   ;Draw PackMan Game!
   mov dl,58
   mov dh,10
   call Gotoxy    
   mov edx,OFFSET packman
   call WriteString
   call crlf   
   
   ;Draw BorderLeft
   mov dl,10
   mov dh,1
   call Gotoxy    
   mov edx,OFFSET borderTopLeft
   call WriteString
   call crlf  
  
  
  ;Draw BorderRight
  mov dl,120
  mov dh,1
  call Gotoxy    
  mov edx,OFFSET borderTopRight
  call WriteString
  call crlf  
  
  ;Draw BorderLeft
  mov dl,10
  mov dh,28
  call Gotoxy    
  mov edx,OFFSET borderLeft
  call WriteString
  call crlf  
  
  
  ;Draw BorderRight
  mov dl,120
  mov dh,28
  call Gotoxy    
  mov edx,OFFSET borderRight
  call WriteString
  call crlf  



    ; Open or create a file for writing

    mov edx, OFFSET filename
    call CreateOutputFile
    mov fileHandle, eax

    ; Check if file is opened successfully
    cmp eax, INVALID_HANDLE_VALUE
    je FileError

    ; Get user input
    mov dl,56
    mov dh,12
    call Gotoxy  
    mov edx, OFFSET userinput
    call WriteString
    mov ecx, BUFFER_SIZE
    mov edx, OFFSET buffer
    call ReadString

    ; Write to the file
    mov eax, fileHandle
    mov edx, OFFSET buffer
    mov ecx, eax            ; Length of the string
    call WriteToFile

    ; Close the file
    call CloseFile

    ; Complete the operation
    jmp Done

FileError:
    mov edx, OFFSET errMsg
    call WriteString

Done:

  ;Page 2

  Menu:

   INVOKE PlaySound, OFFSET music, NULL, 11h
   mov eax,10
   call delay

    
  ;draw PackMan Game on Screen &  Name of user as an input
  mov eax,black(gray*16)
  call SetTextColor
  call clrScr
  
  ;Draw BorderLeft
  mov dl,10
  mov dh,1
  call Gotoxy    
  mov edx,OFFSET borderTopLeft
  call WriteString
  call crlf  
  
  
  ;Draw BorderRight
  mov dl,120
  mov dh,1
  call Gotoxy    
  mov edx,OFFSET borderTopRight
  call WriteString
  call crlf  
  
  ;Draw BorderLeft
  mov dl,10
  mov dh,28
  call Gotoxy    
  mov edx,OFFSET borderLeft
  call WriteString
  call crlf  
  
  
  ;Draw BorderRight
  mov dl,120
  mov dh,28
  call Gotoxy    
  mov edx,OFFSET borderRight
  call WriteString
  call crlf  
  
  
  ;Draw Menu for the Game!
  mov dl,49
  mov dh,9
  call Gotoxy    
  mov edx,OFFSET menuofthegame
  call WriteString
  call crlf   
  
  ;Draw Instruction!
  mov dl,55
  mov dh,12
  call Gotoxy    
  mov edx,OFFSET instruction
  call WriteString
  call crlf   
  
  ;User Pause Screen
  mov dl,55
  mov dh,14
  call Gotoxy   
  mov edx,offset pausegame
  call writestring
  call crlf   
  
  ;User Level
  mov dl,55
  mov dh,16
  call Gotoxy   
  mov edx,offset levels
  call writestring
  call crlf   
  
  ;Start Game
  mov dl,55
  mov dh,18
  call Gotoxy   
  mov edx,offset startgame
  call writestring
  call crlf   
  
  
  call ReadChar
  mov inputChar,al
  
  cmp inputChar,'w'
  je Instructions
  
  cmp inputChar, 'a'
  je LevelGame
  
  cmp inputChar,'s'
  je Game 
  
  
  cmp inputChar,'p'
  cmp level,1
  je level11
  cmp level,2
  je level22
  cmp level,3
  je level33
  
  level11:
  je Game

  level22:
  je Game1

  Level33:
  je Game2



  ;3rd Page

  Instructions:

   mov eax,black(gray*16)
   call SetTextColor
   call clrScr

   ;Draw BorderLeft
   mov dl,10
   mov dh,1
   call Gotoxy    
   mov edx,OFFSET borderTopLeft
   call WriteString
   call crlf  

   
   ;Draw BorderRight
   mov dl,120
   mov dh,1
   call Gotoxy    
   mov edx,OFFSET borderTopRight
   call WriteString
   call crlf  

   ;Draw BorderLeft
   mov dl,10
   mov dh,28
   call Gotoxy    
   mov edx,OFFSET borderLeft
   call WriteString
   call crlf  

   
   ;Draw BorderRight
   mov dl,120
   mov dh,28
   call Gotoxy    
   mov edx,OFFSET borderRight
   call WriteString
   call crlf  

   ;Menu Design
   mov dl,55
   mov dh,4
   call Gotoxy    
   mov edx,OFFSET menu1
   call WriteString
   call crlf 

   mov dl,59
   mov dh,5
   call Gotoxy    
   mov edx,OFFSET menu2
   call WriteString
   call crlf 


   mov dl,63
   mov dh,6
   call Gotoxy    
   mov edx,OFFSET menu3
   call WriteString
   call crlf 


   mov dl,55
   mov dh,22
   call Gotoxy    
   mov edx,OFFSET menu1
   call WriteString
   call crlf 

   mov dl,59
   mov dh,21
   call Gotoxy    
   mov edx,OFFSET menu2
   call WriteString
   call crlf 


   mov dl,63
   mov dh,20
   call Gotoxy    
   mov edx,OFFSET menu3
   call WriteString
   call crlf 



   ;Draw Ghost Movement!
   mov dl,23
   mov dh,9
   call Gotoxy    
   mov edx,OFFSET ghostmovement
   call WriteString
   call crlf   
   
   ;Draw Walls Collision!
   mov dl,23
   mov dh,11
   call Gotoxy    
   mov edx,OFFSET wallscollision
   call WriteString
   call crlf   
   
   ;Draw Eneny Collision!
   mov dl,23
   mov dh,13
   call Gotoxy    
   mov edx,OFFSET enemycollision
   call WriteString
   call crlf   
   
   ;Draw Collect Coins!
   mov dl,23
   mov dh,15
   call Gotoxy    
   mov edx,OFFSET collectioncoins
   call WriteString
   call crlf   
   
   
   call ReadChar
   mov inputChar,al

   cmp inputChar,'w'
   je Menu


  ;4th Page
  
  LevelGame:
  
  mov eax,black(gray*16)
  call SetTextColor
  call clrScr
  
  ;Draw BorderLeft
  mov dl,10
  mov dh,1
  call Gotoxy    
  mov edx,OFFSET borderTopLeft
  call WriteString
  call crlf  
  
  
  ;Draw BorderRight
  mov dl,120
  mov dh,1
  call Gotoxy    
  mov edx,OFFSET borderTopRight
  call WriteString
  call crlf  
  
  ;Draw BorderLeft
  mov dl,10
  mov dh,28
  call Gotoxy    
  mov edx,OFFSET borderLeft
  call WriteString
  call crlf  
  
  
  ;Draw BorderRight
  mov dl,120
  mov dh,28
  call Gotoxy    
  mov edx,OFFSET borderRight
  call WriteString
  call crlf  
  
  
     ;Menu Design
   mov dl,55
   mov dh,4
   call Gotoxy    
   mov edx,OFFSET menu1
   call WriteString
   call crlf 

   mov dl,59
   mov dh,5
   call Gotoxy    
   mov edx,OFFSET menu2
   call WriteString
   call crlf 


   mov dl,63
   mov dh,6
   call Gotoxy    
   mov edx,OFFSET menu3
   call WriteString
   call crlf 


   mov dl,55
   mov dh,20
   call Gotoxy    
   mov edx,OFFSET menu1
   call WriteString
   call crlf 

   mov dl,59
   mov dh,19
   call Gotoxy    
   mov edx,OFFSET menu2
   call WriteString
   call crlf 


   mov dl,63
   mov dh,18
   call Gotoxy    
   mov edx,OFFSET menu3
   call WriteString
   call crlf 

  ;Draw Level 1!
  mov dl,13
  mov dh,9
  call Gotoxy    
  mov edx,OFFSET level1
  call WriteString
  call crlf   
  
  ;Draw Level 2!
  mov dl,13
  mov dh,11
  call Gotoxy    
  mov edx,OFFSET level2
  call WriteString
  call crlf   
  
  ;Draw Level 3!
  mov dl,13
  mov dh,13
  call Gotoxy    
  mov edx,OFFSET level3
  call WriteString
  call crlf   
  
  
  call ReadChar
  mov inputChar,al
  
  cmp inputChar, 'a'
  je Menu

  cmp inputChar,'d'
  je Game 
  jne next

  next:
  cmp inputChar,'k'
  je Game1 
  jne next1

  next1:
  cmp inputChar,'l'
  je Game2 
  exit
  
         ;*********************************************  LEVEL 1 *********************************************************

  Game:

    
     INVOKE PlaySound, OFFSET music1, NULL, 11h
     mov eax,100
     call delay

    mov eax,black (black*16)
    call SetTextColor
    call clrscr
    ;************************************************* Maze 1 ********************************************************* 

       ; draw ground at (0,29):
    mov eax, gray (gray*16)
    call SetTextColor

    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    ;For Left Side in Vertical
    mov ecx,27
    mov dh,2
    mov temp,dh
    l1:
    mov dh,temp
    mov dl,0
    call Gotoxy
    mov edx,OFFSET ground2  ;"|"
    call WriteString
    inc temp
    loop l1
    
    ;For Right Side in Vertical
   
    mov ecx,27
    mov dh,2
    mov temp,dh
    l2:
    mov dh,temp
    mov dl,119
    call Gotoxy
    mov edx,OFFSET ground2  ;"|"
    call WriteString
    inc temp 
    loop l2
   
   


    ;Walls Creation

    ;Tile 1 Top
    
    call SetTextColor
    mov dl,11 
    mov dh,5
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString
    
    mov dl,40
    mov dh,5
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString

    mov dl,100
    mov dh,5
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString

    ;Tile 1 bottom

        
    call SetTextColor
    mov dl,11 
    mov dh,24
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString
   
    mov dl,40
    mov dh,24
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString

    

    mov dl,100
    mov dh,24
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString

    
    ;Tile 2

    mov ecx,4
    mov dh,8
    mov temp,dh
    l3:
    mov dh,temp
    mov dl,16
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop l3

    mov ecx,4
    mov dh,8
    mov temp,dh
    l5:
    mov dh,temp
    mov dl,45
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop l5

    mov ecx,4
    mov dh,8
    mov temp,dh
    l6:
    mov dh,temp
    mov dl,65
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop l6

    mov ecx,4
    mov dh,8
    mov temp,dh
    l06:
    mov dh,temp
    mov dl,78
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop l06

    call SetTextColor
    mov dl,69 
    mov dh,15
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString

    mov ecx,4
    mov dh,8
    mov temp,dh
    l7:
    mov dh,temp
    mov dl,95
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop l7

    ;Tile 3
    
    mov ecx,4
    mov dh,18
    mov temp,dh
    l8:
    mov dh,temp
    mov dl,16
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop l8

    mov ecx,4
    mov dh,18
    mov temp,dh
    l10:
    mov dh,temp
    mov dl,45
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop l10


    mov ecx,4
    mov dh,18
    mov temp,dh
    l11:
    mov dh,temp
    mov dl,78
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop l11

    call SetTextColor
    mov dl,100
    mov dh,15
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString

    mov ecx,4
    mov dh,18
    mov temp,dh
    l12:
    mov dh,temp
    mov dl,110
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop l12


    ;Tiles Border
      
      ;1st Top Left
    
    call SetTextColor
    mov dl,4
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border1:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border1


       ;2nd Top Right
    
    call SetTextColor
    mov dl,107
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border2:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border2


     ;3rd Bottom Left
    
    call SetTextColor
    mov dl,4
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border3:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border3


      ;4th Bottom Right
    
    call SetTextColor
    mov dl,107
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border4:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border4


      ;Coins Dispaly Horizontal

    mov eax,gray (black*16)
    call SetTextColor
    mov ecx,38
    mov esi, 0
   
   loopstars:
   
      mov dl,[coinx1+esi]
      mov dh,coiny1
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dl,[coinx2+esi]
      mov dh,coiny2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars

       ;Vertical Coins

    mov ecx,20
    mov esi, 0
   
   loopstars2:
   
      mov dh,[coiny3+esi]
      mov dl,coinx3
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coiny4+esi]
      mov dl,coinx4
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars2


      ;Left Most1 and RRight mOst1 Vertical

    mov ecx,18
    mov esi, 0
   
   loopstars3:
   
      mov dh,[coin1y1+esi]
      mov dl,coin1x1
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coin1y2+esi]
      mov dl,coin1x2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars3


       ;Left Most and RRight mOst Vertical

    mov ecx,11
    mov esi, 0
   
   loopstars4:
   
      mov dh,[coin2y1+esi]
      mov dl,coin2x1
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coin3y2+esi]
      mov dl,coin3x2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars4

      
    mov ecx,15
    mov esi, 0
   
   loopstars5:
   
      mov dh,[coin2y2+esi]
      mov dl,coin2x2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars5




    call DrawPlayer


   gameLoopMaze1:
       
        
        mov bl, xPos
        mov bh, yPos

        call CoinCollection
        call UpdateGhost1
        call DrawGhost1 

        call UpdateGhost2
        call DrawGhost2
     
        call UpdateGhost3
        call DrawGhost3
        
        call G1Collision
        call G2Collision
        call G3Collision
      
        
        cmp score,10
        je HALEVEL2

        cmp lives,0
        je lastscreen01
       
        ;notCollecting:
      
        mov eax,lightgray (black * 16)  ;This color for scoring, packman so on..
        call SetTextColor

        ; draw score:
        mov dl,1
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov ax,score
        call WriteInt

        ;Draw PackMan Game!
        mov dl,50
        mov dh,0
        call Gotoxy
        mov edx,OFFSET packman
        call WriteString
       
        ;Lives
        mov dl,123
        mov dh,28
        call Gotoxy
        mov edx,OFFSET strLife
        call WriteString
         mov eax,0
        mov al,lives
        call WriteInt

        ;Draw Coal 23'
        mov dl,110
        mov dh,0
        call Gotoxy
        mov edx,OFFSET coal
        call WriteString

        ;Level of the Game
        mov dl,124
        mov dh,5
        call Gotoxy
        mov edx,OFFSET level_of_the_game
        call WriteString
         mov eax,0
        mov al,level
        call writeint
        ;call crlf

        ;Cutting Line

        mov dl, 122
        mov dh,4
        call Gotoxy
        mov edx, offset cutting
        call writestring

        mov dl, 122
        mov dh,6
        call Gotoxy
        mov edx, offset cutting
        call writestring

        ;Name
        mov dl,121
        mov dh,8
        call Gotoxy
        mov edx,OFFSET hammadshabbir
        call WriteString
        
        ;Sec
        mov dl,125
        mov dh,10
        call Gotoxy
        mov edx,OFFSET section
        call WriteString

        
        ;Roll No
        mov dl,123
        mov dh,12
        call Gotoxy
        mov edx,OFFSET rollNo
        call WriteString



        ; gravity logic:
        gravity:
        cmp yPos,0
        jg onGround
        
        ; make player fall:
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        mov eax,100  ;Postion where to player falls
        call Delay
        jmp gravity
        onGround:

        ; get user key input:

        call ReadChar
        mov inputChar,al
    
        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame 

        cmp inputChar,"w"
        je moveUpMaze1

        cmp inputChar,"s"
        je moveDownMaze1

        cmp inputChar,"a"
        je moveLeftMaze1

        cmp inputChar,"d"
        je moveRightMaze1

        cmp inputchar, "p"
        jmp Menu
        
      
        

    moveUpMaze1:
        
        cmp yPos,2
        je  gameLoopMaze1
        mov bl, xPos
        mov bh, yPos
        dec bh
        mov al, 0

        ;***********************************************  MAZE 1  *************************************************************
           
           ;Vertical Calling

        call WallCheckVertical1
        cmp al, 1
        je pnomove
        call WallCheckVertical01
        cmp al, 1
        je pnomove
        call WallCheckVertical4
        cmp al, 1
        je pnomove
        call WallCheckVertical04
        cmp al, 1
        je pnomove
        call WallCheckVertical5
        cmp al, 1
        je pnomove
        call WallCheckVertical05
        cmp al, 1
        je pnomove

           ;Horizontal Calling

        call WallCheckHorizontalMidsMaze1 
        cmp al,1
        je pnomove
        call WallCheckHorizontalTopCornersMaze1
        cmp al,1
        je pnomove
        call WallCheckHorizontalBottomCornersMaze1
        cmp al,1
        je pnomove
        call WallCheckHorizontalTopMaze1
        cmp al, 1
        je pnomove
        call WallCheckHorizontalBotoomMaze1
        cmp al, 1
        je pnomove
        
        call WallCheckVerticalBorder1Maze1
        cmp al, 1
        je pnomove
        call WallCheckVerticalBorder2Maze1
        cmp al, 1
        je pnomove

        call UpdatePlayer
        dec yPos
        call DrawPlayer
        jmp  gameLoopMaze1
         

   moveDownMaze1:

        cmp yPos ,28
        je  gameLoopMaze1
        mov bl, xPos
        mov bh, yPos
        inc bh
        mov al, 0

        ;***********************************************  MAZE 1  *************************************************************

          ;Vertical Calling

        call WallCheckVertical1
        cmp al, 1
        je pnomove
        call WallCheckVertical01
        cmp al, 1
        je pnomove
        call WallCheckVertical4
        cmp al, 1
        je pnomove
        call WallCheckVertical04
        cmp al, 1
        je pnomove
        call WallCheckVertical5
        cmp al, 1
        je pnomove
        call WallCheckVertical05
        cmp al, 1
        je pnomove

          ;Horizontal Calling

        call WallCheckHorizontalMidsMaze1 
        cmp al,1
        je pnomove
        call WallCheckHorizontalTopCornersMaze1
        cmp al,1
        je pnomove
        call WallCheckHorizontalBottomCornersMaze1
        cmp al,1
        je pnomove
        call WallCheckHorizontalTopMaze1
        cmp al, 1
        je pnomove
        call WallCheckHorizontalBotoomMaze1
        cmp al, 1
        je pnomove
       
        call WallCheckVerticalBorder1Maze1
        cmp al, 1
        je pnomove
        call WallCheckVerticalBorder2Maze1
        cmp al, 1
        je pnomove

        call UpdatePlayer
        inc yPos
        call DrawPlayer 
        jmp gameLoopMaze1

   moveLeftMaze1:

        cmp xPos,1
        je gameLoopMaze1
        mov bl, xPos
        mov bh, yPos
        dec bl
        mov al, 0

        ;***********************************************  MAZE 1  *************************************************************

          ;Vertical Calling

        call WallCheckVertical1
        cmp al, 1
        je pnomove
        call WallCheckVertical01
        cmp al, 1
        je pnomove
        call WallCheckVertical4
        cmp al, 1
        je pnomove
        call WallCheckVertical04
        cmp al, 1
        je pnomove
        call WallCheckVertical5
        cmp al, 1
        je pnomove
        call WallCheckVertical05
        cmp al, 1
        je pnomove

          ;Horizontal Calling

        call WallCheckHorizontalMidsMaze1 
        cmp al,1
        je pnomove
        call WallCheckHorizontalTopCornersMaze1
        cmp al,1
        je pnomove
        call WallCheckHorizontalBottomCornersMaze1
        cmp al,1
        je pnomove
        call WallCheckHorizontalTopMaze1
        cmp al, 1
        je pnomove
        call WallCheckHorizontalBotoomMaze1
        cmp al, 1
        je pnomove

        call WallCheckVerticalBorder1Maze1
        cmp al, 1
        je pnomove
        call WallCheckVerticalBorder2Maze1
        cmp al, 1
        je pnomove

        call UpdatePlayer
        dec xPos
        call DrawPlayer
        jmp gameLoopMaze1

   moveRightMaze1:

        cmp xPos,118
        je gameLoopMaze1
        mov bl, xPos
        mov bh, yPos
        inc bl
        mov al, 0

        ;***********************************************  MAZE 1  *************************************************************

          ;Vertical Calling

        call WallCheckVertical1
        cmp al, 1
        je pnomove
        call WallCheckVertical01
        cmp al, 1
        je pnomove
        call WallCheckVertical4
        cmp al, 1
        je pnomove
        call WallCheckVertical04
        cmp al, 1
        je pnomove
        call WallCheckVertical5
        cmp al, 1
        je pnomove
        call WallCheckVertical05
        cmp al, 1
        je pnomove

          ;Horizontal Calling

        call WallCheckHorizontalMidsMaze1 
        cmp al,1
        je pnomove
        call WallCheckHorizontalTopCornersMaze1
        cmp al,1
        je pnomove
        call WallCheckHorizontalBottomCornersMaze1
        cmp al,1
        je pnomove
        call WallCheckHorizontalTopMaze1
        cmp al, 1
        je pnomove
        call WallCheckHorizontalBotoomMaze1
        cmp al, 1
        je pnomove

        call WallCheckVerticalBorder1Maze1
        cmp al, 1
        je pnomove
        call WallCheckVerticalBorder2Maze1
        cmp al, 1
        je pnomove

        call UpdatePlayer
        inc xPos
        call DrawPlayer
        jmp gameLoopMaze1

     pnomove:
    jmp gameLoopMaze1
    

 lastscreen01:
    
   INVOKE PlaySound, OFFSET music3, NULL, 11h
   mov eax,10
   call delay

    mov eax,white (black*16)
    call SetTextColor
    call clrscr
    mov dh,10
    mov dl, 45
    call Gotoxy
    mov edx,offset gameover
    call writestring
    call crlf

    mov dh,12
    mov dl, 50
    call Gotoxy
    mov edx,offset gameover1
    call writestring

    
    ;draw score:
    mov dl,50
    mov dh,14
    call Gotoxy
    mov edx,OFFSET strScore
    call WriteString
     mov eax,0
    mov ax,score
    call WriteInt
    call crlf

    ;draw level:
    mov dl,50
    mov dh,16
    call Gotoxy
    mov edx,OFFSET yourlevel
    call WriteString
     mov eax,0
    mov al,level
    call WriteInt
    call crlf



    ;fILE Handling
    mov edx,OFFSET filename
    call OpenInputFile

    mov fileHandle,eax
    cmp eax,INVALID_HANDLE_VALUE 
    jne file_ok3
    mov edx,offset errMsg
    call writestring
    jmp quit3

file_ok3:


    mov edx,OFFSET buffer
    mov ecx,BUFFER_SIZE
    call ReadFromFile
    jnc check_buffer_size3 ;if not carry
   mov edx,offset errMsg
   call writestring
    call WriteWindowsMsg
    jmp close_file3

check_buffer_size3:

    cmp eax,BUFFER_SIZE1
    jb buf_size_ok3
    mov edx,offset sizesmall
    call writestring
    jmp quit3

buf_size_ok3:

   mov buffer[eax],0
   mov dh,18  
   mov dl,50
   call Gotoxy
   mov edx,offset yourname
   call writestring
   mov dh,18  
   mov dl,63
   call Gotoxy
   mov edx, OFFSET buffer
   call WriteString
   call Crlf
   close_file3:
   mov eax,fileHandle
   call CloseFile

quit3:
  
    mov eax,gray (gray*16)
    call SetTextColor


   ;Tiles Border
      
        ;1st Top Left

    mov dl,4
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border1maze88:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border1maze88


       ;2nd Top Right
    
    call SetTextColor
    mov dl,107
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border2maze88:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border2maze88


     ;3rd Bottom Left
    
    call SetTextColor
    mov dl,4
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border3maze88:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border3maze88


      ;4th Bottom Right
    
    call SetTextColor
    mov dl,107
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border4maze88:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border4maze88


    call ReadChar
    mov inputchar,al

    cmp inputchar,"x"
    je exitGame


    exitGame:
    exit

    HALEVEL2:

    mov eax,white (black*16)
    call SetTextColor
    call clrscr
    mov dh,14
    mov dl, 22
    call Gotoxy
    mov edx,offset level1completed
    mov level,2
    call writestring

    mov eax,gray (gray*16)
    call SetTextColor

   ;Tiles Border
      
        ;1st Top Left

    mov dl,4
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border1maze22:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border1maze22


       ;2nd Top Right
    
    call SetTextColor
    mov dl,107
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border2maze22:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border2maze22


     ;3rd Bottom Left
    
    call SetTextColor
    mov dl,4
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border3maze22:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border3maze22


      ;4th Bottom Right
    
    call SetTextColor
    mov dl,107
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border4maze22:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border4maze22

    call ReadChar

    
      ;*********************************************  LEVEL 2 *********************************************************

 Game1:
    
       
   INVOKE PlaySound, OFFSET music3, NULL, 11h
   mov eax,20
   call delay

    mov xPos,57
    mov yPos,14
    mov level,2


    ;************************************************* Maze 2 ********************************************************* 
    mov eax,black (black*16)
    call SetTextColor
    call clrscr

    ; draw ground at (0,29):
    mov eax, cyan (cyan*16)
    call SetTextColor

    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    ;For Left Side in Vertical
    mov ecx,27
    mov dh,2
    mov temp,dh
    l1maze2:
    mov dh,temp
    mov dl,0
    call Gotoxy
    mov edx,OFFSET ground2  ;"|"
    call WriteString
    inc temp
    loop l1maze2
    
    ;For Right Side in Vertical
    mov ecx,27
    mov dh,2
    mov temp,dh
    l2maze2:
    mov dh,temp
    mov dl,119
    call Gotoxy
    mov edx,OFFSET ground2  ;"|"
    call WriteString
    inc temp
    loop l2maze2
  
    
    ;Walls Creation

      ;Tile 1 Top
    
    call SetTextColor
    mov dl,17
    mov dh,5
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString
    
    mov dl,95
    mov dh,5
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString

     ;Tile 1 bottom
        
    call SetTextColor
    mov dl,17 
    mov dh,24
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString
   
    mov dl,95
    mov dh,24
    call Gotoxy
    mov edx,OFFSET tiles1
    call WriteString


    ;Tile 2
      
      ;0 ka left vectical

    mov ecx,4
    mov dh,8
    mov temp,dh
    lleft1:
    mov dh,temp
    mov dl,12
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop lleft1


    mov ecx,4
    mov dh,18
    mov temp,dh
    lleft01:
    mov dh,temp
    mov dl,12
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop lleft01

      ;0 ka right vertical

    mov ecx,4
    mov dh,8
    mov temp,dh
    lright1:
    mov dh,temp
    mov dl,26
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop lright1

       
    mov ecx,4
    mov dh,18
    mov temp,dh
    lright01:
    mov dh,temp
    mov dl,26
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop lright01

      
      ;0 ka left Vectrical

      
    mov ecx,4
    mov dh,8
    mov temp,dh
    lleft5:
    mov dh,temp
    mov dl,90
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop lleft5


    mov ecx,4
    mov dh,18
    mov temp,dh
    lleft05:
    mov dh,temp
    mov dl,90
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop lleft05

    
      ;0 ka right Vertical
          
    mov ecx,4
    mov dh,8
    mov temp,dh
    lright5:
    mov dh,temp
    mov dl,105
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop lright5

    
    mov ecx,4
    mov dh,18
    mov temp,dh
    lright05:
    mov dh,temp
    mov dl,105
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop lright05

   
    ;Mid AREa
  
     ;Mid ka 1St horizontal 

    mov dl,51   ;horzontal change
    mov dh,12  ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles05
    call WriteString

     ;Mid ka 2nd Horizontal
   
    mov dl,51   ;horzontal change
    mov dh,16  ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles05
    call WriteString

     ; Mid ka 3rd horizontal
   
    mov dl,43   ;horzontal change
    mov dh,18  ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles7
    call WriteString

     ;Mid ka Left Vertical Corner

    mov ecx,7
    mov dh,12
    mov temp,dh
    tilemidkaleft:
    mov dh,temp
    mov dl,43
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tilemidkaleft

     ;Mid ka right Vertical corner

    mov ecx,7
    mov dh,12
    mov temp,dh
    tilemidkaright:
    mov dh,temp
    mov dl,72
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tilemidkaright

     ;Mid ka left Vertical corner sy next

    mov ecx,3
    mov dh,13
    mov temp,dh
    tilecornersynext:
    mov dh,temp
    mov dl,47
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tilecornersynext

     ;mid ka right Vertical corner sy prev
   
    mov ecx,3
    mov dh,13
    mov temp,dh
    tilecornersyprev:
    mov dh,temp
    mov dl,69
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tilecornersyprev


   ;Tiles Border
      
      ;1st Top Left
    
    call SetTextColor
    mov dl,4
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border1maze2:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border1maze2


       ;2nd Top Right
    
    call SetTextColor
    mov dl,107
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border2maze2:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border2maze2


     ;3rd Bottom Left
    
    call SetTextColor
    mov dl,4
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border3maze2:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border3maze2


      ;4th Bottom Right
    
    call SetTextColor
    mov dl,107
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border4maze2:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border4maze2


      ;Fruites 
       
    mov eax, magenta
    call SetTextColor
    
    mov ecx,1
    mov esi,0

    printfruite1:
        
        mov dl,[fruitex1+esi]
        mov dh,fruitey1
        call Gotoxy
        mov edx,offset fruites_score
        call writestring
        loop printfruite1

    mov ecx,1
    mov esi,0

    printfruite2:
        
        mov dl,[fruitex2+esi]
        mov dh,fruitey2
        call Gotoxy
        mov edx,offset fruites_score
        call writestring
        loop printfruite2

    mov ecx,1
    mov esi,0

    printfruite3:
        
        mov dl,[fruitex3+esi]
        mov dh,fruitey3
        call Gotoxy
        mov edx,offset fruites_score
        call writestring
        loop printfruite3


    mov ecx,1
    mov esi,0

    printfruit4:
        
        mov dl,[fruitex4+esi]
        mov dh,fruitey4
        call Gotoxy
        mov edx,offset fruites_score
        call writestring
        loop printfruit4

    mov ecx,1
    mov esi,0

    printfruit5:
        
        mov dl,[fruitex5+esi]
        mov dh,fruitey5
        call Gotoxy
        mov edx,offset fruites_score
        call writestring
        loop printfruit5


     ;Coins Dispaly Horizontal

    mov eax,cyan (black*16)
    call SetTextColor
   
    mov ecx,35
    mov esi, 0
   
   loopstarsMaze2:
   
      mov dl,[coinx1Maze22+esi]
      mov dh,coiny1Maze22
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dl,[coinx2Maze22+esi]
      mov dh,coiny2Maze22
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstarsMaze2

       ;Vertical Coins

    mov ecx,20
    mov esi, 0
   
   loopstars2Maze2:
   
      mov dh,[coiny3Maze22+esi]
      mov dl,coinx3Maze22
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coiny4Maze22+esi]
      mov dl,coinx4Maze22
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars2Maze2


      ;Left Most1 and RRight mOst1 Vertical

    mov ecx,18
    mov esi, 0
   
   loopstars3Maze2:
   
      mov dh,[coin1y1Maze22+esi]
      mov dl,coin1x1Maze22
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coin1y2Maze22+esi]
      mov dl,coin1x2Maze22
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars3Maze2


       ;Left Most and RRight mOst Vertical

    mov ecx,11
    mov esi, 0
   
   loopstars4Maze2:
   
      mov dh,[coin2y1Maze22+esi]
      mov dl,coin2x1Maze22
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coin3y2Maze22+esi]
      mov dl,coin3x2Maze22
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars4Maze2

      
       ;Last Vertical sy next 

    mov ecx,15
    mov esi, 0
   
   loopstars5Maze2:
   
      mov dh,[coin2y2Maze22+esi]
      mov dl,coin2x2Maze22
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coin2y3Maze22+esi]
      mov dl,coin2x3Maze22
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars5Maze2

      ;Mid Block

    mov ecx,23
    mov esi, 0
   
   loopstars6Maze2:
   
      mov dl,[coinx1Maze2+esi]
      mov dh,coiny1Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dl,[coinx2Maze2+esi]
      mov dh,coiny2Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars6Maze2

       ;Vertical Coins

    mov ecx,14
    mov esi, 0
   
   loopstars7Maze2:
   
      mov dh,[coiny3Maze2+esi]
      mov dl,coinx3Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coiny4Maze2+esi]
      mov dl,coinx4Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars7Maze2



         ;Full Mid Block

    mov ecx,9
    mov esi, 0
   
   loopstars8Maze2:
   
      mov dl,[coin1x1Maze2+esi]
      mov dh,coin1y1Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dl,[coin1x2Maze2+esi]
      mov dh,coin1y2Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars8Maze2

       ;Vertical Coins

    mov ecx,10
    mov esi, 0
   
   loopstars9Maze2:
   
      mov dh,[coin1y3Maze2+esi]
      mov dl,coin1x3Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coin1y4Maze2+esi]
      mov dl,coin1x4Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars9Maze2

      call DrawPlayer
   

gameLoopMaze2:
        
        mov level,2
        mov bl, xPos
        mov bh, yPos
        call CoinCollectionForMaze2
        call UpdateGhost1Maze2 
        call DrawGhost1Maze2 
        call G1CollisionMaze2 

        call UpdateGhost2Maze2 
        call DrawGhost2Maze2 
        call G2CollisionMaze2 

        call UpdateGhost3Maze2 
        call DrawGhost3Maze2 
        call G3CollisionMaze2 

        call UpdateGhost4Maze2 
        call DrawGhost4Maze2 
        call G4CollisionMaze2 
        
        ; player is intersecting coin:
        cmp score,20
        je HALEVEL3

        cmp lives,0
        jle lastscreen2

        mov eax,lightgray (black * 16)  ;This color for scoring, packman so on..
        call SetTextColor

        ; draw score:

        mov dl,1
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov ax,score
        call WriteInt

        ;Draw PackMan Game!
        
        mov dl,50
        mov dh,0
        call Gotoxy
        mov edx,OFFSET packman
        call WriteString
        
        ;Lives
        mov dl,123
        mov dh,28
        call Gotoxy
        mov edx,OFFSET strLife
        call WriteString
         mov eax,0
        mov al,lives
        call WriteInt

        ;Draw Coal 23'
        mov dl,110
        mov dh,0
        call Gotoxy
        mov edx,OFFSET coal
        call WriteString

        ;Level of the Game
        mov dl,124
        mov dh,5
        call Gotoxy
        mov edx,OFFSET level_of_the_game
        call WriteString
         mov eax,0
        mov al, level
        call writeint
        ;call crlf

        ;Cutting Line

        mov dl, 122
        mov dh,4
        call Gotoxy
        mov edx, offset cutting
        call writestring

        mov dl, 122
        mov dh,6
        call Gotoxy
        mov edx, offset cutting
        call writestring

        ;Name
        mov dl,121
        mov dh,8
        call Gotoxy
        mov edx,OFFSET hammadshabbir
        call WriteString
        
        ;Sec
        mov dl,125
        mov dh,10
        call Gotoxy
        mov edx,OFFSET section
        call WriteString

        
        ;Roll No
        mov dl,123
        mov dh,12
        call Gotoxy
        mov edx,OFFSET rollNo
        call WriteString



        ; gravity logic:
        gravitymaze2:
        cmp yPos,0
        jg onGroundmaze2
        
        ; make player fall:
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        mov eax,100  ;Postion where to player falls
        call Delay
        jmp gravity
        onGroundmaze2:

        ; get user key input:
        call ReadChar
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame1 

        cmp inputChar,"w"
        je moveUpMaze2

        cmp inputChar,"s"
        je moveDownMaze2

        cmp inputChar,"a"
        je moveLeftMaze2

        cmp inputChar,"d"
        je moveRightMaze2

        cmp inputchar, "p"
        jmp Menu

    moveUpMaze2:
        
        cmp yPos,2
        je gameLoopMaze2
        mov bl, xPos
        mov bh, yPos
        dec bh
        mov al, 0

        ;***********************************************  MAZE 2  *************************************************************

           ;Vertical Calling

        call WallCheckLeft1VerticalMaze2 
        cmp al, 1
        je pnomove2
        call WallCheckLeft2VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckRight1VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckRight2VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckMid1VerticalLeftMaze2
        cmp al,1
        je pnomove2
        call WallCheckMid2VerticalRightMaze2 
        cmp al,1
        je pnomove2
        call WallCheckMid3VerticalLeftNextMaze2
        cmp al,1
        je pnomove2
        call WallCheckMid4VerticalRightPrevMaze2 
        cmp al,1
        je pnomove2

           ;Horizontal Calling
           
        call WallCheckHorizontalMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalBottomMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalTopCornersMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalBottomCornersMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMIDMaze2 
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMID1Maze2 
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMID2Maze2 
        cmp al,1
        je pnomove2
        
        call WallCheckVerticalBorder1Maze2
        cmp al, 1
        je pnomove2
        call WallCheckVerticalBorder2Maze2
        cmp al, 1
        je pnomove2

        call UpdatePlayer
        dec yPos
        call DrawPlayer
        jmp gameLoopMaze2

   moveDownMaze2:

        cmp yPos ,28
        je gameLoopMaze2
        mov bl, xPos
        mov bh, yPos
        inc bh
        mov al, 0

        ;***********************************************  MAZE 2  *************************************************************
        
            ;Vertical Calling

        call WallCheckLeft1VerticalMaze2 
        cmp al, 1
        je pnomove2
        call WallCheckLeft2VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckRight1VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckRight2VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckMid1VerticalLeftMaze2
        cmp al,1
        je pnomove2
        call WallCheckMid2VerticalRightMaze2 
        cmp al,1
        je pnomove2
        call WallCheckMid3VerticalLeftNextMaze2
        cmp al,1
        je pnomove2
        call WallCheckMid4VerticalRightPrevMaze2 
        cmp al,1
        je pnomove2

           ;Horizontal Calling
           
        call WallCheckHorizontalMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalBottomMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalTopCornersMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalBottomCornersMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMIDMaze2 
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMID1Maze2 
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMID2Maze2 
        cmp al,1
        je pnomove2

        call WallCheckVerticalBorder1Maze2
        cmp al, 1
        je pnomove2
        call WallCheckVerticalBorder2Maze2
        cmp al, 1
        je pnomove2

        call UpdatePlayer
        inc yPos
        call DrawPlayer 
        jmp gameLoopMaze2

   moveLeftMaze2:

        cmp xPos,1
        je gameLoopMaze2
        mov bl, xPos
        mov bh, yPos
        dec bl
        mov al, 0


        ;***********************************************  MAZE 2  *************************************************************


             ;Vertical Calling

        call WallCheckLeft1VerticalMaze2 
        cmp al, 1
        je pnomove2
        call WallCheckLeft2VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckRight1VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckRight2VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckMid1VerticalLeftMaze2
        cmp al,1
        je pnomove2
        call WallCheckMid2VerticalRightMaze2 
        cmp al,1
        je pnomove2
        call WallCheckMid3VerticalLeftNextMaze2
        cmp al,1
        je pnomove2
        call WallCheckMid4VerticalRightPrevMaze2 
        cmp al,1
        je pnomove2

           ;Horizontal Calling
           
        call WallCheckHorizontalMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalBottomMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalTopCornersMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalBottomCornersMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMIDMaze2 
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMID1Maze2 
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMID2Maze2 
        cmp al,1
        je pnomove2

        call WallCheckVerticalBorder1Maze2
        cmp al, 1
        je pnomove2
        call WallCheckVerticalBorder2Maze2
        cmp al, 1
        je pnomove2


        call UpdatePlayer
        dec xPos
        call DrawPlayer
        jmp gameLoopMaze2

   moveRightMaze2:

        cmp xPos,118
        je gameLoopMaze2
        mov bl, xPos
        mov bh, yPos
        inc bl
        mov al, 0

        ;***********************************************  MAZE 2  *************************************************************

              ;Vertical Calling

        call WallCheckLeft1VerticalMaze2 
        cmp al, 1
        je pnomove2
        call WallCheckLeft2VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckRight1VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckRight2VerticalMaze2
        cmp al, 1
        je pnomove2
        call WallCheckMid1VerticalLeftMaze2
        cmp al,1
        je pnomove2
        call WallCheckMid2VerticalRightMaze2 
        cmp al,1
        je pnomove2
        call WallCheckMid3VerticalLeftNextMaze2
        cmp al,1
        je pnomove2
        call WallCheckMid4VerticalRightPrevMaze2 
        cmp al,1
        je pnomove2

           ;Horizontal Calling
           
        call WallCheckHorizontalMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalBottomMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalTopCornersMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalBottomCornersMaze2
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMIDMaze2 
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMID1Maze2 
        cmp al,1
        je pnomove2
        call WallCheckHorizontalMID2Maze2 
        cmp al,1
        je pnomove2

        call WallCheckVerticalBorder1Maze2
        cmp al, 1
        je pnomove2
        call WallCheckVerticalBorder2Maze2
        cmp al, 1
        je pnomove2

        call UpdatePlayer
        inc xPos
        call DrawPlayer
        jmp gameLoopMaze2
    
     pnomove2:
    
    jmp gameLoopMaze2

 lastscreen2:

   
   INVOKE PlaySound, OFFSET music3, NULL, 11h
   mov eax,10
   call delay

    
    mov eax,white (black*16)
    call SetTextColor
    call clrscr
    mov dh,10
    mov dl, 45
    call Gotoxy
    mov edx,offset gameover
    call writestring
    call crlf

    mov dh,12
    mov dl, 50
    call Gotoxy
    mov edx,offset gameover1
    call writestring

    
    ;draw score:
    mov dl,50
    mov dh,14
    call Gotoxy
    mov edx,OFFSET strScore
    call WriteString
    mov ax,score
    call WriteInt
    call crlf

    mov dl,50
    mov dh,18
    call Gotoxy
    mov edx,OFFSET yourlevel
    call WriteString
     mov eax,0
    mov al,level
    call WriteInt
    call crlf


    ;fILE Handling
    mov edx,OFFSET filename
    call OpenInputFile

    mov fileHandle,eax
    cmp eax,INVALID_HANDLE_VALUE 
    jne file_ok2
    mov edx,offset errMsg
    jmp quit2

file_ok2:


    mov edx,OFFSET buffer
    mov ecx,BUFFER_SIZE
    call ReadFromFile
    jnc check_buffer_size2 ;if not carry
    mov edx,offset error
    call writestring
    call WriteWindowsMsg
    jmp close_file2

check_buffer_size2:

    cmp eax,BUFFER_SIZE1
    jb buf_size_ok2
    mov edx,offset sizesmall
    call writestring
    jmp quit2

buf_size_ok2:

   mov buffer[eax],0
   mov dh,16  
   mov dl,50
   call Gotoxy
   mov edx,offset yourname
   call writestring
   mov dh,16  
   mov dl,63
   call Gotoxy
   mov edx, OFFSET buffer
   call WriteString
   call Crlf
   close_file2:
   mov eax,fileHandle
   call CloseFile

quit2:
  
    mov eax,cyan (cyan*16)
    call SetTextColor


   ;Tiles Border
      
     ;1st Top Left

    mov dl,4
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border1maze55:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border1maze55


       ;2nd Top Right
    
    call SetTextColor
    mov dl,107
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border2maze55:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border2maze55


     ;3rd Bottom Left
    
    call SetTextColor
    mov dl,4
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border3maze55:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border3maze55


      ;4th Bottom Right
    
    call SetTextColor
    mov dl,107
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border4maze55:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border4maze55


    call ReadChar
    mov inputchar,al

    cmp inputchar,"x"
    je exitGame1

    exitGame1:
    exit

    HALEVEL3:

    mov eax,white (black*16)
    call SetTextColor
    call clrscr
    mov dh,14
    mov dl, 22
    call Gotoxy
    mov edx,offset level2completed
    mov level,3
    call writestring
    mov eax,cyan (cyan*16)
    call SetTextColor

   ;Tiles Border
      
        ;1st Top Left

    mov dl,4
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border1maze33:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border1maze33


       ;2nd Top Right
    
    call SetTextColor
    mov dl,107
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border2maze33:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border2maze33


     ;3rd Bottom Left
    
    call SetTextColor
    mov dl,4
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border3maze33:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border3maze33


      ;4th Bottom Right
    
    call SetTextColor
    mov dl,107
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border4maze33:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border4maze33

    call ReadChar

          ;*********************************************  LEVEL 3 *********************************************************

 Game2:
    
      
   INVOKE PlaySound, OFFSET music3, NULL, 11h
   mov eax,10
   call delay

    mov xPos,57
    mov yPos,27
  

    ;************************************************* Maze 3 ********************************************************* 
    mov eax,black (black*16)
    call SetTextColor
    call clrscr


    ; draw ground at (0,29):
    mov eax, red (red*16)
    call SetTextColor

    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET groundup
    call WriteString
    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET grounddown
    call WriteString

    mov dl,62
    mov dh,1
    call Gotoxy
    mov edx,OFFSET groundup1
    call WriteString


    mov dl,62
    mov dh,29
    call Gotoxy
    mov edx,OFFSET grounddown1
    call WriteString
     
    
    ;Boundary
    mov ecx,26
    mov dh,2
    mov temp,dh
    tilemidkaleftleftleft:
    mov dh,temp
    mov dl,0
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tilemidkaleftleftleft

    mov ecx,26
    mov dh,2
    mov temp,dh
    tilemidkarightrightright:
    mov dh,temp
    mov dl,119
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tilemidkarightrightright

    ;************************************************* Maze 3 ********************************************************* 
   
    
      ;Tile 8

    mov dl,24   ;horzontal change
    mov dh,9  ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles8
    call WriteString

    mov dl,24   ;horzontal change
    mov dh,21  ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles8
    call WriteString


    mov ecx,4
    mov dh,10
    mov temp,dh
    tile8:
    mov dh,temp
    mov dl,24
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tile8

    mov ecx,4
    mov dh,17
    mov temp,dh
    tile08:
    mov dh,temp
    mov dl,24
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tile08


    mov ecx,4
    mov dh,10
    mov temp,dh
    tile008:
    mov dh,temp
    mov dl,96
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tile008

    
    mov ecx,4
    mov dh,17
    mov temp,dh
    tile0008:
    mov dh,temp
    mov dl,96 ;horzontal
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tile0008

     ;Tile 9

    mov ecx,17
    mov dh,7
    mov temp,dh
    tile9:
    mov dh,temp
    mov dl,11
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tile9


    
    ;Tile 10

    mov ecx,17
    mov dh,7
    mov temp,dh
    tile10:
    mov dh,temp
    mov dl,106
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tile10 



    
    ;Tile 11

    mov dl,30  ;horzontal change
    mov dh,7    ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles11
    call WriteString

    
    mov ecx,4
    mov dh,3
    mov temp,dh
    tile11:
    mov dh,temp
    mov dl,30
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tile11 


    mov dl,68  ;horzontal change
    mov dh,7    ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles11
    call WriteString

    
    mov ecx,4
    mov dh,3
    mov temp,dh
    tile011:
    mov dh,temp
    mov dl,84
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tile011 


    ;Tile 12

    
    mov dl,30  ;horzontal change
    mov dh,23    ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles11
    call WriteString

    
    mov ecx,4
    mov dh,24
    mov temp,dh
    tile12:
    mov dh,temp
    mov dl,30
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tile12 


    mov dl,68   ;horzontal change
    mov dh,23    ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles11
    call WriteString

    
    mov ecx,4
    mov dh,24
    mov temp,dh
    tile012:
    mov dh,temp
    mov dl,84
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tile012 
   
    
    ;Mid AREa
  
     ;Mid ka 1St horizontal 

    mov dl,51   ;horzontal change
    mov dh,12  ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles05
    call WriteString

     ;Mid ka 2nd Horizontal
   
    mov dl,51   ;horzontal change
    mov dh,16  ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles05
    call WriteString

     ; Mid ka 3rd horizontal
   
    mov dl,43   ;horzontal change
    mov dh,18  ;vertical  change
    call Gotoxy
    mov edx,OFFSET tiles7
    call WriteString

     ;Mid ka Left Vertical Corner

    mov ecx,7
    mov dh,12
    mov temp,dh
    tilemidkaleftmaze3:
    mov dh,temp
    mov dl,43
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tilemidkaleftmaze3

     ;Mid ka right Vertical corner

    mov ecx,7
    mov dh,12
    mov temp,dh
    tilemidkarightmaze3:
    mov dh,temp
    mov dl,72
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tilemidkarightmaze3

     ;Mid ka left Vertical corner sy next

    mov ecx,3
    mov dh,13
    mov temp,dh
    tilecornersynextmaze3:
    mov dh,temp
    mov dl,47
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tilecornersynextmaze3

     ;mid ka right Vertical corner sy prev
   
    mov ecx,3
    mov dh,13
    mov temp,dh
    tilecornersyprevmaze3:
    mov dh,temp
    mov dl,69
    call Gotoxy
    mov edx,OFFSET tiles2 
    call WriteString
    inc temp
    loop tilecornersyprevmaze3


   ;Tiles Border
      
      ;1st Top Left
    
    call SetTextColor
    mov dl,4
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border1maze3:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border1maze3


       ;2nd Top Right
    
    call SetTextColor
    mov dl,107
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border2maze3:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border2maze3


     ;3rd Bottom Left
    
    call SetTextColor
    mov dl,4
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border3maze3:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border3maze3


      ;4th Bottom Right
    
    call SetTextColor
    mov dl,107
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border4maze4:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border4maze4


      
      ;Fruites 
       
    mov eax, magenta
    call SetTextColor
    
  
    mov ecx,1
    mov esi,0

    print1fruite2:
        
        mov dl,[fruitex2Maze3+esi]
        mov dh,fruitey2Maze3
        call Gotoxy
        mov edx,offset fruites_scoreMaze3
        call writestring
        loop print1fruite2

    mov ecx,1
    mov esi,0

    print1fruite3:
        
        mov dl,[fruitex3Maze3+esi]
        mov dh,fruitey3Maze3
        call Gotoxy
        mov edx,offset fruites_scoreMaze3
        call writestring
        loop print1fruite3


    mov ecx,1
    mov esi,0

    print1fruit4:
        
        mov dl,[fruitex4Maze3+esi]
        mov dh,fruitey4Maze3
        call Gotoxy
        mov edx,offset fruites_scoreMaze3
        call writestring
        loop print1fruit4

    mov ecx,1
    mov esi,0

    print1fruit5:
        
        mov dl,[fruitex5Maze3+esi]
        mov dh,fruitey5Maze3
        call Gotoxy
        mov edx,offset fruites_scoreMaze3
        call writestring
        loop print1fruit5


    mov ecx,1
    mov esi,0

    print1fruit6:
        
        mov dl,[fruitex6Maze3+esi]
        mov dh,fruitey6Maze3
        call Gotoxy
        mov edx,offset fruites_score1Maze3
        call writestring
        loop print1fruit6


    mov ecx,1
    mov esi,0

    print1fruit7:
        
        mov dl,[fruitex7Maze3+esi]
        mov dh,fruitey7Maze3
        call Gotoxy
        mov edx,offset fruites_score1Maze3
        call writestring
        loop print1fruit7


     ;Coins Dispaly Horizontal

    mov eax,red (black*16)
    call SetTextColor
   
    mov ecx,35
    mov esi, 0
   

       ;Left Most and RRight mOst Vertical

    mov ecx,11
    mov esi, 0
   
   loopstars4Maze3:
   
      mov dh,[coin2y1Maze33+esi]
      mov dl,coin2x1Maze33
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coin3y2Maze33+esi]
      mov dl,coin3x2Maze33
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars4Maze3

      
       ;Last Vertical sy next 

    mov ecx,15
    mov esi, 0
   
   loopstars5Maze3:
   
      mov dh,[coin2y2Maze33+esi]
      mov dl,coin2x2Maze33
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coin2y3Maze33+esi]
      mov dl,coin2x3Maze33
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars5Maze3

         ;Full Mid Block

    mov ecx,9
    mov esi, 0
   
   loopstars8Maze3:
   
      mov dl,[coin1x1Maze3+esi]
      mov dh,coin1y1Maze3
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dl,[coin1x2Maze3+esi]
      mov dh,coin1y2Maze3
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars8Maze3

  

    mov ecx,10
    mov esi, 0
   
   loopstars9Maze3:
   
      mov dh,[coin1y3Maze3+esi]
      mov dl,coin1x3Maze3
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      mov dh,[coin1y4Maze3+esi]
      mov dl,coin1x4Maze3
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars9Maze3

       
     ;Horizontal Mid

    mov ecx,11
    mov esi, 0
   
   loopstars10Maze3:
   
      mov dl,[coinx11Maze2+esi]
      mov dh,coiny11Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      
      mov dl,[coinx22Maze2+esi]
      mov dh,coiny22Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars10Maze3


    mov ecx,6
    mov esi, 0

  loopstars11Maze3:
   
      mov dl,[coinx55Maze2+esi]
      mov dh,coiny55Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      
      mov dl,[coinx66Maze2+esi]
      mov dh,coiny66Maze2
      call Gotoxy
      mov edx,offset stringstars
      call writestring
      inc esi
      loop loopstars11Maze3

    call DrawPlayer

   

    gameLoopMaze3:
        
        mov bl, xPos
        mov bh, yPos
       
        call CoinCollectionForMaze3
        call UpdateGhost1Maze3 
        call DrawGhost1Maze3
        call G1CollisionMaze3 

        call UpdateGhost2Maze3
        call DrawGhost2Maze3
        call G2CollisionMaze3

        call UpdateGhost3Maze3 
        call DrawGhost3Maze3
        call G3CollisionMaze3 

        call UpdateGhost4Maze3
        call DrawGhost4Maze3
        call G4CollisionMaze3

        call UpdateGhost5Maze3
        call DrawGhost5Maze3
        call G5CollisionMaze3

        call UpdateGhost6Maze3
        call DrawGhost6Maze3
        call G6CollisionMaze3

        call UpdateGhost7Maze3
        call DrawGhost7Maze3
        call G7CollisionMaze3

        call UpdateGhost8Maze3
        call DrawGhost8Maze3
        call G8CollisionMaze3
        
        ; player is intersecting coin:
        mov eax,lightgray (black * 16)  ;This color for scoring, packman so on..
        call SetTextColor

        mov level,3

        cmp lives,0
        jle lastscreen

        cmp score,30
        je finish

        ; draw score:
        mov dl,1
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov ax,score
        call WriteInt

        ;Draw PackMan Game!
        mov dl,46
        mov dh,0
        call Gotoxy
        mov edx,OFFSET packman
        call WriteString
       
        ;lives
        mov dl,123
        mov dh,28
        call Gotoxy
        mov edx,OFFSET strLife
        call WriteString
         mov eax,0
        mov al,lives
        call WriteInt

        ;Draw Coal 23'
        mov dl,110
        mov dh,0
        call Gotoxy
        mov edx,OFFSET coal
        call WriteString

        ;Level of the Game
        mov dl,124
        mov dh,5
        call Gotoxy
        mov edx,OFFSET level_of_the_game
        call WriteString
         mov eax,0
        mov al,level
        call writeint
        ;call crlf

        ;Cutting Line

        mov dl, 122
        mov dh,4
        call Gotoxy
        mov edx, offset cutting
        call writestring

        mov dl, 122
        mov dh,6
        call Gotoxy
        mov edx, offset cutting
        call writestring

        ;Name
        mov dl,121
        mov dh,8
        call Gotoxy
        mov edx,OFFSET hammadshabbir
        call WriteString
        
        ;Sec
        mov dl,125
        mov dh,10
        call Gotoxy
        mov edx,OFFSET section
        call WriteString

        
        ;Roll No
        mov dl,123
        mov dh,12
        call Gotoxy
        mov edx,OFFSET rollNo
        call WriteString



        ; gravity logic:
        gravitymaze3:
        cmp yPos,0
        jg onGroundmaze3
        
        ; make player fall:
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        mov eax,100  ;Postion where to player falls
        call Delay
        jmp gravity
        onGroundmaze3:

        ; get user key input:
        
        call TeleportFunc
        call TeleportFunc1
        call TeleportFunc2
        ; exit game if user types 'x':
        call ReadChar

        mov inputChar,al

        cmp inputChar,"x"
        je exitGame2 

        cmp inputChar,"w"
        je moveUpMaze3

        cmp inputChar,"s"
        je moveDownMaze3

        cmp inputChar,"a"
        je moveLeftMaze3

        cmp inputChar,"d"
        je moveRightMaze3

        cmp inputchar, "p"
        jmp Menu

    moveUpMaze3:
 
        mov bl, xPos
        mov bh, yPos
        dec bh
        mov al, 0

        ;***********************************************  MAZE 3  *************************************************************

           ;Vertical Calling

        call WallCheckMidLeft1VerticalMaze3 
        cmp al,1
        je pnomove3
        call WallCheckMidLeft2VerticalMaze3 
        cmp al,1
        je pnomove3
        call WallCheckMid1VerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMid2VerticalRightMaze3 
        cmp al,1
        je pnomove3
        call WallCheckMid3VerticalLeftNextMaze3
        cmp al,1
        je pnomove3
        call WallCheckMid4VerticalRightPrevMaze3 
        cmp al,1
        je pnomove3
        call WallCheckLeftLongVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckRightLongVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMidLeftUpprVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMidRightUpprVerticalLeftMaze3
        cmp al,1
        je pnomove3
         
           ;Horizontal Calling

        call WallCheckHorizontalTopCornersMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalBottomCornersMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMIDMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMID1Maze3 
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMID2Maze3 
        cmp al,1
        je pnomove3
        call WallCheckHorizontalTopMidMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalBottomMidMaze3
        cmp al,1
        je pnomove3

        call WallCheckVerticalBorder1
        cmp al, 1
        je pnomove3
        call WallCheckVerticalBorder2
        cmp al, 1
        je pnomove3

        call WallCheckHorizontalMIDMidTopMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMIDMidBottomMaze3
        cmp al,1
        je pnomove3
        
        call WallCheckHorizontalGrounUp
        cmp al,1
        je pnomove3
        call WallCheckHorizontalGrounDown
        cmp al,1
        je pnomove3

        call VerticalBoundaryWallMaze3
        cmp al,1
        je pnomove3

        call VerticalBoundaryWallMaze31
        cmp al,1
        je pnomove3

        call UpdatePlayer
        dec yPos
        call DrawPlayer
        jmp gameLoopMaze3

   moveDownMaze3:

        mov bl, xPos
        mov bh, yPos
        inc bh
        mov al, 0

        
        ;***********************************************  MAZE 3  *************************************************************

            ;Vertical Calling

        call WallCheckMidLeft1VerticalMaze3 
        cmp al,1
        je pnomove3
        call WallCheckMidLeft2VerticalMaze3 
        cmp al,1
        je pnomove3
        call WallCheckMid1VerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMid2VerticalRightMaze3 
        cmp al,1
        je pnomove3
        call WallCheckMid3VerticalLeftNextMaze3
        cmp al,1
        je pnomove3
        call WallCheckMid4VerticalRightPrevMaze3 
        cmp al,1
        je pnomove3
        call WallCheckLeftLongVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckRightLongVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMidLeftUpprVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMidRightUpprVerticalLeftMaze3
        cmp al,1
        je pnomove3

             ;Horizontal Calling

        call WallCheckHorizontalTopCornersMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalBottomCornersMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMIDMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMID1Maze3 
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMID2Maze3 
        cmp al,1
        je pnomove3
        call WallCheckHorizontalTopMidMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalBottomMidMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMIDMidTopMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMIDMidBottomMaze3
        cmp al,1
        je pnomove3

        call WallCheckVerticalBorder1
        cmp al, 1
        je pnomove3
        call WallCheckVerticalBorder2
        cmp al, 1
        je pnomove3

        call WallCheckHorizontalGrounUp
        cmp al,1
        je pnomove3

        call WallCheckHorizontalGrounDown
        cmp al,1
        je pnomove3

        call VerticalBoundaryWallMaze3
        cmp al,1
        je pnomove3

        call VerticalBoundaryWallMaze31
        cmp al,1
        je pnomove3

        call UpdatePlayer
        inc yPos
        call DrawPlayer 
        jmp gameLoopMaze3

   moveLeftMaze3:

        mov bl, xPos
        mov bh, yPos
        dec bl
        mov al, 0
      
        ;***********************************************  MAZE 3  *************************************************************

           ;Vertical Calling

        call WallCheckMidLeft1VerticalMaze3 
        cmp al,1
        je pnomove3
        call WallCheckMidLeft2VerticalMaze3 
        cmp al,1
        je pnomove3
        call WallCheckMid1VerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMid2VerticalRightMaze3 
        cmp al,1
        je pnomove3
        call WallCheckMid3VerticalLeftNextMaze3
        cmp al,1
        je pnomove3
        call WallCheckMid4VerticalRightPrevMaze3 
        cmp al,1
        je pnomove3
        call WallCheckLeftLongVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckRightLongVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMidLeftUpprVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMidRightUpprVerticalLeftMaze3
        cmp al,1
        je pnomove3

            ;Horizontal Calling

        call WallCheckHorizontalTopCornersMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalBottomCornersMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMIDMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMID1Maze3 
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMID2Maze3 
        cmp al,1
        je pnomove3
        call WallCheckHorizontalTopMidMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalBottomMidMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMIDMidTopMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMIDMidBottomMaze3
        cmp al,1
        je pnomove3

        call WallCheckVerticalBorder1
        cmp al, 1
        je pnomove3
        call WallCheckVerticalBorder2
        cmp al, 1
        je pnomove3

        call WallCheckHorizontalGrounUp
        cmp al,1
        je pnomove3
        call WallCheckHorizontalGrounDown
        cmp al,1
        je pnomove3

        call VerticalBoundaryWallMaze3
        cmp al,1
        je pnomove3

        call VerticalBoundaryWallMaze31
        cmp al,1
        je pnomove3

        call UpdatePlayer
        dec xPos
        call DrawPlayer
        jmp gameLoopMaze3

   moveRightMaze3:

        mov bl, xPos
        mov bh, yPos
        inc bl
        mov al, 0

        ;***********************************************  MAZE 3  *************************************************************

            ;Vertical Calling

        call WallCheckMidLeft1VerticalMaze3 
        cmp al,1
        je pnomove3
        call WallCheckMidLeft2VerticalMaze3 
        cmp al,1
        je pnomove3
        call WallCheckMid1VerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMid2VerticalRightMaze3
        cmp al,1
        je pnomove3
        call WallCheckMid3VerticalLeftNextMaze3
        cmp al,1
        je pnomove3
        call WallCheckMid4VerticalRightPrevMaze3 
        cmp al,1
        je pnomove3
        call WallCheckLeftLongVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckRightLongVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMidLeftUpprVerticalLeftMaze3
        cmp al,1
        je pnomove3
        call WallCheckMidRightUpprVerticalLeftMaze3
        cmp al,1
        je pnomove3

             ;Horizontal Calling

        call WallCheckHorizontalTopCornersMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalBottomCornersMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMIDMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMID1Maze3 
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMID2Maze3 
        cmp al,1
        je pnomove3
        call WallCheckHorizontalTopMidMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalBottomMidMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMIDMidTopMaze3
        cmp al,1
        je pnomove3
        call WallCheckHorizontalMIDMidBottomMaze3
        cmp al,1
        je pnomove3

        call WallCheckVerticalBorder1
        cmp al, 1
        je pnomove3

        call WallCheckVerticalBorder2
        cmp al, 1
        je pnomove3

        call WallCheckHorizontalGrounUp
        cmp al,1
        je pnomove3

        call WallCheckHorizontalGrounDown
        cmp al,1
        je pnomove3

        call VerticalBoundaryWallMaze3
        cmp al,1
        je pnomove3

        call VerticalBoundaryWallMaze31
        cmp al,1
        je pnomove3

        call UpdatePlayer
        inc xPos
        call DrawPlayer
        jmp gameLoopMaze3
     
     pnomove3: 
    jmp gameLoopMaze3
    

 lastscreen:
    
    mov eax,white (black*16)
    call SetTextColor
    call clrscr
    mov dh,10
    mov dl, 45
    call Gotoxy
    mov edx,offset gameover
    call writestring
    call crlf

    mov dh,12
    mov dl, 50
    call Gotoxy
    mov edx,offset gameover1
    call writestring

    
    ;draw score:
    mov dl,50
    mov dh,14
    call Gotoxy
    mov edx,OFFSET strScore
    call WriteString
    mov ax,score
    call WriteInt
    call crlf

    ;draw score:
    mov dl,50
    mov dh,16
    call Gotoxy
    mov edx,OFFSET yourlevel
    call WriteString
     mov eax,0
    mov al,level
    call WriteInt
    call crlf



    ;fILE Handling
    mov edx,OFFSET filename
    call OpenInputFile

    mov fileHandle,eax
    cmp eax,INVALID_HANDLE_VALUE 
    jne file_ok1
    mov edx,offset errMsg
    call writestring
    jmp quit1

file_ok1:


    mov edx,OFFSET buffer
    mov ecx,BUFFER_SIZE
    call ReadFromFile
    jnc check_buffer_size ;if not carry 
    mov edx,offset error
    call writestring
    call WriteWindowsMsg
    jmp close_file

check_buffer_size:

    cmp eax,BUFFER_SIZE1
    jb buf_size_ok
    mov edx,offset sizesmall
    call writestring
    jmp quit1

buf_size_ok:

   mov buffer[eax],0
   mov dh,18  
   mov dl,50
   call Gotoxy
   mov edx,offset yourname
   call writestring
   mov dh,18  
   mov dl,63
   call Gotoxy
   mov edx, OFFSET buffer
   call WriteString
   call Crlf
   close_file:
   mov eax,fileHandle
   call CloseFile

quit1:
  
    mov eax,red (red*16)
    call SetTextColor


   ;Tiles Border
      
        ;1st Top Left

    mov dl,4
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border1maze44:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border1maze44


       ;2nd Top Right
    
    call SetTextColor
    mov dl,107
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border2maze44:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border2maze44


     ;3rd Bottom Left
    
    call SetTextColor
    mov dl,4
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border3maze44:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border3maze44


      ;4th Bottom Right
    
    call SetTextColor
    mov dl,107
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border4maze44:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border4maze44


    call ReadChar
    mov inputchar,al

    cmp inputchar,"x"
    je exitGame2



 finish:
    
    mov eax,white (black*16)
    call SetTextColor
    call clrscr
    mov dh,14
    mov dl, 45
    call Gotoxy
    mov edx,offset winner
    call writestring
    call crlf

    
    ;draw score:
    mov dl,50
    mov dh,16
    call Gotoxy
    mov edx,OFFSET strScore
    call WriteString
    mov ax,score
    call WriteInt
    call crlf

    mov eax,lightblue (lightblue*16)
    call SetTextColor


   ;Tiles Border
      
        ;1st Top Left

    mov dl,4
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border1maze77:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border1maze77


       ;2nd Top Right
    
    call SetTextColor
    mov dl,107
    mov dh,3
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,4
    mov temp,dh
    border2maze77:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border2maze77


     ;3rd Bottom Left
    
    call SetTextColor
    mov dl,4
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border3maze77:
    mov dh,temp
    mov dl,4
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border3maze77


      ;4th Bottom Right
    
    call SetTextColor
    mov dl,107
    mov dh,27
    call Gotoxy
    mov edx,OFFSET tiles3
    call WriteString

    mov ecx,6
    mov dh,21
    mov temp,dh
    border4maze77:
    mov dh,temp
    mov dl,115
    call Gotoxy
    mov edx,OFFSET tiles2  ;"#"
    call WriteString
    inc temp
    loop border4maze77


    call ReadChar
    mov inputchar,al

    cmp inputchar,"x"
    je exitGame2

    
   
    exitGame2:
    exit

main ENDP

;***********************************************  MAZE 1  *************************************************************

;Maze 1 Vertical
WallCheckVertical1 PROC
;1
cmp bl, 16
jne not_one
cmp bh,8
jl not_one
cmp bh, 21
jg not_one
cmp bh, 11
jle is_one
cmp bh, 18
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
 WallCheckVertical1 ENDP
WallCheckVertical01 PROC
;1
cmp bl, 45
jne not_one
cmp bh,8
jl not_one
cmp bh, 21
jg not_one
cmp bh, 11
jle is_one
cmp bh,18
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckVertical01 ENDP
WallCheckVertical4 PROC
;1
cmp bl, 78
jne not_one
cmp bh,8
jl not_one
cmp bh, 21
jg not_one
cmp bh, 11
jle is_one
cmp bh,18
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckVertical4 ENDP
WallCheckVertical04 PROC
;1
cmp bl, 65
jne not_one
cmp bh,8
jl not_one
cmp bh, 70
jg not_one
cmp bh, 11
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckVertical04 ENDP
WallCheckVertical5 PROC
;1
cmp bl, 95
jne not_one
cmp bh,8
jl not_one
cmp bh, 100
jg not_one
cmp bh, 11
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckVertical5 ENDP
WallCheckVertical05 PROC
;1
cmp bl, 110
jne not_one
cmp bh,18
jl not_one
cmp bh, 115
jg not_one
cmp bh, 21
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckVertical05 ENDP

;Maze 1 Horizontal

WallCheckHorizontalMidsMaze1 PROC
;1
cmp bh,15
jne not_one
cmp bl,69
jl not_one
cmp bl, 74
jle is_one
cmp bl,100
jl not_one
cmp bl, 105
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalMidsMaze1 ENDP
WallCheckHorizontalTopCornersMaze1 PROC
;1
cmp bh,3
jne not_one
cmp bl,4
jl not_one
cmp bl, 12
jle is_one
cmp bl,107
jl not_one
cmp bl, 115
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalTopCornersMaze1 ENDP
WallCheckHorizontalBottomCornersMaze1 PROC
;1
cmp bh,27
jne not_one
cmp bl,4
jl not_one
cmp bl, 12
jle is_one
cmp bl,107
jl not_one
cmp bl, 115
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalBottomCornersMaze1 ENDP
WallCheckHorizontalTopMaze1 PROC
;1
cmp bh,5
jne not_one
cmp bl,11
jl not_one
cmp bl, 16
jle is_one
cmp bl,40
jl not_one
cmp bl, 45
jle is_one
cmp bl,100
jl not_one
cmp bl, 105
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalTopMaze1 ENDP
WallCheckHorizontalBotoomMaze1 PROC
;1
cmp bh,24
jne not_one
cmp bl,11
jl not_one
cmp bl, 16
jle is_one
cmp bl,40
jl not_one
cmp bl, 45
jle is_one
cmp bl,100
jl not_one
cmp bl, 105
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalBotoomMaze1 ENDP

WallCheckVerticalBorder1Maze1  PROC
;1
cmp bl, 4
jne not_one
cmp bh,4
jl not_one
cmp bh, 26
jg not_one
cmp bh, 9
jle is_one
cmp bh,21
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckVerticalBorder1Maze1  ENDP
WallCheckVerticalBorder2Maze1  PROC
;1
cmp bl, 115
jne not_one
cmp bh,4
jl not_one
cmp bh, 26
jg not_one
cmp bh, 9
jle is_one
cmp bh,21
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckVerticalBorder2Maze1  ENDP

;***********************************************  MAZE 2  *************************************************************

;Maze 2 Vertical

WallCheckLeft1VerticalMaze2  PROC
;0
cmp bl, 12
jne not_one
cmp bh,8
jl not_one
cmp bh, 21
jg not_one
cmp bh, 11
jle is_one
cmp bh,18
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckLeft1VerticalMaze2  ENDP
WallCheckLeft2VerticalMaze2  PROC
;0
cmp bl, 26
jne not_one
cmp bh,8
jl not_one
cmp bh, 21
jg not_one
cmp bh, 11
jle is_one
cmp bh,18
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckLeft2VerticalMaze2  ENDP
WallCheckRight1VerticalMaze2  PROC
;0
cmp bl, 90
jne not_one
cmp bh,8
jl not_one
cmp bh, 21
jg not_one
cmp bh, 11
jle is_one
cmp bh,18
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckRight1VerticalMaze2  ENDP
WallCheckRight2VerticalMaze2  PROC
;0
cmp bl, 105
jne not_one
cmp bh,8
jl not_one
cmp bh, 21
jg not_one
cmp bh, 11
jle is_one
cmp bh,18
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckRight2VerticalMaze2  ENDP
WallCheckMid1VerticalLeftMaze2  PROC
;0
cmp bl, 43
jne not_one
cmp bh,12
jl not_one
cmp bh, 17
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMid1VerticalLeftMaze2  ENDP
WallCheckMid2VerticalRightMaze2  PROC
;0
cmp bl, 72
jne not_one
cmp bh,12
jl not_one
cmp bh, 17
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMid2VerticalRightMaze2  ENDP
WallCheckMid3VerticalLeftNextMaze2  PROC
;0
cmp bl, 47
jne not_one
cmp bh,13
jl not_one
cmp bh, 15
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMid3VerticalLeftNextMaze2  ENDP
WallCheckMid4VerticalRightPrevMaze2  PROC
;0
cmp bl, 69
jne not_one
cmp bh,13
jl not_one
cmp bh, 15
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMid4VerticalRightPrevMaze2  ENDP

;Maze 2 HOrizontal

WallCheckHorizontalMaze2 PROC
;1
cmp bh,5
jne not_one
cmp bl,17
jl not_one
cmp bl, 22
jle is_one
cmp bl,95
jl not_one
cmp bl, 100
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalMaze2 ENDP
WallCheckHorizontalBottomMaze2 PROC
;1
cmp bh,24
jne not_one
cmp bl,17
jl not_one
cmp bl, 22
jle is_one
cmp bl,95
jl not_one
cmp bl, 100
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalBottomMaze2 ENDP
WallCheckHorizontalTopCornersMaze2 PROC
;1
cmp bh,3
jne not_one
cmp bl,4
jl not_one
cmp bl, 12
jle is_one
cmp bl,107
jl not_one
cmp bl, 115
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalTopCornersMaze2 ENDP
WallCheckHorizontalBottomCornersMaze2 PROC
;1
cmp bh,27
jne not_one
cmp bl,4
jl not_one
cmp bl, 12
jle is_one
cmp bl,107
jl not_one
cmp bl, 115
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalBottomCornersMaze2 ENDP
WallCheckHorizontalMIDMaze2 PROC
cmp bh,12
jne not_one
cmp bl,51
jl not_one
cmp bl, 64
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalMIDMaze2 ENDP
WallCheckHorizontalMID1Maze2 PROC
cmp bh,16
jne not_one
cmp bl,51
jl not_one
cmp bl, 64
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalMID1Maze2 ENDP
WallCheckHorizontalMID2Maze2 PROC
cmp bh,18
jne not_one
cmp bl,43
jl not_one
cmp bl, 72
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalMID2Maze2 ENDP

WallCheckVerticalBorder1Maze2  PROC
;1
cmp bl, 4
jne not_one
cmp bh,4
jl not_one
cmp bh, 26
jg not_one
cmp bh, 9
jle is_one
cmp bh,21
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckVerticalBorder1Maze2  ENDP
WallCheckVerticalBorder2Maze2  PROC
;1
cmp bl, 115
jne not_one
cmp bh,4
jl not_one
cmp bh, 26
jg not_one
cmp bh, 9
jle is_one
cmp bh,21
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckVerticalBorder2Maze2  ENDP


;***********************************************  MAZE 3  *************************************************************


;Maze 3 Vertical

WallCheckMidLeft1VerticalMaze3  PROC
;0
cmp bl, 24
jne not_one
cmp bh,10
jl not_one
cmp bh, 20
jg not_one
cmp bh, 13
jle is_one
cmp bh,17
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMidLeft1VerticalMaze3 ENDP
WallCheckMidLeft2VerticalMaze3  PROC
;0
cmp bl, 96
jne not_one
cmp bh,10
jl not_one
cmp bh, 20
jg not_one
cmp bh, 13
jle is_one
cmp bh,17
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMidLeft2VerticalMaze3 ENDP
WallCheckMid1VerticalLeftMaze3  PROC
;0
cmp bl, 43
jne not_one
cmp bh,12
jl not_one
cmp bh, 17
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMid1VerticalLeftMaze3  ENDP
WallCheckMid2VerticalRightMaze3  PROC
;0
cmp bl, 72
jne not_one
cmp bh,12
jl not_one
cmp bh, 17
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMid2VerticalRightMaze3  ENDP
WallCheckMid3VerticalLeftNextMaze3  PROC
;0
cmp bl, 47
jne not_one
cmp bh,13
jl not_one
cmp bh, 15
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMid3VerticalLeftNextMaze3  ENDP
WallCheckMid4VerticalRightPrevMaze3  PROC
;0
cmp bl, 69
jne not_one
cmp bh,13
jl not_one
cmp bh, 15
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMid4VerticalRightPrevMaze3  ENDP
WallCheckLeftLongVerticalLeftMaze3  PROC
;0
cmp bl, 11
jne not_one
cmp bh,7
jl not_one
cmp bh, 23
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckLeftLongVerticalLeftMaze3  ENDP
WallCheckRightLongVerticalLeftMaze3  PROC
;0
cmp bl, 106
jne not_one
cmp bh,7
jl not_one
cmp bh, 23
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckRightLongVerticalLeftMaze3  ENDP
WallCheckMidLeftUpprVerticalLeftMaze3  PROC
;0
cmp bl, 30
jne not_one
cmp bh,3
jl not_one
cmp bh, 27
jg not_one
cmp bh, 6
jle is_one
cmp bh, 24
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMidLeftUpprVerticalLeftMaze3   ENDP
WallCheckMidRightUpprVerticalLeftMaze3  PROC
;0
cmp bl, 84
jne not_one
cmp bh,3
jl not_one
cmp bh, 27
jg not_one
cmp bh, 6
jle is_one
cmp bh, 24
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckMidRightUpprVerticalLeftMaze3   ENDP


;Maze 3 Horizontal

WallCheckHorizontalTopCornersMaze3 PROC
;1
cmp bh,3
jne not_one
cmp bl,4
jl not_one
cmp bl, 12
jle is_one
cmp bl,107
jl not_one
cmp bl, 115
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalTopCornersMaze3 ENDP
WallCheckHorizontalBottomCornersMaze3 PROC
;1
cmp bh,27
jne not_one
cmp bl,4
jl not_one
cmp bl, 12
jle is_one
cmp bl,107
jl not_one
cmp bl, 115
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalBottomCornersMaze3 ENDP
WallCheckHorizontalMIDMaze3 PROC
cmp bh,12
jne not_one
cmp bl,51
jl not_one
cmp bl, 64
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalMIDMaze3 ENDP
WallCheckHorizontalMID1Maze3 PROC
cmp bh,16
jne not_one
cmp bl,51
jl not_one
cmp bl, 64
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalMID1Maze3 ENDP
WallCheckHorizontalMID2Maze3 PROC
cmp bh,18
jne not_one
cmp bl,43
jl not_one
cmp bl, 72
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalMID2Maze3 ENDP
WallCheckHorizontalTopMidMaze3 PROC
;1
cmp bh,7
jne not_one
cmp bl,30
jl not_one
cmp bl, 46
jle is_one
cmp bl,68
jl not_one
cmp bl, 84
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalTopMidMaze3 ENDP
WallCheckHorizontalBottomMidMaze3 PROC
;1
cmp bh,23
jne not_one
cmp bl,30
jl not_one
cmp bl, 46
jle is_one
cmp bl,68
jl not_one
cmp bl, 84
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalBottomMidMaze3 ENDP
WallCheckHorizontalMIDMidTopMaze3 PROC
;1
cmp bh,9
jne not_one
cmp bl,24
jl not_one
cmp bl, 96
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalMIDMidTopMaze3 ENDP
WallCheckHorizontalMIDMidBottomMaze3 PROC
;1
cmp bh,21
jne not_one
cmp bl,24
jl not_one
cmp bl, 96
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalMIDMidBottomMaze3 ENDP
WallCheckHorizontalGrounUp PROC
;1
cmp bh,1
jne not_one
cmp bl,0
jl not_one
cmp bl, 60
jle is_one
cmp bl,62
jl not_one
cmp bl, 119
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalGrounUp ENDP
WallCheckHorizontalGrounDown PROC
;1
cmp bh,29
jne not_one
cmp bl,0
jl not_one
cmp bl, 60
jle is_one
cmp bl,62
jl not_one
cmp bl, 119
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckHorizontalGrounDown ENDP

WallCheckVerticalBorder1  PROC
;1
cmp bl, 4
jne not_one
cmp bh,4
jl not_one
cmp bh, 26
jg not_one
cmp bh, 9
jle is_one
cmp bh,21
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckVerticalBorder1  ENDP
WallCheckVerticalBorder2  PROC
;1
cmp bl, 115
jne not_one
cmp bh,4
jl not_one
cmp bh, 26
jg not_one
cmp bh, 9
jle is_one
cmp bh,21
jge is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
WallCheckVerticalBorder2  ENDP
VerticalBoundaryWallMaze3 PROC
cmp bl, 0
jne not_one
cmp bh,2
jl not_one
cmp bh, 27
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
VerticalBoundaryWallMaze3 ENDP
VerticalBoundaryWallMaze31 PROC
cmp bl, 119
jne not_one
cmp bh,2
jl not_one
cmp bh, 27
jle is_one
jmp not_one
is_one:
mov al, 1
not_one:
ret
VerticalBoundaryWallMaze31 ENDP


        ;moveUp:
        ;mov ecx,3 ; allow player to jump how many steps to jump?? (3):
        ;jumpLoop:
            ;call UpdatePlayer
            ;dec yPos
            ;call DrawPlayer
            ;mov eax,70
            ;call Delay
        ;loop jumpLoop
        ;jmp gameLoop

;***********************************************  Player  *************************************************************

DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"C"

    call WriteChar
    ret
DrawPlayer ENDP
UpdatePlayer PROC
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdatePlayer ENDP


;**************************************************** Maze 1  & Coins & Ghost  *******************************************

CoinCollection PROC

mov esi,0
mov ecx, 38
coincoll:
cmp bl, [coinx1+esi]
jne notcoin1
cmp bh, coiny1
jne notcoin1
inc score
mov [coinx1+esi],0
mov scorechange,1

notcoin1:
cmp bl, [coinx2+esi]
jne notcoin2
cmp bh, coiny2
jne notcoin2
inc score
mov [coinx2+esi],0
mov scorechange,1
notcoin2:
inc esi
loop coincoll


mov esi, 0
mov ecx, 20
coincoll2:
cmp bl, coinx3
jne notcoin3
cmp bh, [coiny3+esi]
jne notcoin3
inc score
mov [coiny3+esi],0
mov scorechange,1

notcoin3:
cmp bl, coinx4
jne notcoin4
cmp bh, [coiny4+esi]
jne notcoin4
inc score
mov [coiny4+esi],0
mov scorechange,1
notcoin4:
inc esi
loop coincoll2


mov esi, 0
mov ecx, 11
coincoll3:
cmp bl, coin2x1
jne notcoin5
cmp bh, [coin2y1+esi]
jne notcoin5
inc score
mov [coin2y1+esi],0
mov scorechange,1

notcoin5:
cmp bl, coin3x2
jne notcoin6
cmp bh, [coin3y2+esi]
jne notcoin6
inc score
mov [coin3y2+esi],0
mov scorechange,1
notcoin6:
inc esi
loop coincoll3


mov esi, 0
mov ecx, 18
coincoll4:
cmp bl, coin1x1
jne notcoin7
cmp bh, [coin1y1+esi]
jne notcoin7
inc score
mov [coin1y1+esi],0
mov scorechange,1

notcoin7:
cmp bl, coin1x2
jne notcoin8
cmp bh, [coin1y2+esi]
jne notcoin8
inc score
mov [coin1y2+esi],0
mov scorechange,1
notcoin8:
inc esi
loop coincoll4

mov esi, 0
mov ecx, 15
coincoll5:
cmp bl, coin2x2
jne notcoin9
cmp bh, [coin2y2+esi]
jne notcoin9
inc score
mov [coin2y2+esi],0
mov scorechange,1
notcoin9:
inc esi
loop coincoll5


ret
CoinCollection ENDP


UpdateGhost1 PROC

    mov dl,xPosG1
    mov dh,yPosG1
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG1
    cmp al, 'u'
    je upG1
    inc yPosG1
    jmp endG1
    upG1:
    dec yPosG1
    endG1:
    cmp yPosG1, 8
    je chngdownG1
    cmp yPosG1, 22
    je chngupG1
    jmp end2G1
    chngdownG1:
    mov moveG1, 'd'
    jmp end2G1
    chngupG1:
    mov moveG1, 'u'
    end2G1:
    ret

UpdateGhost1 ENDP

DrawGhost1 PROC

    mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,xPosG1
    mov dh,yPosG1
    call Gotoxy
    mov al,"#"
    call WriteChar
    ret
DrawGhost1 ENDP

G1Collision PROC



cmp bl, xPosG1
jne G1Collend
cmp bh, yPosG1
jne G1Collend

INVOKE PlaySound, OFFSET music, NULL, 11h
mov eax,5
call delay

call DrawPlayer
mov xPos,57
mov yPos,14
dec lives
mov al, 1
G1Collend:
ret

G1COllision ENDP

;Ghost 2
UpdateGhost2 PROC

    mov dl,xPosG2
    mov dh,yPosG2
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG2
    cmp al, 'u'
    je upG2
    inc yPosG2
    jmp endG2
    upG2:
    dec yPosG2
    endG2:
    cmp yPosG2, 8
    je chngdownG2
    cmp yPosG2, 22
    je chngupG2
    jmp end2G2
    chngdownG2:
    mov moveG2, 'd'
    jmp end2G2
    chngupG2:
    mov moveG2, 'u'
    end2G2:
    ret

UpdateGhost2 ENDP

DrawGhost2 PROC

    mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,xPosG2
    mov dh,yPosG2
    call Gotoxy
    mov al,"@"
    call WriteChar
    ret
DrawGhost2 ENDP

G2Collision PROC


cmp bl, xPosG2
jne G2Collend
cmp bh, yPosG2
jne G2Collend
call DrawPlayer
mov xPos,57
mov yPos,14
dec lives
mov al, 1
G2Collend:
ret

G2COllision ENDP

;Ghost 3
UpdateGhost3 PROC

    mov dl,xPosG3
    mov dh,yPosG3
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG3
    cmp al, 'u'
    je upG3
    inc yPosG3
    jmp endG3
    upG3:
    dec yPosG3
    endG3:
    cmp yPosG3, 8
    je chngdownG3
    cmp yPosG3, 22
    je chngupG3
    jmp end2G3
    chngdownG3:
    mov moveG3, 'd'
    jmp end2G3
    chngupG3:
    mov moveG3, 'u'
    end2G3:
    ret

UpdateGhost3 ENDP

DrawGhost3 PROC

    mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,xPosG3
    mov dh,yPosG3
    call Gotoxy
    mov al,"&"
    call WriteChar
    ret
DrawGhost3 ENDP

G3Collision PROC

cmp bl, xPosG3
jne G3Collend
cmp bh, yPosG3
jne G3Collend
call DrawPlayer
mov xPos,57
mov yPos,14
dec lives
mov al, 1
G3Collend:
ret

G3COllision ENDP

;************************************************* MAZE 2 GHOST AND COINS COLLECTIONS *************************


CoinCollectionForMaze2 PROC

mov esi,0
mov ecx, 35
coincollMaze22:
cmp bl, [coinx1Maze22+esi]
jne notcoin1Maze22
cmp bh, coiny1Maze22
jne notcoin1Maze22
inc score
mov [coinx1Maze22+esi],0
mov scorechange,1

notcoin1Maze22:
cmp bl, [coinx2Maze22+esi]
jne notcoin2Maze22
cmp bh, coiny2Maze22
jne notcoin2Maze22
inc score
mov [coinx2Maze22+esi],0
mov scorechange,1
notcoin2Maze22:
inc esi
loop coincollMaze22


mov esi,0
mov ecx, 23
coincoll1Maze22:
cmp bl, [coinx1Maze2+esi]
jne notcoin1Maze222
cmp bh, coiny1Maze2
jne notcoin1Maze222
inc score
mov [coinx1Maze2+esi],0
mov scorechange,1

notcoin1Maze222:
cmp bl, [coinx2Maze2+esi]
jne notcoin2Maze222   
cmp bh, coiny2Maze2
jne notcoin2Maze222
inc score
mov [coinx2Maze2+esi],0
mov scorechange,1
notcoin2Maze222:
inc esi
loop coincoll1Maze22



mov esi, 0
mov ecx, 20
coincoll2Maze22:
cmp bl, coinx3Maze22
jne notcoin3Maze22
cmp bh, [coiny3Maze22+esi]
jne notcoin3Maze22
inc score
mov [coiny3Maze22+esi],0
mov scorechange,1

notcoin3Maze22:
cmp bl, coinx4Maze22
jne notcoin4Maze22
cmp bh, [coiny4Maze22+esi]
jne notcoin4Maze22
inc score
mov [coiny4Maze22+esi],0
mov scorechange,1
notcoin4Maze22:
inc esi
loop coincoll2Maze22

mov esi, 0
mov ecx, 14
coincoll3Maze22:
cmp bl, coinx3Maze2
jne notcoin5Maze22
cmp bh, [coiny3Maze2+esi]
jne notcoin5Maze22
inc score
mov [coiny3Maze2+esi],0
mov scorechange,1

notcoin5Maze22:
cmp bl, coinx4Maze2
jne notcoin6Maze22
cmp bh, [coiny4Maze2+esi]
jne notcoin6Maze22
inc score
mov [coiny4Maze2+esi],0
mov scorechange,1
notcoin6Maze22:
inc esi
loop coincoll3Maze22


mov esi, 0
mov ecx, 18
coincoll4Maze22:
cmp bl, coin1x1Maze22
jne notcoin7Maze22
cmp bh, [coin1y1Maze22+esi]
jne notcoin7Maze22
inc score
mov [coin1y1Maze22+esi],0
mov scorechange,1

notcoin7Maze22:
cmp bl, coin1x2Maze22
jne notcoin8Maze22
cmp bh, [coin1y2Maze22+esi]
jne notcoin8Maze22
inc score
mov [coin1y2Maze22+esi],0
mov scorechange,1
notcoin8Maze22:
inc esi
loop coincoll4Maze22



mov esi, 0
mov ecx, 11
coincoll5Maze22:
cmp bl, coin2x1Maze22
jne notcoin9Maze22
cmp bh, [coin2y1Maze22+esi]
jne notcoin9Maze22
inc score
mov [coin2y1Maze22+esi],0
mov scorechange,1

notcoin9Maze22:
cmp bl, coin3x2Maze22
jne notcoin10Maze22
cmp bh, [coin3y2Maze22+esi]
jne notcoin10Maze22
inc score
mov [coin3y2Maze22+esi],0
mov scorechange,1
notcoin10Maze22:
inc esi
loop coincoll5Maze22


mov esi, 0
mov ecx, 15
coincoll6Maze22:
cmp bl, coin2x2Maze22
jne notcoin11Maze22
cmp bh, [coin2y2Maze22+esi]
jne notcoin11Maze22
inc score
mov [coin2y2Maze22+esi],0
mov scorechange,1

notcoin11Maze22:
cmp bl, coin2x3Maze22
jne notcoin12Maze22
cmp bh, [coin2y3Maze22+esi]
jne notcoin12Maze22
inc score
mov [coin2y3Maze22+esi],0
mov scorechange,1
notcoin12Maze22:
inc esi
loop coincoll6Maze22



mov esi, 0
mov ecx, 10
coincoll7Maze22:
cmp bl, coin1x3Maze2
jne notcoin13Maze22
cmp bh, [coin1y3Maze2+esi]
jne notcoin13Maze22
inc score
mov [coin1y3Maze2+esi],0
mov scorechange,1

notcoin13Maze22:
cmp bl, coin1x4Maze2
jne notcoin14Maze22
cmp bh, [coin1y4Maze2+esi]
jne notcoin14Maze22
inc score
mov [coin1y4Maze2+esi],0
mov scorechange,1
notcoin14Maze22:
inc esi
loop coincoll7Maze22



mov esi,0
mov ecx, 9
coincoll8Maze22:
cmp bl, [coin1x1Maze2+esi]
jne notcoin15Maze22
cmp bh, coin1y1Maze2
jne notcoin15Maze22
inc score
mov [coin1x1Maze2+esi],0
mov scorechange,1

notcoin15Maze22:
cmp bl, [coin1x2Maze2+esi]
jne notcoin16Maze22
cmp bh, coin1y2Maze2
jne notcoin16Maze22
inc score
mov [coin1x2Maze2+esi],0
mov scorechange,1
notcoin16Maze22:
inc esi
loop coincoll8Maze22


mov esi,0
mov ecx, 1
coincoll9Maze22:
cmp bl, [fruitex1+esi]
jne notcoin17Maze22
cmp bh, fruitey1
jne notcoin17Maze22


add score,5
mov [fruitex1+esi],0
mov scorechange,1

notcoin17Maze22:
inc esi 
loop coincoll9Maze22

mov esi,0
mov ecx, 1
coincoll10Maze22:
cmp bl, [fruitex2+esi]
jne notcoin18Maze22
cmp bh, fruitey2
jne notcoin18Maze22
add score,5
mov [fruitex2+esi],0
mov scorechange,1

notcoin18Maze22:
inc esi 
loop coincoll10Maze22


mov esi,0
mov ecx, 1
coincoll11Maze22:
cmp bl, [fruitex3+esi]
jne notcoin19Maze22
cmp bh, fruitey3
jne notcoin19Maze22
add score,5
mov [fruitex3+esi],0
mov scorechange,1

notcoin19Maze22:
inc esi 
loop coincoll11Maze22


mov esi,0
mov ecx, 1
coincoll12Maze22:
cmp bl, [fruitex4+esi]
jne notcoin20Maze22
cmp bh, fruitey4
jne notcoin20Maze22


add score,5
mov [fruitex4+esi],0
mov scorechange,1

notcoin20Maze22:
inc esi 
loop coincoll12Maze22


mov esi,0
mov ecx, 1
coincoll13Maze22:
cmp bl, [fruitex5+esi]
jne notcoin21Maze22
cmp bh, fruitey5
jne notcoin21Maze22
add score,5
mov [fruitex5+esi],0
mov scorechange,1

notcoin21Maze22:
inc esi 
loop coincoll13Maze22
ret
CoinCollectionForMaze2 ENDP



UpdateGhost1Maze2  PROC

    mov dl,xPosG1Maze2 
    mov dh,yPosG1Maze2 
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG1Maze2 
    cmp al, 'u'
    je upG1
    inc yPosG1Maze2 
    jmp endG1
    upG1:
    dec yPosG1Maze2 
    endG1:
    cmp yPosG1Maze2 , 8
    je chngdownG1
    cmp yPosG1Maze2 , 22
    je chngupG1
    jmp end2G1
    chngdownG1:
    mov moveG1Maze2 , 'd'
    jmp end2G1
    chngupG1:
    mov moveG1Maze2 , 'u'
    end2G1:
    ret

UpdateGhost1Maze2  ENDP

DrawGhost1Maze2  PROC

    mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,xPosG1Maze2 
    mov dh,yPosG1Maze2 
    call Gotoxy
    mov al,"@"
    call WriteChar
    ret
DrawGhost1Maze2  ENDP

G1CollisionMaze2  PROC

cmp bl, xPosG1Maze2 
jne G1Collend
cmp bh, yPosG1Maze2 
jne G1Collend
call DrawPlayer
mov xPos,57
mov yPos,14
dec lives
mov al, 1
G1Collend:
ret

G1COllisionMaze2  ENDP

;Ghost 2
UpdateGhost2Maze2  PROC

    mov dl,xPosG2Maze2 
    mov dh,yPosG2Maze2 
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG2Maze2 
    cmp al, 'u'
    je upG2
    inc yPosG2Maze2 
    jmp endG2
    upG2:
    dec yPosG2Maze2 
    endG2:
    cmp yPosG2Maze2, 8
    je chngdownG2
    cmp yPosG2Maze2 , 22
    je chngupG2
    jmp end2G2
    chngdownG2:
    mov moveG2Maze2 , 'd'
    jmp end2G2
    chngupG2:
    mov moveG2Maze2 , 'u'
    end2G2:
    ret

UpdateGhost2Maze2  ENDP

DrawGhost2Maze2  PROC

    mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,xPosG2Maze2 
    mov dh,yPosG2Maze2 
    call Gotoxy
    mov al,"?"
    call WriteChar
    ret
DrawGhost2Maze2  ENDP

G2CollisionMaze2  PROC

cmp bl, xPosG2Maze2 
jne G2Collend
cmp bh, yPosG2Maze2 
jne G2Collend
call DrawPlayer
mov xPos,57
mov yPos,14
dec lives
mov al, 1
G2Collend:
ret

G2COllisionMaze2  ENDP

;Ghost 3
UpdateGhost3Maze2  PROC

    mov dl,xPosG3Maze2 
    mov dh,yPosG3Maze2 
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG3Maze2 
    cmp al, 'u'
    je upG3
    inc yPosG3Maze2 
    jmp endG3
    upG3:
    dec yPosG3Maze2 
    endG3:
    cmp yPosG3Maze2 , 8
    je chngdownG3
    cmp yPosG3Maze2 , 22
    je chngupG3
    jmp end2G3
    chngdownG3:
    mov moveG3Maze2 , 'd'
    jmp end2G3
    chngupG3:
    mov moveG3Maze2 , 'u'
    end2G3:
    ret

UpdateGhost3Maze2  ENDP

DrawGhost3Maze2  PROC

    mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,xPosG3Maze2 
    mov dh,yPosG3Maze2 
    call Gotoxy
    mov al,"&"
    call WriteChar
    ret
DrawGhost3Maze2  ENDP

G3CollisionMaze2  PROC

cmp bl, xPosG3Maze2 
jne G3Collend
cmp bh, yPosG3Maze2 
jne G3Collend

INVOKE PlaySound, OFFSET music, NULL, 11h
mov eax,5
call delay

call DrawPlayer
mov xPos,57
mov yPos,14
dec lives
mov al, 1
G3Collend:
ret

G3COllisionMaze2  ENDP


;Ghost 4
UpdateGhost4Maze2  PROC

    mov dl,xPosG4Maze2 
    mov dh,yPosG4Maze2 
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG4Maze2 
    cmp al, 'u'
    je upG4
    inc yPosG4Maze2 
    jmp endG4
    upG4:
    dec yPosG4Maze2 
    endG4:
    cmp yPosG4Maze2 , 8
    je chngdownG4
    cmp yPosG4Maze2 , 22
    je chngupG4
    jmp end2G4
    chngdownG4:
    mov moveG4Maze2 , 'd'
    jmp end2G4
    chngupG4:
    mov moveG4Maze2 , 'u'
    end2G4:
    ret

UpdateGhost4Maze2  ENDP

DrawGhost4Maze2  PROC

    mov eax,white ;(blue*16)
    call SetTextColor
    mov dl,xPosG4Maze2 
    mov dh,yPosG4Maze2 
    call Gotoxy
    mov al,"$"
    call WriteChar
    ret
DrawGhost4Maze2  ENDP

G4CollisionMaze2 PROC

cmp bl, xPosG4Maze2 
jne G4Collend
cmp bh, yPosG4Maze2 
jne G4Collend

call DrawPlayer
mov xPos,57
mov yPos,14
dec lives
mov al, 1
G4Collend:
ret

G4COllisionMaze2  ENDP




;************************************************* MAZE 3 GHOST AND COINS COLLECTIONS *************************


CoinCollectionForMaze3 PROC

mov esi, 0
mov ecx, 11
coincoll5Maze22:
cmp bl, coin2x1Maze33
jne notcoin9Maze22
cmp bh, [coin2y1Maze33+esi]
jne notcoin9Maze22
inc score
mov [coin2y1Maze33+esi],0
mov scorechange,1

notcoin9Maze22:
cmp bl, coin3x2Maze33
jne notcoin10Maze22
cmp bh, [coin3y2Maze33+esi]
jne notcoin10Maze22
inc score
mov [coin3y2Maze33+esi],0
mov scorechange,1
notcoin10Maze22:
inc esi
loop coincoll5Maze22


mov esi, 0
mov ecx, 15
coincoll6Maze22:
cmp bl, coin2x2Maze33
jne notcoin11Maze22
cmp bh, [coin2y2Maze33+esi]
jne notcoin11Maze22
inc score
mov [coin2y2Maze33+esi],0
mov scorechange,1

notcoin11Maze22:
cmp bl, coin2x3Maze33
jne notcoin12Maze22
cmp bh, [coin2y3Maze33+esi]
jne notcoin12Maze22
inc score
mov [coin2y3Maze33+esi],0
mov scorechange,1
notcoin12Maze22:
inc esi
loop coincoll6Maze22



mov esi, 0
mov ecx, 10
coincoll7Maze22:
cmp bl, coin1x3Maze3
jne notcoin13Maze22
cmp bh, [coin1y3Maze3+esi]
jne notcoin13Maze22
inc score
mov [coin1y3Maze3+esi],0
mov scorechange,1

notcoin13Maze22:
cmp bl, coin1x4Maze3
jne notcoin14Maze22
cmp bh, [coin1y4Maze3+esi]
jne notcoin14Maze22
inc score
mov [coin1y4Maze3+esi],0
mov scorechange,1
notcoin14Maze22:
inc esi
loop coincoll7Maze22



mov esi,0
mov ecx, 9
coincoll8Maze22:
cmp bl, [coin1x1Maze3+esi]
jne notcoin15Maze22
cmp bh, coin1y1Maze3
jne notcoin15Maze22
inc score
mov [coin1x1Maze3+esi],0
mov scorechange,1

notcoin15Maze22:
cmp bl, [coin1x2Maze3+esi]
jne notcoin16Maze22
cmp bh, coin1y2Maze3
jne notcoin16Maze22
inc score
mov [coin1x2Maze3+esi],0
mov scorechange,1
notcoin16Maze22:
inc esi
loop coincoll8Maze22


;Fruites


mov esi,0
mov ecx, 1
coincoll9Maze22:
cmp ecx,0
jmp done
cmp bl, [fruitex1Maze3+esi]
jne notcoin17Maze22
cmp bh, fruitey1Maze3
jne notcoin17Maze22
add score,10
mov scorechange,1

notcoin17Maze22:
inc esi 
loop coincoll9Maze22

done:

mov esi,0
mov ecx, 1
coincoll10Maze22:
cmp bl, [fruitex2Maze3+esi]
jne notcoin18Maze22
cmp bh, fruitey2Maze3
jne notcoin18Maze22
add score,5
mov [fruitex2Maze3+esi],0
mov scorechange,1

notcoin18Maze22:
inc esi 
loop coincoll10Maze22


mov esi,0
mov ecx, 1
coincoll11Maze22:
cmp bl, [fruitex3Maze3+esi]
jne notcoin19Maze22
cmp bh, fruitey3Maze3
jne notcoin19Maze22
add score,5
mov [fruitex3Maze3+esi],0
mov scorechange,1

notcoin19Maze22:
inc esi 
loop coincoll11Maze22


mov esi,0
mov ecx, 1
coincoll12Maze22:
cmp bl, [fruitex4Maze3+esi]
jne notcoin20Maze22
cmp bh, fruitey4Maze3
jne notcoin20Maze22
add score,5
mov [fruitex4Maze3+esi],0
mov scorechange,1

notcoin20Maze22:
inc esi 
loop coincoll12Maze22


mov esi,0
mov ecx, 1
coincoll13Maze22:
cmp bl, [fruitex5Maze3+esi]
jne notcoin21Maze22
cmp bh, fruitey5Maze3
jne notcoin21Maze22
add score,5
mov [fruitex5Maze3+esi],0
mov scorechange,1

notcoin21Maze22:
inc esi 
loop coincoll13Maze22



mov esi,0
mov ecx, 1
coincoll133Maze22:
cmp bl, [fruitex6Maze3+esi]
jne notcoin21Maze223
cmp bh, fruitey6Maze3
jne notcoin21Maze223

add score,5
mov [fruitex6Maze3+esi],0
mov scorechange,1

notcoin21Maze223:
inc esi 
loop coincoll133Maze22


mov esi,0
mov ecx, 1
coincoll134Maze22:
cmp bl, [fruitex7Maze3+esi]
jne notcoin21Maze224
cmp bh, fruitey7Maze3
jne notcoin21Maze224
add score,5
mov [fruitex7Maze3+esi],0
mov scorechange,1

notcoin21Maze224:
inc esi 
loop coincoll134Maze22

;Mids 

mov esi,0
mov ecx,11
coincoll14Maze22:
cmp bl, [coinx11Maze2+esi]
jne notcoin22Maze22
cmp bh, coiny11Maze2
jne notcoin22Maze22
inc score
mov [coinx11Maze2+esi],0
mov scorechange,1

notcoin22Maze22:
cmp bl, [coinx22Maze2+esi]
jne notcoin23Maze22
cmp bh, coiny22Maze2
jne notcoin23Maze22
inc score
mov [coinx22Maze2+esi],0
mov scorechange,1
notcoin23Maze22:
inc esi
loop coincoll14Maze22



mov esi,0
mov ecx,6
coincoll15Maze22:
cmp bl, [coinx55Maze2+esi]
jne notcoin24Maze22
cmp bh, coiny55Maze2
jne notcoin24Maze22
inc score
mov [coinx55Maze2+esi],0
mov scorechange,1

notcoin24Maze22:
cmp bl, [coinx66Maze2+esi]
jne notcoin25Maze22
cmp bh, coiny66Maze2
jne notcoin25Maze22
inc score
mov [coinx66Maze2+esi],0
mov scorechange,1
notcoin25Maze22:
inc esi
loop coincoll15Maze22



ret
CoinCollectionForMaze3 ENDP

;Draw Fruite 

UpdateFruite1Maze3  PROC

    mov dl,fruitex1Maze3
    mov dh,fruitey1Maze3
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveFruite1Maze3 
    cmp al, 'u'
    je upG4
    inc fruitey1Maze3 
    jmp endG4
    upG4:
    dec fruitey1Maze3
    endG4:
    cmp fruitey1Maze3 , 3
    je chngdownG4
    cmp fruitey1Maze3 , 28
    je chngupG4
    jmp end2G4
    chngdownG4:
    mov moveFruite1Maze3 , 'd'
    jmp end2G4
    chngupG4:
    mov moveFruite1Maze3 , 'u'
    end2G4:
    ret

UpdateFruite1Maze3  ENDP
DrawFruite1Maze3  PROC

    mov eax,magenta ;(blue*16)
    call SetTextColor
    mov dl,fruitex1Maze3 
    mov dh,fruitey1Maze3
    call Gotoxy
    mov al,"B"
    call WriteChar
    ret
DrawFruite1Maze3  ENDP

;Ghost 1

UpdateGhost1Maze3  PROC

    mov dl,xPosG1Maze3 
    mov dh,yPosG1Maze3 
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG1Maze3 
    cmp al, 'u'
    je upG1
    inc yPosG1Maze3 
    jmp endG1
    upG1:
    dec yPosG1Maze3 
    endG1:
    cmp yPosG1Maze3 , 8
    je chngdownG1
    cmp yPosG1Maze3 , 22
    je chngupG1
    jmp end2G1
    chngdownG1:
    mov moveG1Maze3 , 'd'
    jmp end2G1
    chngupG1:
    mov moveG1Maze3 , 'u'
    end2G1:
    ret

UpdateGhost1Maze3  ENDP
DrawGhost1Maze3 PROC

    mov eax,blue ;(blue*16)
    call SetTextColor
    mov dl,xPosG1Maze3 
    mov dh,yPosG1Maze3 
    call Gotoxy
    mov al,"G"
    call WriteChar
    ret
DrawGhost1Maze3  ENDP
G1CollisionMaze3  PROC

cmp bl, xPosG1Maze3 
jne G1Collend
cmp bh, yPosG1Maze3 
jne G1Collend
dec lives
call DrawPlayer
mov xPos,56
mov yPos,25
call DrawPlayer
mov al, 1
G1Collend:
ret

G1COllisionMaze3  ENDP

;Ghost 2

UpdateGhost2Maze3  PROC

    mov dl,xPosG2Maze3 
    mov dh,yPosG2Maze3
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG2Maze3 
    cmp al, 'u'
    je upG2
    inc yPosG2Maze3 
    jmp endG2
    upG2:
    dec yPosG2Maze3 
    endG2:
    cmp yPosG2Maze3, 10
    je chngdownG2
    cmp yPosG2Maze3 , 20
    je chngupG2
    jmp end2G2
    chngdownG2:
    mov moveG2Maze3 , 'd'
    jmp end2G2
    chngupG2:
    mov moveG2Maze3 , 'u'
    end2G2:
    ret

UpdateGhost2Maze3  ENDP
DrawGhost2Maze3  PROC

    mov eax,blue ;(blue*16)
    call SetTextColor
    mov dl,xPosG2Maze3 
    mov dh,yPosG2Maze3 
    call Gotoxy
    mov al,"G"
    call WriteChar
    ret
DrawGhost2Maze3  ENDP
G2CollisionMaze3  PROC

cmp bl, xPosG2Maze3 
jne G2Collend
cmp bh, yPosG2Maze3 
jne G2Collend
dec lives
call DrawPlayer
mov xPos,56
mov yPos,25
call DrawPlayer
mov al, 1
G2Collend:
ret

G2COllisionMaze3  ENDP

;Ghost 3

UpdateGhost3Maze3  PROC

    mov dl,xPosG3Maze3 
    mov dh,yPosG3Maze3 
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG3Maze3 
    cmp al, 'u'
    je upG3
    inc yPosG3Maze3 
    jmp endG3
    upG3:
    dec yPosG3Maze3 
    endG3:
    cmp yPosG3Maze3 , 10
    je chngdownG3
    cmp yPosG3Maze3 , 20
    je chngupG3
    jmp end2G3
    chngdownG3:
    mov moveG3Maze3 , 'd'
    jmp end2G3
    chngupG3:
    mov moveG3Maze3 , 'u'
    end2G3:
    ret

UpdateGhost3Maze3  ENDP
DrawGhost3Maze3 PROC

    mov eax,blue ;(blue*16)
    call SetTextColor
    mov dl,xPosG3Maze3 
    mov dh,yPosG3Maze3 
    call Gotoxy
    mov al,"G"
    call WriteChar
    ret
DrawGhost3Maze3  ENDP
G3CollisionMaze3  PROC

cmp bl, xPosG3Maze3 
jne G3Collend
cmp bh, yPosG3Maze3 
jne G3Collend
dec lives
call DrawPlayer
mov xPos,56
mov yPos,25
call DrawPlayer
mov al, 1
G3Collend:
ret

G3COllisionMaze3  ENDP


;Ghost 4

UpdateGhost4Maze3  PROC

    mov dl,xPosG4Maze3 
    mov dh,yPosG4Maze3
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG4Maze3 
    cmp al, 'u'
    je upG4
    inc yPosG4Maze3 
    jmp endG4
    upG4:
    dec yPosG4Maze3 
    endG4:
    cmp yPosG4Maze3 , 8
    je chngdownG4
    cmp yPosG4Maze3 , 22
    je chngupG4
    jmp end2G4
    chngdownG4:
    mov moveG4Maze3 , 'd'
    jmp end2G4
    chngupG4:
    mov moveG4Maze3 , 'u'
    end2G4:
    ret

UpdateGhost4Maze3  ENDP
DrawGhost4Maze3  PROC

    mov eax,blue ;(blue*16)
    call SetTextColor
    mov dl,xPosG4Maze3 
    mov dh,yPosG4Maze3 
    call Gotoxy
    mov al,"G"
    call WriteChar
    ret
DrawGhost4Maze3  ENDP
G4CollisionMaze3 PROC

cmp bl, xPosG4Maze3 
jne G4Collend
cmp bh, yPosG4Maze3 
jne G4Collend

INVOKE PlaySound, OFFSET music, NULL, 11h
mov eax,5
call delay

dec lives
call DrawPlayer
mov xPos,56
mov yPos,25
call DrawPlayer
mov al, 1
G4Collend:
ret

G4COllisionMaze3  ENDP

;GHost 5

UpdateGhost5Maze3  PROC

    mov dl,xPosG5Maze3 
    mov dh,yPosG5Maze3 
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG5Maze3 
    cmp al, 'l'
    je upG1
    inc xPosG5Maze3 
    jmp endG1
    upG1:
    dec xPosG5Maze3 
    endG1:
    cmp xPosG5Maze3 , 23
    je chngdownG1
    cmp xPosG5Maze3 , 97
    je chngupG1
    jmp end2G1
    chngdownG1:
    mov moveG5Maze3 , 'r'
    jmp end2G1
    chngupG1:
    mov moveG5Maze3 , 'l'
    end2G1:
    ret

UpdateGhost5Maze3  ENDP
DrawGhost5Maze3 PROC

    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPosG5Maze3 
    mov dh,yPosG5Maze3 
    call Gotoxy
    mov al,""""
    call WriteChar
    ret
DrawGhost5Maze3  ENDP
G5CollisionMaze3  PROC

cmp bl, xPosG5Maze3 
jne G1Collend
cmp bh, yPosG5Maze3 
jne G1Collend
dec lives
call DrawPlayer
mov xPos,56
mov yPos,25
call DrawPlayer
mov al, 1
G1Collend:
ret

G5COllisionMaze3  ENDP

;Ghost 6

UpdateGhost6Maze3  PROC

    mov dl,xPosG6Maze3 
    mov dh,yPosG6Maze3 
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG6Maze3 
    cmp al, 'l'
    je upG1
    inc xPosG6Maze3 
    jmp endG1
    upG1:
    dec xPosG6Maze3 
    endG1:
    cmp xPosG6Maze3 , 23
    je chngdownG1
    cmp xPosG6Maze3 , 97
    je chngupG1
    jmp end2G1
    chngdownG1:
    mov moveG6Maze3 , 'r'
    jmp end2G1
    chngupG1:
    mov moveG6Maze3 , 'l'
    end2G1:
    ret

UpdateGhost6Maze3  ENDP

DrawGhost6Maze3 PROC

    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPosG6Maze3 
    mov dh,yPosG6Maze3 
    call Gotoxy
    mov al,""""
    call WriteChar
    ret
DrawGhost6Maze3  ENDP

G6CollisionMaze3  PROC

cmp bl, xPosG6Maze3 
jne G1Collend
cmp bh, yPosG6Maze3 
jne G1Collend
dec lives
call DrawPlayer
mov xPos,56
mov yPos,25
call DrawPlayer
mov al, 1
G1Collend:
ret

G6COllisionMaze3  ENDP


;Ghost 7

UpdateGhost7Maze3  PROC

    mov dl,xPosG7Maze3 
    mov dh,yPosG7Maze3 
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG7Maze3 
    cmp al, 'l'
    je upG1
    inc xPosG7Maze3 
    jmp endG1
    upG1:
    dec xPosG7Maze3 
    endG1:
    cmp xPosG7Maze3 , 31
    je chngdownG1
    cmp xPosG7Maze3 , 81
    je chngupG1
    jmp end2G1
    chngdownG1:
    mov moveG7Maze3 , 'r'
    jmp end2G1
    chngupG1:
    mov moveG7Maze3 , 'l'
    end2G1:
    ret

UpdateGhost7Maze3  ENDP

DrawGhost7Maze3 PROC

    mov eax,cyan ;(blue*16)
    call SetTextColor
    mov dl,xPosG7Maze3 
    mov dh,yPosG7Maze3 
    call Gotoxy
    mov al,"~"
    call WriteChar
    ret
DrawGhost7Maze3  ENDP

G7CollisionMaze3  PROC

cmp bl, xPosG7Maze3 
jne G1Collend
cmp bh, yPosG7Maze3 
jne G1Collend
dec lives
call DrawPlayer
mov xPos,56
mov yPos,25
call DrawPlayer
mov al, 1
G1Collend:
ret

G7COllisionMaze3  ENDP

;Ghost 8

UpdateGhost8Maze3  PROC

    mov dl,xPosG8Maze3 
    mov dh,yPosG8Maze3 
    call Gotoxy
    mov al," "
    call WriteChar
    mov al, moveG8Maze3 
    cmp al, 'r'
    je upG1
    dec xPosG8Maze3 
    jmp endG1
    upG1:
    inc xPosG8Maze3 
    endG1:
    cmp xPosG8Maze3 , 81
    je chngdownG1
    cmp xPosG8Maze3 , 31
    je chngupG1
    jmp end2G1
    chngdownG1:
    mov moveG8Maze3 , 'l'
    jmp end2G1
    chngupG1:
    mov moveG8Maze3 , 'r'
    end2G1:
    ret

UpdateGhost8Maze3  ENDP

DrawGhost8Maze3 PROC

    mov eax,cyan ;(blue*16)
    call SetTextColor
    mov dl,xPosG8Maze3 
    mov dh,yPosG8Maze3 
    call Gotoxy
    mov al,"~"
    call WriteChar
    ret
DrawGhost8Maze3  ENDP

G8CollisionMaze3  PROC

cmp bl, xPosG8Maze3 
jne G1Collend
cmp bh, yPosG8Maze3 
jne G1Collend
dec lives
call DrawPlayer
mov xPos,56
mov yPos,25
call DrawPlayer
mov al, 1
G1Collend:
ret

G8COllisionMaze3  ENDP


;Teleportation
TeleportFunc PROC

cmp yPos, 28
jne NoHorTeleport

cmp xPos, 1
jne NoRightTeleport

cmp inputChar, 'a'
jne NoRightTeleport
call UpdatePlayer
mov xPos, 118
call DrawPlayer
jmp TeleportEnd

NoRightTeleport:
cmp xPos, 118
jne NoLeftTeleport
cmp inputChar, 'd'
jne NoLeftTeleport
call UpdatePlayer
mov xPos, 1
call DrawPlayer
jmp TeleportEnd

NoLeftTeleport:
NoHorTeleport:
TeleportEnd:
ret

TeleportFunc ENDP



TeleportFunc1 PROC

cmp xPos, 61 
jne NoHorTeleport

cmp yPos, 1
jne NoRightTeleport

cmp inputChar, 'w'
jne NoRightTeleport
call UpdatePlayer
mov yPos, 29
call DrawPlayer
jmp TeleportEnd

NoRightTeleport:

cmp yPos, 29
jne NoLeftTeleport
cmp inputChar, 's'
jne NoLeftTeleport
call UpdatePlayer
mov yPos, 1
call DrawPlayer
jmp TeleportEnd

NoLeftTeleport:
NoHorTeleport:
TeleportEnd:
ret


TeleportFunc1 ENDP

TeleportFunc2 PROC

cmp yPos, 14 
jne NoHorTeleport

cmp xPos,1
jne NoRightTeleport

cmp inputChar, 'a'
jne NoRightTeleport
call UpdatePlayer
mov xPos, 118
call DrawPlayer
jmp TeleportEnd

NoRightTeleport:

cmp xPos, 118
jne NoLeftTeleport
cmp inputChar, 'd'
jne NoLeftTeleport
call UpdatePlayer
mov xPos, 1
call DrawPlayer
jmp TeleportEnd

NoLeftTeleport:
NoHorTeleport:
TeleportEnd:
ret


TeleportFunc2 ENDP

END main
