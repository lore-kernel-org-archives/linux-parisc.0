Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id C762F4955
	for <parisc-linux@parisc-linux.org>; Tue,  9 Oct 2001 15:42:33 -0600 (MDT)
Received: from esiee.fr (pc211j.esiee.fr [147.215.80.169])
	by mail.esiee.fr (Postfix) with ESMTP id 00181D15A6
	for <parisc-linux@parisc-linux.org>; Tue,  9 Oct 2001 23:42:31 +0200 (CEST)
Sender: marteaut@esiee.fr
Message-ID: <3BC36DD0.42636C7@esiee.fr>
Date: Tue, 09 Oct 2001 23:36:16 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------B1DF8C654DD6FAFEE25799A4"
Subject: [parisc-linux] Final version of Configure.help
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------B1DF8C654DD6FAFEE25799A4
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all,

	Here is the patch to update the help for make config. It is the result
of many advices given by a lot of people. 

Thank you, Thomas.

PS: Any comment is STILL possible :-)
--------------B1DF8C654DD6FAFEE25799A4
Content-Type: text/plain; charset=us-ascii;
 name="config.help.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="config.help.patch"

diff -Nru linux/Documentation/Configure.help linux.new/Documentation/Configure.help
--- linux/Documentation/Configure.help	Fri Aug 17 08:09:10 2001
+++ linux.new/Documentation/Configure.help	Tue Oct  9 23:17:55 2001
@@ -18525,6 +18525,143 @@
 
   To use this option, you have to check that the "/proc file system
   support" (CONFIG_PROC_FS) is enabled, too.
+
+Processor family
+CONFIG_PA7100
+  This is the processor type of your CPU. This information is used for
+  optimizing purposes. In order to compile a kernel that can run on
+  all 32-bit PA-RISC processors, you can specify PA7000 here.  If you
+  have a 64-bit machine, you may need to select PA8x00 here and say
+  'y' to '64-bit kernel' below.
+
+  The kernel will not necessarily run on earlier architectures than
+  the one you have chosen, e.g. a PA7200 optimised kernel will run on
+  a PA8000 cpu, but not a PA7000.
+
+  If you don't know what type of CPU you have, you can refer to the
+  Hardware Database at http://hwdb.parisc-linux.org/
+
+64-bit kernel
+CONFIG_PARISC64
+  Selecting this option will build a 64-bit kernel.  Some 64-bit machines
+  require a 64-bit kernel (eg L2000, A500) while other machines don't
+  have 64-bit firmware (eg C360, J200), so you may need to enable 32-bit
+  PDC below if you select this option.  Note that 64-bit userspace is
+  not yet supported but having a 64-bit kernel can improve some memory
+  operations like load, operate and store. Some applications (eg graphics) 
+  might benefit from that depending on what they are doing.
+
+GSC/Gecko bus support
+CONFIG_GSC
+  This option gives to the kernel the capability to manage GSC buses 
+  of HP computers. More than that, if you have systems with GSC slots, 
+  LASI, EISA or Dino (GSCtoPCI) bridge, this option is also compulsory 
+  if you want it working.
+
+LASI I/O support
+CONFIG_GSC_LASI
+  LASI is one type of controller embedded in HP workstations and 
+  servers. It controls some I/O devices like PS2 keyboard and mouse, 
+  audio or serial interface. The best advice is to keep it in your 
+  configuration, if you are not sure about that point.
+
+WAX support
+CONFIG_GSC_WAX
+  WAX is an EISA bus converter for PA-RISC systems. It can be found in
+  older systems like B/C/D/R-class machines. This option enables this 
+  converter. Note that it is under heavy development. Thus, it may not 
+  be working.
+
+GSCtoPCI/DINO PCI support
+CONFIG_GSC_DINO
+  By selecting this item, you add PCI support for Dino PCI Host Bus bridge.
+  PCI devices are sometimes embedded in GSC add-on cards (aka "card-mode 
+  Dino"). Note that only recent systems need it like B132L, C200. For more
+  information, go to http://hwdb.parisc-linux.org.
+
+LBA/Elroy PCI support
+CONFIG_PCI_LBA
+  Elroy is a bridge between Ropes bus and PCI on several machines. It can
+  be found on A500 and B/C/J/L/N-XXXX models. It allows the system to 
+  communicate with PCI cards. Thus, you should leave it on especially
+  if you have one of the listed HP machines. By default, say Y.
+
+SuperIO support
+CONFIG_SUPERIO
+  SuperIO is a chip that integrates a good part of I/O for the newest 
+  B/C/J-XXXX workstations. Serial, USB, IDE and Floppy are built in that
+  chip. That's why you must select it, if your box is corresponding to
+  those series. Please note that only the seriel support is working
+  at the moment.
+
+Chassis LCD and LED support
+CONFIG_CHASSIS_LCD_LED
+  HP boxes have LED or LCD indicator on the front in order to show some 
+  basic information like status for example. With this enabled, you can
+  have this help also available.
+
+Kernel support for SOM binaries
+CONFIG_BINFMT_SOM
+  SOM (Spectrum Object Model) is a format for libraries and executables 
+  used by HP. Saying Y here will enable your kernel to run SOM binaries.
+  As a result, you could run HP-UX executables. This capability is still
+  in development. Then, you use this functionality with no warranty!
+
+LASI/ASP builtin parallel-port
+CONFIG_PARPORT_GSC
+  If you have a LASI or ASP controller in your HP box and you want to use 
+  the parallel port, a good idea will be to keep this item in your
+  configuration.
+
+HP Lasi SCSI support
+CONFIG_SCSI_LASI700
+  If you have an old HP system like a 712, you should keep this on.
+  This will enable your SCSI controller and give you access to 
+  SCSI devices. For quite recent computers, you may be able to turn 
+  this off. 
+
+Lasi ethernet
+CONFIG_LASI_82596
+  This option adds the driver for one of most used network chips 
+  integrated in LASI chip. It is also known as Apricot driver. It is 
+  based on an Intel 82596 chip. If you do not know what is your 
+  hardware, it is strongly recommended to keep is on.
+
+Support for Lasi/Dino PS2 port
+CONFIG_GSC_PS2
+  The PS2 connector of the HP boxes looks like a standard PC connector.
+  If you want to use the PS2 keyboard and mouse, you must keep this on.
+  Anyway, some HP workstations and servers have this kind of interfaces
+  but not the ports you can plug in your devices. Thus, the best thing
+  to do anyway is to let this choice turned on.
+
+serial port on GSC support
+CONFIG_SERIAL_GSC
+  For most of the HP servers and for some workstations that do not have 
+  its video card supported yet, you will need to get the console output
+  via the serial port. As a result, you could interact with the box via
+  a VT or a serial cable link to another computer.
+
+STI console
+CONFIG_STI_CONSOLE
+  The Standard Text Interface could correspond to the VGA support for PC.
+  HP developped STI as a mechanism between CPU and graphics devices. 
+  Thus, if you want your console on your screen like any other PC linux
+  does, leave this option on.
+  If you do not have any success with your console output, we advice you
+  to check if you have checked the STI frame buffer option, aka 
+  CONFIG_FB_STI, in your configuration. Some models are happy when the 
+  two of them are enabled and some others prefer to have only this one 
+  only.
+  Anyway, if you failed to have the screen output, you can switch to the 
+  serial console output.
+
+PA Harmony audio driver
+CONFIG_SOUND_HARMONY
+  This option enables the audio part of the LASI controller. Since it is 
+  standard to all the boxes, this option should be set for any 
+  workstation except the newest ones. Servers do not really need audio. 
+  Then, you can unset it.
 
 #
 # A couple of things I keep forgetting:

--------------B1DF8C654DD6FAFEE25799A4--
