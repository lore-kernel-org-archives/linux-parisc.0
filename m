From: Helge Deller <deller@gmx.de>
Subject: kernel segv with 2.6.31-rc6 ?
Date: Mon, 17 Aug 2009 23:31:57 +0200
Message-ID: <4A89CC4D.5040801@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

anyone else seeing this with 2.6.31-rc6 ?

<...system boots up...>
Waiting for /dev to be fully populated...
  
sysfs: cannot create duplicate filename '/module/ac97_bus/sections/.text'
------------[ cut here ]------------
Badness at fs/sysfs/dir.c:487
  
      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111 Not tainted
r00-03  0004000f 10669bd0 10204ff8 7ce58340
r04-07  7efcd000 ffffffef 7f881d74 7efcd000
r08-11  0008746c 00000000 7f1c6400 0008441c
r12-15  00000019 00084332 105a96c8 00000124
r16-19  0000fff1 00000017 00084abc ffffffff
r20-23  7eeff080 00000060 102f5898 10330dec
r24-27  ffffffff 0000000e 10669c04 10656670
r28-31  00000050 00000190 7ce583c0 10123988
sr00-03  00000000 00000000 00000000 00000008
sr04-07  00000000 00000000 00000000 00000000
  
IASQ: 00000000 00000000 IAOQ: 10204ff8 10204ffc
  IIR: 03ffe01f    ISR: 00000000  IOR: 00000000
  CPU:        0   CR30: 7ce58000 CR31: 11111111
  ORIG_R28: 00000001
  IAOQ[0]: sysfs_add_one+0xb8/0xd0
  IAOQ[1]: sysfs_add_one+0xbc/0xd0
  RP(r2): sysfs_add_one+0xb8/0xd0
Backtrace:
  [<102045b8>] sysfs_add_file_mode+0x60/0xc4
  [<1020748c>] internal_create_group+0xf0/0x1d8
  
Backtrace:
  [<1016f0f0>] load_module+0x10e8/0x1294
  

Kernel Fault: Code=26 regs=7ce58200 (Addr=00000030)
  
      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001111 Tainted: G        W
r00-03  0006000f 7ce58200 1016f0f0 7ce58140
r04-07  00084444 00000019 00087424 7eddb660
r08-11  00084000 00000001 7f1c66a4 0008441c
r12-15  00000019 00084332 105a96c8 00000124
r16-19  0000fff1 00000017 00084abc 00000000
r20-23  00000000 1016d3e0 7eddb668 00000124
r24-27  105a96cc 00000000 7eddb660 10656670
r28-31  00000000 00000001 7ce58200 00000000
sr00-03  00000000 00000000 00000000 00000008
sr04-07  00000000 00000000 00000000 00000000
  
IASQ: 00000000 00000000 IAOQ: 1016f130 1016f134
  IIR: 4b940060    ISR: 00000000  IOR: 00000030
  CPU:        0   CR30: 7ce58000 CR31: 11111111
  ORIG_R28: 00084332
  IAOQ[0]: load_module+0x1128/0x1294
  IAOQ[1]: load_module+0x112c/0x1294
  RP(r2): load_module+0x10e8/0x1294
Backtrace:
  [<1016f0f0>] load_module+0x10e8/0x1294
  
Kernel panic - not syncing: Kernel Fault
Backtrace:
  [<1011ac28>] show_stack+0x18/0x28
  [<1013f3a0>] vprintk+0x19c/0x430
  
