From: Jukka Taimisto <jukka.taimisto@mail.suomi.net>
Subject: 2.6.30-rc1 hangs on boot
Date: Sat, 11 Apr 2009 14:42:19 +0300
Message-ID: <20090411114219.GA14981@mayall.koti>
Reply-To: jukka.taimisto@iki.fi
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

It seems that almost every other boot with 2.6.30-rc1 my HP c3700 with
single PA8700 (PCX-W2) 750MHz cpu hangs with following printed on serial
console: 

[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.30-rc1-jtt (root@billie) (gcc version 4.3.2 (GCC) ) #1 Fr i Apr 10 18:53:40 EEST 2009
[    0.000000] unwind_init: start = 0x4044b144, end = 0x40475174, entries = 10755
[    0.000000] WARNING: Out of order unwind entry!  000000004044cc94 and 000000004044cca4
[    0.000000] WARNING: Out of order unwind entry!  000000004044cca4 and 000000004044ccb4
[    0.000000] FP[0] enabled: Rev 1 Model 19
[    0.000000] The 64-bit Kernel has started...
[    0.000000] console [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: System Map.
[    0.000000] model 00005dc0 00000481 00000000 00000002 77e15312 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000203
[    0.000000] CPUID vers 19 rev 7 (0x00000267)
[    0.000000] capabilities 0x7
[    0.000000] model 9000/785/C3700
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 MB
[    0.000000]  1) Start 0x00000010f0000000 End 0x00000010ffffffff Size    256 MB
[    0.000000] Total Memory: 4096 MB
[    0.000000] initrd: 7f99a000-7ffedc88
[    0.000000] initrd: reserving 3f99a000-3ffedc88 (mem_max 100000000)
[    0.000000] LCD display at fffffff0f05d0008,fffffff0f05d0000 registered
[    0.000000] Built 2 zonelists in Zone order, mobility grouping on.  Total pages: 1034240
[    0.000000] Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
[    0.000000] NR_IRQS:128
[    0.000000] PID hash table entries: 4096 (order: 12, 32768 bytes)
[17179569.184000] timer_interrupt(CPU 0): delayed! cycles FFFFFFFFFFE494D4 rem 2A0894  next/now E004EEDA1/E00338275
[6166094260.418448] timer_interrupt(CPU 0): delayed! cycles 15EA6E45DE rem 24C09E next/now E003740A1/23EAA5867F

.config is available at
http://xsquared.no-ip.com:/warehouse/config-linux-2.6.30-rc1

-- 
-Jukka
:wq					jukka.taimisto@iki.fi
