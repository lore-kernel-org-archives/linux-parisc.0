From: Helge Deller <deller@gmx.de>
Subject: 2.6.26 kernel crash
Date: Sun, 20 Jul 2008 18:46:11 +0200
Message-ID: <200807201846.11809.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

While debugging some user-space stuff I just faced this 32bit kernel crash (2.6.26):
Maybe someone has an idea?

Kernel Fault: Code=15 regs=5f578640 (Addr=000127ec)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111110000001111 Not tainted
r00-03  0004fc0f 10644f10 1011ee68 5f578288
r04-07  00000014 8c1fe860 8c1fe828 8eb7d030
r08-11  105ee890 00000040 0001264a 000d3b60
r12-15  00000000 000d3b5c 000dde68 000b0000
r16-19  8eb7d250 000b0000 ffffffff 000127ec
r20-23  ffffe040 00000000 101205d4 00000000
r24-27  00012800 101205cc 5f578288 1062ff10
r28-31  00000000 000002ee 5f578640 10120630
sr00-03  00000000 000013a7 00000000 000013a7
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1011ed04 1011ed08
 IIR: 0e601093    ISR: 00000000  IOR: 000127ec
 CPU:        0   CR30: 5f578000 CR31: ffffffff
 ORIG_R28: 40400000
 IAOQ[0]: unwind_frame_regs+0x214/0x244
 IAOQ[1]: unwind_frame_regs+0x218/0x244
 RP(r2): unwind_once+0x10/0x48
Backtrace:
 [<1011ee68>] unwind_once+0x10/0x48
 [<10112bbc>] do_show_stack+0x28/0xac
 [<10112cd0>] parisc_show_stack+0x90/0xa8
 [<10111258>] do_page_fault+0x174/0x294
 [<10113824>] handle_interruption+0x570/0x58c
 [<10117078>] intr_check_sig+0x0/0x34

Kernel panic - not syncing: Kernel Fault
