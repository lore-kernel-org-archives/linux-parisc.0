Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA17159
	for <parisc-linux@puffin.external.hp.com>; Fri, 23 Jun 2000 04:33:53 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 23 Jun 2000 10:35:02 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA28580;
	Fri, 23 Jun 2000 20:34:43 +1000
Date: Fri, 23 Jun 2000 20:34:43 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Paul Bame <bame@fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs 
In-Reply-To: <Pine.LNX.4.21.0006231116510.24137-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0006232007520.26260-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Paul,
   I nearly forgot to follow up with the results of my kernel build.  It
was "ld -r" that caused the failure, and the following patch to the kernel
Makefile cures the build problem for me.  Not tested as I don't have any
hp hardware.

Regards, Alan
-- 
Linuxcare.  Support for the Revolution.

Index: Makefile
===================================================================
RCS file: /home/cvs/parisc/linux-2.3/Makefile,v
retrieving revision 1.17
diff -u -p -r1.17 Makefile
--- Makefile	2000/05/31 18:50:18	1.17
+++ Makefile	2000/06/23 10:11:16
@@ -95,6 +95,11 @@ AFLAGS := -D__ASSEMBLY__ $(CPPFLAGS)
 # use '-fno-strict-aliasing', but only if the compiler can take it
 CFLAGS += $(shell if $(CC) -fno-strict-aliasing -S -o /dev/null -xc /dev/null >/dev/null 2>&1; then echo "-fno-strict-aliasing"; fi)
 
+# Same for -ffunction-sections
+# This is needed for the new binutils as otherwise "ld -r" results in .text
+# sections that are too big (> 0x40000) for branches to reach stubs.
+CFLAGS += $(shell if $(CC) -ffunction-sections -S -o /dev/null -xc /dev/null >/dev/null 2>&1; then echo "-ffunction-sections"; fi)
+
 export	CPPFLAGS CFLAGS AFLAGS
 
 #
