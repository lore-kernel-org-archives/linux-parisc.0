Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49F7E482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 May 2002 18:03:14 -0600 (MDT)
Date: Wed, 29 May 2002 00:40:24 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020528234023.GF3471@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PATCH: flush_icache_page() and flush_icache_range()
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
  gdb has a problem in that it often doesn't stop the target program
when you do a 'step' or 'next'.  This is because it plants breakpoints,
but those breakpoints sit in the data cache and don't get flushed
through to be visible as code in time.  We need a flush_icache_page()
implementation to fix this; the following adds that and
flush_icache_range() also.  It does fix gdb for me on my a500.

Posted here for comments, before commiting.  I modelled the new
flush_kernel_icache_page on flush_kernel_dcache_page, just changing the
stride and fdc to fic.

Richard


Index: include/asm-parisc/pgalloc.h
===================================================================
RCS file: /var/cvs/linux/include/asm-parisc/pgalloc.h,v
retrieving revision 1.34
diff -u -r1.34 pgalloc.h
--- include/asm-parisc/pgalloc.h	2001/09/30 06:06:47	1.34
+++ include/asm-parisc/pgalloc.h	2002/05/28 23:52:41
@@ -121,9 +121,9 @@
 	}
 }
 
-#define flush_icache_page(vma,page)
+#define flush_icache_page(vma,page)	do { flush_kernel_dcache_page(page_address(page)); flush_kernel_icache_page(page_address(page)); } while (0)
 
-#define flush_icache_range flush_kernel_icache_range_asm
+#define flush_icache_range(s,e)		do { flush_kernel_dcache_range_asm(s,e); flush_kernel_icache_range_asm(s,e); } while (0)
 
 /* TLB flushing routines.... */
 
Index: arch/parisc/kernel/pacache.S
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/pacache.S,v
retrieving revision 1.10
diff -u -r1.10 pacache.S
--- arch/parisc/kernel/pacache.S	2001/09/06 09:44:07	1.10
+++ arch/parisc/kernel/pacache.S	2002/05/28 23:52:42
@@ -747,6 +747,50 @@
 
 	.procend
 
+	.export flush_kernel_icache_page
+
+flush_kernel_icache_page:
+	.proc
+	.callinfo NO_CALLS
+	.entry
+
+	ldil    L%icache_stride,%r1
+	ldw     R%icache_stride(%r1),%r23
+
+#ifdef __LP64__
+	depdi,z 1,63-PAGE_SHIFT,1,%r25
+#else
+	depwi,z 1,31-PAGE_SHIFT,1,%r25
+#endif
+	add     %r26,%r25,%r25
+	sub     %r25,%r23,%r25
+
+
+1:      fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	fic,m   %r23(%r26)
+	CMPB<<  %r26,%r25,1b
+	fic,m   %r23(%r26)
+
+	sync
+	bv      %r0(%r2)
+	nop
+	.exit
+
+	.procend
+
 	.export flush_kernel_icache_range_asm
 
 flush_kernel_icache_range_asm:
