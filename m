Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 977D94DA1
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Apr 2004 16:32:16 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3MMWFa14581 for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Apr 2004 18:32:15 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 22 Apr 2004 18:32:15 -0400
Message-Id: <1082673135.1714.118.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I've traced this to an apparent linker fault.  It seems to be being
caused by having the scheduling function in its own section.

The offending code is in entry.S; this is what the code actually says:

syscall_do_resched:
        bl      schedule,%r2
#ifdef __LP64__
        ldo     -16(%r30),%r29          /* Reference param save area */
#else
        nop
#endif
        b       syscall_check_bh  /* if resched, we start over again */
        nop

And this is what it assembles to in the final vmlinux:

000000001010d05c <syscall_do_resched>:
    1010d05c:   e8 54 12 ac     b,l 101369b8 <dbl_to_sgl_fcnvxf+0xd0>,rp
    1010d060:   37 dd 3f e1     ldo -10(sp),ret1
    1010d064:   e8 1f 1b ed     b,l 1010ce60 <syscall_check_bh>,r0
    1010d068:   08 00 02 40     nop

Apparently ld has simply loaded an out of range value for the branch.  I
can't see that this is a global fault, otherwise calling init functions
wouldn't work either, but it does.

I've hacked a temporary work around in vmlinux.lds.S (simply make all of
the required functions close enough to entry.S that they don't need
stubs), but I'd really like some input from the toolchain people about
what the real problem actually is.

James

Index: arch/parisc/kernel/vmlinux.lds.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/vmlinux.lds.S,v
retrieving revision 1.10
diff -u -r1.10 vmlinux.lds.S
--- a/arch/parisc/kernel/vmlinux.lds.S	15 Apr 2004 18:04:14 -0000	1.10
+++ b/arch/parisc/kernel/vmlinux.lds.S	22 Apr 2004 22:30:16 -0000
@@ -49,8 +49,13 @@
 
   _text = .;			/* Text and read-only data */
   .text ALIGN(16) : {
-	*(.text*)
+	*(.text)
 	SCHED_TEXT
+	*(.text.do_softirq)
+	*(.text.sys_exit)
+	*(.text.do_sigaltstack)
+	*(.text.do_fork)
+	*(.text.*)
 	*(.PARISC.unwind)
 	*(.fixup)
 	*(.lock.text)		/* out-of-line lock text */
