#line 1 "C:/Users/eliff/Desktop/Gömülü Sistemler/Uyg/MyProject.c"








sbit LCD_RS at GPIOE_ODR.B2;
sbit LCD_EN at GPIOE_ODR.B3;
sbit LCD_D4 at GPIOE_ODR.B4;
sbit LCD_D5 at GPIOE_ODR.B5;
sbit LCD_D6 at GPIOE_ODR.B6;
sbit LCD_D7 at GPIOE_ODR.B7;

int numberA=-1;
int numberB=-1;
int numberC=-1;

float direnc = 0.0;
unsigned char txt[15];
char strA[7];
char strB[7];
char strC[7];


const char character[] = {14,17,17,17,10,27,0,0};
void CustomChar(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}
float direncHesapla(int sayi1, int sayi2, int sayi3)
{
 direnc = (sayi1*10) + sayi2;
 direnc *= pow(10,sayi3);
 return direnc;
}
void renkBul(int key)
{
 switch(key)
 {
 case 0: Lcd_Out(1,1, "Black"); delay_ms(1000); break;
 case 1: Lcd_Out(1,1, "Brown"); delay_ms(1000); break;
 case 2: Lcd_Out(1,1, "Red"); delay_ms(1000); break;
 case 3: Lcd_Out(1,1, "Orange"); delay_ms(1000); break;
 case 4: Lcd_Out(1,1, "Yellow"); delay_ms(1000); break;
 case 5: Lcd_Out(1,1, "Green"); delay_ms(1000); break;
 case 6: Lcd_Out(1,1, "Blue"); delay_ms(1000);break;
 case 7: Lcd_Out(1,1, "Purple"); delay_ms(1000);break;
 case 8: Lcd_Out(1,1, "Gray"); delay_ms(1000);break;
 case 9: Lcd_Out(1,1, "White");delay_ms(1000);break;
 }
 Lcd_Cmd(_LCD_CLEAR);
}
void main() {
 GPIO_Digital_Input(&GPIOA_IDR, _GPIO_PINMASK_ALL);
 GPIO_Digital_Output(&GPIOD_ODR, _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3);
 GPIO_Digital_Output(&GPIOE_ODR, _GPIO_PINMASK_9);
 GPIOE_ODR.B9=0;

  GPIOD_ODR.B1  = 0,  GPIOD_ODR.B2  = 0,  GPIOD_ODR.B3  =0 ;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Direnc Hesaplama");
 Lcd_Out(2,2,"Uygulamasi");
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);

 while(1) {

 if( Button(&GPIOA_IDR, 3, 100, 1) ){
 Lcd_Cmd(_LCD_CLEAR);

 numberA++;

 while( Button(&GPIOA_IDR, 3, 100, 1) );
  GPIOD_ODR.B1  = 1;
 delay_ms(1000);
 if(numberA==10)
 {
 numberA=0;
 }
 renkBul(numberA);
 IntToStr(numberA, strA);
 Lcd_Out(2,2,strA);
 delay_ms(1000);
 }



  GPIOD_ODR.B1 =0;
 if( Button(&GPIOA_IDR, 1, 100, 1) ){
 Lcd_Cmd(_LCD_CLEAR);
 numberB++;
 while( Button(&GPIOA_IDR, 1, 100, 1) );
  GPIOD_ODR.B2  = 1;
 delay_ms(1000);
 if(numberB==10){
 numberB=0;
 }
 renkBul(numberB);
 IntToStr(numberB,strB);
 Lcd_Out(2,2,strB);
 delay_ms(1000);
 }

  GPIOD_ODR.B2 =0;
 if( Button(&GPIOA_IDR, 2, 100, 1) ){
 Lcd_Cmd(_LCD_CLEAR);
 numberC++;
 while( Button(&GPIOA_IDR, 2, 100, 1) );
  GPIOD_ODR.B3  = 1;
 delay_ms(1000);
 if(numberC==10){
 numberC=0;
 }
 renkBul(numberC);
 IntToStr(numberC,strC);
 Lcd_Out(2,2,strC);
 delay_ms(1000);
 }

  GPIOD_ODR.B3 =0;
 if( Button(&GPIOA_IDR, 0, 100, 1) ){
 direnc = direncHesapla(numberA,numberB,numberC);
 FloatToStr(direnc, txt);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1, "R=  ");
 Lcd_Out(1,6, txt);
 CustomChar(1,4);
 }
 }




}
