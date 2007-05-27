From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] [PARISC] fix section mismatch in parport_gsc
Date: Sun, 27 May 2007 18:07:25 +0200
Message-ID: <200705271807.25326.deller__22174.0571585999$1416624367$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
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

Hi Kyle,

this patch fixes the section mismatch in parport_gsc.c:
WARNING: drivers/built-in.o(.text.parport_init_chip+0xc8): Section mismatch: reference to .init.data:parport_count (after 'parport_init_chip')

Please apply, Helge

    Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index 17bf993..43652ba 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -350,7 +350,7 @@ struct parport *__devinit parport_gsc_pr
 
 #define PARPORT_GSC_OFFSET 0x800
 
-static int __initdata parport_count;
+static int __devinitdata parport_count;
 
 static int __devinit parport_init_chip(struct parisc_device *dev)
 {
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
