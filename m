Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF04A4841
	for <parisc-linux@parisc-linux.org>; Sat,  8 Nov 2003 15:14:19 -0700 (MST)
Date: Sat, 8 Nov 2003 17:09:23 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org, Matthew Wilcox <willy@debian.org>
Message-ID: <20031108220923.GK21080@systemhalted>
References: <3F969FFE00005DB3@ocpmta2.freegates.net> <3FACE5A4.7070003@tiscali.be> <20031108155247.GC21080@systemhalted> <3FAD5C01.7040302@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FAD5C01.7040302@tiscali.be>
Subject: [parisc-linux] fork failed? protection id trap. All suspect.
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

On Sat, Nov 08, 2003 at 09:11:29PM +0000, Joel Soete wrote:
> all start fine until I point a mail to preview it in the preview's window.
> Then a child process failled, so Ctrl-C in gdb and bt:
> #0  0x4172005c in __pthread_sigsuspend () from /lib/libpthread.so.0
...
> #29 0x0009deb8 in main ()
> #30 0x41a1146c in __libc_start_main () from /lib/libc.so.6
> #31 0x00022e10 in _start ()
> ----------><----------

This is a trace from another thread. You need to attach to the thread
that is going to die and try to get a backtrace. This thread was happy
:) until you interrupted it's sleeping.

> At the console, I could always capture:
> 
> request_module[net-pf-10]: fork failed, errno 1
> evolution (pid 879): Protection id trap (code 27)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001111 Not tainted
> r00-03  00000000 103b7524 1015352c 00282b28
> r04-07  00000000 00000000 00000001 11f27da0
> r08-11  00000000 00000001 13084548 fffffff2
> r12-15  419ee608 419ee718 419345a8 419345a8
> r16-19  419ee608 419345a8 00000070 1371d000
> r20-23  00000000 00000002 00282b2e 00000000
> r24-27  11f27da0 00000000 10d0b520 10304010
> r28-31  00000000 10314a60 130845c0 101532c8
> sr0-3   00000000 00000000 00000000 00000003
> sr4-7   00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 10153658 1015365c
>  IIR: 0ed4d240    ISR: 00000003  IOR: 00282b2e
>  CPU:        0   CR30: 13084000 CR31: 103a8000
>  ORIG_R28: 419345a8
> 
> ----------><----------

I've never seen this perhaps some kernelish people would like to comment
on this?

 
> while I can still see processes:
> root       879   869  0 17:16 pts/2    00:00:00 [evolution] <defunct>

Try to find the thread that is going to die and attach to it.

c.
