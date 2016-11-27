From: Helge Deller <deller@gmx.de>
Subject: Re: parsic: strange boot crash on a500
Date: Sun, 27 Nov 2016 21:37:50 +0100
Message-ID: <3aa51712-b586-aefc-8e1f-b81b97c0729a@gmx.de>
References: <alpine.LRH.2.20.1611260142170.9292@math.ut.ee>
 <e8a4822d-bd78-7d5a-9c4b-b515b6fa8eb1@gmx.de>
 <alpine.LRH.2.20.1611272329430.19497@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1611272329430.19497@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 27.11.2016 22:35, Meelis Roos wrote:
> Cloned git://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git 
> and built and installed it.
> 
>>    You should build palo 1.96, and then *install* it into
>>    your palo boot partition:  run "palo -v" once.
> 
> palo version 1.96 http://www.parisc-linux.org - Sun Nov 27 21:27:38 EET 2016
> Partition Start(MB) End(MB) Id Type
> 1               1      32   f0 Palo
> 2              33     224   83 ext2
> 3             225   31696   83 ext2
> 4           31697   34732   83 ext2
> F0 partition start sector 32 length 65504
> do_ra(1, 4, -1, -1, '2/vmlinux root=/dev/sda3 console=ttyS0', 3, -1, 16384, 33538048)
> check_bootloader 215
> checksum(0x331d8, 45056) = 0x00000000
> ipl: addr 16384 size 45056 entry 0x0
>  ko 0x0 ksz 0 knsz 0 k64o 0x0 k64sz 0 k64nsz 0 rdo 0 rdsz 0
> <2/vmlinux root=/dev/sda3 console=ttyS0>
> check_bootloader 670
> checksum(0x281d0, 45056) = 0x00000000
> ipl: addr 16384 size 45056 entry 0x0
>  ko 0x0 ksz 0 knsz 0 k64o 0x0 k64sz 0 k64nsz 0 rdo 0 rdsz 0
> <2/vmlinux root=/dev/sda3 console=ttyS0>

Good.

>> 3. Pull and build Linus' latest git tree to get latest parisc fixes
> 
> Built.

Ok.
I assume you copied it to /boot/vmlinux then ?

>> 4. boot again, palo should report version 1.96 and it should start your new kernel.
> 
> Unfortunately, still the same. 
> Is iplboot precompiled? It shows 08 Oct.

Yes, it's precompiled (needed if palo is built on other architectures).
You can compile it yourself with "make iplboot".
But the precompiled version works for me, so I don't think it's related to your boot problem.

> Trying Primary Boot Path
> ------------------------
> Booting... 
> Boot IO Dependent Code (IODC) revision 1
> 
> 
> HARD Booted.
> palo ipl 1.96 http://www.parisc-linux.org - Sun, 08 Oct 2016 22:40:31 +0100

Good.
 
> Partition Start(MB) End(MB) Id Type
> 1               1      32   f0 Palo
> 2              33     224   83 ext2
> 3             225   31696   83 ext2
> 4           31697   34732   83 ext2
> 
> PALO(F0) partition contains:
> 
> Command line for kernel: 'root=/dev/sda3 console=ttyS0 
> palo_kernel=2/vmlinux'
> Selected kernel: /vmlinux from partition 2

I'm missing here the information of the various sections
in the vmlinux file which the boot loader usually prints
here.

Can you please check (e.g. readelf/objdump) your vmlinux file?
I assume partition 2 is your /boot partition, in which case it's /boot/vmlinux.

There seems to be a current problem with latest binutils (on x86_64), but
not sure if this affects you.

Helge

> ************* SYSTEM ALERT **************
> SYSTEM NAME: a500-m
> DATE: 11/27/2016 TIME: 19:34:16
> ALERT LEVEL: 7 = reserved
> 
> REASON FOR ALERT
> SOURCE: 0 = unknown, no source stated
> SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
> PROBLEM DETAIL: 0 = no problem detail

