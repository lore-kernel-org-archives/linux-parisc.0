Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tdl.com (tdl.com [206.180.224.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6474C482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Sep 2001 18:59:04 -0600 (MDT)
Received: (from randall@localhost)
	by tdl.com (8.9.3/8.9.3) id RAA08445
	for parisc-linux@lists.parisc-linux.org; Sat, 8 Sep 2001 17:48:24 -0700
Date: Sat, 8 Sep 2001 17:48:24 -0700
From: Randall Craig <randall@tdl.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010908174824.A7948@tdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] CXXX Processor Identification Path
List-ID: <linux-parisc.vger.kernel.org>

The  C240+ reports as PA8000 processors.  This patch
will make them report as PA8200 processors. The file hardware.c also reported
that the C180 had a PA8200 processor, which the HP Hardware Compatability list
reports that the C180 has a PA8000 processor.


Cheers,

Randall

--- linux/arch/parisc/kernel/hardware.c	Sat Sep  8 17:47:15 2001
+++ linux.new/arch/parisc/kernel/hardware.c	Sat Sep  8 17:38:20 2001
@@ -1372,8 +1372,9 @@
 	{ 0x0592, 0x0fff, pcxt_  },  /* 0x0592 - 0x0592 */
 	{ 0x0593, 0x0fff, pcxu   },  /* 0x0593 - 0x0593 */
 	{ 0x0594, 0x0ffc, pcxu   },  /* 0x0594 - 0x0597 */
-	{ 0x0598, 0x0ffc, pcxu   },  /* 0x0598 - 0x059b */
-	{ 0x059c, 0x0ffe, pcxu_  },  /* 0x059c - 0x059d */
+	{ 0x0598, 0x0ffe, pcxu_  },  /* 0x0598 - 0x0599 */
+	{ 0x059a, 0x0ffd, pcxu   },  /* 0x059a - 0x059c */
+        { 0x059d, 0x0fff, pcxu_  },  /* 0x059d - 0x059d */
 	{ 0x059e, 0x0fff, pcxt_  },  /* 0x059e - 0x059e */
 	{ 0x059f, 0x0fff, pcxu   },  /* 0x059f - 0x059f */
 	{ 0x05a0, 0x0ffe, pcxt_  },  /* 0x05a0 - 0x05a1 */
