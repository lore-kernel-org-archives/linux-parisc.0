From: Helge Deller <deller@gmx.de>
Subject: 2.6.28-rcX in pretty bad shape on parisc
Date: Tue, 18 Nov 2008 21:04:32 +0100
Message-ID: <49231FD0.9040409@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello PA hackers,

I've tried various -rc candidates in the last few weeks, and sadly the 
parisc kernel is in pretty bad shape.

At the beginning I started to get problems only when I had USB 
keyboard/mouse attached to the PA machine. This lead to bugzilla 
http://bugzilla.kernel.org/show_bug.cgi?id=11913

Now, with -rc4 and -rc5 things got even worse.

Crashes happen often just directly at the beginning.
I'm sure it's not USB related any more, and I assume we have some 
strange mm-problem somewhere.
The kernel crashes at various places, and mostly a null-pointer is involved.

Right now I'm clueless...

Helge

PS: I'm happy that I just recently bought this one: 
http://www.gembird.cn/main.asp?mode=item&N=5915
------------

Here ist just one of the latest crashes (c3k, UP, CONFIG_SMP not set, 
2.6.28-rc5):
.....
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
PDC Stable Storage facility v0.30
Backtrace:
  [<1018b6a4>] __kmalloc+0xa4/0xec
  [<101718f4>] kstrdup+0x38/0x6c
  [<101d9090>] sysfs_new_dirent+0x54/0xf4
  [<101da0dc>] sysfs_do_create_link+0xcc/0x19c
  [<106cd644>] pdc_stable_init+0x1cc/0x2b4
  [<1010d998>] do_one_initcall+0x70/0x190
  [<106b9cf8>] do_initcalls+0x30/0x4c
  [<106b9df8>] kernel_init+0x64/0xac
  [<10113c5c>] ret_from_kernel_thread+0x1c/0x24


Kernel Fault: Code=26 regs=8f820500 (Addr=00000000)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111000001110 Not tainted
r00-03  0004fe0e 00000000 1018b18c 8ed92000
r04-07  8f8068ec 8f8020c0 8f806800 ffffffff
r08-11  8f800180 8f8020e4 000000d0 1066aa60
r12-15  00000000 ffffffff 00000000 f0400004
r16-19  f0000884 f000017c f0000174 00000000
r20-23  00000000 00000000 8ed9201c 00000001
r24-27  00000000 00000000 00002000 10607260
r28-31  00000000 00000000 8f820500 1018ae38
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1018b1b0 1018b1b4
  IIR: 0e931280    ISR: 00000000  IOR: 00000000
  CPU:        0   CR30: 8f820000 CR31: ffffffff
  ORIG_R28: 8f80f888
  IAOQ[0]: cache_alloc_refill+0x10c/0x208
  IAOQ[1]: cache_alloc_refill+0x110/0x208
  RP(r2): cache_alloc_refill+0xe8/0x208
Backtrace:
  [<1018b6a4>] __kmalloc+0xa4/0xec
  [<101718f4>] kstrdup+0x38/0x6c
  [<101d9090>] sysfs_new_dirent+0x54/0xf4
  [<101da0dc>] sysfs_do_create_link+0xcc/0x19c
  [<106cd644>] pdc_stable_init+0x1cc/0x2b4
  [<1010d998>] do_one_initcall+0x70/0x190
  [<106b9cf8>] do_initcalls+0x30/0x4c
  [<106b9df8>] kernel_init+0x64/0xac
  [<10113c5c>] ret_from_kernel_thread+0x1c/0x24

Kernel panic - not syncing: Kernel Fault
