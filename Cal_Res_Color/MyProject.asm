_CustomChar:
;MyProject.c,28 :: 		void CustomChar(char pos_row, char pos_char) {
; pos_char start address is: 4 (R1)
; pos_row start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTB	R4, R0
UXTB	R5, R1
; pos_char end address is: 4 (R1)
; pos_row end address is: 0 (R0)
; pos_row start address is: 16 (R4)
; pos_char start address is: 20 (R5)
;MyProject.c,30 :: 		Lcd_Cmd(64);
MOVS	R0, #64
BL	_Lcd_Cmd+0
;MyProject.c,31 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
; i start address is: 24 (R6)
MOVS	R6, #0
; pos_row end address is: 16 (R4)
; pos_char end address is: 20 (R5)
; i end address is: 24 (R6)
STRB	R5, [SP, #4]
UXTB	R5, R4
LDRB	R4, [SP, #4]
L_CustomChar0:
; i start address is: 24 (R6)
; pos_char start address is: 16 (R4)
; pos_row start address is: 20 (R5)
CMP	R6, #7
IT	HI
BHI	L_CustomChar1
MOVW	R2, #lo_addr(_character+0)
MOVT	R2, #hi_addr(_character+0)
ADDS	R2, R2, R6
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	_Lcd_Chr_CP+0
ADDS	R6, R6, #1
UXTB	R6, R6
; i end address is: 24 (R6)
IT	AL
BAL	L_CustomChar0
L_CustomChar1:
;MyProject.c,32 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
MOVS	R0, #2
BL	_Lcd_Cmd+0
;MyProject.c,33 :: 		Lcd_Chr(pos_row, pos_char, 0);
MOVS	R2, #0
UXTB	R1, R4
; pos_char end address is: 16 (R4)
UXTB	R0, R5
; pos_row end address is: 20 (R5)
BL	_Lcd_Chr+0
;MyProject.c,34 :: 		}
L_end_CustomChar:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _CustomChar
_direncHesapla:
;MyProject.c,35 :: 		float direncHesapla(int sayi1, int sayi2, int sayi3)
; sayi3 start address is: 8 (R2)
; sayi2 start address is: 4 (R1)
; sayi1 start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; sayi3 end address is: 8 (R2)
; sayi2 end address is: 4 (R1)
; sayi1 end address is: 0 (R0)
; sayi1 start address is: 0 (R0)
; sayi2 start address is: 4 (R1)
; sayi3 start address is: 8 (R2)
;MyProject.c,37 :: 		direnc = (sayi1*10) + sayi2;
MOVS	R3, #10
SXTH	R3, R3
MULS	R3, R0, R3
SXTH	R3, R3
; sayi1 end address is: 0 (R0)
ADDS	R3, R3, R1
SXTH	R3, R3
; sayi2 end address is: 4 (R1)
VMOV	S0, R3
VCVT.F32	#1, S0, S0
MOVW	R3, #lo_addr(_direnc+0)
MOVT	R3, #hi_addr(_direnc+0)
VSTR	#1, S0, [R3, #0]
;MyProject.c,38 :: 		direnc *= pow(10,sayi3);
VMOV	S0, R2
VCVT.F32	#1, S0, S0
; sayi3 end address is: 8 (R2)
VMOV.F32	S1, S0
VMOV.F32	S0, #10
BL	_pow+0
MOVW	R3, #lo_addr(_direnc+0)
MOVT	R3, #hi_addr(_direnc+0)
VLDR	#1, S1, [R3, #0]
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R3, #0]
;MyProject.c,39 :: 		return  direnc;
VMOV.F32	S0, S0
;MyProject.c,40 :: 		}
L_end_direncHesapla:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _direncHesapla
_renkBul:
;MyProject.c,41 :: 		void renkBul(int key)
; key start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; key end address is: 0 (R0)
; key start address is: 0 (R0)
;MyProject.c,43 :: 		switch(key)
IT	AL
BAL	L_renkBul3
; key end address is: 0 (R0)
;MyProject.c,45 :: 		case 0: Lcd_Out(1,1, "Black"); delay_ms(1000); break;
L_renkBul5:
MOVW	R1, #lo_addr(?lstr1_MyProject+0)
MOVT	R1, #hi_addr(?lstr1_MyProject+0)
MOV	R2, R1
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_renkBul6:
SUBS	R7, R7, #1
BNE	L_renkBul6
NOP
NOP
NOP
NOP
IT	AL
BAL	L_renkBul4
;MyProject.c,46 :: 		case 1: Lcd_Out(1,1, "Brown"); delay_ms(1000); break;
L_renkBul8:
MOVW	R1, #lo_addr(?lstr2_MyProject+0)
MOVT	R1, #hi_addr(?lstr2_MyProject+0)
MOV	R2, R1
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_renkBul9:
SUBS	R7, R7, #1
BNE	L_renkBul9
NOP
NOP
NOP
NOP
IT	AL
BAL	L_renkBul4
;MyProject.c,47 :: 		case 2: Lcd_Out(1,1, "Red"); delay_ms(1000); break;
L_renkBul11:
MOVW	R1, #lo_addr(?lstr3_MyProject+0)
MOVT	R1, #hi_addr(?lstr3_MyProject+0)
MOV	R2, R1
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_renkBul12:
SUBS	R7, R7, #1
BNE	L_renkBul12
NOP
NOP
NOP
NOP
IT	AL
BAL	L_renkBul4
;MyProject.c,48 :: 		case 3: Lcd_Out(1,1, "Orange"); delay_ms(1000); break;
L_renkBul14:
MOVW	R1, #lo_addr(?lstr4_MyProject+0)
MOVT	R1, #hi_addr(?lstr4_MyProject+0)
MOV	R2, R1
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_renkBul15:
SUBS	R7, R7, #1
BNE	L_renkBul15
NOP
NOP
NOP
NOP
IT	AL
BAL	L_renkBul4
;MyProject.c,49 :: 		case 4: Lcd_Out(1,1, "Yellow"); delay_ms(1000); break;
L_renkBul17:
MOVW	R1, #lo_addr(?lstr5_MyProject+0)
MOVT	R1, #hi_addr(?lstr5_MyProject+0)
MOV	R2, R1
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_renkBul18:
SUBS	R7, R7, #1
BNE	L_renkBul18
NOP
NOP
NOP
NOP
IT	AL
BAL	L_renkBul4
;MyProject.c,50 :: 		case 5: Lcd_Out(1,1, "Green"); delay_ms(1000); break;
L_renkBul20:
MOVW	R1, #lo_addr(?lstr6_MyProject+0)
MOVT	R1, #hi_addr(?lstr6_MyProject+0)
MOV	R2, R1
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_renkBul21:
SUBS	R7, R7, #1
BNE	L_renkBul21
NOP
NOP
NOP
NOP
IT	AL
BAL	L_renkBul4
;MyProject.c,51 :: 		case 6: Lcd_Out(1,1, "Blue"); delay_ms(1000);break;
L_renkBul23:
MOVW	R1, #lo_addr(?lstr7_MyProject+0)
MOVT	R1, #hi_addr(?lstr7_MyProject+0)
MOV	R2, R1
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_renkBul24:
SUBS	R7, R7, #1
BNE	L_renkBul24
NOP
NOP
NOP
NOP
IT	AL
BAL	L_renkBul4
;MyProject.c,52 :: 		case 7: Lcd_Out(1,1, "Purple"); delay_ms(1000);break;
L_renkBul26:
MOVW	R1, #lo_addr(?lstr8_MyProject+0)
MOVT	R1, #hi_addr(?lstr8_MyProject+0)
MOV	R2, R1
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_renkBul27:
SUBS	R7, R7, #1
BNE	L_renkBul27
NOP
NOP
NOP
NOP
IT	AL
BAL	L_renkBul4
;MyProject.c,53 :: 		case 8: Lcd_Out(1,1, "Gray"); delay_ms(1000);break;
L_renkBul29:
MOVW	R1, #lo_addr(?lstr9_MyProject+0)
MOVT	R1, #hi_addr(?lstr9_MyProject+0)
MOV	R2, R1
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_renkBul30:
SUBS	R7, R7, #1
BNE	L_renkBul30
NOP
NOP
NOP
NOP
IT	AL
BAL	L_renkBul4
;MyProject.c,54 :: 		case 9: Lcd_Out(1,1, "White");delay_ms(1000);break;
L_renkBul32:
MOVW	R1, #lo_addr(?lstr10_MyProject+0)
MOVT	R1, #hi_addr(?lstr10_MyProject+0)
MOV	R2, R1
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_renkBul33:
SUBS	R7, R7, #1
BNE	L_renkBul33
NOP
NOP
NOP
NOP
IT	AL
BAL	L_renkBul4
;MyProject.c,55 :: 		}
L_renkBul3:
; key start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_renkBul5
CMP	R0, #1
IT	EQ
BEQ	L_renkBul8
CMP	R0, #2
IT	EQ
BEQ	L_renkBul11
CMP	R0, #3
IT	EQ
BEQ	L_renkBul14
CMP	R0, #4
IT	EQ
BEQ	L_renkBul17
CMP	R0, #5
IT	EQ
BEQ	L_renkBul20
CMP	R0, #6
IT	EQ
BEQ	L_renkBul23
CMP	R0, #7
IT	EQ
BEQ	L_renkBul26
CMP	R0, #8
IT	EQ
BEQ	L_renkBul29
CMP	R0, #9
IT	EQ
BEQ	L_renkBul32
; key end address is: 0 (R0)
L_renkBul4:
;MyProject.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;MyProject.c,57 :: 		}
L_end_renkBul:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _renkBul
_main:
;MyProject.c,58 :: 		void main() {
;MyProject.c,59 :: 		GPIO_Digital_Input(&GPIOA_IDR, _GPIO_PINMASK_ALL);                                       //Buton
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;MyProject.c,60 :: 		GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3);    //LED
MOVW	R1, #14
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;MyProject.c,61 :: 		GPIO_Digital_Output(&GPIOE_ODR, _GPIO_PINMASK_9);                                        //LCD
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;MyProject.c,62 :: 		GPIOE_ODR.B9=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
_SX	[R0, ByteOffset(GPIOE_ODR+0)]
;MyProject.c,64 :: 		G_Led = 0, Y_Led = 0, R_Led =0 ;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;MyProject.c,65 :: 		Lcd_Init();
BL	_Lcd_Init+0
;MyProject.c,66 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;MyProject.c,67 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;MyProject.c,68 :: 		Lcd_Out(1,1,"Direnc Hesaplama");
MOVW	R0, #lo_addr(?lstr11_MyProject+0)
MOVT	R0, #hi_addr(?lstr11_MyProject+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;MyProject.c,69 :: 		Lcd_Out(2,2,"Uygulamasi");
MOVW	R0, #lo_addr(?lstr12_MyProject+0)
MOVT	R0, #hi_addr(?lstr12_MyProject+0)
MOV	R2, R0
MOVS	R1, #2
MOVS	R0, #2
BL	_Lcd_Out+0
;MyProject.c,70 :: 		delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main35:
SUBS	R7, R7, #1
BNE	L_main35
NOP
NOP
NOP
NOP
;MyProject.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;MyProject.c,73 :: 		while(1) {
L_main37:
;MyProject.c,75 :: 		if(BUTONA){
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main39
;MyProject.c,76 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;MyProject.c,78 :: 		numberA++;
MOVW	R1, #lo_addr(_numberA+0)
MOVT	R1, #hi_addr(_numberA+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject.c,80 :: 		while(BUTONA);
L_main40:
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main41
IT	AL
BAL	L_main40
L_main41:
;MyProject.c,81 :: 		G_Led = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;MyProject.c,82 :: 		delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main42:
SUBS	R7, R7, #1
BNE	L_main42
NOP
NOP
NOP
NOP
;MyProject.c,83 :: 		if(numberA==10)
MOVW	R0, #lo_addr(_numberA+0)
MOVT	R0, #hi_addr(_numberA+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	NE
BNE	L_main44
;MyProject.c,85 :: 		numberA=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_numberA+0)
MOVT	R0, #hi_addr(_numberA+0)
STRH	R1, [R0, #0]
;MyProject.c,86 :: 		}
L_main44:
;MyProject.c,87 :: 		renkBul(numberA);
MOVW	R0, #lo_addr(_numberA+0)
MOVT	R0, #hi_addr(_numberA+0)
LDRSH	R0, [R0, #0]
BL	_renkBul+0
;MyProject.c,88 :: 		IntToStr(numberA, strA);
MOVW	R0, #lo_addr(_numberA+0)
MOVT	R0, #hi_addr(_numberA+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_strA+0)
MOVT	R1, #hi_addr(_strA+0)
BL	_IntToStr+0
;MyProject.c,89 :: 		Lcd_Out(2,2,strA);
MOVW	R2, #lo_addr(_strA+0)
MOVT	R2, #hi_addr(_strA+0)
MOVS	R1, #2
MOVS	R0, #2
BL	_Lcd_Out+0
;MyProject.c,90 :: 		delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main45:
SUBS	R7, R7, #1
BNE	L_main45
NOP
NOP
NOP
NOP
;MyProject.c,91 :: 		}
L_main39:
;MyProject.c,95 :: 		G_Led=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;MyProject.c,96 :: 		if(BUTONB){
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main47
;MyProject.c,97 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;MyProject.c,98 :: 		numberB++;
MOVW	R1, #lo_addr(_numberB+0)
MOVT	R1, #hi_addr(_numberB+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject.c,99 :: 		while(BUTONB);
L_main48:
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main49
IT	AL
BAL	L_main48
L_main49:
;MyProject.c,100 :: 		Y_Led = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;MyProject.c,101 :: 		delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main50:
SUBS	R7, R7, #1
BNE	L_main50
NOP
NOP
NOP
NOP
;MyProject.c,102 :: 		if(numberB==10){
MOVW	R0, #lo_addr(_numberB+0)
MOVT	R0, #hi_addr(_numberB+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	NE
BNE	L_main52
;MyProject.c,103 :: 		numberB=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_numberB+0)
MOVT	R0, #hi_addr(_numberB+0)
STRH	R1, [R0, #0]
;MyProject.c,104 :: 		}
L_main52:
;MyProject.c,105 :: 		renkBul(numberB);
MOVW	R0, #lo_addr(_numberB+0)
MOVT	R0, #hi_addr(_numberB+0)
LDRSH	R0, [R0, #0]
BL	_renkBul+0
;MyProject.c,106 :: 		IntToStr(numberB,strB);
MOVW	R0, #lo_addr(_numberB+0)
MOVT	R0, #hi_addr(_numberB+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_strB+0)
MOVT	R1, #hi_addr(_strB+0)
BL	_IntToStr+0
;MyProject.c,107 :: 		Lcd_Out(2,2,strB);
MOVW	R2, #lo_addr(_strB+0)
MOVT	R2, #hi_addr(_strB+0)
MOVS	R1, #2
MOVS	R0, #2
BL	_Lcd_Out+0
;MyProject.c,108 :: 		delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main53:
SUBS	R7, R7, #1
BNE	L_main53
NOP
NOP
NOP
NOP
;MyProject.c,109 :: 		}
L_main47:
;MyProject.c,111 :: 		Y_Led=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;MyProject.c,112 :: 		if(BUTONC){
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main55
;MyProject.c,113 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;MyProject.c,114 :: 		numberC++;
MOVW	R1, #lo_addr(_numberC+0)
MOVT	R1, #hi_addr(_numberC+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject.c,115 :: 		while(BUTONC);
L_main56:
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main57
IT	AL
BAL	L_main56
L_main57:
;MyProject.c,116 :: 		R_Led = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;MyProject.c,117 :: 		delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main58:
SUBS	R7, R7, #1
BNE	L_main58
NOP
NOP
NOP
NOP
;MyProject.c,118 :: 		if(numberC==10){
MOVW	R0, #lo_addr(_numberC+0)
MOVT	R0, #hi_addr(_numberC+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	NE
BNE	L_main60
;MyProject.c,119 :: 		numberC=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_numberC+0)
MOVT	R0, #hi_addr(_numberC+0)
STRH	R1, [R0, #0]
;MyProject.c,120 :: 		}
L_main60:
;MyProject.c,121 :: 		renkBul(numberC);
MOVW	R0, #lo_addr(_numberC+0)
MOVT	R0, #hi_addr(_numberC+0)
LDRSH	R0, [R0, #0]
BL	_renkBul+0
;MyProject.c,122 :: 		IntToStr(numberC,strC);
MOVW	R0, #lo_addr(_numberC+0)
MOVT	R0, #hi_addr(_numberC+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_strC+0)
MOVT	R1, #hi_addr(_strC+0)
BL	_IntToStr+0
;MyProject.c,123 :: 		Lcd_Out(2,2,strC);
MOVW	R2, #lo_addr(_strC+0)
MOVT	R2, #hi_addr(_strC+0)
MOVS	R1, #2
MOVS	R0, #2
BL	_Lcd_Out+0
;MyProject.c,124 :: 		delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main61:
SUBS	R7, R7, #1
BNE	L_main61
NOP
NOP
NOP
NOP
;MyProject.c,125 :: 		}
L_main55:
;MyProject.c,127 :: 		R_Led=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
_SX	[R0, ByteOffset(GPIOD_ODR+0)]
;MyProject.c,128 :: 		if(BUTOND){
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main63
;MyProject.c,129 :: 		direnc = direncHesapla(numberA,numberB,numberC);
MOVW	R0, #lo_addr(_numberC+0)
MOVT	R0, #hi_addr(_numberC+0)
LDRSH	R2, [R0, #0]
MOVW	R0, #lo_addr(_numberB+0)
MOVT	R0, #hi_addr(_numberB+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_numberA+0)
MOVT	R0, #hi_addr(_numberA+0)
LDRSH	R0, [R0, #0]
BL	_direncHesapla+0
MOVW	R0, #lo_addr(_direnc+0)
MOVT	R0, #hi_addr(_direnc+0)
VSTR	#1, S0, [R0, #0]
;MyProject.c,130 :: 		FloatToStr(direnc, txt);
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_FloatToStr+0
;MyProject.c,131 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;MyProject.c,132 :: 		Lcd_Out(1,1, "R=  ");
MOVW	R0, #lo_addr(?lstr13_MyProject+0)
MOVT	R0, #hi_addr(?lstr13_MyProject+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;MyProject.c,133 :: 		Lcd_Out(1,6, txt);
MOVW	R2, #lo_addr(_txt+0)
MOVT	R2, #hi_addr(_txt+0)
MOVS	R1, #6
MOVS	R0, #1
BL	_Lcd_Out+0
;MyProject.c,134 :: 		CustomChar(1,4);
MOVS	R1, #4
MOVS	R0, #1
BL	_CustomChar+0
;MyProject.c,135 :: 		}
L_main63:
;MyProject.c,136 :: 		}
IT	AL
BAL	L_main37
;MyProject.c,141 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
