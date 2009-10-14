From: Helge Deller <deller@gmx.de>
Subject: poll(), illegal instruction and crash on smp kernel
Date: Wed, 14 Oct 2009 23:59:24 +0200
Message-ID: <4AD649BC.3080905@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc.ca>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In the meantime I've got access to a parisc SMP box (J5000),
and now I think I faced for the very first time the often-here-reported
SMP kernel bug.

While this happened, I was debugging konqueror (the KDE web browser) with
gdb and suddenly I faced this crash:

Program received signal SIGILL, Illegal instruction.
[Switching to Thread 0x8001 (LWP 22707)]
0x405e06fc in poll () from /lib/libc.so.6
(gdb) bt
#0  0x405e06fc in poll () from /lib/libc.so.6
#1  0x41bb45a0 in __pthread_manager () from /lib/libpthread.so.0
#2  0x41bb4e4c in __pthread_manager_event () from /lib/libpthread.so.0
#3  0x405eb340 in clone () from /lib/libc.so.6
#4  0x00000010 in ?? ()
#5  0x00000010 in ?? ()
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb)

dmesg shows:

[557116.676000] User Fault on Kernel Space pid=22910 command='konqueror'
[557116.676000]
[557116.676000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[557116.676000] PSW: 00000000000001000000000000001011 Tainted: G        W
[557116.676000] r00-03  0004000b 41bbf31c 405e06df 000007d0
[557116.676000] r04-07  4065f134 00000001 0070a480 00000000
[557116.676000] r08-11  008be600 0070a480 00000011 001ff000
[557116.676000] r12-15  c025d970 41bc14c8 00001000 44665000
[557116.676000] r16-19  008bdec0 00000010 0070a508 4065f134
[557116.676000] r20-23  000000a8 008bdec0 4054d3ec 00000000
[557116.676000] r24-27  000007d0 00000001 0070a480 00011b10
[557116.676000] r28-31  00000000 00000008 0070a6f8 0070a700
[557116.676000] sr00-03  00001283 00000000 00000000 00001283
[557116.676000] sr04-07  00001283 00001283 00001283 00001283
[557116.676000]
[557116.676000]       VZOUICununcqcqcqcqcqcrmunTDVZOUI
[557116.676000] FPSR: 00001100000101010100000000000000
[557116.676000] FPER1: 00000000
[557116.676000] fr00-03  0c15400000000000 0000000000000000 0000000000000000 0000000000000000
[557116.676000] fr04-07  0000000000000000 bff921fb54442eea 0000000000000000 0000000000000000
[557116.676000] fr08-11  bfbf4842a80ef044 0000000000000000 bfd520324ad3ef15 4004cccccccccccd
[557116.676000] fr12-15  4183225470000000 4183225470000000 0000000000000000 00000000ffffffff
[557116.676000] fr16-19  0000000000000000 103d16ec11667180 00000000fffff000 8f82f00000000000
[557116.676000] fr20-23  ffffff9c00000002 3b9aca0010452540 0000000000000098 3ff0000000000000
[557116.676000] fr24-27  3ff051eb851eb852 0000000000000000 0000000000000000 3a8a7a187f5c3568
[557116.676000] fr28-31  3d3d1b9676733ae9 3ff0000000000000 bfd8d24e1e7bd6d4 3b92e3b40a0e9b4f
[557116.676000]
[557116.676000] IASQ: 00001283 00001283 IAOQ: 0070a703 0070a707
[557116.676000]  IIR: 4051bcc8    ISR: 00000000  IOR: 405e2543
[557116.676000]  CPU:        1   CR30: 8fed4000 CR31: ffffffff
[557116.676000]  ORIG_R28: 00000000
[557116.676000]  IAOQ[0]: 0070a703
[557116.676000]  IAOQ[1]: 0070a707
[557116.676000]  RP(r2): 405e06df

Does this sound familiar to anybody here?
Does this backtrace help?

The installed kernel is Debian's 2.6.30-2-parisc-smp kernel.

Btw, the glibc is the standard (linuxthreads-based) Debian glibc 2.9-27.
I haven't yet installed Carlos' NPTL-enabled glibc on this machine yet.

Helge
