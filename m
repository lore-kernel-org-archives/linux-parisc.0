Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3934F48C0
	for <parisc-linux@parisc-linux.org>; Mon,  1 Oct 2001 05:57:48 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15o1hi-0007Ij-00
	for parisc-linux@parisc-linux.org; Mon, 01 Oct 2001 12:57:46 +0100
Date: Mon, 1 Oct 2001 12:57:46 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011001125746.D28828@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] I-Cache flushing
List-ID: <linux-parisc.vger.kernel.org>

On the subject of cache flushing... cachetlb.txt says:

  void flush_icache_range(unsigned long start, unsigned long end)
        When the kernel stores into addresses that it will execute
        out of (eg when loading modules), this function is called.

        If the icache does not snoop stores then this routine will need
        to flush it.

This implies to me that our implementation of flush_icache_range must
flush the relevant range of the dcache first.  I assume it doesn't
currently do that since our diff vs linus' tree for module.c is:

diff -urNX dontdiff linux-249/kernel/module.c linux-249-pa/kernel/module.c
--- linux-249/kernel/module.c   Mon Sep  3 15:20:34 2001
+++ linux-249-pa/kernel/module.c        Fri Aug 17 00:12:22 2001
@@ -510,8 +510,18 @@
 
        /* On some machines it is necessary to do something here
           to make the I and D caches consistent.  */
+#ifdef __hppa__
+       /* I guess we have a problem here because copy_from_user() has left
+        * the new module code in the data cache, so we need to flush it
+        * through.  Our copy_from_user() used to do cache flushing, but 
+        * it has been removed.  Puzzled as to why other archs might want
+        * to flush icache at this point.  rhirst@linuxcare.com
+        */
+       flush_data_cache();
+#endif
        flush_icache_range((unsigned long)mod, (unsigned long)mod + mod->size);
 
+       /* Update module references.  */
        mod->next = mod_tmp.next;
        mod->refs = NULL;
 
I suspect the right fix would be to change:

#define flush_icache_range flush_kernel_icache_range_asm

to:

static inline void flush_icache_range(unsigned long start, unsigned long end)
{
	flush_kernel_icache_range_asm(start, end);
	flush_kernel_dcache_range_asm(start, end);
}

Comments?

-- 
Revolutions do not require corporate support.
