Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B926482A
	for <parisc-linux@parisc-linux.org>; Wed,  2 May 2001 01:55:21 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14urTh-00078O-00
	for parisc-linux@parisc-linux.org; Wed, 02 May 2001 08:55:17 +0100
Date: Wed, 2 May 2001 08:55:17 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010502085517.J18144@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Bizarre linking problems with glibc
List-ID: <linux-parisc.vger.kernel.org>

If I add this patch to glibc:

diff -u -p -r1.6.2.1 dl-error.c
--- elf/dl-error.c      2001/04/25 18:39:32     1.6.2.1
+++ elf/dl-error.c      2001/05/01 23:10:34
@@ -154,6 +154,8 @@ _dl_catch_error (const char **objname, c
       return 0;
     }
 
+printf("_dl_catcherror: we longjmped\n");
+
   /* We get here only if we longjmp'd out of OPERATE.  */
   tsd_setspecific (old);
   *objname = c.objname;

then i get these errors when building it:

gcc   -nostdlib -nostartfiles -r -o /home/willy/cvs/glibc-build/elf/librtld.os '-Wl,-(' /home/willy/cvs/glibc-build/elf/dl-allobjs.os /home/willy/cvs/glibc-build/libc_pic.a -lgcc '-Wl,-)'
/home/willy/cvs/glibc-build/libc_pic.a(init-first.os): In function `init':
/home/willy/cvs/glibc-merge/csu/../sysdeps/unix/sysv/linux/init-first.c:59: multiple definition of `__libc_multiple_libcs'
/home/willy/cvs/glibc-build/elf/dl-allobjs.os:/home/willy/cvs/glibc-merge/elf/../sysdeps/generic/dl-cache.c:149: first defined here
collect2: ld returned 1 exit status

-- 
Revolutions do not require corporate support.
