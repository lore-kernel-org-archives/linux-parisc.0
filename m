Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from plum.csi.cam.ac.uk (plum.csi.cam.ac.uk [131.111.8.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 470F04829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Aug 2002 05:49:43 -0600 (MDT)
Date: Tue, 20 Aug 2002 12:49:35 +0100
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20020820114935.GA27316@cam.ac.uk>
References: <20020817220545.GF16532@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="EeQfGwPcQSOJBaQU"
In-Reply-To: <20020817220545.GF16532@systemhalted>
From: Christophe Rhodes <csr21@cam.ac.uk>
Subject: [parisc-linux] mcontext registers on parisc64 (was Re: subo -> overflow_trap (12) -> What to do?)
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

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 17, 2002 at 06:05:45PM -0400, Carlos O'Donell wrote:
> Talking with Christophe Rhodes who is porting some Common Lisp code[1]
> to parisc-linux and he has some old-ish code from HPUX (circa 1994)
> that does some interesting things :)

Firstly, thanks to this, my code seems to work on a parisc-1.1 machine
that I have available.  However, I'm having trouble getting it to run on
a parisc64 kernel...

As you may have gathered, the Common Lisp compiler in question depends
quite heavily on signal handling, and in particular SA_SIGINFO
sigaction-style handling. This seems to work fine in 32-bit mode, but
not in 64-bits; in particular, there seem to be some 32/64-bit
confusions going on...

I've attached a test program to (try to) demonstrate the problem; it's
complicated a bit by Debian bug #157374 (basically, incompatibility
between <sys/ucontext.h> and what the kernel actually delivers) but I
hope that what it's doing is clear enough... if I'm doing something
wrong, please let me know.

Inspecting the sigcontext that I get on a parisc64 machine gives
register contents looking a bit like
    [...]
    0xffffffff, 0xdeadbeef, 0x0, 0xf00d, 0x0, 0xfaf00380, 0x0, 0x2097a, 0x0, 
    0xfaf001a4, 0x0, 0x2096a, 0x0, 0x1, 0x0, 0x20972, 0x0, 0x1, 0x0, 0x0, 0x0, 
    [...]

and the alternation of data, 0/-1 is what leads me to believe that
64-bit quantities are being delivered; userland only seems to know about
32-bits, though.

Please don't hesitate to get back to me with comments and/or criticisms,

Cheers,

Christophe
-- 
Jesus College, Cambridge, CB5 8BL                           +44 1223 510 299
http://www-jcsu.jesus.cam.ac.uk/~csr21/                  (defun pling-dollar 
(str schar arg) (first (last +))) (make-dispatch-macro-character #\! t)
(set-dispatch-macro-character #\! #\$ #'pling-dollar)

--EeQfGwPcQSOJBaQU
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="test.c"

#include <stdio.h>
#include <sys/ucontext.h>
#include <signal.h>
/* c.f. Debian Bug#157374 */
#include <asm/sigcontext.h>

void sigsegv_handler(int signal, siginfo_t *info, void *context) {
  fprintf(stderr, "si_addr: %p (should probably be 0x0 [aka \"(nil)\"]\n",info->si_addr);
  fprintf(stderr, "%r1    : 0x%08x (should probably be 0xdeadbeef)\n",
	  ((struct sigcontext *) &(((ucontext_t *) context)->uc_mcontext))->sc_gr[1]);
  exit(0);
}

int main () {
  int *foo;
  struct sigaction sa;
  
  sa.sa_sigaction = sigsegv_handler;
  sa.sa_flags = SA_SIGINFO | SA_RESTART;
  sigaction(SIGSEGV, &sa, NULL);
  
  asm("ldil L%0xdeadbeef,%r1");
  asm("ldo R%0xdeadbeef(%r1),%r1");
  foo = NULL;
  *foo = 3;
}

--EeQfGwPcQSOJBaQU--
