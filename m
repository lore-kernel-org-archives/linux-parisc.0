From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Incorrect execve_wrapper macro?
Date: Tue, 23 Mar 2010 18:03:29 -0400
Message-ID: <119aab441003231503v345dfacar374e2c06b88769ac@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle,

The execve_wrapper macro loads thread->task like this:
LDREG   TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1

This assumes that at the point the macro is called that there is only
THREAD_SZ_ALGN+FRAME_SIZE between %r30 and the starting value of %r30
(cr30).

However, in the syscall entry path I see (syscall.S):
ldo     THREAD_SZ_ALGN+FRAME_SIZE(%r30),%r30  /* set up kernel stack */
...
STREGM  %r1,FRAME_SIZE(%r30)            /* save r1 (usp) here for now */

Which means that between %r30 and the start there is actually
THREAD_SZ_ALGN+2*FRAME_SIZE.

I believe that these should match, so that when we return we can
restore some of the things we saved.
e.g. execve_wrapper should read:
LDREG   TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE-FRAME_SIZE(%r30),%r1

or heaven forbid the easier to read:

mfctl   %cr30,%r1                       /* get task ptr in %r1 */
LDREG   TI_TASK(%r1),%r1

Comments?

Cheers,
Carlos.
