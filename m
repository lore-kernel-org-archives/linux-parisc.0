Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id A1B95482B
	for <parisc-linux@parisc-linux.org>; Tue, 25 Sep 2001 16:43:54 -0600 (MDT)
Received: from esiee.fr (pc211j.esiee.fr [147.215.80.169])
	by mail.esiee.fr (Postfix) with ESMTP id E55CAD15DC
	for <parisc-linux@parisc-linux.org>; Wed, 26 Sep 2001 00:43:46 +0200 (CEST)
Sender: marteaut@esiee.fr
Message-ID: <3BB10839.D23F2ED6@esiee.fr>
Date: Wed, 26 Sep 2001 00:42:01 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] First Draft of the help for the kernel options
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

	As you know, PA/Linux source needs some help to guide their users.
That's why I tried to complete the documentation for the kernel. I would
like to know your point of view and your modifications. I send what we
must add at Documentation/Configuration.help. If you want to reply, try
to cut only the most interesting part in order to have small replies.

Thanks in advance, Thomas.
ESIEE Team


Here is the first draft:
==================================================================================

GSC/Gecko bus support
CONFIG_GSC
  This option gives to the kernel the capability to manage GSC buses 
  of HP computers. This option is compulsory if you want it working.

LASI I/O support
CONFIG_GSC_LASI
  LASI is one type of controller embedded in HP workstations and 
  servers. It controls some I/O devices like PS2 keyboard and mouse, 
  audio or serial interface. The best advice is to keep it in your 
  configuration, if you are not sure about that point.

GSCtoPCI/DINO PCI support
CONFIG_GSC_DINO
  By selecting this item, you add the use of your PCI extension slots.
  In order to be useful, you need a quite recent HP computer like those
  based on PA7300LC or PA8X00.

Chassis LCD and LED support
CONFIG_CHASSIS_LCD_LED
  HP boxes have LED or LCD indicator on the front in order to show some 
  basic information like status for example. With this enabled, you can
  have this help also available.

Kernel support for SOM binaries
CONFIG_BINFMT_SOM
  SOM (Spectrum Object Model) is a format for libraries and executables 
  used by HP. Saying Y here will enable your kernel to run SOM binaries.
  As a result, you could run HP-UX executables. This capability is still
  in development. Then, you use this functionality with no warranty!

LASI/ASP builtin parallel-port
CONFIG_PARPORT_GSC
  If you have a LASI or ASP controller in your HP box and you want to
use 
  the parallel port, a good idea will be to keep this item in your
  configuration.

HP Lasi SCSI support
CONFIG_SCSI_LASI
  If you have an old HP system like a 712, you should keep this on.
  This will enable the 
  For quite recent computers, you may be able to turn this off. 

Lasi ethernet
CONFIG_LASI_82596
  This option adds the driver for one of most used network cards. It
  is also known as Apricot driver. It is based on an Intel 82596 chip.
  If you do not know what is your hardware, it is strongly recommended
  to keep is on.

Support for Lasi/Dino PS2 port
CONFIG_GSC_PS2
  The PS2 connector of the HP boxes looks like a standard PC connector.
  If you want to use the PS2 keyboard and mouse, you must keep this on.
  Anyway, some HP workstations and servers have this kind of interfaces
  but not the ports you can plug in your devices. Thus, the best thing
  to do anyway is to let this choice turned on.

serial port on GSC support
CONFIG_SERIAL_GSC
  For most of the HP servers and for some workstations that do not have 
  its video card supported yet, you will need to get the console output
  via the serial port. As a result, you could interact with the box via
  a VT or a serial cable link to another computer.

STI console
CONFIG_STI_CONSOLE
  The Standard Text Interface could correspond to the VGA support for
PC.
  HP developped STI as a mechanism between CPU and graphics devices. 
  Thus, if you want your console on your screen like any other PC linux
  does, leave this option on.
  If you do not have any success with your console output, we advice you
  to check if you have checked the STI frame buffer option, aka 
  CONFIG_FB_STI, in your configuration. Some models are happy when the 
  two of them are enabled and some others prefer to have only this one 
  only.
  Anyway, if you failed to have the screen output, you can switch to the 
  serial console output.

PA Harmony audio driver
CONFIG_SOUND_HARMONY
  This option enables the audio part of the LASI controller. Since it is 
  standard to all the boxes, this option should be set for any 
  workstation. Servers do not really need audio. Then, you can unset it.
