From: Meelis Roos <mroos@linux.ee>
Subject: Re: parisc crash on boot with 4.8+git
Date: Mon, 10 Oct 2016 09:04:44 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1610100857110.32571@math.ut.ee>
References: <alpine.LRH.2.20.1610090042580.12761@math.ut.ee> <57F96010.1040309@gmx.de> <alpine.LRH.2.20.1610091032210.12761@math.ut.ee> <57FA089F.1020301@gmx.de> <alpine.LRH.2.20.1610092356270.32571@math.ut.ee> <57FAA079.5010502@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57FAA079.5010502@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >>>> Even if you fix the kernel with the patches above, you still may run
> >>>> into the palo bug. I've just pushed a fix for it into the palo tree:
> >>>> https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/commit/?id=70bd7a9a41e318c0575755a78c4d18ad97495c47
> >>>>
> >>>> If you rebuild palo, please make sure to install the new ipl boot loader into
> >>>> the palo partition of your boot disc. palo should report at bootup version 1.96.
> >>
> >> Same here. Please pull latest version, and install it:
> >> https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/
> > 
> > palo ipl 1.96 http://www.parisc-linux.org - Sun, 08 Oct 2016 22:40:31 +0100
> > 
> > Just palo with newst upstream kernel git did not change anything, so 
> > it's not palo.
> > 
> > 
> > Pulled 
> > git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git 
> > but it seems to be alreay up to date - these commits are in my tested 
> > upstream that broke the booting?
> 
> Really? I just updated it a few hours ago. Please pull the "for-next" branch.
> 
> Can you send the last line of your "System.map" file, e.g.
> 0000000041f00000 B _end
> 
> What is the output of palo when booting ?

Sorry, I pulled from the default branch before, now for-next and it did 
pull stuff.

System.map ends with

0000000040900000 B _end



HARD Booted.
palo ipl 1.96 http://www.parisc-linux.org - Sun, 08 Oct 2016 22:40:31 +0100

Partition Start(MB) End(MB) Id Type
1               1      32   f0 Palo
2              33     224   83 ext2
3             225   31696   83 ext2
4           31697   34715   82 swap

PALO(F0) partition contains:

Command line for kernel: 'root=/dev/sdb3 console=ttyS1 
palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 135536 mediaptr 0x1000
Segment 1 load 00122000 size 23320 mediaptr 0x23000
Segment 2 load 00200000 size 4541488 mediaptr 0x29000
Segment 3 load 00655000 size 1393916 mediaptr 0x47e000
Segment 4 load 00800000 size 1045640 mediaptr 0x5d3000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 4.8.0-11292-gf79b076 (mroos@rp3410) (gcc version 5.4.0 (Gentoo 5.4.0 p1.0) ) #82 Mon Oct 10 01:25:58 EEST 2016
unwind_init: start = 0x40770e1c, end = 0x407a94fc, entries = 14446
FP[0] enabled: Rev 1 Model 20
The 64-bit Kernel has started...
Kernel default page size is 4 KB. Huge pages enabled with 1 MB physical and 2 MB virtual size.
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00008860 00000491 00000000 00000002 3e45475d0860fe3d 100000f0 00000008 000000b2 000000b2
vers  00000302
CPUID vers 20 rev 5 (0x00000285)
capabilities 0x35
model 9000/800/rp3410  
parisc_cache_init: Only equivalent aliasing supported!
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
 1) Start 0x0000004040000000 End 0x000000407fdfffff Size   1022 MB
Total Memory: 2046 MB
Backtrace:
 [<0000000040102d40>] paging_init+0x5e0/0x740
 [<0000000040103744>] setup_arch+0x16c/0x1b0
 [<0000000040100ce0>] start_kernel+0xb8/0x668


Bad Address (null pointer deref?): Code=15 regs=00000000408004c0 (Addr=0000006cbe693000)
CPU: 0 PID: 0 Comm: swapper Not tainted 4.8.0-11292-gf79b076 #82
task: 000000004087ba20 task.stack: 0000000040800000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Not tainted
r00-03  000000ff0804ff0e 0000000000900000 00000000401024c4 00000000408003b0
r04-07  00000000406b45c0 0000000040ae0000 0000004040000000 000000004088b104
r08-11  0000000040800490 000000407fe00000 0000004040000000 0000000000200000
r12-15  00000000406d85c0 0000000040122928 0000000040000000 0000000000000323
r16-19  0000004080000000 0000000000000400 0000000000000000 0000006cbe693000
r20-23  0000000000001000 00000000009e2000 0000000000000001 0000000000000001
r24-27  000000006c7e693e 00000000408eec90 0000004080000000 00000000406b45c0
r28-31  0000004040000323 0000000040800510 00000000408004c0 0000006cbe693000
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004010251c 0000000040102520
 IIR: 0ffc12c0    ISR: 0000000000000000  IOR: 0000006cbe693000
 CPU:        0   CR30: 0000000040800000 CR31: fffffff0f0e05ee0
 ORIG_R28: 00000000408006d0
 IAOQ[0]: map_pages+0x234/0x320
 IAOQ[1]: map_pages+0x238/0x320
 RP(r2): map_pages+0x1dc/0x320
Backtrace:
 [<0000000040102d40>] paging_init+0x5e0/0x740
 [<0000000040103744>] setup_arch+0x16c/0x1b0
 [<0000000040100ce0>] start_kernel+0xb8/0x668

Kernel panic - not syncing: Bad Address (null pointer deref?)
---[ end Kernel panic - not syncing: Bad Address (null pointer deref?)



-- 
Meelis Roos (mroos@linux.ee)
