#define BUTONA Button(&GPIOA_IDR, 0, 100, 1)
#define BUTONB Button(&GPIOB_IDR, 0, 100, 1)
#define BUTONC Button(&GPIOC_IDR, 0, 100, 1)
#define G_Led GPIOD_ODR.B1
#define Y_Led GPIOD_ODR.B2
#define R_Led GPIOD_ODR.B3


void main() {
GPIO_Digital_Input(&GPIOA_IDR,  _GPIO_PINMASK_0);
GPIO_Digital_Output(&GPIOD_ODR,  _GPIO_PINMASK_15);

 while(1) {
    if(BUTON1){
       while(BUTON1);
       G_LED = 1;
       delay_ms(1000);
       
       
}