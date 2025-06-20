;         +-()-+
;   PB5  1|°   |8  Vcc
;   PB3  2|    |7  PB2 SCL
;   PB4  3|    |6  PB1 
;   GND  4|    |5  PB0 SDA
;         +----+  

.equ PB0, 0x00
.equ PB1, 0x01
.equ PB2, 0x02
.equ PB3, 0x03
.equ PB4, 0x04
; .equ PB5, 0x05


.equ I2C_DIR,   0x17 ; DDRB
.equ I2C_PORT,  0x18 ; PORTB
.equ I2C_SDA,   PB0
.equ I2C_SCL,   PB2

.global tn13a_i2c_init
tn13a_i2c_init:
    cbi I2C_DIR, I2C_SDA
    cbi I2C_DIR, I2C_SCL
    nop
    cbi I2C_PORT, I2C_SDA
    nop
    cbi I2C_PORT, I2C_SCL    
    ret


.global tn13a_i2c_write
tn13a_i2c_write:
    ldi  r18,  0x08
1:  sbi  I2C_DIR, I2C_SDA 
    sbrs r24,  0x07
    rjmp 2f
    cbi  I2C_DIR, I2C_SDA
2:  cbi  I2C_DIR, I2C_SCL
    lsl  r24
    sbi  I2C_DIR, I2C_SCL

    dec  r18
    brne 1b

    ;ACK
    cbi  I2C_DIR, I2C_SDA
    cbi  I2C_DIR, I2C_SCL
    nop
    sbi  I2C_DIR, I2C_SCL
    ret


.global tn13a_i2c_start
tn13a_i2c_start:
    sbi  I2C_DIR, I2C_SDA
    sbi  I2C_DIR, I2C_SCL
    rjmp tn13a_i2c_write

.global tn13a_i2c_stop
tn13a_i2c_stop:
    sbi  I2C_DIR, I2C_SDA
    cbi  I2C_DIR, I2C_SCL
    nop
    cbi  I2C_DIR, I2C_SDA
    ret


; TODO tn13a_i2c_read
