From: Meelis Roos <mroos@linux.ee>
Subject: Re: parsic: strange boot crash on a500
Date: Sun, 27 Nov 2016 23:35:43 +0200 (EET)
Message-ID: <alpine.LRH.2.20.1611272329430.19497@math.ut.ee>
References: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee> <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > 4.9.0-rc5-00297-g20afa6e, they both crash on boot like that.
> 
> rc5 should be more OK, but just last night we fixed some more problems:
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3ad0e83cf86bcaeb6ca3c37060a3ce866b25fb42
> So, if you try, please update to latest git head now.

Updated to ths version.

> 1. Boot into a functional kernel (e.g. v4.8)
> 2. Update your palo boot loader: 
>    https://git.kernel.org/cgit/linux/kernel/git/deller/palo.git/

Cloned git://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git 
and built and installed it.

>    You should build palo 1.96, and then *install* it into
>    your palo boot partition:  run "palo -v" once.

palo version 1.96 http://www.parisc-linux.org - Sun Nov 27 21:27:38 EET 2016
Partition Start(MB) End(MB) Id Type
1               1      32   f0 Palo
2              33     224   83 ext2
3             225   31696   83 ext2
4           31697   34732   83 ext2
F0 partition start sector 32 length 65504
do_ra(1, 4, -1, -1, '2/vmlinux root=/dev/sda3 console=ttyS0', 3, -1, 16384, 33538048)
check_bootloader 215
checksum(0x331d8, 45056) = 0x00000000
ipl: addr 16384 size 45056 entry 0x0
 ko 0x0 ksz 0 knsz 0 k64o 0x0 k64sz 0 k64nsz 0 rdo 0 rdsz 0
<2/vmlinux root=/dev/sda3 console=ttyS0>
check_bootloader 670
checksum(0x281d0, 45056) = 0x00000000
ipl: addr 16384 size 45056 entry 0x0
 ko 0x0 ksz 0 knsz 0 k64o 0x0 k64sz 0 k64nsz 0 rdo 0 rdsz 0
<2/vmlinux root=/dev/sda3 console=ttyS0>


> 3. Pull and build Linus' latest git tree to get latest parisc fixes

Built.

> 4. boot again, palo should report version 1.96 and it should start your new kernel.

Unfortunately, still the same. Is iplboot precompiled? It shows 08 Oct.

Trying Primary Boot Path
------------------------
Booting... 
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.96 http://www.parisc-linux.org - Sun, 08 Oct 2016 22:40:31 +0100

Partition Start(MB) End(MB) Id Type
1               1      32   f0 Palo
2              33     224   83 ext2
3             225   31696   83 ext2
4           31697   34732   83 ext2

PALO(F0) partition contains:

Command line for kernel: 'root=/dev/sda3 console=ttyS0 
palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2

************* SYSTEM ALERT **************
SYSTEM NAME: a500-m
DATE: 11/27/2016 TIME: 19:34:16
ALERT LEVEL: 7 = reserved

REASON FOR ALERT
SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         OFF       ON         ON
LED State: Running non-OS code.  Non-critical error detected.
Check Chassis and Console Logs for error messages.

0x0000007000FF6292 00000000 00000000 - type  0 = Data Field Unused
0x5800087000FF6292 0000740A 1B132210 - type 11 = Timestamp 11/27/2016 
19:34:16
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry


-- 
Meelis Roos (mroos@linux.ee)
