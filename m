Return-Path: <rbradetich@uswest.net>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 80DBE484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Dec 2003 00:55:16 -0700 (MST)
From: Ryan Bradetich <rbradetich@uswest.net>
To: bame@debian.org
Content-Type: multipart/mixed; boundary="=-7BKU+oxglG0KcdtPizLS"
Message-Id: <1071906891.11231.6.camel@laptop.bradetich.net>
Mime-Version: 1.0
Date: Sat, 20 Dec 2003 00:54:52 -0700
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Updated patch for palo to auto-detect serial mux.
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--=-7BKU+oxglG0KcdtPizLS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Paul,

My last palo patch had a bug in masking the sversion bits so palo
incorrectly determined the console on the E-35 was not a Mux.  I have
attached an interdiff patch between the new patch and my previous patch.

Thanks,

- Ryan


--=-7BKU+oxglG0KcdtPizLS
Content-Disposition: attachment; filename=palo-interdiff.diff
Content-Type: text/x-patch; name=palo-interdiff.diff; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 7bit

diff -u ipl/pdc_misc.c ipl/pdc_misc.c
--- ipl/pdc_misc.c	19 Dec 2003 03:39:41 -0000
+++ ipl/pdc_misc.c	20 Dec 2003 04:49:07 -0000
@@ -231,7 +231,7 @@
     int r;
     unsigned char hw_type;    /* 5  bits used */
     unsigned int sversion;    /* 20 bits used */
-    unsigned pdc_result2[64] __attribute__ ((aligned (8)));
+    unsigned long pdc_result2[32] __attribute__ ((aligned (8)));
 
     *is_mux = 0;
 
@@ -241,11 +241,11 @@
                 
     if (r >= 0)
     {
-        unsigned char iodc_data[32];
-        memcpy(&iodc_data, pdc_result2, 32);
+        unsigned char iodc_data[8];
+        memcpy(&iodc_data, pdc_result2, 8);
 
         hw_type = iodc_data[3] & 0x1f;
-        sversion = ((iodc_data[4] & 0x1f) << 16) | (iodc_data[5] << 8) | iodc_data[6];
+        sversion = ((iodc_data[4] & 0x0f) << 16) | (iodc_data[5] << 8) | iodc_data[6];
 
         if(hw_type == HPHW_A_DIRECT && sversion == MUX_SVERSION)
             *is_mux = 1;

--=-7BKU+oxglG0KcdtPizLS--
