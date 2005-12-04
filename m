From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 4 Dec 2005 01:04:23 -0500
Message-ID: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: linux-pcmcia@lists.infradead.org
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

PCMCIA port and memory probing is broken on parisc, disabling both
allows the PCMCIA subsystem to work on parisc systems.

Signed-off-by: James Bottomley <jejb@parisc-linux.org>
Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

--- a/drivers/pcmcia/Kconfig	2005-11-29 10:53:24.000000000 -0700
+++ b/drivers/pcmcia/Kconfig	2005-11-11 21:08:04.000000000 -0700
@@ -200,7 +200,11 @@
 
 config PCMCIA_PROBE
 	bool
-	default y if ISA && !ARCH_SA1100 && !ARCH_CLPS711X
+	default y if ISA && !ARCH_SA1100 && !ARCH_CLPS711X && !PARISC
+
+config PCMCIA_PROBE_MEM
+	bool
+	default y if !PARISC
 
 config M32R_PCC
 	bool "M32R PCMCIA I/F"
--- a/drivers/pcmcia/rsrc_nonstatic.c	2005-11-29 10:53:24.000000000 -0700
+++ b/drivers/pcmcia/rsrc_nonstatic.c	2005-11-11 21:08:04.000000000 -0700
@@ -43,7 +43,11 @@
 
 #define INT_MODULE_PARM(n, v) static int n = v; module_param(n, int, 0444)
 
+#ifdef CONFIG_PCMCIA_PROBE_MEM
 INT_MODULE_PARM(probe_mem,	1);		/* memory probe? */
+#else
+INT_MODULE_PARM(probe_mem,	0);		/* memory probe? */
+#endif
 #ifdef CONFIG_PCMCIA_PROBE
 INT_MODULE_PARM(probe_io,	1);		/* IO port probe? */
 INT_MODULE_PARM(mem_limit,	0x10000);
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
