From: Meelis Roos <mroos@linux.ee>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Thu, 30 Jul 2009 20:58:57 +0300 (EEST)
Message-ID: <Pine.SOC.4.64.0907302054100.20870@math.ut.ee>
References: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > 0x0000007000FF6292 000000F0 F0000000 - type  0 = Data Field Unused
> > 0x5800087000FF6292 00006D05 0F092C37 - type 11 = Timestamp 06/15/2009 09:44:55
> 
> I believe FF6292 is a HPMC.  Please collect and post the "ser pim" output
> for the above.  It would also help if the location of the HPMC can be related
> to your compiled kernel using objdump.

Well, it took some time, but I'm back to it. I rebooted a 
Debian-packaged kernel and got SER PIM output as well for the same boot. 
I also checked that there's nothing more in GSP console log.

As I can't boot it up with any kernel currently, I could not objdump the 
specific image, but I know it's 2.6.29-5 version of Debian 
2.6.29-2-parisc64-smp kernel. Will investigate if I get a match - what 
address should I be decoding?

Main Menu: Enter command or menu > bo
NOTICE: System integrity at risk when selftest(s) are disabled.
        Enabling selftests with "ser sel on" will prevent this note.
        Do you wish to continue the boot?  [Y] or N: y
Interact with IPL (Y, N, or Cancel)?> y

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
PALO will choose the console currently used by firmware (serial).Current command line:
2/vmlinux root=/dev/sda5 initrd=2/initrd.img HOME=/ console=ttyS0 TERM=vt102
 0: 2/vmlinux
 1: root=/dev/sda5
 2: initrd=2/initrd.img
 3: HOME=/
 4: console=ttyS0
 5: TERM=vt102

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 0 l
Directory listing of /.

  lost+found
  vmlinux
  initrd.img-2.6.29-rc1.bak
  initrd.img
  vmlinux.old
  System.map-2.6.29-rc1
  vmlinux-2.6.29-rc1
  config-2.6.29-rc8
  System.map-2.6.29-rc8
  vmlinux-2.6.29-rc8
  initrd.img-2.6.29-rc8
  config-2.6.29-rc1
  initrd.img-2.6.29-rc1
  System.map-2.6.26-1-parisc64-smp
  System.map-2.6.26-1-parisc64
  config-2.6.26-1-parisc64
  vmlinux-2.6.26-1-parisc64
  vmlinux-2.6.26-1-parisc64-smp
  config-2.6.26-1-parisc64-smp
  initrd.img-2.6.26-1-parisc64-smp
  initrd.img-2.6.26-1-parisc64
  initrd.img.old
  initrd.img-2.6.26-1-parisc64-smp.bak
  System.map-2.6.29-2-parisc64-smp
  vmlinux-2.6.29-2-parisc64-smp
  config-2.6.29-2-parisc64-smp
  initrd.img-2.6.29-2-parisc64-smp

Current command line:
2/vmlinux root=/dev/sda5 initrd=2/initrd.img HOME=/ console=ttyS0 TERM=vt102
 0: 2/vmlinux
 1: root=/dev/sda5
 2: initrd=2/initrd.img
 3: HOME=/
 4: console=ttyS0
 5: TERM=vt102

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 0
2/vmlinux-2.6.29-2-parisc64-smp
Current command line:
2/vmlinux-2.6.29-2-parisc64-smp root=/dev/sda5 initrd=2/initrd.img HOME=/ console=ttyS0 TERM=vt102
 0: 2/vmlinux-2.6.29-2-parisc64-smp
 1: root=/dev/sda5
 2: initrd=2/initrd.img
 3: HOME=/
 4: console=ttyS0
 5: TERM=vt102

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 0 2
initrd=2/initrd.img-2.6.29-2-parisc64-smp
Current command line:
2/vmlinux-2.6.29-2-parisc64-smp root=/dev/sda5 initrd=2/initrd.img-2.6.29-2-parisc64-smp HOME=/ console=ttyS0 TERM=vt102
 0: 2/vmlinux-2.6.29-2-parisc64-smp
 1: root=/dev/sda5
 2: initrd=2/initrd.img-2.6.29-2-parisc64-smp
 3: HOME=/
 4: console=ttyS0
 5: TERM=vt102

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? 0 b

Command line for kernel: 'root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.29-2-parisc64-smp'
Selected kernel: /vmlinux-2.6.29-2-parisc64-smp from partition 2
Selected ramdisk: /initrd.img-2.6.29-2-parisc64-smp from partition 2
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
[    0.000000] Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.29-2-parisc64-smp
[    0.000000] PID hash table entries: 4096 (order: 12, 32768 bytes)
[17179569.184000] Console: colour dummy device 160x64
[17179569.200000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
[17179569.240000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
[17179569.760000] Memory: 3075708k/3145728k available (3164k kernel code, 69364k reserved, 1459k data, 312k init)
[17179569.772000] virtual kernel memory layout:
[17179569.772000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
[17179569.772000]     memory  : 0x0000000040000000 - 0x0000000100000000   (3072 MB)
[17179569.772000]       .init : 0x000000004068c000 - 0x00000000406da000   ( 312 kB)
[17179569.772000]       .data : 0x00000000404173d0 - 0x0000000040584000   (1459 kB)
[17179569.772000]       .text : 0x0000000040100000 - 0x00000000404173d0   (3164 kB)
[17179569.840000] Calibrating delay loop... 876.54 BogoMIPS (lpj=1753088)
[17179569.936000] Security Framework initialized
[17179569.944000] SELinux:  Disabled at boot.
[17179569.956000] Mount-cache hash table entries: 256
[17179570.060000] Initializing cgroup subsys ns
[17179570.068000] Initializing cgroup subsys cpuacct
[17179570.072000] Initializing cgroup subsys devices
[17179570.076000] Initializing cgroup subsys freezer
[17179570.080000] Initializing cgroup subsys net_cls
[17179570.096000] Brought up 1 CPUs
[17179570.348000] net_namespace: 1880 bytes
[17179570.352000] regulator: core version 0.5
[17179570.480000] NET: Registered protocol family 16
[17179570.492000] EISA bus registered
[17179570.500000] Searching for devices...
[17179571.076000] Found devices:
[17179571.080000] 1. Rhapsody DC- 440 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5c9, 0x00004 }
[17179571.092000] 2. Rhapsody DC- 440 at 0xfffffffffffa6000 [166] { 0, 0x0, 0x5c9, 0x00004 }
[17179571.100000] 3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x095, 0x00009 }
[17179571.108000] 4. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
[17179571.112000] 5. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
[17179571.188000] 6. Elroy PCI Bridge at 0xfffffffffed32000 [0/1] { 13, 0x0, 0x782, 0x0000a }
[17179571.196000] 7. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
[17179571.204000] 8. Elroy PCI Bridge at 0xfffffffffed36000 [0/3] { 13, 0x0, 0x782, 0x0000a }
[17179571.212000] 9. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
[17179571.220000] 10. Elroy PCI Bridge at 0xfffffffffed3a000 [0/5] {
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
[17179572.312000] powersw: Soft power switch support not available.
[17179572.328000] bio: create slab <bio-0> at 0
[17179572.480000] NET: Registered protocol family 2
[17179572.540000] IP route cache hash table entries: 131072 (order: 8, 1048576 bytes)
[17179572.552000] TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
[17179572.624000] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[17179572.748000] TCP: Hash tables configured (established 262144 bind 65536)
[17179572.756000] TCP reno registered
[17179572.768000] NET: Registered protocol family 1
[17179572.880000] checking if image is initramfs... it is
[17179576.376000] Freeing initrd memory: 7703k freed
[17179576.384000] Chassis warnings not supported.
[17179576.392000] Performance monitoring counters enabled for Rhapsody DC- 440
[17179576.404000] audit: initializing netlink socket (disabled)
[17179576.416000] type=2000 audit(1248974998.722:1): initialized
[17179576.428000] VFS: Disk quotas dquot_6.5.2
[17179576.436000] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[17179576.460000] msgmni has been set to 6023
[17179576.468000] alg: No test for stdrng (krng)
[17179576.476000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[17179576.488000] io scheduler noop registered
[17179576.492000] io scheduler anticipatory registered
[17179576.496000] io scheduler deadline registered
[17179576.500000] io scheduler cfq registered (default)
[17179576.604000] PDC Stable Storage facility v0.30
[17179577.424000] STI GSC/PCI core graphics driver Version 0.9a
[17179577.456000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[17179577.464000] serial 0000:00:04.0: enabling device (0146 -> 0147)
[17179577.476000] 0000:00:04.0: ttyS0 at MMIO 0xfffffffff8000000 (irq = 70) is a 16550A
[17179577.484000] console handover: boot [ttyB0] -> real [ttyS0]
[17179577.500000] 0000:00:04.0: ttyS1 at MMIO 0xfffffffff8000008 (irq = 70) is a 16550A
[17179577.524000] 0000:00:04.0: ttyS2 at MMIO 0xfffffffff8000010 (irq = 70) is a 16550A
[17179577.536000] serial 0000:00:05.0: enabling device (0000 -> 0003)
[17179577.548000] serial 0000:00:05.0: enabling SERR and PARITY (0003 -> 0143)
[17179577.564000] 0000:00:05.0: ttyS3 at MMIO 0xfffffffff8005000 (irq = 71) is a 16550A
[17179577.576000] Couldn't register serial port 0000:00:05.0: -28
[17179577.680000] brd: module loaded
[17179577.804000] mice: PS/2 mouse device common for all mice
[17179577.816000] rtc-parisc rtc-parisc: rtc core: registered rtc-parisc as rtc0
[17179577.828000] TCP cubic registered
[17179577.944000] NET: Registered protocol family 17
[17179577.956000] registered taskstats version 1
[17179578.088000] rtc-parisc rtc-parisc: setting system clock to 2009-07-30 17:30:00 UTC (1248975000)
[17179578.100000] Freeing unused kernel memory: <0>------------[ cut here ]------------
[17179578.236000] Badness at /build/buildd/linux-2.6-2.6.29/debian/build/source_hppa_none/kernel/smp.c:329
[17179578.372000] 
[17179578.372000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[17179578.376000] PSW: 00001000000001100000000000001110 Not tainted
[17179578.512000] r00-03  000000000806000e 00000000406829c0 0000000040181194 0000000040590020
[17179578.652000] r04-07  00000000406791c0 000000004065e6a0 0000000000000000 00000000404fdfa0
[17179578.660000] r08-11  000000004065e6a0 0000000000000000 00000000406841c0 0000000000000001
[17179578.668000] r12-15  000000004067a9c0 0000000000000000 00000000406791c0 00000000000000ff
[17179578.676000] r16-19  00000000406809c0 00000000406879c0 00000000ff83a268 000000004[17179579.072000] r20-23  0000000000000000 00000000406da000 fffffffffffffffe 0000000000000001
[17179579.084000] r24-27  0000000000000000 000000004065e6a0 00000000404fdfa0 00000000406791c0
[17179579.092000] r28-31  000000000800000e 00000000ff8404a0 00000000ff840590 0000000000000000
[17179579.100000] sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[17179579.108000] sr04-07  0000000000000000 0000000000000000 000000000000000
[17179579.640000] 
[17179579.644000] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040180e34 0000000040180e38
[17179579.652000]  IIR: 03ffe01f    ISR: 0000000010340000  IOR: 000002fe10040510
[17179579.660000]  CPU:        0   CR30: 00000000ff840000 CR31: ffffffffffffffff
[17179579.668000]  ORIG_R28: 000000000800000e
[17179579.672000]  IAOQ[0]: smp_call_function_many+0x44/0x368
[17179579.920000]  IAOQ[1]: smp_call_function_many+0x48/0x368
[17179579.928000]  RP(r2): smp_call_function+0x3c/0x50
[17179579.932000] Backtrace:
[17179579.932000]  [<0000000040181194>] smp_call_function+0x3c/0x50
[17179579.940000000401a1504>] call_rcu+0x44/0x58
[17179580.344000] 
[17179580.352000] ------------[ cut here ]------------
[17179580.360000] Badness at /build/buildd/linux-2.6-2.6.29/debian/build/source_hppa_none/kernel/smp.c:226
[17179580.368000] 
[17179580.368000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[17179580.376000] PSW: 00001000000001101111111000001110 Tainted: G        W 
[17179580.380000] r00-03  000000ff0806fe0e 000000004067e1c0 0000000040180f1c 0000000000000000
[17179580.388000] r04-07  00000000406791c0 00000000065e6a0 0000000000000000
[17179580.908000] r08-11  000000004065e6a0 0000000000000000 00000000406841c0 0000000000000001
[17179580.920000] r12-15  000000004067a9c0 0000000000000000 00000000406791c0 00000000000000ff
[17179580.928000] r16-19  00000000406809c0 00000000406879c0 00000000ff83a268 0000000000000008
[17179580.936000] r20-23  00000000404fdfa0 0000000000000002 fffffffffffffffe 0000000000000001
[17179580.944000] r24-27  0000000000000000 000000004065e6a0 0000000000000001 0000000041.340000] r28-31  000000000800000e 00000000ff840560 00000000ff840660 0000000000000008
[17179581.476000] sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[17179581.492000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[17179581.500000] 
[17179581.500000] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040180cd0 0000000040180cd4
[17179581.508000]  IIR: 03ffe01f    ISR: 0000000010340000  IOR: 000002fe100405e0
[17179581.512000]  CPU:        0   CR30: 00000000ff840000 CR31: fffffffff81.908000]  ORIG_R28: 0000000000000001
[17179582.036000]  IA
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
[17179583.088000] SCSI subsystem initialized
WARNING: All config files need .conf: /etc/modprobe.d/pnp-hotplug, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/display_class, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/blacklist, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/pnp-hotplug, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/display_class, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/blacklist, it will be ignored in a future release.
done.
Begin: Running /scripts/init-premount ... [17179583.856000] Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
[17179584.008000] tulip 0000:00:00.0: enabling device (0140 -> 0143)
[17179584.028000] tulip0: no phy info, aborting mtable build
[17179584.140000] tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
[17179584.164000] eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0xfffffffff8006000, 00:10:83:fe:9c:b0, IRQ 66.
[17179584.428000] tulip 0000:18:00.0: enabling device (0000 -> 0003)
[17179584.436000] tulip 0000:18:00.0: enabling SERR and PARITY (0003 -> 0143)

************* SYSTEM ALERT **************
SYSTEM NAME: scaspdb24
DATE: 07/30/2009 TIME: 17:30:06
ALERT LEVEL: 7 = reserved

REASON FOR ALERT
SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

0x0000007000FF6292 000000F0 F0000000 - type  0 = Data Field Unused
0x5800087000FF6292 00006D06 1E111E06 - type 11 = Timestamp 07/30/2009 17:30:06
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:a
*****************************************


Leaving Console Mode - you may lose write access.
When Console Mode returns, type ^Ecf to get console write access.

Service Processor login: 
Service Processor password: 




             Hewlett-Packard Guardian Service Processor


             9000/800/L1000-44 System Name: scaspdb24


GSP Host Name:  scaspdb24
GSP> r ser pim

Unknown Command 


GSP Host Name:  scaspdb24
GSP> rs


RS

Execution of this command irrecoverably halts all system processing and
I/O activity and restarts the computer system.

Type Y to confirm your intention to restart the system: (Y/[N]) y
y
   -> SPU hardware was successfully issued a reset.


GSP Host Name:  scaspdb24
GSP> 
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         FLASH     ON         ON
LED State: Unexpected Reboot. Running non-OS code. Non-critical error detected.
Check Chassis and Console Logs for error messages.

platform                  config                     626F
processor                 slave rendezvous           1C17
processor                 test                       1142
processor                 test                       1100
processor                 test                       1100
processor                 test                       1100
processor                 test                       1100
processor                 test                       1100
processor                 test                       1100
processor                 test                       1100
processor                 test                       1100
processor                 test                       1100
PDH                       config                     322F
PDH                       test                       3149
PDH                       test                       3160
platform                  test                       616A
processor                 test                       1146
processor                 INIT                       1701
processor                 INIT                       1701
processor                 test                       1110
processor                 test                       1110
processor                 test                       1110
processor                 INIT                       1701
processor                 test                       1110
processor                 INIT                       1701
processor                 test                       1110
processor                 test                       1110
processor                 slave rendezvous           1C17
processor                 test                       1142
processor                 slave rendezvous           1C10
processor                 test                       1142
PDH                       test                       3158
PDH                       test                       3157
PDH                       test                       316E
PDH                       test                       316E
PDH                       test                       316E
PDH                       test                       316E
PDH                       test                       316E
PDH                       test                       316E
PDH                       test                       316E
memory                    config                     7210
memory                    INIT                       7702
memory                    INIT                       771D
memory                    test                       7150
memory                    config                     7213
memory                    config                     7213
memory                    config                     7214
memory                    config                     7213
memory                    config                     7213
memory                    config                     7214
memory                    config                     7213
memory                    config                     7213
memory                    config                     7214
memory                    config                     7213
memory                    config                     7213
memory                    config                     7214
memory                    config                     7213
memory                    config                     7213
memory                    config                     7214
memory                    config                     7213
memory                    config                     7213
memory                    config                     7214
memory                    config                     7213
memory                    config                     7213
memory                    config                     7214
memory                    config                     7213
memory                    config                     7213
memory                    config                     7214
memory                    config                     7213
memory                    config                     7213
memory                    config                     7215
memory                    config                     7216
memory                    config                     72A0
memory                    test                       71A1
memory                    test                       71A2
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A3
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A6
memory                    config                     7217
memory                    config                     7218
memory                    config                     72A0
memory                    test                       71A1
memory                    test                       71A2
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A3
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A6
memory                    config                     7210
I/O                       INIT                       8701
I/O                       test                       8118
I/O                       test                       8118
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
I/O                       INIT                       8701
memory                    config                     7240
memory                    INIT                       7702
memory                    config                     7241
memory                    config                     7243
memory                    config                     72A0
memory                    test                       71A1
memory                    test                       71A2
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A3
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A4
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A5
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    test                       71A6
memory                    INIT                       7745
memory                    config                     7240
I/O                       config                     8204
I/O                       config                     8204
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       test                       8119
I/O                       config                     8204
processor                 test                       1120
processor                 test                       1120
processor                 INIT                       1701
processor                 test                       1120
processor                 test                       1120
processor                 test                       1120
processor                 INIT                       1701
processor                 test                       1120
processor                 slave rendezvous           1C40
processor                 test                       1142
platform                  test                       612A
I/O                       config                     8238

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************

Firmware Version  44.28

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2002, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      440  MHz   Active                 Functional         512 KB   1 MB
      3      440  MHz   Idle                   Functional         512 KB   1 MB

  Central Bus Speed (in MHz)  :         82  
  Available Memory            :    3145728  KB
  Good Memory Required        :      22096  KB

   Primary boot path:    0/0/1/1.0           
   Alternate boot path:  0/7/0/0.97.20.19.0.0.5     
   Console path:         0/0/4/0.0           
   Keyboard path:        0/0/4/0.0           


---- Main Menu ---------------------------------------------------------------

     Command                           Description
     -------                           -----------
     BOot [PRI|ALT|<path>]             Boot from specified path
     PAth [PRI|ALT] [<path>]           Display or modify a path
     SEArch [DIsplay|IPL] [<path>]     Search for boot devices

     COnfiguration menu                Displays or sets boot values
     INformation menu                  Displays hardware information
     SERvice menu                      Displays service commands

     DIsplay                           Redisplay the current menu
     HElp [<menu>|<command>]           Display help for menu or command
     RESET                             Restart the system
----
Main Menu: Enter command or menu > ser pim


PROCESSOR PIM INFORMATION

Original Product Number:   A5576A
Current Product Number:    A5576A


-----------------  Processor 0 HPMC Information - PDC Version: 44.28  ------ 

Timestamp =    Thu Jul  30 17:30:07 GMT 2009    (20:09:07:30:17:30:07)

HPMC Chassis Codes 

       Chassis Code        Extension 
       ------------        --------- 
       0x0000082000ff6242  0x0000000000000000
       0x1800082011006312  0xcb81000000000000
       0x0000087000ff6292  0x000000f0f0000000
       0x6000082070006062  0x0000000000100010
       0x7000082070006082  0x0000000000b92400
       0x7000082379006133  0xc1bff0fffed08040
       0x0000080080006310  0x0000000000000001
       0x000008008000631f  0x0000000000000000
       

General Registers 0 - 31
00-03  0000000000000000  00000000402e7098  000000000c1b5c78  000000007f954680
04-07  000000000c1b1000  000000000c1fc800  000000000c1c79b0  000000007f954000
08-11  000000000c1fc830  0000000000000003  00000000fe87e800  000000000c1fc800
12-15  0000000000000000  00000000fb6a2d5e  00000000fb6a2b5e  0000000000000003
16-19  0000000000026420  0000000000000000  00000000fe87e880  000000007f9555b8
20-23  0000000000000000  000000007f9552c0  ffffffffc0000000  0000000000100000
24-27  0000000000000000  0000000000000000  000000000c1fc830  00000000406791c0
28-31  000000000c1b4010  000000007f858be0  000000007f858c90  000000000c1b3fd0


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  000000000000011c  0000000000000000  00000000000000c0  0000000000000001
12-15  0000000000000000  0000000000000000  0000000000103000  ff80000000000000
16-19  0000003aeb5d81e1  0000000000000000  00000000402e70d0  000000000f40109c
20-23  00000000a627ff41  000000004fdfc830  000000ff0804ff0f  8000000000000000
24-27  0000000000586000  000000003f892000  ffffffffffffffff  0000000040001480
28-31  ffffffffffffffff  ffffffffffffff2f  000000007f858000  ffffffffffffffff

Space Registers 0 - 7
00-03  0004d800          00000000          00000000          00047000
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x00000000402e70d4
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000ffd053f830
System Requestor Address     = 0xfffffffffffa0000


Floating Point Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  00000000bf840350  00000000bf840358  0000000000000008
08-11  000000004020b518  00000000ff83a268  0000000000000000  0000000000000002
12-15  00000000ff83fc10  00000000ff8403f0  00000000ff83fc00  00000000406791c0
16-19  0000000000000002  00000000ff83a268  00000000406879c0  00000000406809c0
20-23  00000000000000ff  00000000406791c0  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  fffffffffffff000  00000000fefa6000
28-31  0000000000000000  0000000000000000  ffffffffffffff9c  00000000406791c0


Check Summary                = 0xcb81000000000000
Available Memory             = 0x00000000c0000000
CPU Diagnose Register 2      = 0x0203000100802004
CPU Status Register 0        = 0x2440c24000000000
CPU Status Register 1        = 0x8002000000000000
SADD LOG                     = 0x147ffcffffffffff
Read Short LOG               = 0xc1af00ffd053f830



-----------------  Processor 0 LPMC Information ------------------

Check Type                   = 0x00000000
IC Parity Info               = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000



-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000000000000
CPU State                    = 0x00000000



-----------------  Processor 3 HPMC Information - PDC Version: 44.28  ------ 

Timestamp =    Thu Jul  30 17:30:07 GMT 2009    (20:09:07:30:17:30:07)

HPMC Chassis Codes 

       Chassis Code        Extension 
       ------------        --------- 
       0x0000082000ff6242  0x0000000000000000
       0x1800082011036322  0xcb81800000000000
       

General Registers 0 - 31
00-03  0000000000000000  000000004067a9c0  000000004011c18c  0000000043541518
04-07  00000000406791c0  00000000fc985000  000000007f93f000  0000000000000000
08-11  00000000fca67918  000000007f8d9cc0  00000000404eb740  0000000040000000
12-15  0000000000000000  0000000000000200  0000000040311427  0000000000000000
16-19  00000000419e85c8  000000007f93f888  0000000000000000  0000000000000000
20-23  000000000003f93f  00000000fffffffa  0000000000000000  0000000000000040
24-27  0000000000000010  00000000fc985fc0  000000004050a000  00000000406791c0
28-31  0000000000000001  000000007f94c800  000000007f94c830  00000000005282a3


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000146  0000000000000000  00000000000000c0  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000103000  ff80000000000000
16-19  0000003aeb5d7f36  0000000000000000  000000004011c190  0000000004a01200
20-23  0000000000000000  00000000fc985000  000000ff0804f90f  8000000000000000
24-27  0000000000586000  000000003f952000  fffffffff37f7f00  0000000040001b60
28-31  fffffffff37f7f00  fffffffff37f7f00  000000007f94c000  fffffffff37f7f00

Space Registers 0 - 7
00-03  00051800          00000000          00000000          00051800
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x000000004011c194
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030000d
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0xfffffffffffa6000
System Requestor Address     = 0xfffffffffffa0000


Floating Point Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  00000000bf840350  00000000bf840358  0000000000000008
08-11  000000004020b518  00000000ff83a268  0000000000000000  0000000000000002
12-15  00000000ff83fc10  00000000ff8403f0  00000000ff83fc00  00000000406791c0
16-19  0000000000000002  00000000ff83a268  00000000406879c0  00000000406809c0
20-23  00000000000000ff  00000000406791c0  0000000000000000  0000000a4067a9c0
24-27  0000000000000000  00000000406841c0  fffffffffffff000  00000000fefa6000
28-31  0000000000000000  0000000000000000  ffffffffffffff9c  00000000406791c0


Check Summary                = 0xcb81800000000000
Available Memory             = 0x00000000c0000000
CPU Diagnose Register 2      = 0x0203030100802004
CPU Status Register 0        = 0x3440c24000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x4800000000000000
Read Short LOG               = 0xc13ff0f0f0047218



-----------------  Processor 3 LPMC Information ------------------

Check Type                   = 0x00000000
IC Parity Info               = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000



-----------------  Processor 3 TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000
28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x0000000000000000
CPU State                    = 0x00000000


--------------  Memory Error Log Information  --------------

Bus 0 Log Information

Timestamp =    Thu Jul  30 17:30:07 GMT 2009    (20:09:07:30:17:30:07)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
  X       X     ERR_ERROR       X            X           

Bus Requestor Address      = 0xfffffffffffa0000
Bus Target Address         = 0x0000000000000000
Bus Responder Address      = 0xfffffffffed00000

Error Status Reg           = 0x0000000000100010
Runway Control Reg         = 0x0000021c00001418
Runway Address Reg         = 0xc1bff0fffed08040
Runway Data High Reg       = 0xe840c000083c025c
Runway Data Low Reg        = 0xe840c000083c025c
Memory Address Reg         = 0x000001ff3fffffff
Memory Address Corr Reg    = 0x000001ff3fffffff
Memory Syndrome Reg        = 0x0000000000000000
Memory Syndrome Corr Reg   = 0x0000000000000000



 Address/Control Parity Error Registers  

   Address/Control Parity Error Bit (mem_addr_par_stat) Not Set 



------------  I/O Module Error Log Information  ------------


   No I/O module errors logged


Main Menu: Enter command or menu > 

-- 
Meelis Roos (mroos@linux.ee)
