From: Helge Deller <deller@gmx.de>
Subject: systemd on hppa and number of free RT signals
Date: Tue, 07 Oct 2014 21:39:59 +0200
Message-ID: <5434418F.1020407@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060109070908020206020206"
To: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------060109070908020206020206
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

I've just had a successful boot on hppa with systemd :-)
The bootlog is attached.

As already discussed here:
http://article.gmane.org/gmane.linux.ports.parisc/5278
we don't have enough RT signals for systemd, which requests "SIGRTMIN+29" which is > 64 (SIGRTMAX).
Since systemd gets more and more important (e.g. KDE now seems to require systemd) we should try to find a solution.

The attached patches to Linux kernel and glibc shuffles around some signals, so that we end up with
#define __SIGRTMIN	32
instead of
#define __SIGRTMIN	37

I do know that this changes the ABI and introduces a binary incompatibly.
Nevertheless, my testing with the new kernel and glibc didn't showed any obvious problems, which means that I could install either of those and the system didn't showed problems even after reboots.
Additionally, given the fact that we have very little users and live in debian/gentoo unstable would IMHO justify such an incompatible change. Even HP-UX support was dropped a few months back...
And we could easily rebuild packages like strace, gdb and such...

The other option would be to increase NSIG in kernel from 64 to 128 or higher.
I did tried to come up with kernel patches for this now for a few weeks, but ended up with the recognition, that this would require to duplicate nearly all of Linux kernel signal handling and which would most likely introduce new bugs.

What's your opinion on this?
I will provide prebuilt debian packages with those patches for kernel and glibc tomorrow for download, so that people may test themselves...

Helge

--------------060109070908020206020206
Content-Type: text/x-patch;
 name="kernel.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="kernel.patch"

diff --git a/arch/parisc/include/uapi/asm/signal.h b/arch/parisc/include/uapi/asm/signal.h
index f5645d6..10df707 100644
--- a/arch/parisc/include/uapi/asm/signal.h
+++ b/arch/parisc/include/uapi/asm/signal.h
@@ -8,12 +8,12 @@
 #define SIGTRAP		 5
 #define SIGABRT		 6
 #define SIGIOT		 6
-#define SIGEMT		 7
+#define SIGSTKFLT	 7
 #define SIGFPE		 8
 #define SIGKILL		 9
 #define SIGBUS		10
 #define SIGSEGV		11
-#define SIGSYS		12 /* Linux doesn't use this */
+#define SIGXCPU		12
 #define SIGPIPE		13
 #define SIGALRM		14
 #define SIGTERM		15
@@ -32,16 +32,12 @@
 #define SIGTTIN		27
 #define SIGTTOU		28
 #define SIGURG		29
-#define SIGLOST		30 /* Linux doesn't use this either */
-#define	SIGUNUSED	31
-#define SIGRESERVE	SIGUNUSED
-
-#define SIGXCPU		33
-#define SIGXFSZ		34
-#define SIGSTKFLT	36
+#define SIGXFSZ		30
+#define SIGUNUSED	31
+#define SIGSYS		31 /* Linux doesn't use this */
 
 /* These should not be considered constants from userland.  */
-#define SIGRTMIN	37
+#define SIGRTMIN	32
 #define SIGRTMAX	_NSIG /* it's 44 under HP/UX */
 
 /*

--------------060109070908020206020206
Content-Type: text/x-patch;
 name="glibc.signal.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="glibc.signal.patch"

diff -up ./ports/sysdeps/unix/sysv/linux/hppa/bits/signum.h.org ./ports/sysdeps/unix/sysv/linux/hppa/bits/signum.h
--- ./ports/sysdeps/unix/sysv/linux/hppa/bits/signum.h.org	2014-10-06 10:58:34.071963059 +0200
+++ ./ports/sysdeps/unix/sysv/linux/hppa/bits/signum.h	2014-10-06 11:02:48.879949179 +0200
@@ -35,13 +35,13 @@
 #define	SIGILL		4	/* Illegal instruction (ANSI).  */
 #define	SIGTRAP		5	/* Trace trap (POSIX).  */
 #define	SIGABRT		6	/* Abort (ANSI).  */
+#define	SIGSTKFLT	7	/* Stack fault.  */
 #define	SIGIOT		6	/* IOT trap (4.2 BSD).  */
-#define	SIGEMT		7
 #define	SIGFPE		8	/* Floating-point exception (ANSI).  */
 #define	SIGKILL		9	/* Kill, unblockable (POSIX).  */
 #define	SIGBUS		10	/* BUS error (4.2 BSD).  */
 #define	SIGSEGV		11	/* Segmentation violation (ANSI).  */
-#define SIGSYS		12	/* Bad system call.  */
+#define	SIGXCPU		12	/* CPU limit exceeded (4.2 BSD).  */
 #define	SIGPIPE		13	/* Broken pipe (POSIX).  */
 #define	SIGALRM		14	/* Alarm clock (POSIX).  */
 #define	SIGTERM		15	/* Termination (ANSI).  */
@@ -61,11 +61,9 @@
 #define	SIGTTIN		27	/* Background read from tty (POSIX).  */
 #define	SIGTTOU		28	/* Background write to tty (POSIX).  */
 #define	SIGURG		29	/* Urgent condition on socket (4.2 BSD).  */
-#define SIGLOST		30	/* Operating System Has Lost (HP/UX). */
+#define	SIGXFSZ		30	/* File size limit exceeded (4.2 BSD).  */
+#define SIGSYS		31	/* Bad system call.  */
 #define SIGUNUSED	31
-#define	SIGXCPU		33	/* CPU limit exceeded (4.2 BSD).  */
-#define	SIGXFSZ		34	/* File size limit exceeded (4.2 BSD).  */
-#define	SIGSTKFLT	36	/* Stack fault.  */
 
 #define	_NSIG		65	/* Biggest signal number + 1
 				   (including real-time signals).  */
@@ -75,7 +73,7 @@
 
 /* These are the hard limits of the kernel.  These values should not be
    used directly at user level.  */
-#define __SIGRTMIN	37
+#define __SIGRTMIN	32	/* Kernel > 3.17 */
 #define __SIGRTMAX	(_NSIG - 1)
 
 #endif	/* <signal.h> included.  */

--------------060109070908020206020206
Content-Type: text/x-log;
 name="boot.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="boot.log"

Main Menu: Enter command > bo fwscsi.4
Interact with IPL (Y, N, Q)?> y

Booting... 
Boot IO Dependent Code (IODC) revision 0


HARD Booted.
palo ipl 1.95 root@mkhppa3 Thu Apr 17 20:15:17 UTC 2014
Skipping extended partition 6 - beyond reach of IPL

Partition Start(MB) End(MB) Id Type
1               2      33   f0 Palo
2              34     157   83 ext2
5             159   16673   83 ext2

PALO(F0) partition contains:
    0/vmlinux64 11433124(0) bytes @ 0x140000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).Current command line:
2/vmlinux root=/dev/sdb5 rootfstype=ext4 initrd=2/initrd.img HOME=/ panic_timeout=60 panic=-1 console=ttyS0 TERM=vt102
 0: 2/vmlinux
 1: root=/dev/sdb5
 2: rootfstype=ext4
 3: initrd=2/initrd.img
 4: HOME=/
 5: panic_timeout=60
 6: panic=-1
 7: console=ttyS0
 8: TERM=vt102

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
'x'    reset and reboot machine
? b

Command line for kernel: 'root=/dev/sdb5 rootfstype=ext4 HOME=/ panic_timeout=60 panic=-1 console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
Selected ramdisk: /initrd.img from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 228528 mediaptr 0x1000
Segment 1 load 00138000 size 9420920 mediaptr 0x39000
Loading ramdisk 16365131 bytes @ 3f053000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.16-2-parisc64-smp (debian-kernel@lists.debian.org) (gcc version 4.8.3 (GCC) ) #1 SMP Debian 3.16.3-2 (2014-10-07)
[    0.000000] unwind_init: start = 0x40877600, end = 0x408bd670, entries = 17927
[    0.000000] FP[0] enabled: Rev 1 Model 16
[    0.000000] The 64-bit Kernel has started...
[    0.000000] Default page size is 4KB.
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: System Map.
[    0.000000] model 00005bd0 00000491 00000000 00000002 782482ee 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000203
[    0.000000] CPUID vers 17 rev 7 (0x00000227)
[    0.000000] capabilities 0x3
[    0.000000] model 9000/785/J5000
[    0.000000] Total Memory: 2048 MB
[    0.000000] initrd: 7f053000-7ffee64b
[    0.000000] initrd: reserving 3f053000-3ffee64b (mem_max 80000000)
[    0.000000] LCD display at fffffff0f05d0008,fffffff0f05d0000 registered
[    0.000000] PERCPU: Embedded 14 pages/cpu @0000000042964000 s27008 r8192 d22144 u57344
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 517120
[    0.000000] Kernel command line: root=/dev/sdb5 rootfstype=ext4 HOME=/ panic_timeout=60 panic=-1 console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.000000] Sorting __ex_table...
[    0.000000] Memory: 2035292K/2097152K available (5508K kernel code, 1817K rwdata, 1094K rodata, 368K init, 636K bss, 61860K reserved)
[    0.000000] virtual kernel memory layout:
    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    0.000000]     memory  : 0x0000000040000000 - 0x00000000c0000000   (2048 MB)
    0.000000]       .init : 0x0000000040100000 - 0x000000004015c000   ( 368 kB)
    0.000000]       .data : 0x00000000406bd000 - 0x0000000040994fb0   (2911 kB)
    0.000000]       .text : 0x000000004015c000 - 0x00000000406bd000   (5508 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  CONFIG_RCU_FANOUT set to non-default value of 32
[    0.000000] NR_IRQS:128
[    0.000000] Console: colour dummy device 160x64
[    0.060000] Calibrating delay loop... 872.44 BogoMIPS (lpj=1744896)
[    0.160000] pid_max: default: 32768 minimum: 301
[    0.224000] Security Framework initialized
[    0.276000] AppArmor: AppArmor disabled by boot time parameter
[    0.352000] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.440000] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.528000] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.624000] Initializing cgroup subsys memory
[    0.680000] Initializing cgroup subsys devices
[    0.740000] Initializing cgroup subsys freezer
[    0.800000] Initializing cgroup subsys net_cls
[    0.856000] Initializing cgroup subsys blkio
[    0.912000] Initializing cgroup subsys perf_event
[    0.976000] Initializing cgroup subsys net_prio
[    1.040000] Brought up 1 CPUs
[    1.080000] devtmpfs: initialized
[    1.128000] NET: Registered protocol family 16
[    1.188000] EISA bus registered
[    1.228000] Searching for devices...
[    1.520000] Found devices:
[    1.556000] 1. Astro BC Runway Port at 0xfffffffffed00000 [10] { 12, 0x0, 0x582, 0x0000b }
[    1.664000] 2. Elroy PCI Bridge at 0xfffffffffed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
[    1.772000] 3. Elroy PCI Bridge at 0xfffffffffed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
[    1.876000] 4. Elroy PCI Bridge at 0xfffffffffed34000 [10/2] { 13, 0x0, 0x782, 0x0000a }
[    1.984000] 5. Elroy PCI Bridge at 0xfffffffffed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
[    2.092000] 6. Elroy PCI Bridge at 0xfffffffffed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
[    2.196000] 7. Forte W 2-way at 0xfffffffffffa0000 [32] { 0, 0x0, 0x5bd, 0x00004 }
[    2.296000] 8. Forte W 2-way at 0xfffffffffffa2000 [34] { 0, 0x0, 0x5bd, 0x00004 }
[    2.396000] 9. Memory at 0xfffffffffed10200 [49] { 1, 0x0, 0x088, 0x00009 }
[    2.488000] Enabling regular chassis codes support v0.05
[    2.680000] Releasing cpu 1 now, hpa=fffffffffffa2000
[    2.764000] FP[1] enabled: Rev 1 Model 16
[    2.764000] CPU(s): 2 out of 2 PA8500 (PCX-W) at 440.000000 MHz online
[    2.908000] Setting cache flush threshold to 100000 (2 CPUs online)
[    3.016000] SBA found Astro 2.1 at 0xfffffffffed00000
[    3.084000] Elroy version TR2.1 (0x2) found at 0xfffffffffed30000
[    3.164000] LBA 10:0: PCI host bridge to bus 0000:00
[    3.232000] pci_bus 0000:00: root bus resource [io  0x0000-0x1fff]
[    3.312000] pci_bus 0000:00: root bus resource [mem 0xfffffffff4000000-0xfffffffff47fffff] (bus address [0xf4000000-0xf47fffff])
[    3.464000] pci_bus 0000:00: root bus resource [bus 00]
[    3.536000] PCI: Enabled native mode for NS87415 (pif=0x8f)
[    3.616000] Elroy version TR2.1 (0x2) found at 0xfffffffffed32000
[    3.696000] LBA 10:1: PCI host bridge to bus 0000:01
[    3.760000] pci_bus 0000:01: root bus resource [io  0x12000-0x13fff] (bus address [0x2000-0x3fff])
[    3.880000] pci_bus 0000:01: root bus resource [mem 0xfffffffff4800000-0xfffffffff4ffffff] (bus address [0xf4800000-0xf4ffffff])
[    4.032000] pci_bus 0000:01: root bus resource [bus 01]
[    4.100000] Elroy version TR2.1 (0x2) found at 0xfffffffffed34000
[    4.180000] LBA 10:2: PCI host bridge to bus 0000:02
[    4.248000] pci_bus 0000:02: root bus resource [io  0x24000-0x25fff] (bus address [0x4000-0x5fff])
[    4.364000] pci_bus 0000:02: root bus resource [mem 0xfffffffff5000000-0xfffffffff57fffff] (bus address [0xf5000000-0xf57fffff])
[    4.516000] pci_bus 0000:02: root bus resource [bus 02]
[    4.588000] Elroy version TR2.1 (0x2) found at 0xfffffffffed38000
[    4.668000] LBA 10:4: PCI host bridge to bus 0000:03
[    4.732000] pci_bus 0000:03: root bus resource [io  0x38000-0x39fff] (bus address [0x8000-0x9fff])
[    4.852000] pci_bus 0000:03: root bus resource [mem 0xfffffffff6000000-0xfffffffff67fffff] (bus address [0xf6000000-0xf67fffff])
[    5.004000] pci_bus 0000:03: root bus resource [bus 03]
[    5.072000] Elroy version TR2.1 (0x2) found at 0xfffffffffed3c000
[    5.152000] LBA 10:6: PCI host bridge to bus 0000:04
[    5.220000] pci_bus 0000:04: root bus resource [io  0x4c000-0x4dfff] (bus address [0xc000-0xdfff])
[    5.336000] pci_bus 0000:04: root bus resource [mem 0xfffffffffa000000-0xfffffffffbffffff] (bus address [0xfa000000-0xfbffffff])
[    5.488000] pci_bus 0000:04: root bus resource [mem 0xfffffffff7000000-0xfffffffff77fffff] (bus address [0xf7000000-0xf77fffff])
[    5.640000] pci_bus 0000:04: root bus resource [bus 04]
[    5.712000] iosapic: hpa not registered for 0000:04:07.0
[    5.792000] powersw: Soft power switch at 0xfffffff0f0400804 enabled.
[    5.892000] vgaarb: loaded
[    5.944000] NET: Registered protocol family 2
[    6.004000] TCP established hash table entries: 16384 (order: 5, 131072 bytes)
[    6.100000] TCP bind hash table entries: 16384 (order: 6, 262144 bytes)
[    6.188000] TCP: Hash tables configured (established 16384 bind 16384)
[    6.276000] TCP: reno registered
[    6.316000] UDP hash table entries: 1024 (order: 3, 32768 bytes)
[    6.396000] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
[    6.480000] NET: Registered protocol family 1
[    6.540000] SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 68)
[    6.632000] SuperIO: Serial port 1 at 0x3f8
[    6.688000] SuperIO: Serial port 2 at 0x2f8
[    6.744000] SuperIO: Parallel port at 0x378
[    6.796000] SuperIO: Floppy controller at 0x3f0
[    6.856000] SuperIO: ACPI at 0x7e0
[    6.904000] SuperIO: USB regulator enabled
[    7.012000] Unpacking initramfs...
[    9.124000] Freeing initrd memory: 15980K (000000007f053000 - 000000007ffee000)
[    9.220000] Enabling PDC chassis warnings support v0.05
[    9.288000] Performance monitoring counters enabled for Forte W 2-way
[    9.376000] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    9.460000] audit: initializing netlink subsys (disabled)
[    9.528000] audit: type=2000 audit(1412708413.528:1): initialized
[    9.612000] zbud: loaded
[    9.648000] VFS: Disk quotas dquot_6.5.2
[    9.700000] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    9.784000] msgmni has been set to 4006
[    9.840000] alg: No test for stdrng (krng)
[    9.892000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    9.992000] io scheduler noop registered
[   10.040000] io scheduler deadline registered
[   10.100000] io scheduler cfq registered (default)
[   10.164000] PDC Stable Storage facility v0.30
[   10.532000] STI GSC/PCI core graphics driver Version 0.9b
[   10.604000] sti 0000:04:07.0: enabling SERR and PARITY (0002 -> 0142)
[   10.688000] STI PCI graphic ROM found at fffffffff7000000 (64 kB), fb at fffffffffa000000 (32 MB)
[   10.876000] STI ROM supports 32 bit firmware functions.
[   10.948000] STI selected 8x16 framebuffer font VGA8x16 for sticon
[   11.028000]     id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
[   11.108000]     graphics card name: PCI_GRAFFITIX800
[   11.172000] sticon: Initializing STI text console.
[   11.604000] Console: switching to colour STI console 100x37
[   12.088000] Console: switching to colour frame buffer device 100x37
[   12.212000] fb0: stifb 800x600-8 frame buffer device, PCI_GRAFFITIX800, id: 2d08c0a7, mmio: 0xfffffffffa100000
[   12.344000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[   12.424000] serial8250: ttyS0 at I/O 0x3f8 (irq = 3, base_baud = 115200) is a 16550A
[   12.528000] console [ttyS0] enabled
[   12.528000] console [ttyS0] enabled
[   12.616000] bootconsole [ttyB0] disabled
[   12.616000] bootconsole [ttyB0] disabled
[   12.712000] serial8250: ttyS1 at I/O 0x2f8 (irq = 4, base_baud = 115200) is a 16550A
[   12.808000] Linux agpgart interface v0.103
[   12.856000] quicksilver: No Pluto found, so no AGPGART for you.
[   12.928000] [drm] Initialized drm 1.1.0 20060810
[   12.984000] mousedev: PS/2 mouse device common for all mice
[   13.052000] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[   13.140000] ledtrig-cpu: registered to indicate activity on CPUs
[   13.212000] TCP: cubic registered
[   13.252000] NET: Registered protocol family 10
[   13.308000] mip6: Mobile IPv6
[   13.344000] NET: Registered protocol family 17
[   13.396000] mpls_gso: MPLS GSO support
[   13.440000] registered taskstats version 1
[   13.496000] rtc-generic rtc-generic: setting system clock to 2014-10-07 19:00:18 UTC (1412708418)
[   13.604000] Freeing unused kernel memory: 368K (0000000040100000 - 000000004015c000)
Loading, please wait...
[   13.948000] systemd-udevd[59]: starting version 215
[   14.012000] random: systemd-udevd urandom read with 72 bits of entropy available
[   14.232000] tulip: Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
[   14.380000] SCSI subsystem initialized
[   14.436000] tulip0: no phy info, aborting mtable build
[   14.500000] tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1
[   14.704000] net eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0xfffffffff4008000, 00:10:83:cf:f8:47, IRQ 66
[   14.864000] usbcore: registered new interface driver usbfs
[   14.932000] usbcore: registered new interface driver hub
[   14.996000] usbcore: registered new device driver usb
[   15.076000] sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq 69
[   15.144000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   15.144000] sym0: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
[   15.144000] sym0: SCSI BUS has been reset.
[   15.144000] scsi0 : sym-2.2.3
[   15.384000] sym0: SCSI BUS mode change from SE to SE.
[   15.384000] sym0: SCSI BUS has been reset.
[   15.504000] scsi1 : pata_ns87415
[   15.548000] scsi2 : pata_ns87415
[   15.588000] ata1: PATA max MWDMA2 cmd 0xf00 ctl 0xe00 bmdma 0xa00 irq 7
[   15.668000] ata2: PATA max MWDMA2 cmd 0xd00 ctl 0xb00 bmdma 0xa08 irq 7
[   15.756000] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[   15.836000] ehci-pci: EHCI PCI platform driver
[   15.900000] ohci-pci: OHCI PCI platform driver
[   15.984000] sym1: <896> rev 0x4 at pci 0000:00:0f.1 irq 69
[   16.052000] sym1: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
[   16.132000] sym1: SCSI BUS has been reset.
[   16.188000] sym1: SCSI BUS mode change from SE to SE.
[   16.188000] ata1.00: ATAPI: FX4830T, R02D, max UDMA/33
[   16.188000] sym1: SCSI BUS has been reset.
[   16.360000] scsi3 : sym-2.2.3
[   16.396000] ata1.00: configured for MWDMA2
[   16.448000] ohci-pci 0000:00:0e.2: OHCI PCI host controller
[   16.516000] ohci-pci 0000:00:0e.2: new USB bus registered, assigned bus number 1
[   16.604000] ohci-pci 0000:00:0e.2: irq 1, io mem 0xfffffffff4007000
[   16.736000] usb usb1: New USB device found, idVendor=1d6b, idProduct=0001
[   16.816000] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   16.904000] usb usb1: Product: OHCI PCI host controller
[   16.964000] usb usb1: Manufacturer: Linux 3.16-2-parisc64-smp ohci_hcd
[   17.044000] usb usb1: SerialNumber: 0000:00:0e.2
[   17.100000] hub 1-0:1.0: USB hub found
[   17.144000] hub 1-0:1.0: 3 ports detected
[   20.600000] scsi 3:0:3:0: Direct-Access     SEAGATE  ST118273WC       HP14 PQ: 0 ANSI: 2
[   20.696000] scsi target3:0:3: tagged command queuing enabled, command queue depth 16.
[   20.792000] scsi: waiting for bus probes to complete ...
[   20.792000] scsi target3:0:3: Beginning Domain Validation
[   20.804000] scsi target3:0:3: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
[   20.812000] scsi target3:0:3: Domain Validation skipping write tests
[   20.812000] scsi target3:0:3: Ending Domain Validation
[   20.820000] scsi 3:0:4:0: Direct-Access     SEAGATE  ST118273WC       HP14 PQ: 0 ANSI: 2
[   20.820000] scsi target3:0:4: tagged command queuing enabled, command queue depth 16.
[   20.820000] scsi target3:0:4: Beginning Domain Validation
[   20.832000] scsi target3:0:4: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
[   20.840000] scsi target3:0:4: Domain Validation skipping write tests
[   20.840000] scsi target3:0:4: Ending Domain Validation
[   20.844000] scsi 3:0:5:0: Direct-Access     QUANTUM  ATLAS10K-18LVD   HP06 PQ: 0 ANSI: 3
[   20.844000] scsi target3:0:5: tagged command queuing enabled, command queue depth 16.
[   20.844000] scsi target3:0:5: Beginning Domain Validation
[   20.848000] scsi target3:0:5: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 31)
[   20.848000] scsi target3:0:5: Domain Validation skipping write tests
[   20.852000] scsi target3:0:5: Ending Domain Validation
[   20.856000] scsi 3:0:6:0: Direct-Access     QUANTUM  ATLAS10K-18LVD   HP06 PQ: 0 ANSI: 3
[   20.856000] scsi target3:0:6: tagged command queuing enabled, command queue depth 16.
[   20.856000] scsi target3:0:6: Beginning Domain Validation
[   20.860000] scsi target3:0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 31)
[   20.860000] scsi target3:0:6: Domain Validation skipping write tests
[   20.860000] scsi target3:0:6: Ending Domain Validation
[   22.584000] timer_interrupt(CPU 1): delayed! cycles 2EF0812F rem EBED1  next/now 1082CF096F7/1082CE1D826
[   22.676000] random: nonblocking pool is initialized
[   23.284000] scsi 1:0:0:0: CD-ROM            MITSUMI  CD-ROM FX4830T!B R02D PQ: 0 ANSI: 5
[   23.428000] sd 3:0:3:0: [sda] 35566480 512-byte logical blocks: (18.2 GB/16.9 GiB)
[   23.428000] sd 3:0:5:0: [sdc] 35566480 512-byte logical blocks: (18.2 GB/16.9 GiB)
[   23.428000] sd 3:0:6:0: [sdd] 35566480 512-byte logical blocks: (18.2 GB/16.9 GiB)
[   23.432000] sd 3:0:5:0: [sdc] Write Protect is off
[   23.432000] sd 3:0:6:0: [sdd] Write Protect is off
[   23.432000] sd 3:0:5:0: [sdc] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   23.432000] sd 3:0:4:0: [sdb] 35566480 512-byte logical blocks: (18.2 GB/16.9 GiB)
[   23.436000] sd 3:0:6:0: [sdd] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   23.436000] sd 3:0:4:0: [sdb] Write Protect is off
[   23.440000] sd 3:0:4:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   24.292000] sd 3:0:3:0: [sda] Write Protect is off
[   24.348000]  sdd: sdd1 sdd2 sdd3 sdd4 < sdd5 >
[   24.348000]  sdc: unknown partition table
[   24.456000] sd 3:0:3:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
[   24.460000] sd 3:0:6:0: [sdd] Attached SCSI disk
[   24.460000] sd 3:0:5:0: [sdc] Attached SCSI disk
[   24.484000]  sdb: sdb1 sdb2 sdb3 < sdb5 sdb6 >
[   24.740000] sd 3:0:4:0: [sdb] Attached SCSI disk
[   24.796000]  sda: sda1 sda2 sda3
[   24.844000] sd 3:0:3:0: [sda] Attached SCSI disk
[   24.928000] sd 3:0:3:0: Attached scsi generic sg0 type 0
[   25.004000] sd 3:0:4:0: Attached scsi generic sg1 type 0
[   25.076000] sd 3:0:5:0: Attached scsi generic sg2 type 0
[   25.152000] sd 3:0:6:0: Attached scsi generic sg3 type 0
[   25.216000] scsi 1:0:0:0: Attached scsi generic sg4 type 5
[   25.320000] sr0: scsi3-mmc drive: 48x/48x cd/rw xa/form2 cdda tray
[   25.392000] cdrom: Uniform CD-ROM driver Revision: 3.20
Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
Begin: Running /scripts/local-premount ... done.
Begin: Checking root file system ... fsck from util-linux 2.20.1
/dev/sdb5: recovering journal
/dev/sdb5: clean, 41430/1058720 files, 525252/4227840 blocks
done.
[   30.516000] EXT4-fs (sdb5): mounted filesystem with ordered data mode. Opts: (null)
done.
Begin: Running /scripts/local-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
[   32.144000] systemd[1]: systemd 215 running in system mode. (+PAM +AUDIT +SELINUX +IMA +SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ -SECCOMP -APPARMOR)
[   32.304000] systemd[1]: Detected architecture 'parisc64'.

Welcome to Debian GNU/Linux jessie/sid!

[   32.804000] systemd[1]: Inserted module 'autofs4'
[   32.888000] systemd[1]: Set hostname to <ls3017>.
[   34.548000] systemd[1]: Cannot add dependency job for unit display-manager.service, ignoring: Unit display-manager.service failed to load: No such file or directory.
[   34.728000] systemd[1]: Starting Forward Password Requests to Wall Directory Watch.
[   34.824000] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[   34.912000] systemd[1]: Expecting device dev-ttyS0.device...
         Expecting device dev-ttyS0.device...
[   35.040000] systemd[1]: Starting Remote File Systems (Pre).
[  OK  ] Reached target Remote File Systems (Pre).
[   35.176000] systemd[1]: Reached target Remote File Systems (Pre).
[   35.252000] systemd[1]: Starting Arbitrary Executable File Formats File System Automount Point.
[  OK  ] Set up automount Arbitrary Executable File Formats F...utomount Point.
[   35.456000] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[   35.568000] systemd[1]: Starting Encrypted Volumes.
[  OK  ] Reached target Encrypted Volumes.
[   35.688000] systemd[1]: Reached target Encrypted Volumes.
[   35.752000] systemd[1]: Starting Dispatch Password Requests to Console Directory Watch.
[   35.852000] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[   35.944000] systemd[1]: Starting Paths.
[  OK  ] Reached target Paths.
[   36.040000] systemd[1]: Reached target Paths.
[   36.092000] systemd[1]: Expecting device dev-disk-by\x2duuid-e9c4c389\x2d6b1f\x2d47c4\x2dbc47\x2d30cb05380d54.device...
         Expecting device dev-disk-by\x2duuid-e9c4c389\x2d6b1...80d54.device...
[   36.316000] systemd[1]: Expecting device dev-disk-by\x2duuid-c393bfeb\x2d0c0a\x2d4b7d\x2da529\x2d21580d653d23.device...
         Expecting device dev-disk-by\x2duuid-c393bfeb\x2d0c0...53d23.device...
[   36.536000] systemd[1]: Starting Root Slice.
[  OK  ] Created slice Root Slice.
[   36.712000] systemd[1]: Created slice Root Slice.
[   36.768000] systemd[1]: Starting Delayed Shutdown Socket.
[  OK  ] Listening on Delayed Shutdown Socket.
[   36.900000] systemd[1]: Listening on Delayed Shutdown Socket.
[   36.968000] systemd[1]: Starting /dev/initctl Compatibility Named Pipe.
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
[   37.132000] systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
[   37.216000] systemd[1]: Starting Journal Socket (/dev/log).
[  OK  ] Listening on Journal Socket (/dev/log).
[   37.352000] systemd[1]: Listening on Journal Socket (/dev/log).
[   37.424000] systemd[1]: Starting Syslog Socket.
[  OK  ] Listening on Syslog Socket.
[   37.536000] systemd[1]: Listening on Syslog Socket.
[   37.596000] systemd[1]: Starting udev Control Socket.
[  OK  ] Listening on udev Control Socket.
[   37.716000] systemd[1]: Listening on udev Control Socket.
[   37.780000] systemd[1]: Starting udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[   37.900000] systemd[1]: Listening on udev Kernel Socket.
[   37.964000] systemd[1]: Starting User and Session Slice.
[  OK  ] Created slice User and Session Slice.
[   38.096000] systemd[1]: Created slice User and Session Slice.
[   38.168000] systemd[1]: Starting Journal Socket.
[  OK  ] Listening on Journal Socket.
[   38.280000] systemd[1]: Listening on Journal Socket.
[   38.340000] systemd[1]: Starting System Slice.
[  OK  ] Created slice System Slice.
[   38.448000] systemd[1]: Created slice System Slice.
[   38.508000] systemd[1]: Starting File System Check on Root Device...
         Starting File System Check on Root Device...
[   38.652000] systemd[1]: Starting system-systemd\x2dfsck.slice.
[  OK  ] Created slice system-systemd\x2dfsck.slice.
[   38.800000] systemd[1]: Created slice system-systemd\x2dfsck.slice.
[   38.876000] systemd[1]: Starting udev Coldplug all Devices...
         Startin[   38.956000] systemd[1]: Mounting POSIX Message Queue File System...
g udev Coldplug all Devices...
         Mounting POSIX Message Queue File System...
[   39.412000] systemd[1]: Started Set Up Additional Binary Formats.
[   39.492000] systemd[1]: Starting Create list of required static device nodes for the current kernel...
         Startin[   39.620000] systemd[1]: Mounting Debug File System...
g Create list of[   39.692000] systemd[1]: Mounted Huge Pages File System.
 required static device nodes...rrent kernel...
         Mounti[   39.812000] systemd[1]: Starting Load Kernel Modules...
ng Debug File Sy[   39.900000] systemd[1]: Starting system-getty.slice.
stem...
       [   39.972000] systemd[1]: Created slice system-getty.slice.
  Starting Load [   40.048000] systemd[1]: Starting system-serial\x2dgetty.slice.
Kernel Modules..[   40.140000] systemd[1]: Created slice system-serial\x2dgetty.slice.
.
[  OK    40.228000] systemd[1]: Starting Journal Service...
[0m] Created slice system-getty.[   40.320000] systemd[1]: Started Journal Service.                                                                                     
slice.                                                                                                                                                                  
[  OK  ] Created slice system-serial\x2dgetty.slice.
         Starting Journal Service...
[  OK  ] Started Journal Service.
[  OK  ] Reached target Slices.
[  OK  ] Mounted Debug File System.
[  OK  ] Mounted POSIX Message Queue File System.
[  OK  ] Started udev Coldplug all Devices.
[  OK  ] Started Create list of required static device nodes ...current kernel.
         Starting Create Static Device Nodes in /dev...
[  OK  ] Started Load Kernel Modules.
         Starting Apply Kernel Variables...
[  OK  ] Started Apply Kernel Variables.
[   41.580000] systemd-fsck[142]: /dev/sdb5: clean, 41430/1058720 files, 525252/4227840 blocks
[  OK  ] Started Create Static Device Nodes in /dev.
[  OK  ] Started File System Check on Root Device.
         Starting Remount Root and Kernel File Systems...
         Starting udev Kernel Device Manager...
[   41.996000] EXT4-fs (sdb5): re-mounted. Opts: errors=remount-ro
[  OK  ] Started Remount Root and Kerne[   42.128000] systemd-udevd[165]: starting version 215
l File Systems.
[  OK  ] Started udev Kernel Device Manager.
         Starting Copy rules generated while the root was ro...
         Starting Load/Save Random Seed...
[  OK  ] Reached target Local File Systems (Pre).
[  OK  ] Started Copy rules generated while the root was ro.
[  OK  ] Started Load/Save Random Seed.
[  OK  ] Found device /dev/ttyS0.
[  OK  ] Found device ST118273WC 6.
         Activating swap /dev/disk/by-uuid/e9c4c389-6b1f-47c4...30cb05380d54...
[  OK  ] Found device S[   44.560000] Adding 708604k swap on /dev/sdb6.  Priority:-1 extents:1 across:708604k FS
T118273WC 2.
[  OK  ] Activated swap /dev/disk/by-uuid/e9c4c389-6b1f-47c4-bc47-30cb05380d54.
[  OK  ] Created slice system-ifup.slice.
[  OK  ] Reached target Swap.
         Starting File System Check on /dev/disk/by-uuid/c393...21580d653d23...
[  OK  ] Reached target Sound Card.
[   45.408000] systemd-fsck[201]: /dev/sdb2 was not cleanly unmounted, check forced.
[   49.760000] systemd-fsck[201]: /dev/sdb2: 27/63488 files (11.1% non-contiguous), 94612/126976 blocks
[  OK  ] Started File System Check on /dev/disk/by-uuid/c393b...9-21580d653d23.
         Mounting /boot...
[   50.144000] EXT4-fs (sdb2): mounting ext2 file system using the ext4 subsystem
[   50.244000] EXT4-fs (sdb2): mounted filesystem without journal. Opts: (null)
[  OK  ] Mounted /boot.
[  OK  ] Reached target Local File Systems.
         Starting Create Volatile Files and Directories...
[  OK  ] Reached target Remote File Systems.
         Starting Trigger Flushing of Journal to Persistent Storage...
         Starting LSB: Raise network interfaces....
[  OK  ] Started Create Volatile Files and Directories.
[   50.884000] systemd-journald[152]: Received request to flush runtime journal from PID 1
         Starting Update UTMP about System Boot/Shutdown...
[  OK  ] Started Trigger Flushing of Journal to Persistent Storage.
[  OK  ] Started Update UTMP about System Boot/Shutdown.
[  OK  ] Started LSB: Raise network interfaces..
         Starting ifup for eth0...
[  OK  ] Started ifup for eth0.
[  OK  ] Reached target Network.
[  OK  ] Reached target Network is Online.
         Starting LSB: RPC portmapper replacement...
[  OK  ] Started LSB: RPC portmapper replacement.
[  OK  ] Reached target RPC Port Mapper.
         Starting LSB: NFS support files common to client and server...
[   54.572000] RPC: Registered named UNIX socket transport module.
[   54.640000] RPC: Registered udp transport module.
[   54.700000] RPC: Registered tcp transport module.
[   54.756000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   54.948000] FS-Cache: Loaded
[   55.152000] FS-Cache: Netfs 'nfs' registered for caching
[   55.508000] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[   55.752000] net eth0: Setting full-duplex based on MII#1 link partner capability of c1e1
[  OK  ] Started LSB: NFS support files common to client and server.
[  OK  ] Reached target System Initialization.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Reached target Sockets.
[  OK  ] Reached target Timers.
[  OK  ] Reached target Basic System.
         Starting Deferred execution scheduler...
[  OK  ] Started Deferred execution scheduler.
         Starting Regular background program processing daemon...
[  OK  ] Started Regular background program processing daemon.
         Starting System Logging Service...
         Starting OpenBSD Secure Shell server...
[  OK  ] Started OpenBSD Secure Shell server.
         Starting /etc/rc.local Compatibility...
         Starting Permit User Sessions...
         Starting Login Service...
         Starting D-Bus System Message Bus...
[  OK  ] Started D-Bus System Message Bus.
         Starting LSB: exim Mail Transport Agent...
[  OK  ] Started System Logging Service.
[  OK  ] Started /etc/rc.local Compatibility.
[  OK  ] Started Permit User Sessions.
         Starting Getty on tty1...
[  OK  ] Started Getty on tty1.
         Starting Serial Getty on ttyS0...
[  OK  ] Started Serial Getty on ttyS0.
[  OK  ] Reached target Login Prompts.
[  OK  ] Started Login Service.
[  OK  ] Started LSB: exim Mail Transport Agent.
[  OK  ] Reached target Multi-User System.
[  OK  ] Reached target Graphical Interface.
         Starting Update UTMP about System Runlevel Changes...
[  OK  ] Started Update UTMP about System Runlevel Changes.

Debian GNU/Linux jessie/sid ls3017 ttyS0

ls3017 login: root
Password: 
Last login: Mon Oct  6 08:58:55 EDT 2014 from ls3530 on pts/1
Linux ls3017 3.16-2-parisc64-smp #1 SMP Debian 3.16.3-2 (2014-10-07) parisc64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
ps -efroot@ls3017:~# ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0 16 15:00 ?        00:00:18 /sbin/init
root         2     0  0 15:00 ?        00:00:00 [kthreadd]
root         3     2  0 15:00 ?        00:00:00 [ksoftirqd/0]
root         4     2  0 15:00 ?        00:00:00 [kworker/0:0]
root         5     2  0 15:00 ?        00:00:00 [kworker/0:0H]
root         6     2  0 15:00 ?        00:00:00 [kworker/u16:0]
root         7     2  0 15:00 ?        00:00:00 [kworker/u17:0]
root         8     2  1 15:00 ?        00:00:01 [rcu_sched]
root         9     2  0 15:00 ?        00:00:00 [rcu_bh]
root        10     2  0 15:00 ?        00:00:00 [migration/0]
root        11     2  0 15:00 ?        00:00:00 [khelper]
root        12     2  0 15:00 ?        00:00:00 [kdevtmpfs]
root        13     2  0 15:00 ?        00:00:00 [netns]
root        14     2  0 15:00 ?        00:00:00 [migration/1]
root        15     2  0 15:00 ?        00:00:00 [ksoftirqd/1]
root        16     2  0 15:00 ?        00:00:00 [kworker/1:0]
root        17     2  0 15:00 ?        00:00:00 [kworker/1:0H]
root        18     2  0 15:00 ?        00:00:00 [kworker/0:1]
root        19     2  0 15:00 ?        00:00:00 [kworker/1:1]
root        20     2  0 15:00 ?        00:00:00 [kpowerswd]
root        21     2  0 15:00 ?        00:00:00 [khungtaskd]
root        22     2  0 15:00 ?        00:00:00 [writeback]
root        23     2  0 15:00 ?        00:00:00 [ksmd]
root        24     2  0 15:00 ?        00:00:00 [crypto]
root        25     2  0 15:00 ?        00:00:00 [kintegrityd]
root        26     2  0 15:00 ?        00:00:00 [bioset]
root        27     2  0 15:00 ?        00:00:00 [kblockd]
root        28     2  0 15:00 ?        00:00:00 [kswapd0]
root        29     2  0 15:00 ?        00:00:00 [fsnotify_mark]
root        35     2  0 15:00 ?        00:00:00 [kthrotld]
root        36     2  0 15:00 ?        00:00:00 [led_wq]
root        37     2  0 15:00 ?        00:00:00 [kworker/u16:1]
root        38     2  0 15:00 ?        00:00:00 [ipv6_addrconf]
root        39     2  0 15:00 ?        00:00:00 [deferwq]
root        76     2  0 15:00 ?        00:00:00 [khubd]
root        77     2  0 15:00 ?        00:00:00 [ata_sff]
root        78     2  0 15:00 ?        00:00:00 [scsi_eh_0]
root        79     2  0 15:00 ?        00:00:00 [scsi_tmf_0]
root        80     2  0 15:00 ?        00:00:00 [kworker/u16:2]
root        81     2  0 15:00 ?        00:00:00 [scsi_eh_1]
root        82     2  0 15:00 ?        00:00:00 [scsi_tmf_1]
root        83     2  0 15:00 ?        00:00:00 [kworker/1:1H]
root        84     2  3 15:00 ?        00:00:03 [kworker/u16:3]
root        85     2  0 15:00 ?        00:00:00 [scsi_eh_2]
root        86     2  0 15:00 ?        00:00:00 [scsi_tmf_2]
root        87     2  0 15:00 ?        00:00:00 [kworker/u16:4]
root        88     2  0 15:00 ?        00:00:00 [scsi_eh_3]
root        89     2  0 15:00 ?        00:00:00 [scsi_tmf_3]
root        90     2  0 15:00 ?        00:00:00 [kworker/u16:5]
root        92     2  0 15:00 ?        00:00:00 [kworker/u16:6]
root        96     2  0 15:00 ?        00:00:00 [kworker/0:2]
root        99     2  0 15:00 ?        00:00:00 [kworker/0:1H]
root       101     2  0 15:00 ?        00:00:00 [kworker/1:2]
root       120     2  0 15:00 ?        00:00:00 [jbd2/sdb5-8]
root       121     2  0 15:00 ?        00:00:00 [ext4-rsv-conver]
root       152     1  2 15:00 ?        00:00:01 /lib/systemd/systemd-journald
root       153     2  0 15:00 ?        00:00:00 [kauditd]
root       165     1  1 15:00 ?        00:00:00 /lib/systemd/systemd-udevd
root       177     2  0 15:00 ?        00:00:00 [kworker/1:3]
root       207     2  0 15:00 ?        00:00:00 [ext4-rsv-conver]
root       282     1  0 15:00 ?        00:00:00 /sbin/rpcbind -w
root       288     1  0 15:00 ?        00:00:00 dhclient -v -pf /run/dhclient.et
statd      312     1  0 15:00 ?        00:00:00 /sbin/rpc.statd
root       317     2  0 15:00 ?        00:00:00 [rpciod]
root       320     2  0 15:01 ?        00:00:00 [nfsiod]
root       327     1  0 15:01 ?        00:00:00 /usr/sbin/rpc.idmapd
daemon     328     1  0 15:01 ?        00:00:00 /usr/sbin/atd -f
root       329     1  0 15:01 ?        00:00:00 /usr/sbin/cron -f
root       330     1  0 15:01 ?        00:00:00 /usr/sbin/rsyslogd -n
root       331     1  0 15:01 ?        00:00:00 /usr/sbin/sshd -D
root       335     1  0 15:01 ?        00:00:00 /lib/systemd/systemd-logind
message+   336     1  0 15:01 ?        00:00:00 /usr/bin/dbus-daemon --system --
root       357     1  0 15:01 tty1     00:00:00 /sbin/agetty --noclear tty1 linu
root       370     1  0 15:01 ttyS0    00:00:00 /bin/login --     
Debian-+   598     1  0 15:01 ?        00:00:00 /usr/sbin/exim4 -bd -q30m
root       604     1 17 15:01 ?        00:00:00 /lib/systemd/systemd --user
root       606   604  0 15:01 ?        00:00:00 (sd-pam)  
root       608   370 29 15:01 ttyS0    00:00:00 -bash
root       614   608  0 15:01 ttyS0    00:00:00 ps -ef


--------------060109070908020206020206--
