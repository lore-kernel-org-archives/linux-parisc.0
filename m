From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] [PATCH] New help text for HIL options
Date: Fri, 27 Aug 2004 02:21:41 +0100
Message-ID: <20040827012141.GA4746@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This patch changes the help text for the following options:

   CONFIG_KEYBOARD_HIL_OLD
   CONFIG_KEYBOARD_HIL
   CONFIG_MOUSE_HIL
   CONFIG_HP_SDC

I hope it's an improvement.

Help for CONFIG_HIL_MLC is still missing, though.

Index: drivers/input/keyboard/Kconfig
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/input/keyboard/Kconfig,v
retrieving revision 1.19
diff -u -r1.19 Kconfig
--- drivers/input/keyboard/Kconfig	20 Jul 2004 22:06:12 -0000	1.19
+++ drivers/input/keyboard/Kconfig	27 Aug 2004 01:12:33 -0000
@@ -102,7 +102,12 @@
 	depends on PARISC && INPUT && INPUT_KEYBOARD && !HIL_MLC
 	default y
 	help
-	  The "Human Interface Loop" is a older, 8-channel USB-like
+	  Say Y here (or to "HP HIL keyboard support") if you have a
+	  PA-RISC machine with a HIL keyboard connected. This driver does
+	  not support PS/2 keyboards attached to a HIL hub - use the AT
+	  keyboard driver instead.
+
+	  The "Human Interface Loop" is an older, 8-channel USB-like
 	  controller used in several Hewlett Packard models. This driver
 	  was adapted from the one written for m68k/hp300, and implements
 	  support for a keyboard attached to the HIL port, but not for
@@ -110,19 +115,27 @@
 	  However, it has been thoroughly tested and is stable.
 
 	  If you want full HIL support including support for multiple
-	  keyboards, mices and tablets, you have to enable the
-	  "HP System Device Controller i8042 Support" in the input/serio
-	  submenu.
+	  keyboards, mice and tablets, you have to enable the
+	  "HP System Device Controller i8042 Support" in the
+	  "Serial i/o support" submenu, along with "HIL MLC Support".
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called hilkbd.
 
 config KEYBOARD_HIL
 	tristate "HP HIL keyboard support"
 	depends on PARISC && INPUT && INPUT_KEYBOARD
 	default y
 	select HP_SDC
- 	select HIL_MLC
+	select HIL_MLC
 	help
-	  The "Human Interface Loop" is a older, 8-channel USB-like
+	  Say Y here (or to "HP HIL keyboard support (simple driver)")
+	  if you have a PA-RISC machine with a HIL keyboard connected.
+	  This driver does not support PS/2 keyboards attached to a HIL
+	  hub - use the AT keyboard driver instead.
+
+	  The "Human Interface Loop" is an older, 8-channel USB-like
 	  controller used in several Hewlett Packard models.
-	  This driver implements support for HIL-keyboards attached
-	  to your machine, so normally you should say Y here.
 
+	  To compile this driver as a module, choose M here: the
+	  module will be called hil_kbd.
Index: drivers/input/mouse/Kconfig
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/input/mouse/Kconfig,v
retrieving revision 1.20
diff -u -r1.20 Kconfig
--- drivers/input/mouse/Kconfig	20 Jul 2004 22:06:13 -0000	1.20
+++ drivers/input/mouse/Kconfig	27 Aug 2004 01:12:33 -0000
@@ -132,9 +132,17 @@
 	  with that (I don't have the hardware yet).
 
 config MOUSE_HIL
-	tristate "HIL pointers (mice etc)."
+	tristate "HIL pointers (mice etc.)"
 	depends on PARISC && INPUT_MOUSE
 	select HP_SDC
 	select HIL_MLC
 	help
-	  Say Y here to support HIL pointers.
+	  Say Y here if you have a PA-RISC machine with a HIL pointing
+	  device connected. This driver does not support PS/2 devices
+	  attached to a HIL hub - use the PS/2 driver instead.
+
+	  The "Human Interface Loop" is an older, 8-channel USB-like
+	  controller used in several Hewlett Packard models.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called hil_ptr.
Index: drivers/input/serio/Kconfig
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/input/serio/Kconfig,v
retrieving revision 1.18
diff -u -r1.18 Kconfig
--- drivers/input/serio/Kconfig	20 Jul 2004 22:06:13 -0000	1.18
+++ drivers/input/serio/Kconfig	27 Aug 2004 01:12:33 -0000
@@ -118,7 +118,7 @@
 	---help---
 	  This option enables supports for the the "System Device
 	  Controller", an i8042 carrying microcode to manage a
-	  few miscellanous devices on some Hewlett Packard systems.
+	  few miscellaneous devices on some Hewlett Packard systems.
 	  The SDC itself contains a 10ms resolution timer/clock capable
 	  of delivering interrupts on a periodic and one-shot basis.
 	  The SDC may also be connected to a battery-backed real-time
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
