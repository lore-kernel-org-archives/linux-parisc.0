From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [parisc-linux] [PATCH 562] m68k/HP300: Enable HIL configuration
	options
Date: Mon, 9 Oct 2006 22:22:37 +0200
Message-ID: <200610092022.k99KMbtC031450__39588.7131257497$1416624608$gmane$org@anakin.of.borg>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Development <linux-kernel@vger.kernel.org>,
 Linux/PA-RISC <parisc-linux@parisc-linux.org>
To: Linus Torvalds <torvalds@osdl.org>,
 Andrew Morton <akpm@osdl.org>
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

Enable HIL configuration options on HP300

Signed-Off-By: Kars de Jong <jongk@linux-m68k.org>
Signed-Off-By: Geert Uytterhoeven <geert@linux-m68k.org>

---
 keyboard/Kconfig |    4 ++--
 misc/Kconfig     |    2 +-
 mouse/Kconfig    |    2 +-
 serio/Kconfig    |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

--- linux/drivers/input/keyboard/Kconfig	2005/06/18 16:15:57	1.1.1.12
+++ linux/drivers/input/keyboard/Kconfig	2005/08/29 19:17:44	1.2
@@ -154,7 +154,7 @@ config KEYBOARD_AMIGA
 
 config KEYBOARD_HIL_OLD
 	tristate "HP HIL keyboard support (simple driver)"
-	depends on GSC
+	depends on GSC || HP300
 	default y
 	help
 	  The "Human Interface Loop" is a older, 8-channel USB-like
@@ -171,7 +171,7 @@ config KEYBOARD_HIL_OLD
 
 config KEYBOARD_HIL
 	tristate "HP HIL keyboard support"
-	depends on GSC
+	depends on GSC || HP300
 	default y
 	select HP_SDC
 	select HIL_MLC
--- linux/drivers/input/misc/Kconfig	2005/06/18 16:15:58	1.1.1.12
+++ linux/drivers/input/misc/Kconfig	2005/08/29 19:17:44	1.2
@@ -51,7 +51,7 @@ config INPUT_UINPUT
 
 config HP_SDC_RTC
 	tristate "HP SDC Real Time Clock"       
-	depends on GSC
+	depends on GSC || HP300
 	select HP_SDC
 	help
 	  Say Y here if you want to support the built-in real time clock
--- linux/drivers/input/mouse/Kconfig	2005/06/18 16:15:58	1.1.1.18
+++ linux/drivers/input/mouse/Kconfig	2005/08/29 19:17:44	1.2
@@ -129,7 +129,7 @@ config MOUSE_VSXXXAA
 
 config MOUSE_HIL
 	tristate "HIL pointers (mice etc)."     
-	depends on GSC
+	depends on GSC || HP300
 	select HP_SDC
 	select HIL_MLC
 	help
--- linux/drivers/input/serio/Kconfig	2005/08/29 14:19:56	1.1.1.17
+++ linux/drivers/input/serio/Kconfig	2005/08/29 19:17:45	1.5
@@ -112,7 +112,7 @@ config SERIO_GSCPS2
 
 config HP_SDC
 	tristate "HP System Device Controller i8042 Support"
-	depends on GSC && SERIO
+	depends on (GSC || HP300) && SERIO
 	default y
 	---help---
 	  This option enables supports for the the "System Device

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
