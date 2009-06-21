From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Segfault in __c_f_f_c during strace of nptl application.
Date: Sun, 21 Jun 2009 02:27:17 -0400
Message-ID: <119aab440906202327x7093bd81q93f3914fcf6c2c70@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dave,

I saw strace segfault in __canonicalize_funcptr_for_compare while
trying to trace an nptl enabled hppa application.

Program received signal SIGSEGV, Segmentation fault.
0x0002b3bc in __canonicalize_funcptr_for_compare ()
Current language:  auto; currently asm
(gdb) bt
#0  0x0002b3bc in __canonicalize_funcptr_for_compare ()
#1  0x00025fec in sys_rt_sigaction (tcp=0x4e070) at signal.c:1886
#2  0x00017aec in trace_syscall (tcp=0x4e070) at syscall.c:2549
#3  0x00016c98 in main (argc=<value optimized out>, argv=0xc032f01c)
at strace.c:2475
(gdb)

It's 100% reproducible. What should I try to debug this?

Cheers,
Carlos.
