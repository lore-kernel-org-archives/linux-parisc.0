Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43C44482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Aug 2002 07:18:49 -0600 (MDT)
Received: from carlos by systemhalted with local (Exim 3.35 #1 (Debian))
	id 17iEIl-0000sM-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Aug 2002 09:16:35 -0400
Date: Fri, 23 Aug 2002 09:16:35 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020823131634.GA3229@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
Subject: [parisc-linux] RFC - glibc - patch reivew - 64->32
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

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

pa,

I've been going through some of the glibc issues that we
have and trying to fix them... or put in a large enough shoe
-horn that the solution fits.

The following are two .dpatch's that I'd like to send to
gotom to get put in for -15 or -16 depending on how much
testing I get done.

The first .dpatch has to do with our jmpbuf implementation,
and the fact that division calculation is not always 
correct. I _think_ this is a solution, but since I'm away
this weekend, I challenge someone to put together a jmpbuf
test that tries to break this. I've been told that anything
using libst is prone to breakage on PA without some ugly
hacks (e.g. lurker).

The second .dpatch fixes our mcontext_t problem. I don't 
know what was going on with out rather wonky definition, but 
I'm probably sure it was just bitrot. I've specified that
a signal context _is_ just a machine context. Kernel and 
glibc are now in sync.

This brings up another issue! When passing the sigcontext
back from a 64-bit kernel, the kernel passes back 64-bit
values and the mcontext is rather useless to the signal
handler. This has _always_ been broken and has never worked
properly. I'm working on adding some rather ugly "#ifdef __LP64__"
code to arch/parisc/signal.c to have it translate the values
into a sigcontext32 that I have defined in sys32.h.
There are a few other examples in signal.c that already do
some rather ugly conversion :)

Suggested solutions:
- Widen sigcontext
- Add conversion code to signal handling path

I would rather do the later... since it doesn't change 
the way we do business across the board.

Ideas and input welcome and appreciated!

c.


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="glibc22-hppa-jmpbuf.dpatch"

#! /bin/sh -e

# DP: PA-RISC jmpbuf changes.

if [ $# -ne 2 ]; then
    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
    exit 1
fi
case "$1" in
    -patch) patch -d "$2" -f --no-backup-if-mismatch -p1 < $0;;
    -unpatch) patch -d "$2" -f --no-backup-if-mismatch -R -p1 < $0;;
    *)
        echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
        exit 1
esac
exit 0

diff -urN glibc-2.2.5/sysdeps/hppa/bits/setjmp.h glibc-2.2.5/sysdeps/hppa/bits/setjmp.h
--- glibc-2.2.5/sysdeps/hppa/bits/setjmp.h	2002-08-08 14:03:52.000000000 -0400
+++ glibc-2.2.5/sysdeps/hppa/bits/setjmp.h	2002-08-08 14:06:04.000000000 -0400
@@ -32,7 +32,7 @@
 #endif
 
 #ifndef	_ASM
-typedef double __jmp_buf[21];
+typedef int __jmp_buf[21] __attribute__ ((aligned (8)));
 #endif
 
 /* Test if longjmp to JMPBUF would unwind the frame containing a local

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="glibc22-hppa-mcontext.dpatch"

#! /bin/sh -e

# DP: Makes mcontext_t a typedef to sigcontext on hppa.

if [ $# -ne 2 ]; then
    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
    exit 1
fi
case "$1" in
    -patch) patch -d "$2" -f --no-backup-if-mismatch -p1 < $0;;
    -unpatch) patch -d "$2" -f --no-backup-if-mismatch -R -p1 < $0;;
    *)
	echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
	exit 1
esac
exit 0

# append the patch here and adjust the -p? flag in the patch calls.
--- glibc-2.2.5/sysdeps/unix/sysv/linux/hppa/sys/ucontext.h	2002-08-20 20:50:17.000000000 -0400
+++ glibc-2.2.5/sysdeps/unix/sysv/linux/hppa/sys/ucontext.h	2002-08-20 20:49:01.000000000 -0400
@@ -52,11 +52,7 @@
   } fpregset_t;
 
 /* Context to describe whole processor state.  */
-typedef struct
-  {
-    gregset_t gregs;
-    fpregset_t fpregs;
-  } mcontext_t;
+typedef struct sigcontext mcontext_t;
 
 /* Userlevel context.  */
 typedef struct ucontext


--tThc/1wpZn/ma/RB--
