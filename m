Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 821BC4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 17 Aug 2002 16:07:30 -0600 (MDT)
Date: Sat, 17 Aug 2002 18:05:45 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: csr21@cam.ac.uk
Message-ID: <20020817220545.GF16532@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="pWyiEgJYm5f9v55/"
Subject: [parisc-linux] subo -> overflow_trap (12) -> What to do?
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

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

pa,

Talking with Christophe Rhodes who is porting some Common Lisp code[1]
to parisc-linux and he has some old-ish code from HPUX (circa 1994)
that does some interesting things :)

The code does a 'subo' and it _does_ cause an overflow_trap (12) which is
currently unhandled in our traps.c ... this trickles into a SIGBUS, which
is questionable (as the comment notes).

In HPUX the code sets si_code to FPE_INTOVF as well as sending a SIGFPE
to the offending application. From there the handler does all the 'bignum'
cleanup and Lisp land is all happy.

So I've gone ahead and implemented this functionality into traps.c, but
I'm not sure if this is the right way to go. What do people think?
If any HPUX people would like to chime in? :)

Patch attached.

c.

[1] Package is 'sbcl'


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="kernel-parisc-trap.c.diff"

--- linux/arch/parisc/kernel/traps.c.orig       2002-08-17 17:37:26.000000000 -0400
+++ linux/arch/parisc/kernel/traps.c    2002-08-17 17:58:39.000000000 -0400
@@ -561,6 +561,14 @@
                force_sig_info(SIGILL, &si, current);
                return;

+       case 12:
+               /* Overflow Trap, let the userland signal handler do the cleanup */
+               si.si_signo = SIGFPE;
+               si.si_code = FPE_INTOVF;
+               si.si_addr = (void *) regs->iaoq[0];
+               force_sig_info(SIGFPE, &si, current);
+               return;
+
        case 14:
                /* Assist Exception Trap, i.e. floating point exception. */
                die_if_kernel("Floating point exception", regs, 0); /* quiet */


--pWyiEgJYm5f9v55/--
