CHARS DB 7Eh, 4Fh, 5Bh, 4Fh, 0Fh ;look-up табела за DESEt
 DISP_S EQU 1000h ;адреса на порта за селекција
 DISP_P EQU 2000h ;адреса на порта за приказ
DSEG ENDS
CSEG SEGMENT 'CODE'
 ASSUME CS: CSEG, DS: DSEG
START:
 MOV AX, DSEG
 MOV DS, AX
AGAIN:
 MOV CX, 5 ;пет сегменти  пет записи
 MOV SI, 0
 MOV BL, 0FEh ;дефинира кој сегмент е тековно активен
ISPIS:
 MOV DX, DISP_S ;дел од кодот кој врши
 MOV AL, BL ;испис на еден по еден
 OUT DX, AL ;знак на соодветниот
 MOV DX, DISP_P ;сегмент на LED дисплејот
 MOV AL, CHARS[SI] ;SI ја покажува позицијата на
 OUT DX, AL ;сегментот на кој се врши
 ROL BL ;приказ на знакот
 INC SI
 LOOP ISPIS
 JMP AGAIN
CSEG ENDS
 END START 
