From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: [parisc-linux] Couple kernel problems
Date: Mon, 04 Dec 2006 15:37:42 -0700
Message-ID: <4574A336.3000007__20765.5687620447$1416624629$gmane$org@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=windows-1252
To: parisc-linux@parisc-linux.org
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

I've been having a few problems with kernels, and am wondering if these
are known issues.

1) XFS will not load as a module.  When I try I get:
 FATAL: Error inserting xfs
 (/lib/modules/2.6.18-3-parisc/kernel/fs/xfs/xfs.ko):
 Invalid module format

dmesg reveals:
 module xfs relocation of symbol $$divU is out of range (0x3ffefffd in
 17 bits)

This occurs with any kernel I can get from Debian testing and above, so
2.6.17 and 2.6.18.  I tried their images and compiled a 2.6.17 kernel of
my own from their source.  Could this be related to Debian patches?

2) I'm having problems compiling a 2.6.18 kernel (debian source again).
 Perhaps this issue is out-of-scope for this list, but it confuses me
and I wondered if anyone else here has run into it:
 CC      arch/parisc/kernel/asm-offsets.s
   In file included from include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:21,
                    from include/linux/preempt.h:9,
                    from include/linux/spinlock.h:49,
                    from include/linux/capability.h:45,
                    from include/linux/sched.h:44,
                    from arch/parisc/kernel/asm-offsets.c:31:
   include/asm/processor.h:347: error: redefinition of ‘prefetch’
   include/linux/prefetch.h:43: error: previous definition of ‘prefetch’
    was here
   include/asm/processor.h:352: error: redefinition of ‘prefetchw’
   include/linux/prefetch.h:47: error: previous definition of
    ‘prefetchw’ was here

As you can see, it's a simple issue, but what confuses me is that
someone must be compiling this source, since Debian supplies a binary
package in unstable of this kernel.  Could this somehow be related to my
installed tool tree?

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
