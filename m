From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: linux-next boot failure
Date: Sun, 20 Mar 2011 16:16:15 -0400
Message-ID: <20110320201614.GA25287@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The current linux-next tree fails to boot on parisc.  I have seen
the same panic on two different systems.  2.6.38-rc5-next-20110218
is ok.  2.6.38-rc8-next-20110311 failed to boot.  The backtrace is
the same in all cases.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Command line for kernel: ' root=/dev/sda3 console=ttyS0 palo_kernel=1/vmlinux'
Selected kernel: /vmlinux from partition 1
Selected ramdisk: /initrd.img from partition 1
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4866048 mediaptr 0x1000
Segment 1 load 00611fd0 size 441320 mediaptr 0x4a5fd0
Segment 2 load 00680000 size 323392 mediaptr 0x512000
Loading ramdisk 11915351 bytes @ 3f491000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.38-rc8-next-20110311+ (dave@gsyprf11) (gcc version 4.5.3 20101230 (prerelease) [gcc-4_5-branch revision 168358] (GCC) ) #1 SMP Sun Mar 13 18:59:47 PDT 2011
[    0.000000] unwind_init: start = 0x404ce000, end = 0x404ff7d0, entries = 12669
[    0.000000] FP[0] enabled: Rev 1 Model 19
[    0.000000] The 64-bit Kernel has started...
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 00005e30 00000491 00000000 00000001 312b7146 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000203
[    0.000000] CPUID vers 19 rev 8 (0x00000268)
[    0.000000] capabilities 0x5
[    0.000000] model 9000/800/A500-7X
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 MB
[    0.000000]  1) Start 0x0000000100000000 End 0x00000001ffffffff Size   4096 MB
[    0.000000]  2) Start 0x00000010f0000000 End 0x00000010ffffffff Size    256 MB
[    0.000000] Total Memory: 8192 MB
[    0.000000] initrd: 7f491000-7ffee057
[    0.000000] initrd: reserving 3f491000-3ffee057 (mem_max 200000000)
[    0.000000] PERCPU: Embedded 10 pages/cpu @0000000044abe000 s12096 r8192 d20672 u40960
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2068480
[    0.000000] Kernel command line:  root=/dev/sda3 console=ttyS0 palo_kernel=1/vmlinux
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Memory: 8226048k/8388608k available (3261k kernel code, 162560k reserved, 1440k data, 316k init)
[    0.000000] virtual kernel memory layout:
[    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
[    0.000000]     memory  : 0x0000000040000000 - 0x0000001140000000   (69632 MB)
[    0.000000]       .init : 0x0000000040680000 - 0x00000000406cf000   ( 316 kB)
[    0.000000]       .data : 0x000000004042f560 - 0x00000000405977a0   (1440 kB)
[    0.000000]       .text : 0x0000000040100000 - 0x000000004042f560   (3261 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	RCU-based detection of stalled CPUs is disabled.
[    0.000000] NR_IRQS:128
[    0.000000] Console: colour dummy device 160x64
[    0.000000] Calibrating delay loop... 1495.04 BogoMIPS (lpj=2990080)
[    0.224000] pid_max: default: 32768 minimum: 301
[    0.224000] Mount-cache hash table entries: 256
[    0.272000] Initializing cgroup subsys ns
[    0.276000] ns_cgroup deprecated: consider using the 'clone_children' flag without the ns_cgroup.
[    0.412000] Initializing cgroup subsys cpuacct
[    0.552000] Initializing cgroup subsys devices
[    0.552000] Brought up 1 CPUs
[    0.556000] NET: Registered protocol family 16
[    0.692000] EISA bus registered
[    0.692000] Searching for devices...
[    0.964000] Found devices:
[    0.964000] 1. Crescendo 750 W2 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5e3, 0x00004 }
[    0.968000] 2. Crescendo 750 W2 at 0xfffffffffffa2000 [162] { 0, 0x0, 0x5e3, 0x00004 }
[    0.968000] 3. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
[    1.108000] 4. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
[    1.248000] 5. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
[    1.388000] 6. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
[    1.528000] 7. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
[    1.528000] 8. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
[    1.668000] Enabling PDC_PAT chass
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
[    3.168000] Freeing initrd memory: 11636k freed
[    3.176000] Chassis warnings not supported.
[    3.176000] Performance monitoring counters enabled for Crescendo 750 W2
[    3.180000] audit: initializing netlink socket (disabled)
[    3.180000] type=2000 audit(1300143168.900:1): initialized
[    3.192000] VFS: Disk quotas dquot_6.5.2
[    3.192000] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    3.200000] msgmni has been set to 16089
[    3.200000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    3.204000] io scheduler noop registered
[    3.204000] io scheduler deadline registered
[    3.212000] io scheduler cfq registered (default)
[    3.216000] PDC Stable Storage facility v0.30
[    3.768000] STI GSC/PCI core graphics driver Version 0.9a
[    3.768000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    3.768000] serial 0000:00:04.1: enabling device (0142 -> 0143)
[    3.792000] 0000:00:04.1: ttyS0 at MMIO 0xfffffffff8000000 (irq = 70) is a 16550A
[    3.792000] console [ttyS0] enabled, bootconsole disabled
[    3.792000] console [ttyS0] enabled, bootconsole disabled
[    3.792000] 0000:00:04.1: ttyS1 at MMIO 0xfffffffff8000008 (irq = 70) is a 16450
[    3.832000] 0000:00:04.1: ttyS2 at MMIO 0xfffffffff8000010 (irq = 70) is a 16550A
[    3.972000] 0000:00:04.1: ttyS3 at MMIO 0xfffffffff8000030 (irq = 70) is a 16550A
[    4.096000] Couldn't register serial port 0000:00:04.1: -28
[    4.112000] brd: module loaded
[    4.112000] mousedev: PS/2 mouse device common for all mice
[    4.248000] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[    4.400000] TCP cubic registered
[    4.400000] NET: Registered protocol family 17
[    4.400000] Registering the dns_resolver key type
[    4.548000] registered taskstats version 1
[    4.552000] rtc-generic rtc-generic: setting syste
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
[    5.468000] Backtrace:
[    5.468000]  [<00000000402de880>] string.clone.2+0x50/0xe8
[    5.468000]  [<00000000402df6ac>] vsnprintf+0x23c/0x450
[    5.468000]  [<00000000402d7a84>] add_uevent_var+0x94/0x110
[    5.468000]  [<0000000040359690>] dev_uevent+0x138/0x1e0
[    5.580000]  [<00000000402d7de4>] kobject_uevent_env+0x23c/0x640
[    5.580000]  [<00000000402d81fc>] kobject_uevent+0x14/0x20
[    5.732000]  [<0000000040357f3c>] store_uevent+0x4c/0x88
[    5.748000]  [<0000000040356e68>] dev_attr_store+0x28/0x38
[    5.880000]  [<000000004027ecf4>] sysfs_write_file+0x124/0x190
[    6.032000]  [<0000000040206c68>] vfs_write+0xa8/0x188
[    6.032000]  [<0000000040206fd0>] sys_write+0x60/0xa0
[    6.108000]  [<0000000040105034>] syscall_exit+0x0/0x14
[    6.180000] 
[    6.180000] 
[    6.180000] Bad Address (null pointer deref?): Code=15 regs=000000012c988940 (Addr=000006c000000000)
[    6.332000] 
[    6.332000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[    6.480000] PSW: 00001000000001001111111000001111 Not tainted
[    6.480000] r00-03  000000ff0804fe0f 000000004067ced0 00000000402de880 000000012c9d3145
[    6.632000] r04-07  000000004065eed0 000000012c9d3904 0009cec000000000 0000000000000000
[    6.784000] r08-11  ffffffffffffffff 00000000000007c6 0000000000000025 0000000000000020
[    6.908000] r12-15  00000000404938cf 000000012c988798 0000000000000011 000000012c9d3145
[    6.932000] r16-19  0000000000000002 000000000000006c 000000000000007a 00000000402df57c
[    7.084000] r20-23  00000000402df688 000000000000ffff 000000000000ffff 0000000000000000
[    7.232000] r24-27  0009cec000000000 ffffffffffffffff 0009cec000000000 000000004065eed0
[    7.384000] r28-31  0009cec000000000 000000012c988910 000000012c988940 0000000000000004
[    7.384000] sr00-03  0000000000017000 0000000000000000 0000000000000000 0000000000017000
[    7.532000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    7.684000] 
[    7.684000] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000402dc7e0 00000000402dc7e4
[    7.836000]  IIR: 0f80101f    ISR: 000000000009c800  IOR: 000006c000000000
[    7.836000]  CPU:        1   CR30: 000000012c988000 CR31: ffef7dfff7fdffff
[    7.988000]  ORIG_R28: 000000012c988af0
[    7.988000]  IAOQ[0]: strnlen+0x10/0x28
[    8.136000]  IAOQ[1]: strnlen+0x14/0x28
[    8.136000]  RP(r2): string.clone.2+0x50/0xe8
[    8.288000] Backtrace:
[    8.288000]  [<00000000402de880>] string.clone.2+0x50/0xe8
[    8.288000]  [<00000000402df6ac>] vsnprintf+0x23c/0x450
[    8.436000]  [<00000000402d7a84>] add_uevent_var+0x94/0x110
[    8.436000]  [<0000000040359690>] dev_uevent+0x138/0x1e0
[    8.588000]  [<00000000402d7de4>] kobject_uevent_env+0x23c/0x640
[    8.588000]  [<00000000402d81fc>] kobject_uevent+0x14/0x20
[    8.740000]  [<0000000040357f3c>] store_uevent+0x4c/0x88
[    8.740000]  [<0000000040356e68>] dev_attr_store+0x28/0x38
[    8.888000]  [<000000004027ecf4>] sysfs_write_file+0x124/0x190
[    8.888000]  [<0000000040206c68>] vfs_write+0xa8/0x188
[    9.040000]  [<0000000040206fd0>] sys_write+0x60/0xa0
[    9.040000]  [<0000000040105034>] syscall_exit+0x0/0x14
[    9.192000] 
[    9.192000] Kernel panic - not syncing: Bad Address (null pointer deref?)
[    9.344000] Backtrace:
[    9.344000]  [<00000000401169d8>] dump_stack+0x18/0x28
[    9.344000]  [<0000000040116abc>] panic+0xd4/0x350
[    9.492000]  [<000000004011e6a0>] parisc_terminate+0x168/0x170
[    9.492000]  [<000000004011c63c>] do_page_fault+0x314/0x370
[    9.644000]  [<000000004011ed9c>] handle_interruption+0x6f4/0x718
[    9.
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         FLASH     ON         ON
LED State: System Running.  Unexpected Reboot.  Non-critical Error Detected.
Check Chassis and Console Logs for error messages.

processor                 system panic               1B00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************


