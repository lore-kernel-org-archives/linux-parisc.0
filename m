Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 773474841
	for <parisc-linux@parisc-linux.org>; Mon,  1 Oct 2001 17:19:12 -0600 (MDT)
Received: from esiee.fr (pc211j.esiee.fr [147.215.80.169])
	by mail.esiee.fr (Postfix) with ESMTP id 0BA95D15AD
	for <parisc-linux@parisc-linux.org>; Tue,  2 Oct 2001 01:18:48 +0200 (CEST)
Sender: marteaut@esiee.fr
Message-ID: <3BB8F957.C9811C25@esiee.fr>
Date: Tue, 02 Oct 2001 01:16:39 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Second Draft of the help for the kernel options
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

	Once again, I ask you to verify what I wrote and only God knows how
important it is to re-read this file b/c it is useful and I made it so
many mistakes for sure :)

	I added the comments of the first draft (Thanks to Grant) and CPU type
help too. I do not really like the lists. If you have any better idea,
please let me know.

Thanks, Thomas.
ESIEE Team

PS: I would like to know if I can put the PA-RISC/Linux Boot HOWTO into
stable state??

Text to add in Documentation/ Configure.help
======================================================================================


Processor family
CONFIG_PA7100
  In this section, you will find enough informations to set correctly 
  your CPU type option. Nevertheless, if you need more, you can see 
  all the hardware content of your box at http://hwdb.parisc-linux.org.
  
  If you select the PA7000/PA7100 option, your box must be one of these 
  listed below: 705/35, 710/50, 715/33, 715/50, 715/75, 720/50, 725/50, 
  725/75, 730/66, 735/99, 735/125, 750/66, 755/99.

  If you select the PA7200 option, your box must be one of these listed 
  below: C100, C110, D250, D350, D260, D360, J200, J210, K100, K200, 
  K210, K220, K400, K410, K420.

  If you choose the PA7100LC/PA7300LC option then your box is 715/64, 
  715/80, 715/100, 725/100, A180, B132L(+), B160L(+), B180L(+), C160L, 
  C180L, D200, D210, D220, D230, D300, D310, D320 or D330. There are 
  also some systems from the E series but there are not yet supported.

  Finally, PA8x00 is the good choice for all new stuff like A500, B1000,
  B2000, B2600, C200+, C240+, C3000, C3600, J282, J2240, J5000, J6000, 
  J6700, J7000, K250, K260, K270, K370, K450, K460, K470, K570, L1000, 
  L2000, L3000, N4000, V2200, V2250, V2500.

  Now, you should be sure of which CPU type. If not, please send a mail 
  to parisc-linux@lists.parisc-linux.org.

64-bit kernel
CONFIG_PARISC64
  The 64-bit kernel support give the capability of using 64-bit CPU to 
  the kernel. This is useful for PA8X00 series minimum. Note that even
  if your kernel is 64-bit, your userspace will be in 32-bit.

GSC/Gecko bus support
CONFIG_GSC
  This option gives to the kernel the capability to manage GSC buses 
  of HP computers. More than that, if you have systems with GSC slots, 
  LASI, EISA or Dino (GSCtoPCI) bridge, this option is also compulsory 
  if you want it working.

LASI I/O support
CONFIG_GSC_LASI
  LASI is one type of controller embedded in HP workstations and 
  servers. It controls some I/O devices like PS2 keyboard and mouse, 
  audio or serial interface. The best advice is to keep it in your 
  configuration, if you are not sure about that point.

WAX support
CONFIG_GSC_WAX
  WAX is an EISA bus converter for PA-RISC systems. It can be found in
  older systems like B/C/D/R-class machines. This option enables this 
  converter. Note that it is under heavy development. Thus, it may not 
  be working.

GSCtoPCI/DINO PCI support
CONFIG_GSC_DINO
  By selecting this item, you add PCI support for Dino PCI Host Bus
bridge.
  PCI devices are sometimes embedded in GSC add-on cards (aka "card-mode 
  Dino"). Note that only recent systems need it like B132L, C200. For
more
  information, go to http://hwdb.parisc-linux.org.

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
  This will enable your SCSI controller and give you access to 
  SCSI devices. For quite recent computers, you may be able to turn 
  this off. 

Lasi ethernet
CONFIG_LASI_82596
  This option adds the driver for one of most used network chips 
  integrated in LASI chip. It is also known as Apricot driver. It is 
  based on an Intel 82596 chip. If you do not know what is your 
  hardware, it is strongly recommended to keep is on.

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
  workstation except the newest ones. Servers do not really need audio. 
  Then, you can unset it.
