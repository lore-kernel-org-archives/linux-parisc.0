From: Berthold Gunreben <b.gunreben@web.de>
Subject: gcc 4.3 and kernel compiling
Date: Wed, 16 Apr 2008 22:22:30 +0200
Message-ID: <200804162222.30737.b.gunreben@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

I compiled a kernel with gcc 4.3.1, but that kernel failed to boot the system. 
I got the following message on the serial console:

unwind_init: start = 0x103b1e90, end = 0x103d64f0, entries = 9318^M
Backtrace:^M
 [<10479e7c>] init+0x20/0x104^M
 [<104710f4>] kernel_init+0x210/0x3f4^M
^M
^M
Kernel Fault: Code=26 regs=efc401c0 (Addr=00000000)^M
^M
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI^M
PSW: 00000000000001000000000100001111 Not tainted^M
r00-03  0004010f 1015e000 10479e7c 00000000^M
r04-07  1048af48 00000000 103d76ec 104887f0^M
r08-11  00000000 00000000 103d7630 0000001f^M
r12-15  efc40088 1048b084 10376f78 10376f60^M
r16-19  3b9aca00 10376f48 10376f24 efc40000^M
r20-23  00000001 00000020 10479e5c 00000001^M
r24-27  00000000 00000000 00000000 103da010^M
r28-31  00000000 1034b490 efc401c0 104710f4^M
sr00-03  00000000 00000000 00000000 00000000^M
sr04-07  00000000 00000000 00000000 00000000^M
^M
IASQ: 00000000 00000000 IAOQ: 1015e46c 1015e470^M
 IIR: 0f401089    ISR: 00000000  IOR: 00000000^M
 CPU:        0   CR30: efc40000 CR31: 11111111^M
 ORIG_R28: 0000000d^M
 IAOQ[0]: cmpxchg_futex_value_locked+0x28/0x7c^M
 IAOQ[1]: cmpxchg_futex_value_locked+0x2c/0x7c^M
 RP(r2): init+0x20/0x104^M
Backtrace:^M
^M
Kernel panic - not syncing: Kernel Fault^M

Is there a  known issue maybe with barrier() that I should be aware of?

Thanks

Berthold
