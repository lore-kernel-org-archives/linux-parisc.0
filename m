Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id B7507482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Apr 2001 17:15:44 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id F35A1B007; Sat,  7 Apr 2001 00:15:00 +0100 (BST)
Date: Sat, 7 Apr 2001 00:15:00 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: randolph@tausq.org, lamont@hp.com,
	debian-buildd@list.parisc-linux.org,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20010407001500.Z9198@linuxcare.com>
References: <20010406210401.7685C37CDB@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010406210401.7685C37CDB@carmen.fc.hp.com>; from taggart@carmen.fc.hp.com on Fri, Apr 06, 2001 at 03:04:01PM -0600
Subject: [parisc-linux] rpc.lockd hangs  (was Re: portmap deb)
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Apr 06, 2001 at 03:04:01PM -0600, Matt Taggart wrote:
> nfs-common is currently having problems with rpc.lockd, Richard is looking in 
> to it.

Ugh.  nfs-common tries to invoke nfsservctl() and quotactl() via calls
to syscall() in glibc, such as:

    return syscall(SYS_quotactl, cmd, special, id, addr);

For most architectures, glibc as an asm implementation of syscall(),
and our would be in

glibc/sysdeps/unix/sysv/linux/hppa/syscall.S

except that it is just a cpu loop at the moment - hence rpc.lockd
hangs eating cpu.

I guess a one time glibc didn't provide nfsservctl() and quotactl()
wrappers, so syscall() was used.

Options (somone who knows the area better than me can correct
these):

a) Implement syscall() in glibc - I made an initial stab at that,
included below, but I didn't get as far as building it.  Not sure
if my approach was valid for hppa, with some args on stack, etc.

b) change nfs-common to use the proper glibc wrappers for these
functions, rather than syscall().

c) change nfs-common to use INLINE_SYSCALL or something..


I tried a quick hack at (b) and rebuilt.  I didn't get as far as trying
the new binaries yet, because I was doing this on a 64 bit machine, and...
both nfsservctl and quotactl are unimplemented on 64 bit :(

So, we need to implement wrappers for those, and fix either glibc or
nfs-common.

Richard


==================== quick'n'dirty patch to nfs-common =====================

diff -ur nfs-utils.ori/support/nfs/nfsctl.c nfs-utils/support/nfs/nfsctl.c
--- nfs-utils.ori/support/nfs/nfsctl.c	Mon Oct 18 17:21:12 1999
+++ nfs-utils/support/nfs/nfsctl.c	Fri Apr  6 16:02:28 2001
@@ -20,5 +20,9 @@
 int
 nfsctl (int cmd, struct nfsctl_arg * argp, union nfsctl_res * resp)
 {
+#ifdef __hppa__
+  return nfsservctl(cmd, argp, resp);
+#else
   return syscall (__NR_nfsctl, cmd, argp, resp);
+#endif
 }
diff -ur nfs-utils.ori/utils/rquotad/quotactl.c nfs-utils/utils/rquotad/quotactl.c
--- nfs-utils.ori/utils/rquotad/quotactl.c	Mon Oct 18 17:21:12 1999
+++ nfs-utils/utils/rquotad/quotactl.c	Fri Apr  6 15:58:19 2001
@@ -24,7 +24,9 @@
 #include <unistd.h>
 #include <sys/syscall.h>
 
+#ifndef __hppa__
 int quotactl(int cmd, const char * special, int id, caddr_t addr)
 {
 	return syscall(SYS_quotactl, cmd, special, id, addr);
 }
+#endif

============================================================================


===================== initial attempt at syscall for glibc =================

ENTRY(syscall)
        copy %r26,%r20
        copy %r25,%r26
        copy %r24,%r25
        copy %r23,%r24
        ldw -52(%r30),%r23
#if 0
        /* Hmm, can we be sure there is space for two args on the stack,
         * when the syscall() was called with fewer args?  How many args
	 * must we allow for?
         */
        ldw -56(%r30),%r22
        stw %r22,-52(%r30)
#endif
        ble  0x100(%sr2,%r0)
        nop
        ldi -0x1000,%r1
        cmpb,>>=,n %r1,%ret0,0f
        stw %rp, -20(%sr0,%r30)
        stw %ret0, -24(%sr0,%r30)
        .import __errno_location,code
        bl __errno_location,%rp
        ldo 64(%r30), %r30
        ldo -64(%r30), %r30
        ldw -24(%r30), %r26
        sub %r0, %r26, %r26
        stw %r26, 0(%sr0,%ret0)
        ldo -1(%r0), %ret0
        ldw -20(%r30), %rp
0:
	ret,n

============================================================================
