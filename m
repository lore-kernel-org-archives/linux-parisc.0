Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8EE2D4837
	for <parisc-linux@parisc-linux.org>; Thu, 27 Sep 2001 20:01:38 -0600 (MDT)
Received: from localhost (nick@localhost)
	by ns.snowman.net (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA17635
	for <parisc-linux@parisc-linux.org>; Thu, 27 Sep 2001 22:01:37 -0400
Date: Thu, 27 Sep 2001 22:01:37 -0400 (EDT)
From: <nick@snowman.net>
To: parisc-linux@parisc-linux.org
Subject: Re: Betr.: [parisc-linux] HP C180
Message-ID: <Pine.LNX.4.21.0109272158500.7708-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I Run into the exact same problem on a mounted ext2fs with 2xram as swap.
init-2.04# find . -name palo -print                                         
Out of Memory: Killed process 45 (find).                                    
..
Out of Memory: Killed process 45 (find).
SysRq: Emergency Sync                                                       
Syncing device 08:03 ... OK                                                 
Syncing device 08:11 ... OK
Syncing device 08:12 ... OK
Syncing device 08:04 ... OK
Done.
SysRq: Show Regs

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 102d6a28 1026bd0c 0000000c                                
r4-7     105f46e4 105f4794 00000008 00000001                                
r8-11    ffffffff 00000010 105f46db efa0b925                                
r12-15   102d6a28 00000000 00000000 00000000                                
r16-19   105f4258 00063800 10334000 1026d912                                
r20-23   00000000 1026d912 0000000e 00000000
r24-27   1026d911 1029275d 105f48f8 10294010
r28-31   105f46e4 00000000 105f4880 1026b648
sr0-3    00000000 00000000 00000000 0000007c
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1026b724 1026b728
 IIR: 0ea01014    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 105f4000 CR31: 10338000
 ORIG_R28: 105f49c0                                                         
Done.
SysRq: Emergency Remount R/O
Remounting device 08:03 ... OK
Remounting device 08:11 ... OK
Remounting device 08:12 ... OK
Remounting device 08:04 ... OK
Done.
SysRq: Show Memory
Mem-info:
Free pages:      115496kB (     0kB HighMem)
( Active: 63, inactive_dirty: 137, inactive_clean: 0, free: 28874 (255 510
765) )
0*4kB 1*8kB 0*16kB 1*32kB 54*64kB 57*128kB 35*256kB 25*512kB 11*1024kB
35*2048kB = 115496kB)
= 0kB)
= 0kB)
Swap cache: add 92308, delete 92271, find 75/305
Free swap:       248700kB
32768 pages of RAM
1223 reserved pages
13 pages shared
37 pages swap cached
Buffer memory:      176kB
SysRq: Resetting

Any suggestions?
	Thanks
		Nick
On Wed, 26 Sep 2001, Jurriaan Kalkman wrote:
> The 2.4.9 kernel really needs swap, or so I've read on the linux-kernel mailing list.
> You should add some swap. 2* [size of main memory] is a safe amount.
> It's considered a bug, but it needs swap even if there is free memory.....
> 
> Good luck,
> Jurriaan
> 
