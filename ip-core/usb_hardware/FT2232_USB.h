#ifndef FT2232_USB_H_
#define FT2232_USB_H_

//FT2232H USB Device Core with programmable interrupt and eventchar
//Operates in FT245 Style Synchronous FIFO Mode for high speed data transfers
//Designer: Darius Grigaitis www.grigaitis.eu  2011.03.01
//License: Public Domain
//VER 1.01 DEMO
//In order to keep going this product free please donate: http://www.grigaitis.eu/?page_id=400
//This product is free and has no free support. Use it for your own risk.


#include <io.h>
#include "system.h"
#include "types.h"
 

  #define BIT(x) (0x01 << (x)) 
  #define SETBIT(a, m)      IOWR(base, 0, (a|(BIT(m))))     
  #define CLEARBIT(a,  m)   IOWR(base, 0, (a)&(~(BIT(m))))) 
  
  
  #define BASE_ADRESS USB_FT2232_0_BASE // Set base address from SOPC BUILDER
  #define FT2232_IRQ  USB_FT2232_0_IRQ // SET IRQ

//    READS FROM USB REGISTERS 
#define RD_USB_DATA_ADDR                           0x1
#define RD_USB_TX_LEFT_STATUS_ADDR                 0x2
#define RD_USB_RX_USED_STATUS_ADDR                 0x3
#define RD_FIFO_TX_WRFULL_ADDR                     0x4
#define RD_FIFO_RX_WREMPTY_ADDR                    0x5
#define RD_GLOBAL_STATUS_ADDR                      0x6


//     WRITES TO USB REGISTERS
#define WR_USB_DATA_ADDR                           0x0
#define SET_IRQ_COMPARE                            0x7
#define SET_RX_IRQ_EVENT_CHAR                      0x8
#define CLEAR_INTERRUPT                            0x9
#define CONTROL_REG_ADDR                           0xA
#define ASYNC_CLEAR_ADDR                           0xB
#define TRANSMIT_SLICE_ADDR                        0xC// gali but nereikalingas

//  Control register
#define  ENABLE_IRQ_COMPARE                        0x1
#define  ENABLE_IRQ_TX_FULL                        0x2
#define  ENABLE_IRQ_RX_FULL                        0x4
#define  ENBALE_IRQ_EVENT_CHAR                     0x8
#define  ENBALE_IRQ_RX_NOT_EMPTY                   0x10


// Returns one bit value about Receive and Transmit fifo status usefull for fast write and read (no needs to mask)
#define USB_FIFO_RX_NOT_EMPTY     IORD_32DIRECT(BASE_ADRESS, RD_FIFO_RX_WREMPTY_ADDR<<2)// tikrina tik viena bita ar pilnas ar ne
#define USB_FIFO_TX_NOT_FULL      IORD_32DIRECT(BASE_ADRESS, RD_FIFO_TX_WRFULL_ADDR<<2) // tikrina tik viena bita ar pilnas ar ne

// USB Global control register
#define USB_CONTROL(a)            IOWR_8DIRECT(BASE_ADRESS+(CONTROL_REG_ADDR<<2), 0, a)
// USB receive RX interrupt charakter
#define EVENT_CHAR(a)             IOWR_8DIRECT(BASE_ADRESS+(SET_RX_IRQ_EVENT_CHAR<<2), 0, a)

#define CLEAR_TX_FIFO             IOWR_8DIRECT(BASE_ADRESS+(ASYNC_CLEAR_ADDR<<2), 0, 1)
#define CLEAR_RX_FIFO             IOWR_8DIRECT(BASE_ADRESS+(ASYNC_CLEAR_ADDR<<2), 0, 2)
#define CLEAR_IRQ                 IOWR_8DIRECT(BASE_ADRESS+(CLEAR_INTERRUPT<<2), 0, 0)
#define TRANSMIT_SLICE(a)         IOWR_8DIRECT(BASE_ADRESS+(TRANSMIT_SLICE_ADDR<<2), 0, a-1) // nusiunciam skaiciu pagalpo kurio padarys waita kad readas galetu ysikisti

// Returns value of used fifo at the moment (specific delay see AVALON parameters in SOPC Builder)
#define GET_LEFT_TX_FIFO          IORD_32DIRECT(BASE_ADRESS, RD_USB_TX_LEFT_STATUS_ADDR<<2)
#define GET_USED_RX_FIFO          IORD_32DIRECT(BASE_ADRESS, RD_USB_RX_USED_STATUS_ADDR<<2)
// Data Receive and Transmit form USB
#define WRITE_DATA_TO_USB(a)      IOWR_8DIRECT(BASE_ADRESS, 0, a)
#define READ_DATA_FROM_USB        IORD_8DIRECT(BASE_ADRESS, RD_USB_DATA_ADDR<<2)

#endif /*FT2232_USB_H_*/
