From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Git head doesn't boot on A500
Date: Sat, 17 May 2008 15:20:46 +0200
Message-ID: <7d01f9f00805170620t30630519h4890037400c62fb5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi pa-ckers

Just a quick failure report, I tested git head + jejb's zonelist patch
on my A500 (gcc-4.2) and it hpmc'd the box (afaict) very early during
bootup. I'll dig that more ASAP.

Console log:

Linux version 2.6.26-rc2-dirty (varenet@mkhppa3) (gcc version 4.2.3
(Debian 4.2.3-5)) #1 SMP Sat May 17 15:08:54 CEST 2008
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
console [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00005d50 00000491 00000000 00000001 5cbb53d8 100000f0 00000008
000000b2 000000b2
vers  00000301
CPUID vers 18 rev 11 (0x0000024b)
capabilities 0x1
model 9000/800/A500-5X
Memory Ranges:
 0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 MB
 1) Start 0x00000010f0000000 End 0x00000010ffffffff Size    256 MB
Total Memory: 4096 MB
SMP: bootstrap CPU ID is 0
Built 2 zonelists in Zone order, mobility grouping on.  Total pages: 1034240
Kernel command line: root=/dev/sda5 console=ttyS0 TERM=vt102
palo_kernel=2/vmlinux-git
PID hash table entries: 4096 (order: 12, 32768 bytes)
Console: colour dummy device 160x64



Console reset done.

Boot device reset done.


HTH


-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
