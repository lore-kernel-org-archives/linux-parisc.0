From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
Date: Thu, 25 Jan 2018 09:59:03 +0100
Message-ID: <11946948.1Lt8Nslq4k@devpool21>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The last message I had for the crash below is:

Running /var/tmp/portage/sys-devel/gdb-7.12.1/work/gdb-7.12.1/gdb/testsuite/gdb.base/bp-permanent.exp ...

[  909.754182] Backtrace:
[  909.756303] 
[  909.756303] 
[  909.756303] Bad Address (null pointer deref?): Code=6 (Instruction TLB miss fault) regs=000000007c818a50 (Addr=0000000000000000)
[  909.756303] CPU: 0 PID: 5191 Comm: bp-permanent Not tainted 4.13.8 #2
[  909.756303] task: 000000007c8183d0 task.stack: 000000007aad8000
[  909.756303] 
[  909.756303]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[  909.756303] PSW: 00000000000001000000011100001111 Not tainted
[  909.756303] r00-03  000000000004070f 00000000f8f07840 00000000000106bb 00000000f8f07880
[  909.756303] r04-07  00000000f815bc70 00000000000e87a0 0000000000000000 00000000000e8818
[  909.756303] r08-11  0000000000000000 0000000000000000 000000000000006c 0000000000000000
[  909.756303] r12-15  0000000000000000 0000000000000000 0000000000080a74 00000000000e83f8
[  909.756303] r16-19  00000000000c85c8 00000000000cbad8 00000000000c99e8 00000000f815bc70
[  909.756303] r20-23  00000000000120bc 0000000000000004 ffffffffffffe520 0000000000012022
[  909.756303] r24-27  00000000000120bc 00000000000105d8 00000000000120b8 0000000000012000
[  909.756303] r28-31  00000000000120b8 0000000000000001 00000000f8f078c0 00000000f8bffa9f
[  909.756303] sr00-03  00000000010a1800 00000000010a1800 0000000000000000 00000000010a1800
[  909.756303] sr04-07  00000000010a1800 00000000010a1800 00000000010a1800 00000000010a1800
[  909.756303] 
[  909.756303] IASQ: 00000000010a1800 00000000010a1800 IAOQ: 0000000000000000 0000000000000004
[  909.756303]  IIR: 43ffff80    ISR: 0000000010240000  IOR: 000000a43fb07880
[  909.756303]  CPU:        0   CR30: 000000007aad8000 CR31: ffffffffffffffff
[  909.756303]  ORIG_R28: 0000000000000000
[  909.756303]  IAOQ[0]:           (null)
[  909.756303]  IAOQ[1]: 0x4
[  909.756303]  RP(r2): 0x106bb
[  909.756303] Backtrace:
[  909.756303] 
[  909.756303] Kernel panic - not syncing: Bad Address (null pointer deref?)
[  909.756303] ---[ end Kernel panic - not syncing: Bad Address (null pointer deref?)

This is actually the second place where it breaks, before that I had the same 
with this test (twice):

Running /var/tmp/portage/sys-devel/gdb-7.12.1/work/gdb-7.12.1/gdb/testsuite/gdb.base/async.exp ...

It's a Gentoo system, the kernel has been built with gcc 6.4.0.


