From: John David Anglin <dave.anglin@bell.net>
Subject: sigaltstack doesn't round ss.ss_sp as required
Date: Sat, 24 Nov 2012 10:05:04 -0500
Message-ID: <BLU0-SMTP216C0F402CA26A39A5EEB197590@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In trying to build the debian libsigsegv2 package, I found that  
sigaltstack
doesn't round ss.ss_sp.  The tests intentionally pass an unaligned  
pointer.
This results in the two stack overflow tests failing.

According to the Linux manual page:

"When a signal handler is invoked on the alternate stack, the kernel
automatically aligns the address given in ss.ss_sp to a suitable address
boundary for the underlying hardware architecture."

The stack address for the signal handler needs to be adjusted to provide
for frame marker and stack argument slots.

Dave
--
John David Anglin	dave.anglin@bell.net



