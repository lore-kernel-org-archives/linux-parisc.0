From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: 3.4.1 fails to boot on Apollo 705 in paging_init
Date: Wed, 6 Jun 2012 14:55:40 +0200
Message-ID: <e69c1188b0a31ea587fa1faaeb72c712.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Linux version 3.4.1 (root@voyager) (gcc version 4.5.3 (Gentoo 4.5.3-r2
p1.5, pie-0.4.7) ) #1 Wed Jun 6 14:15:43 CEST 2012
unwind_init: start = 0x1044e000, end = 0x1047faf0, entries = 12719
FP[0] enabled: Rev 3 Model 0
The 32-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: Snake.
model 00003020 00000481 00000000 00000000 77aac223 ffffffff 00000004
0000000d 00000000
vers  00000003
model 9000/705
Total Memory: 64 MB
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
swapper (pid 0): Protection id trap (code 7)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001110 Not tainted
r00-03  0004000e 0004000e 1050104c 00000000
r04-07  00000001 104841cc 1048e000 104917b8
r08-11  104917d4 1048e024 00000000 00100000
r12-15  00004000 00000000 00537fff 104b58c8
r16-19  104ec800 00004000 1048e000 0000000e
r20-23  00000000 00000000 00000000 00000000
r24-27  00000001 00000000 00000000 1048e000
r28-31  00000000 00000000 10484280 00000000
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1010077c 10100780
 IIR: e840c000    ISR: 00000000  IOR: 1050104c
 CPU:        0   CR30: 10484000 CR31: 000000e0
 ORIG_R28: 00000000
 IAOQ[0]: .L21+0x0/0x8
 IAOQ[1]: .L21+0x4/0x8
 RP(r2): paging_init+0x788/0x824
Backtrace:
 [<1050104c>] paging_init+0x788/0x824
 [<10501688>] setup_arch+0x5c/0x88
 [<104fd8d0>] start_kernel+0x80/0x370
 [<1010f218>] start_parisc+0x4c/0x68

Backtrace:
 [<1010f940>] die_if_kernel+0x138/0x1b0
 [<10110094>] handle_interruption+0x46c/0x614
 [<10104078>] intr_check_sig+0x0/0x34
 [<10100780>] .L21+0x4/0x8

---[ end trace 139ce121c98e96c9 ]---
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
swapper (pid 0): Protection id trap (code 7)
die_if_kernel() recursion detected.

