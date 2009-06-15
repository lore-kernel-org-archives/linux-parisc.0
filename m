From: Meelis Roos <mroos@linux.ee>
Subject: HPPA hang with PCI SERR or PARITY enabling
Date: Mon, 15 Jun 2009 13:24:18 +0300 (EEST)
Message-ID: <Pine.SOC.4.64.0906151310150.20680@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I found that my L1000 fails to boot wiath any new kernel (anything 
2.6.26+ I tried). In my case, it stops after tulip initialization and 
other people have seen it too:
http://www.mail-archive.com/debian-hppa@lists.debian.org/msg06301.html

The last lines are

tulip 0000:18:00.0: enabling device (0000 -> 0003)
tulip 0000:18:00.0: enabling SERR and PARITY (0003 -> 0143)

In some other cases, people see similar errors from sym53c8xx:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=519984

sym53c8xx 0000:d0:00.0: enabling device (0000 -> 0003)
sym53c8xx 0000:d0:00.0: enabling SERR and PARITY (0003 -> 0143)

In my case, Debians 2.6.26 UP kernel sometimes boots, I think I have 
also seen 2.6.30-rc2 booting once. Debian 2.6.26 SMP, 2.6.29 SMP and 
handcompiled newer kernels have failed the same. It does not fail on 
sym53c8xx for me.

I have only tried 64-bit kernels.

Full dmesg from my L1000:

Main Menu: Enter command or menu > bo
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.14 root@penalosa Wed Oct  8 15:04:37 UTC 2008
Skipping extended partition 6 - beyond reach of IPL

Partition Start(MB) End(MB) Id Type
1               1      31   f0 Palo
2              32     156   83 ext2
5             157   33408   83 ext2

PALO(F0) partition contains:
    0/vmlinux64 6240197 bytes @ 0x48000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
Selected ramdisk: /initrd.img from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4784128 mediaptr 0x1000
Segment 1 load 00628000 size 403984 mediaptr 0x491000
Segment 2 load 0068c000 size 317824 mediaptr 0x4f4000
Loading ramdisk 7887983 bytes @ 3f868000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.29-2-parisc64-smp (Debian 2.6.29-5) (waldi@debian.org) (gcc version 4.3.3 (GCC) ) #1 SMP Mon May 18 14:55:30 UTC 2009
[    0.000000] unwind_init: start = 0x404bf0a4, end = 0x404eb424, entries = 11320
[    0.000000] WARNING: Out of order unwind entry! 00000000404c0fb4 and 00000000404c0fc4
[    0.000000] WARNING: Out of order unwind entry! 00000000404c0fc4 and 00000000404c0fd4
[    0.000000] FP[0] enabled: Rev 1 Model 16
[    0.000000] The 64-bit Kernel has started...
[    0.000000] console [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 00005c90 00000491 00000000 00000002 2353fbcb 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000203
[    0.000000] CPUID vers 17 rev 8 (0x00000228)
[    0.000000] capabilities 0x1
[    0.000000] model 9000/800/L1000-44
[    0.000000] Total Memory: 3072 MB
[    0.000000] initrd: 7f868000-7ffedc6f
[    0.000000] initrd: reserving 3f868000-3ffedc6f (mem_max c0000000)
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 775680
[    0.000000] Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
[    0.000000] PID hash table entries: 4096 (order: 12, 32768 bytes)
[17179569.184000] Console: colour dummy device 160x64
[17179569.204000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
[17179569.244000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
[17179569.764000] Memory: 3075708k/3145728k available (3164k kernel code, 69364k reserved, 1459k data, 312k init)
[17179569.772000] virtual kernel memory layout:
[17179569.772000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
[17179569.772000]     memory  : 0x0000000040000000 - 0x0000000100000000   (3072 MB)
[17179569.772000]       .init : 0x000000004068c000 - 0x00000000406da000   ( 312 kB)
[17179569.772000]       .data : 0x00000000404173d0 - 0x0000000040584000   (1459 kB)
[17179569.772000]       .text : 0x0000000040100000 - 0x00000000404173d0   (3164 kB)
[17179569.848000] Calibrating delay loop... 876.54 BogoMIPS (lpj=1753088)
[17179569.944000] Security Framework initialized
[17179569.952000] SELinux:  Disabled at boot.
[17179569.964000] Mount-cache hash table entries: 256
[17179570.064000] Initializing cgroup subsys ns
[17179570.072000] Initializing cgroup subsys cpuacct
[17179570.080000] Initializing cgroup subsys devices
[17179570.084000] Initializing cgroup subsys freezer
[17179570.092000] Initializing cgroup subsys net_cls
[17179570.104000] Brought up 1 CPUs
[17179570.348000] net_namespace: 1880 bytes
[17179570.356000] regulator: core version 0.5
[17179570.484000] NET: Registered protocol family 16
[17179570.496000] EISA bus registered
[17179570.504000] Searching for devices...
[17179571.080000] Found devices:
[17179571.084000] 1. Rhapsody DC- 440 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5c9, 0x00004 }
[17179571.096000] 2. Rhapsody DC- 440 at 0xfffffffffffa6000 [166] { 0, 0x0, 0x5c9, 0x00004 }
[17179571.104000] 3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x095, 0x00009 }
[17179571.108000] 4. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
[17179571.116000] 5. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
[17179571.192000] 6. Elroy PCI Bridge at 0xfffffffffed32000 [0/1] { 13, 0x0, 0x782, 0x0000a }
[17179571.200000] 7. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
[17179571.208000] 8. Elroy PCI Bridge at 0xfffffffffed36000 [0/3] { 13, 0x0, 0x782, 0x0000a }
[17179571.216000] 9. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
[17179571.224000] 10. Elroy PCI Bridge at 0xfffffffffed3a000 [0/5] {
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         FLASH     ON         ON
LED State: Unexpected Reboot. Running non-OS code. Non-critical error detected.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
[17179572.328000] powersw: Soft power switch support not available.
[17179572.344000] bio: create slab <bio-0> at 0
[17179572.480000] NET: Registered protocol family 2
[17179572.540000] IP route cache hash table entries: 131072 (order: 8, 1048576 bytes)
[17179572.548000] TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
[17179572.624000] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[17179572.748000] TCP: Hash tables configured (established 262144 bind 65536)
[17179572.756000] TCP reno registered
[17179572.896000] NET: Registered protocol family 1
[17179572.900000] checking if image is initramfs... it is
[17179576.384000] Freeing initrd memory: 7703k freed
[17179576.396000] Chassis warnings not supported.
[17179576.404000] Performance monitoring counters enabled for Rhapsody DC- 440
[17179576.416000] audit: initializing netlink socket (disabled)
[17179576.428000] type=2000 audit(1245059087.144:1): initialized
[17179576.440000] VFS: Disk quotas dquot_6.5.2
[17179576.448000] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[17179576.472000] msgmni has been set to 6023
[17179576.484000] alg: No test for stdrng (krng)
[17179576.492000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[17179576.504000] io scheduler noop registered
[17179576.508000] io scheduler anticipatory registered
[17179576.512000] io scheduler deadline registered
[17179576.516000] io scheduler cfq registered (default)
[17179576.616000] PDC Stable Storage facility v0.30
[17179577.436000] STI GSC/PCI core graphics driver Version 0.9a
[17179577.464000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[17179577.476000] serial 0000:00:04.0: enabling device (0146 -> 0147)
[17179577.488000] 0000:00:04.0: ttyS0 at MMIO 0xfffffffff8000000 (irq = 70) is a 16550A
[17179577.496000] console handover: boot [ttyB0] -> real [ttyS0]
[17179577.512000] 0000:00:04.0: ttyS1 at MMIO 0xfffffffff8000008 (irq = 70) is a 16550A
[17179577.536000] 0000:00:04.0: ttyS2 at MMIO 0xfffffffff8000010 (irq = 70) is a 16550A
[17179577.552000] serial 0000:00:05.0: enabling device (0000 -> 0003)
[17179577.564000] serial 0000:00:05.0: enabling SERR and PARITY (0003 -> 0143)
[17179577.576000] 0000:00:05.0: ttyS3 at MMIO 0xfffffffff8005000 (irq = 71) is a 16550A
[17179577.588000] Couldn't register serial port 0000:00:05.0: -28
[17179577.688000] brd: module loaded
[17179577.816000] mice: PS/2 mouse device common for all mice
[17179577.824000] rtc-parisc rtc-parisc: rtc core: registered rtc-parisc as rtc0
[17179577.840000] TCP cubic registered
[17179577.956000] NET: Registered protocol family 17
[17179577.960000] registered taskstats version 1
[17179578.100000] rtc-parisc rtc-parisc: setting system clock to 2009-06-15 09:44:48 UTC (1245059088)
[17179578.112000] Freeing unused kernel memory: <0>------------[ cut here ]------------
[17179578.248000] Badness at /build/buildd/linux-2.6-2.6.29/debian/build/source_hppa_none/kernel/smp.c:329
[17179578.256000] 
[17179578.256000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[17179578.260000] PSW: 00001000000001100000000000001110 Not tainted
[17179578.268000] r00-03  000000000806000e 00000000406829c0 0000000040181194 0000000040590020
[17179578.272000] r04-07  00000000406791c0 000000004065e6a0 0000000000000000
[17179578.808000] r08-11  000000004065e6a0 0000000000000000 00000000406841c0 0000000000000001
[17179578.820000] r12-15  000000004067a9c0 0000000000000000 00000000406791c0 00000000000000ff
[17179578.828000] r16-19  00000000406809c0 00000000406879c0 00000000ff83a268 00000000406da000
[17179578.836000] r20-23  0000000000000000 00000000406da000 fffffffffffffffe 0000000000000001
[17179578.844000] r24-27  0000000000000000 000000004065e6a0 00000000404fdfa0 0000000049.236000] r28-31  000000000800000e 00000000ff8404a0 00000000ff840590 0000000000000000
[17179579.376000] sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[17179579.392000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[17179579.400000] 
[17179579.400000] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040180e34 0000000040180e38
[17179579.408000]  IIR: 03ffe01f    ISR: 0000000010340000  IOR: 000002fe10040510
[17179579.416000]  CPU:        0   CR30: 00000000ff840000 CR31: 0000000009.812000]  ORIG_R28: 000000000800000e
[17179579.940000]  IAOQ[0]: smp_call_function_many+0x44/0x368
[17179579.948000]  IAOQ[1]: smp_call_function_many+0x48/0x368
[17179579.956000]  RP(r2): smp_call_function+0x3c/0x50
[17179579.960000] Backtrace:
[17179579.960000]  [<0000000040181194>] smp_call_function+0x3c/0x50
[17179579.964000]  [<00000000401a1504>] call_rcu+0x44/0x58
[17179580.216000] 
[17179580.348000] ------------[ cut here ]------------
[17179580.356000] Badness at /build/buildd/linux-2.6-2.6.29/debian/build/source_hppa_none/kernel/smp.c:226
[17179580.364000] 
[17179580.364000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[17179580.372000] PSW: 00001000000001101111111000001110 Tainted: G        W 
[17179580.376000] r00-03  000000ff0806fe0e 000000004067e1c0 0000000040180f1c 0000000000000000
[17179580.384000] r04-07  00000000406791c0 0000000005e6a0 0000000000000000
[17179580.924000] r08-11  000000004065e6a0 0000000000000000 00000000406841c0 0000000000000001
[17179580.936000] r12-15  000000004067a9c0 0000000000000000 00000000406791c0 00000000000000ff
[17179580.944000] r16-19  00000000406809c0 00000000406879c0 00000000ff83a268 0000000000000008
[17179580.952000] r20-23  00000000404fdfa0 0000000000000002 fffffffffffffffe 0000000000000001
[17179580.956000] r24-27  0000000000000000 000000004065e6a0 0000000000000001 000000004[17179581.340000] r28-31  000000000800000e 00000000ff840560 00000000ff840660 0000000000000008
[17179581.348000] sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[17179581.356000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[17179581.364000] 
[17179581.368000] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040180cd0 0000000040180cd4
[17179581.376000]  IIR: 03ffe01f    ISR: 000: 000002fe100405e0
[17179581.908000]  CPU:        0
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
Begin: Loading essential drivers ... WARNING: All config files need .conf: /etc/modprobe.d/pnp-hotplug, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/display_class, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/blacklist, it will be ignored in a future release.
[17179582.992000] SCSI subsystem initialized
WARNING: All config files need .conf: /etc/modprobe.d/pnp-hotplug, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/display_class, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/blacklist, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/pnp-hotplug, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/display_class, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/blacklist, it will be ignored in a future release.
done.
Begin: Running /scripts/init-premount ... [17179583.808000] Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
[17179583.876000] tulip 0000:00:00.0: enabling device (0140 -> 0143)
[17179583.896000] tulip0: no phy info, aborting mtable build
[17179584.016000] tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
[17179584.040000] eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0xfffffffff8006000, 00:10:83:fe:9c:b0, IRQ 66.
[17179584.300000] tulip 0000:18:00.0: enabling device (0000 -> 0003)
[17179584.308000] tulip 0000:18:00.0: enabling SERR and PARITY (0003 -> 0143)

************* SYSTEM ALERT **************
SYSTEM NAME: scaspdb24
DATE: 06/15/2009 TIME: 09:44:55
ALERT LEVEL: 7 = reserved

REASON FOR ALERT
SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       OFF      FLASH         FLASH     ON         ON
LED State: Unrecognized state - Refer to LED Decoder on your Support CD.

0x0000007000FF6292 000000F0 F0000000 - type  0 = Data Field Unused
0x5800087000FF6292 00006D05 0F092C37 - type 11 = Timestamp 06/15/2009 09:44:55
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:a
*****************************************

-- 
Meelis Roos (mroos@linux.ee)
