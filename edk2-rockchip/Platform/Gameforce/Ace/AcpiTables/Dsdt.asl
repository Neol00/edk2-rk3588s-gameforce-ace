/** @file
 *
 *  Differentiated System Definition Table (DSDT)
 *
 *  Copyright (c) 2020, Pete Batard <pete@akeo.ie>
 *  Copyright (c) 2018-2020, Andrey Warkentin <andrey.warkentin@gmail.com>
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Copyright (c) 2021, ARM Limited. All rights reserved.
 *
 *  SPDX-License-Identifier: BSD-2-Clause-Patent
 *
 **/

#include "AcpiTables.h"

#define BOARD_I2S0_TPLG "i2s-gameforce"

// Gameforce Ace specific audio codec configuration
#define BOARD_AUDIO_CODEC_HID "ESSX8388"
#define BOARD_CODEC_I2C "\\_SB.I2C3"
#define BOARD_CODEC_I2C_ADDR 0x11
#define BOARD_CODEC_GPIO "\\_SB.GPI1"
#define BOARD_CODEC_GPIO_PIN GPIO_PIN_PA6

DefinitionBlock ("Dsdt.aml", "DSDT", 2, "RKCP  ", "RK3588  ", 2)
{
  Scope (\_SB_)
  {
    include ("DsdtCommon.asl")

    include ("Cpu.asl")

    include ("Pcie.asl")
    include ("Sata.asl")
    include ("Emmc.asl")
    include ("Sdhc.asl")
    include ("Dma.asl")
    // Gameforce Ace doesn't have ethernet
    // include ("Gmac1.asl")
    include ("Gpio.asl")
    include ("I2c.asl")
    include ("Uart.asl")
    // include ("Spi.asl")

    include ("I2s.asl")

    include ("Usb2Host.asl")
    include ("Usb3Host0.asl")
    include ("Usb3Host2.asl")

    Scope (I2C3) {
      include ("Es8388.asl")
    }

    // Display configuration for DSI panel
    // Touchscreen on I2C1 at address 0x14
    Scope (I2C1) {
      Device (TCHP) {
        Name (_HID, "GDIX1001")
        Name (_CID, "PNP0C50")
        Name (_UID, 0)
        
        Method (_STA, 0, NotSerialized) {
          Return (0x0F)
        }
        
        Method (_CRS, 0, NotSerialized) {
          Name (RBUF, ResourceTemplate () {
            I2cSerialBusV2 (0x14, ControllerInitiated, 400000,
                          AddressingMode7Bit, "\\_SB.I2C1",
                          0x00, ResourceConsumer, , Exclusive)
          })
          Return (RBUF)
        }
      }
    }
  }
}