/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'ft232h_avalon_sys'
 * SOPC Builder design path: ../../ft232h_avalon_sys.sopcinfo
 *
 * Generated: Mon Dec 05 23:04:37 CST 2016
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00022820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 96000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x12
#define ALT_CPU_DCACHE_BYPASS_MASK 0x80000000
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 2048
#define ALT_CPU_EXCEPTION_ADDR 0x00010020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 96000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_EXTRA_EXCEPTION_INFO
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x12
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00010000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00022820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 96000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x12
#define NIOS2_DCACHE_BYPASS_MASK 0x80000000
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x00010020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_EXTRA_EXCEPTION_INFO
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x12
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00010000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_DMA
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_NIOS2_GEN2


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone V"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/jtag_uart"
#define ALT_LOG_PORT_BASE 0x23040
#define ALT_LOG_PORT_DEV jtag_uart
#define ALT_LOG_PORT_IS_JTAG_UART
#define ALT_LOG_PORT_PRESENT
#define ALT_LOG_PORT_TYPE ALTERA_AVALON_JTAG_UART
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x23040
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x23040
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x23040
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "ft232h_avalon_sys"


/*
 * ddr3 configuration as viewed by dma_write_master
 *
 */

#define DMA_WRITE_MASTER_DDR3_BASE 0x0
#define DMA_WRITE_MASTER_DDR3_IRQ -1
#define DMA_WRITE_MASTER_DDR3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DMA_WRITE_MASTER_DDR3_NAME "/dev/ddr3"
#define DMA_WRITE_MASTER_DDR3_SPAN 134217728
#define DMA_WRITE_MASTER_DDR3_TYPE "altera_mem_if_ddr3_emif"


/*
 * ddr3 configuration as viewed by usb_dma_read_master
 *
 */

#define USB_DMA_READ_MASTER_DDR3_BASE 0x0
#define USB_DMA_READ_MASTER_DDR3_IRQ -1
#define USB_DMA_READ_MASTER_DDR3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define USB_DMA_READ_MASTER_DDR3_NAME "/dev/ddr3"
#define USB_DMA_READ_MASTER_DDR3_SPAN 134217728
#define USB_DMA_READ_MASTER_DDR3_TYPE "altera_mem_if_ddr3_emif"


/*
 * dma configuration
 *
 */

#define ALT_MODULE_CLASS_dma altera_avalon_dma
#define DMA_ALLOW_BYTE_TRANSACTIONS 1
#define DMA_ALLOW_DOUBLEWORD_TRANSACTIONS 1
#define DMA_ALLOW_HW_TRANSACTIONS 1
#define DMA_ALLOW_QUADWORD_TRANSACTIONS 1
#define DMA_ALLOW_WORD_TRANSACTIONS 1
#define DMA_BASE 0x23000
#define DMA_IRQ 1
#define DMA_IRQ_INTERRUPT_CONTROLLER_ID 0
#define DMA_LENGTHWIDTH 13
#define DMA_MAX_BURST_SIZE 128
#define DMA_NAME "/dev/dma"
#define DMA_SPAN 32
#define DMA_TYPE "altera_avalon_dma"


/*
 * dma_ram configuration
 *
 */

#define ALT_MODULE_CLASS_dma_ram altera_avalon_onchip_memory2
#define DMA_RAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define DMA_RAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define DMA_RAM_BASE 0x20000
#define DMA_RAM_CONTENTS_INFO ""
#define DMA_RAM_DUAL_PORT 1
#define DMA_RAM_GUI_RAM_BLOCK_TYPE "AUTO"
#define DMA_RAM_INIT_CONTENTS_FILE "ft232h_avalon_sys_dma_ram"
#define DMA_RAM_INIT_MEM_CONTENT 1
#define DMA_RAM_INSTANCE_ID "NONE"
#define DMA_RAM_IRQ -1
#define DMA_RAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DMA_RAM_NAME "/dev/dma_ram"
#define DMA_RAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define DMA_RAM_RAM_BLOCK_TYPE "AUTO"
#define DMA_RAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define DMA_RAM_SINGLE_CLOCK_OP 1
#define DMA_RAM_SIZE_MULTIPLE 1
#define DMA_RAM_SIZE_VALUE 8192
#define DMA_RAM_SPAN 8192
#define DMA_RAM_TYPE "altera_avalon_onchip_memory2"
#define DMA_RAM_WRITABLE 1


/*
 * dma_ram configuration as viewed by dma_read_master
 *
 */

#define DMA_READ_MASTER_DMA_RAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define DMA_READ_MASTER_DMA_RAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define DMA_READ_MASTER_DMA_RAM_BASE 0x20000
#define DMA_READ_MASTER_DMA_RAM_CONTENTS_INFO ""
#define DMA_READ_MASTER_DMA_RAM_DUAL_PORT 1
#define DMA_READ_MASTER_DMA_RAM_GUI_RAM_BLOCK_TYPE "AUTO"
#define DMA_READ_MASTER_DMA_RAM_INIT_CONTENTS_FILE "ft232h_avalon_sys_dma_ram"
#define DMA_READ_MASTER_DMA_RAM_INIT_MEM_CONTENT 1
#define DMA_READ_MASTER_DMA_RAM_INSTANCE_ID "NONE"
#define DMA_READ_MASTER_DMA_RAM_IRQ -1
#define DMA_READ_MASTER_DMA_RAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DMA_READ_MASTER_DMA_RAM_NAME "/dev/dma_ram"
#define DMA_READ_MASTER_DMA_RAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define DMA_READ_MASTER_DMA_RAM_RAM_BLOCK_TYPE "AUTO"
#define DMA_READ_MASTER_DMA_RAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define DMA_READ_MASTER_DMA_RAM_SINGLE_CLOCK_OP 1
#define DMA_READ_MASTER_DMA_RAM_SIZE_MULTIPLE 1
#define DMA_READ_MASTER_DMA_RAM_SIZE_VALUE 8192
#define DMA_READ_MASTER_DMA_RAM_SPAN 8192
#define DMA_READ_MASTER_DMA_RAM_TYPE "altera_avalon_onchip_memory2"
#define DMA_READ_MASTER_DMA_RAM_WRITABLE 1


/*
 * ft232 configuration as viewed by usb_dma_write_master
 *
 */

#define USB_DMA_WRITE_MASTER_FT232_BASE 0x0
#define USB_DMA_WRITE_MASTER_FT232_IRQ -1
#define USB_DMA_WRITE_MASTER_FT232_IRQ_INTERRUPT_CONTROLLER_ID -1
#define USB_DMA_WRITE_MASTER_FT232_NAME "/dev/ft232"
#define USB_DMA_WRITE_MASTER_FT232_SPAN 1024
#define USB_DMA_WRITE_MASTER_FT232_TYPE "ft232_avalon"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 4
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x23040
#define JTAG_UART_IRQ 4
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * ram configuration
 *
 */

#define ALT_MODULE_CLASS_ram altera_avalon_onchip_memory2
#define RAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define RAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define RAM_BASE 0x10000
#define RAM_CONTENTS_INFO ""
#define RAM_DUAL_PORT 0
#define RAM_GUI_RAM_BLOCK_TYPE "AUTO"
#define RAM_INIT_CONTENTS_FILE "ft232h_avalon_sys_ram"
#define RAM_INIT_MEM_CONTENT 1
#define RAM_INSTANCE_ID "NONE"
#define RAM_IRQ -1
#define RAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RAM_NAME "/dev/ram"
#define RAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define RAM_RAM_BLOCK_TYPE "AUTO"
#define RAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define RAM_SINGLE_CLOCK_OP 1
#define RAM_SIZE_MULTIPLE 1
#define RAM_SIZE_VALUE 65536
#define RAM_SPAN 65536
#define RAM_TYPE "altera_avalon_onchip_memory2"
#define RAM_WRITABLE 1


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x23048
#define SYSID_ID -1792568025
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1480949152
#define SYSID_TYPE "altera_avalon_sysid_qsys"


/*
 * usb_dma configuration
 *
 */

#define ALT_MODULE_CLASS_usb_dma altera_avalon_dma
#define USB_DMA_ALLOW_BYTE_TRANSACTIONS 1
#define USB_DMA_ALLOW_DOUBLEWORD_TRANSACTIONS 1
#define USB_DMA_ALLOW_HW_TRANSACTIONS 1
#define USB_DMA_ALLOW_QUADWORD_TRANSACTIONS 1
#define USB_DMA_ALLOW_WORD_TRANSACTIONS 1
#define USB_DMA_BASE 0x23020
#define USB_DMA_IRQ 0
#define USB_DMA_IRQ_INTERRUPT_CONTROLLER_ID 0
#define USB_DMA_LENGTHWIDTH 13
#define USB_DMA_MAX_BURST_SIZE 128
#define USB_DMA_NAME "/dev/usb_dma"
#define USB_DMA_SPAN 32
#define USB_DMA_TYPE "altera_avalon_dma"

#endif /* __SYSTEM_H_ */
