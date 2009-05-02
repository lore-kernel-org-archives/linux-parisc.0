From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Kernel Panic during init with 2.6.29-gb609308 (fresh clone of git
	master)
Date: Sat, 2 May 2009 21:04:32 +0200
Message-ID: <7d01f9f00905021204n5582bcfbm93cf449744742c66@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fresh clone of kyle's parisc-2.6 master branch from kernel.org.

Not much to say, it went AWOL during init while starting snmpd...

I dunno if that's worth debugging tho, seems like everybody is using
2.6.30 already (I must have misunderstood how to use git again :P)

HTH

Linux version 2.6.29-gb609308 (varenet@mkhppa3) (gcc version 4.2.4
(Debian 4.2.4-6)) #1 SMP Sat May 2 20:39:12 CEST 2009



Starting Name Service Cache Daemon: nscd.
Starting internet superserver: inetd.
Starting network management services:Backtrace:


Kernel Fault: Code=15 regs=000000012eb44a50 (Addr=000000002e924ca0)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  000000ff0804ff0f 0000000040708120 000000006fc00000 000000012eb44838
r04-07  00000000ffffe000 0000000000000010 000000006bc23fd9 0000000000000014
r08-11  00000000000001a0 0000000073c00008 0000000000000010 000000004064f478
r12-15  0000000000000000 0000000000000000 0000000000000000 0000000000000001
r16-19  000000012f8ba100 0000000000000000 00000000fb5fd5d4 0000000040126388
r20-23  ffffffffffffff30 00000000401203c0 00000000ffffff30 0000000000000000
r24-27  00000000405a9364 0000000037de0000 0000000040120993 00000000406fa120
r28-31  000000002e924ca0 00000000401202d0 000000012eb44a50 000000002e924cb0
sr00-03  0000000000259800 0000000000000000 0000000000000000 0000000000259800
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004012fe4c 000000004012fe50

Press Q/q to quit, Enter to continue:

 IIR: 0f8010df    ISR: 0000000000000000  IOR: 000000002e924ca0
 CPU:        0   CR30: 000000012eb44000 CR31: 000000004065c000
 ORIG_R28: 000000004019df7c
 IAOQ[0]: unwind_once+0x354/0x490
 IAOQ[1]: unwind_once+0x358/0x490
 RP(r2): 0x6fc00000
Backtrace:

Kernel panic - not syncing: Kernel Fault
Backtrace:



-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
