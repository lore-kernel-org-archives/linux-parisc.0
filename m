Return-Path: <rbradetich@uswest.net>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75764484B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Dec 2003 21:58:11 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: bame@debian.org
Content-Type: multipart/mixed; boundary="=-8S2x6HmuIr+x67NN2l7k"
Message-Id: <1071809880.25057.19.camel@laptop.bradetich.net>
Mime-Version: 1.0
Date: Thu, 18 Dec 2003 21:58:00 -0700
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Update palo to autodetect Serial Mux and append
	console=ttyB0
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--=-8S2x6HmuIr+x67NN2l7k
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello Paul and parisc-linux hackers,

I got an itch to update palo to auto-detect the serial mux and append
the console=ttyB0 to the kernel commandline like it does for tty0 and
ttyS0.

The following patch impliments this update (scrach one itch).

I have successfully booted 2.6.0-pa0 on C200+ and K460 using both tftp'd
kernels and on-disk kernels.

Feedback and/or testing welcome.

thanks,

- Ryan

P.S. This patch has not been commited to the palo cvs.  Feel free to
commit the patch if you approve it Paul; or let me know what needs to be
updated (version?, changelog entry?, etc) if you want me to commit it.


--=-8S2x6HmuIr+x67NN2l7k
Content-Disposition: attachment; filename=palo.diff
Content-Type: text/x-patch; name=palo.diff; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 7bit

Index: ipl/bootloader.h
===================================================================
RCS file: /var/cvs/palo/ipl/bootloader.h,v
retrieving revision 1.11
diff -u -p -r1.11 bootloader.h
--- ipl/bootloader.h	7 Jan 2002 23:55:10 -0000	1.11
+++ ipl/bootloader.h	19 Dec 2003 03:39:41 -0000
@@ -29,6 +29,7 @@ void die(const char *);
 void firmware_init(int started_wide);
 void pdc_default_width(int wide);
 int pdc_cons_duplex();
+int pdc_cons_mux(int *is_mux);
 int pdc_iodc_cin(char *buf, int size);
 void pdc_iodc_cout(const char *c, int size);
 int pdc_os_bits();
Index: ipl/ipl.c
===================================================================
RCS file: /var/cvs/palo/ipl/ipl.c,v
retrieving revision 1.32
diff -u -p -r1.32 ipl.c
--- ipl/ipl.c	13 Jan 2003 19:41:24 -0000	1.32
+++ ipl/ipl.c	19 Dec 2003 03:39:41 -0000
@@ -7,9 +7,13 @@
  */
 #include <stddef.h>
 #include "bootloader.h"
+#include <asm/pdc.h>
 #include <asm/byteorder.h>
 #include "load.h"
 
+#undef PAGE0
+#define PAGE0   ((struct zeropage *)0x00000000)
+
 int Debug = 0;
 
 void flush_data_cache(char *start, size_t length)
@@ -320,11 +324,22 @@ iplmain(int is_interactive, char *initia
 	printf("\nInformation: No console specified on kernel command line."
 		" This is normal.\nPALO will choose the console currently"
 		" used by firmware ");
+
         strcat(f.cmdline, " console=");
 	if (pdc_cons_duplex())
 	{
+            int is_mux;
+
 	    printf("(serial).\n");
-	    strcat(f.cmdline, "ttyS0");
+
+            if(pdc_cons_mux(&is_mux) != PDC_OK)
+                printf("Informatin: The PDC calls to query the console device failed. Assuming console=ttyS0\n");
+
+            if(is_mux)
+	        strcat(f.cmdline, "ttyB0");
+            else
+	        strcat(f.cmdline, "ttyS0");
+
 	    if (strstr(f.cmdline, " TERM=") == 0)
 	        strcat(f.cmdline, " TERM=vt102");
 	}
Index: ipl/pdc_misc.c
===================================================================
RCS file: /var/cvs/palo/ipl/pdc_misc.c,v
retrieving revision 1.14
diff -u -p -r1.14 pdc_misc.c
--- ipl/pdc_misc.c	7 Jan 2002 23:55:10 -0000	1.14
+++ ipl/pdc_misc.c	19 Dec 2003 03:39:41 -0000
@@ -20,6 +20,8 @@
 #define PDC_RETURN_DEFAULTS 1
 #define PDC_SET_DEFAULTS 2
 #define PDC_STABLE 10
+#define HPHW_A_DIRECT 5
+#define MUX_SVERSION 0x0d
 
 void die(const char *s)
 {
@@ -221,6 +223,37 @@ int
 pdc_cons_duplex()
 {
     return (PAGE0->mem_cons.cl_class == CL_DUPLEX);
+}
+
+int
+pdc_cons_mux(int *is_mux)
+{
+    int r;
+    unsigned char hw_type;    /* 5  bits used */
+    unsigned int sversion;    /* 20 bits used */
+    unsigned pdc_result2[64] __attribute__ ((aligned (8)));
+
+    *is_mux = 0;
+
+    r = firmware_call(mem_pdc, PDC_IODC, PDC_IODC_READ,
+                pdc_result, PAGE0->mem_cons.hpa,
+		0, pdc_result2, 32);
+                
+    if (r >= 0)
+    {
+        unsigned char iodc_data[32];
+        memcpy(&iodc_data, pdc_result2, 32);
+
+        hw_type = iodc_data[3] & 0x1f;
+        sversion = ((iodc_data[4] & 0x1f) << 16) | (iodc_data[5] << 8) | iodc_data[6];
+
+        if(hw_type == HPHW_A_DIRECT && sversion == MUX_SVERSION)
+            *is_mux = 1;
+
+	return PDC_OK;
+    }
+
+    return r;				/* r < 0; error */
 }
 
 int

--=-8S2x6HmuIr+x67NN2l7k--
