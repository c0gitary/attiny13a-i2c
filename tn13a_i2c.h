#ifndef __ATTINY13A_SOFT_I2C__
#define __ATTINY13A_SOFT_I2C__

typedef unsigned char uint8_t;

extern void tn13a_i2c_init(void);
extern void tn13a_i2c_stop(void);
extern void tn13a_i2c_start(uint8_t addr);
extern void tn13a_i2c_write(uint8_t data);

#endif //__ATTINY13A_SOFT_I2C__
