Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5FCF04829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Dec 2002 13:16:42 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id 508751FFF42
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Dec 2002 21:16:26 +0100 (CET)
Date: Thu, 19 Dec 2002 20:11:11 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Cc: patch@zabbadoz.net
Message-ID: <Pine.BSF.4.44.0212192006300.647-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] [2.5 patch] dummy console Kconfig fix
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

DUMMY_CONSOLE also needs _ROWS and _COLUMNS.

#
# Console display driver support
#
# CONFIG_VGA_CONSOLE is not set
# CONFIG_MDA_CONSOLE is not set
# CONFIG_STI_CONSOLE is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=160
CONFIG_DUMMY_CONSOLE_ROWS=64


--- drivers/video/console/Kconfig.orig	2002-12-19 18:45:38.000000000 +0000
+++ drivers/video/console/Kconfig	2002-12-19 18:47:14.000000000 +0000
@@ -74,9 +74,21 @@
           machines.  Say Y here to build support for it into your kernel.
           The alternative is to use your primary serial port as a console.

+config PROM_CONSOLE
+	bool "PROM console"
+	depends on SPARC32 || SPARC64
+	help
+	  Say Y to build a console driver for Sun machines that uses the
+	  terminal emulation built into their console PROMS.
+
+config DUMMY_CONSOLE
+	bool
+	depends on !PROM_CONSOLE=y || VGA_CONSOLE!=y || SGI_NEWPORT_CONSOLE!=y || !IODC_CONSOLE && GSC_PS2
+	default y
+
 config DUMMY_CONSOLE_COLUMNS
         int "Initial number of STI console screen columns" if STI_CONSOLE
-        depends on STI_CONSOLE || FB_STI
+        depends on STI_CONSOLE || FB_STI || DUMMY_CONSOLE
         default "160"
         help
           The default value is 160, which should fit a 1280x1024 monitor.
@@ -84,24 +96,12 @@

 config DUMMY_CONSOLE_ROWS
         int "Initial number of STI console screen rows" if STI_CONSOLE
-        depends on STI_CONSOLE || FB_STI
+        depends on STI_CONSOLE || FB_STI || DUMMY_CONSOLE
         default "64"
         help
           The default value is 64, which should fit a 1280x1024 monitor.
           Select 25 if you use a 640x480 resolution by default.

-config PROM_CONSOLE
-	bool "PROM console"
-	depends on SPARC32 || SPARC64
-	help
-	  Say Y to build a console driver for Sun machines that uses the
-	  terminal emulation built into their console PROMS.
-
-config DUMMY_CONSOLE
-	bool
-	depends on !PROM_CONSOLE=y || VGA_CONSOLE!=y || SGI_NEWPORT_CONSOLE!=y || !IODC_CONSOLE && GSC_PS2
-	default y
-
 config FRAMEBUFFER_CONSOLE
 	tristate "Framebuffer Console support"
 	depends on FB

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
