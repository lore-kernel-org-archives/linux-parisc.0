From: Meelis Roos <mroos@ut.ee>
Subject: hang/panic on reboot (was: unwind)
Date: Thu, 19 Mar 2009 02:33:13 +0200 (EET)
Message-ID: <Pine.SOC.4.64.0903190225350.15071@math.ut.ee>
References: <Pine.SOC.4.64.0903181515460.4740@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.SOC.4.64.0903181515460.4740@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

(talk about todays 2.6.29-rc8+git)

> [    0.000000] Linux version 2.6.29-rc8 (mroos@sidrun) (gcc version 4.3.2 (GCC) ) #1 Tue Mar 17 19:03:54 EET 2009
> [    0.000000] unwind_init: start = 0x403f5e24, end = 0x4041b7f4, entries = 9629
> [    0.000000] WARNING: Out of order unwind entry! 00000000403f7904 and 00000000403f7914
> [    0.000000] WARNING: Out of order unwind entry! 00000000403f7914 and 00000000403f7924
> [    0.000000] FP[0] enabled: Rev 1 Model 16
> [    0.000000] The 64-bit Kernel has started...

It appears there is one serious problem too - hang/panic on reboot when 
killing all processes. Usually it starts spewing out rsyslog illegal 
instruction messages in the loop. Sometimes RCU stall detector chimes in 
periodically, this time I got a panic mentioning unwind. Also, 
"Backtrace:" is mentioned twice (seems strange too).

The RCU stall messages from another boot) look like this:

[42949569.530000] INFO: RCU detected CPU 0 stall (t=4294956953/1000 jiffies)
[42949569.530000] Backtrace:
[42949569.530000]  [<0000000040116ef4>] show_stack+0x14/0x20
[42949569.530000]  [<0000000040111558>] dump_stack+0x18/0x28
[42949569.530000]  [<000000004016e3d4>] __rcu_pending+0x74/0x208
[42949569.530000]  [<000000004016e58c>] rcu_pending+0x24/0x68
[42949569.530000]  [<000000004014808c>] update_process_times+0x54/0xb8
[42949569.530000]  [<0000000040118190>] timer_interrupt+0x158/0x1b0
[42949569.530000]  [<000000004016b1b0>] handle_IRQ_event+0x60/0xc0
[42949569.530000]  [<000000004016b2b8>] __do_IRQ+0xa8/0x1e8
[42949569.530000]  [<00000000401185e8>] do_cpu_irq_mask+0xf8/0x140
[42949569.530000]  [<0000000040104074>] intr_return+0x0/0x4

Please CC: since I'm not subscribed to linux-parisc.


Full serial console log:

-------------------------------------------------------------------------------------

Firmware Version  40.32

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      440  MHz   Active                 Functional         512 KB   1 MB

  Central Bus Speed (in MHz)  :        111  
  Available Memory            :     655360  KB
  Good Memory Required        :       8300  KB

   Primary boot path:    0/0/1/1.15          
   Alternate boot path:  0/0/2/1.15          
   Console path:         0/0/4/0.0           
   Keyboard path:        0/0/4/0.0           


Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

10 seconds expired.
Proceeding...

Trying Primary Boot Path
------------------------
Booting... 
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.14 root@penalosa Wed Oct  8 15:04:37 UTC 2008
Skipping extended partition 6 - beyond reach of IPL

Partition Start(MB) End(MB) Id Type
1               1      31   f0 Palo
2              32     156   83 ext2
5             157    6832   83 ext2

PALO(F0) partition contains:
    0/vmlinux64 5788910 bytes @ 0x48000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
Selected ramdisk: /initrd.img from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 3842048 mediaptr 0x1000
Segment 1 load 0050c000 size 344688 mediaptr 0x3ab000
Segment 2 load 00564000 size 131206 mediaptr 0x400000
Loading ramdisk 6346283 bytes @ 279e1000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[    0.000000] Linux version 2.6.29-rc8 (mroos@sidrun) (gcc version 4.3.3 (GCC) ) #1 Wed Mar 18 17:30:24 EET 2009
[    0.000000] unwind_init: start = 0x403f5e24, end = 0x4041b804, entries = 9630
[    0.000000] WARNING: Out of order unwind entry! 00000000403f78d4 and 00000000403f78e4
[    0.000000] WARNING: Out of order unwind entry! 00000000403f78e4 and 00000000403f78f4
[    0.000000] FP[0] enabled: Rev 1 Model 16
[    0.000000] The 64-bit Kernel has started...
[    0.000000] console [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 00005d60 00000491 00000000 00000001 45800c68 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000300
[    0.000000] CPUID vers 17 rev 10 (0x0000022a)
[    0.000000] capabilities 0x1
[    0.000000] model 9000/800/A400-44
[    0.000000] Total Memory: 640 MB
[    0.000000] initrd: 679e1000-67fee62b
[    0.000000] initrd: reserving 279e1000-27fee62b (mem_max 28000000)
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 161600
[    0.000000] Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
[    0.000000] RCU-based detection of stalled CPUs is enabled.
[    0.000000] PID hash table entries: 4096 (order: 12, 32768 bytes)
[42949372.960000] Console: colour dummy device 160x64
[42949373.090000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
[42949373.110000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
[42949373.320000] Memory: 632320k/655360k available (2491k kernel code, 22732k reserved, 1212k data, 132k init)
[42949373.330000] virtual kernel memory layout:
[42949373.330000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
[42949373.330000]     memory  : 0x0000000040000000 - 0x0000000068000000   ( 640 MB)
[42949373.330000]       .init : 0x0000000040564000 - 0x0000000040585000   ( 132 kB)
[42949373.330000]       .data : 0x000000004036edf0 - 0x000000004049e000   (1212 kB)
[42949373.330000]       .text : 0x0000000040100000 - 0x000000004036edf0   (2491 kB)
[42949373.940000] Calibrating delay loop... 878.18 BogoMIPS (lpj=4390912)
[42949374.210000] Security Framework initialized
[42949374.220000] Mount-cache hash table entries: 256
[42949374.230000] net_namespace: 1856 bytes
[42949374.240000] NET: Registered protocol family 16
[42949374.250000] Searching for devices...
[42949374.380000] Found devices:
[42949374.380000] 1. Crescendo DC- 440 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5d6, 0x00004 }
[42949374.390000] 2. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
[42949374.400000] 3. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
[42949374.400000] 4. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
[42949374.410000] 5. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
[
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         OFF       OFF        ON
LED State: Running non-OS code.  Non-critical error detected.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
 done
[42949376.760000] Freeing initrd memory: 6197k freed
[42949376.760000] Chassis warnings not supported.
[42949376.780000] Performance monitoring counters enabled for Crescendo DC- 440
[42949376.790000] VFS: Disk quotas dquot_6.5.2
[42949376.800000] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[42949376.810000] msgmni has been set to 1247
[42949376.820000] alg: No test for stdrng (krng)
[42949376.830000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[42949376.850000] io scheduler noop registered
[42949376.860000] io scheduler anticipatory registered
[42949376.870000] io scheduler deadline registered
[42949376.870000] io scheduler cfq registered (default)
[42949376.890000] PDC Stable Storage facility v0.30
[42949377.460000] STI GSC/PCI core graphics driver Version 0.9a
[42949377.480000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[42949377.490000] serial 0000:00:04.0: enabling device (0146 -> 0147)
[42949377.510000] 0000:00:04.0: ttyS0 at MMIO 0xfffffffff8000000 (irq = 21) is a 16550A
[42949377.520000] console handover: boot [ttyB0] -> real [ttyS0]
[42949377.530000] 0000:00:04.0: ttyS1 at MMIO 0xfffffffff8000008 (irq = 21) is a 16550A
[42949377.560000] 0000:00:04.0: ttyS2 at MMIO 0xfffffffff8000010 (irq = 21) is a 16550A
[42949377.570000] serial 0000:00:05.0: enabling device (0000 -> 0003)
[42949377.590000] serial 0000:00:05.0: enabling SERR and PARITY (0003 -> 0143)
[42949377.690000] 0000:00:05.0: ttyS3 at MMIO 0xfffffffff8005000 (irq = 22) is a 16550A
[42949377.710000] Couldn't register serial port 0000:00:05.0: -28
[42949377.830000] mice: PS/2 mouse device common for all mice
[42949377.970000] rtc-parisc rtc-parisc: rtc core: registered rtc-parisc as rtc0
[42949377.980000] TCP cubic registered
[42949378.110000] NET: Registered protocol family 17
[42949378.120000] registered taskstats version 1
[42949378.260000] rtc-parisc rtc-parisc: setting system clock to 2009-03-18 23:59:53 UTC (1237420793)
[42949378.270000] Freeing unused kernel memory: 132k freed
[42949378.400000] Write protecting th
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       OFF        ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
[42949379.450000] SCSI subsystem initialized
[42949379.480000] Linux Tulip driver version 1.1.15-NAPI (Feb 27, 2007)
[42949379.490000] tulip 0000:00:00.0: enabling device (0140 -> 0143)
[42949379.510000] tulip0: no phy info, aborting mtable build
[42949379.520000] tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
[42949379.540000] eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0xfffffffff8006000, 00:30:6e:06:d4:2f, IRQ 17.
[42949379.640000] sym53c8xx 0000:00:01.0: enabling device (0000 -> 0003)
[42949379.660000] sym53c8xx 0000:00:01.0: enabling SERR and PARITY (0003 -> 0143)
[42949379.720000] sym0: <896> rev 0x7 at pci 0000:00:01.0 irq 18
[42949380.180000] sym0: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
[42949380.190000] sym0: SCSI BUS has been reset.
[42949380.200000] scsi0 : sym-2.2.3
[42949387.670000] sym53c8xx 0000:00:01.1: enabling device (0146 -> 0147)
[42949387.730000] sym1: <896> rev 0x7 at pci 0000:00:01.1 irq 19
[42949387.730000] sym1: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
[42949387.750000] sym1: SCSI BUS has been reset.
[42949387.760000] sym1: SCSI BUS mode change from SE to SE.
[42949387.770000] sym1: SCSI BUS has been reset.
[42949387.790000] scsi1 : sym-2.2.3
[42949395.380000] scsi 1:0:15:0: Direct-Access     SEAGATE  ST336704LC       HP01 PQ: 0 ANSI: 3
[42949395.390000] scsi target1:0:15: tagged command queuing enabled, command queue depth 16.
[42949395.410000] scsi target1:0:15: Beginning Domain Validation
[42949395.430000] scsi target1:0:15: asynchronous
[42949395.440000] scsi target1:0:15: wide asynchronous
[42949395.450000] scsi target1:0:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 31)
[42949395.460000] scsi target1:0:15: Domain Validation skipping write tests
[42949395.470000] scsi target1:0:15: Ending Domain Validation
[42949395.480000] sym53c8xx 0000:00:02.0: enabling device (0000 -> 0003)
[42949395.490000] sym53c8xx 0000:00:02.0: enabling SERR and PARITY (0003 -> 0143)
[42949395.570000] sym2: <875> rev 0x14 at pci 0000:00:02.0 irq 19
[42949395.750000] sym2: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
[42949395.760000] sym2: SCSI BUS has been reset.
[42949395.800000] scsi2 : sym-2.2.3
[42949403.240000] sym53c8xx 0000:00:02.1: enabling device (0000 -> 0003)
[42949403.250000] sym53c8xx 0000:00:02.1: enabling SERR and PARITY (0003 -> 0143)
[42949403.320000] sym3: <875> rev 0x14 at pci 0000:00:02.1 irq 20
[42949403.410000] sym3: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
[42949403.420000] sym3: SCSI BUS has been reset.
[42949403.430000] scsi3 : sym-2.2.3
[42949410.540000] scsi 3:0:15:0: Direct-Access     SEAGATE  ST336704LC       HP01 PQ: 0 ANSI: 3
[42949410.540000] scsi target3:0:15: tagged command queuing enabled, command queue depth 16.
[42949410.550000] scsi target3:0:15: Beginning Domain Validation
[42949410.580000] scsi target3:0:15: asynchronous
[42949410.590000] scsi target3:0:15: wide asynchronous
[42949410.600000] scsi target3:0:15: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 16)
[42949410.610000] scsi target3:0:15: Domain Validation skipping write tests
[42949410.620000] scsi target3:0:15: Ending Domain Validation
[42949410.700000] Driver 'sd' needs updating - please use bus_type methods
[42949410.720000] sd 1:0:15:0: [sda] 71132960 512-byte hardware sectors: (36.4 GB/33.9 GiB)
[42949410.730000] sd 1:0:15:0: [sda] Write Protect is off
[42949410.740000] sd 1:0:15:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
[42949410.940000] sd 1:0:15:0: [sda] 71132960 512-byte hardware sectors: (36.4 GB/33.9 GiB)
[42949411.010000] sd 1:0:15:0: [sda] Write Protect is off
[42949411.020000] sd 1:0:15:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
[42949411.150000]  sda: sda1 sda2 sda3 < sda5 sda6 sda7 >
[42949411.310000] sd 1:0:15:0: [sda] Attached SCSI disk
[42949411.330000] sd 3:0:15:0: [sdb] 71132960 512-byte hardware sectors: (36.4 GB/33.9 GiB)
[42949411.430000] sd 3:0:15:0: [sdb] Write Protect is off
[42949411.440000] sd 3:0:15:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
[42949411.570000] sd 3:0:15:0: [sdb] 71132960 512-byte hardware sectors: (36.4 GB/33.9 GiB)
[42949411.710000] sd 3:0:15:0: [sdb] Write Protect is off
[42949411.720000] sd 3:0:15:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
[42949411.860000]  sdb: unknown partition table
[42949411.990000] sd 3:0:15:0: [sdb] Attached SCSI disk
done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
Begin: Running /scripts/local-premount ... done.
WARNING: All config files need .conf: /etc/modprobe.d/display_class, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/pnp-hotplug, it will be ignored in a future release.
WARNING: All config files need .conf: /etc/modprobe.d/blacklist, it will be ignored in a future releas[42949412.860000] EXT3-fs: INFO: recovery required on readonly filesystem.
e.
[42949412.880000] EXT3-fs: write access will be enabled during recovery.
[42949415.290000] kjournald starting.  Commit interval 5 seconds
[42949415.300000] EXT3-fs: recovery complete.
[42949415.320000] EXT3-fs: mounted filesystem with ordered data mode.
Begin: Running /scripts/local-bottom ... done.
done.
Begin: Running /scripts/init-bottom ... done.
modprobe: WARNING: All config files need .conf: /etc/modprobe.d/blacklist, it will be ignored in a future release.

modprobe: WARNING: All config files need .conf: /etc/modprobe.d/pnp-hotplug, it will be ignored in a future release.

modprobe: WARNING: All config files need .conf: /etc/modprobe.d/display_class, it will be ignored in a future release.

INIT: version 2.86 booting
Starting the hotplug events dispatcher: udevd[42949417.370000] udevd version 125 started
.
Synthesizing the initial hotplug events...done.
Waiting for /dev to be fully populated...done.
Setting parameters of disc: (none).
Setting the system clock.
Activating swap...[42949421.330000] Adding 979924k swap on /dev/sda6.  Priority:-1 extents:1 across:979924k 
done.
Checking root file system...fsck 1.41.3 (12-Oct-2008)
/dev/sda5: clean, 30344/427392 files, 229293/1708906 blocks
done.
[42949421.670000] EXT3 FS on sda5, internal journal
Setting the system clock.
Cleaning up ifupdown....
Loading kernel modules...[42949422.900000] loop: module loaded
done.
Checking file systems...fsck 1.41.3 (12-Oct-2008)
/dev/sda2 was not cleanly unmounted, check forced.
/dev/sda2: |==                                                      |  4.4%   /dev/sda2: |==========                                              / 17.5%   /dev/sda2: |===============                                         - 26.2%   /dev/sda2: |======================                                  \ 39.4%   /dev/sda2: |================================                        | 56.9%   /dev/sda2: |=====================================================   / 94.6%   /dev/sda2: |======================================================= - 97.7%   /dev/sda2: |========================================================| 100.0%                                                                                  /dev/sda2: 24/64256 files (20.8% non-contiguous), 40455/128520 blocks
/dev/sda7: recovering journal
/dev/sda7: clean, 39381/1725136 files, 381924/6895893 blocks
fsck died with exit status 1
done.
Setting kernel variables (/etc/sysctl.conf)...done.
Mounting local filesystems...modprobe: WARNING: All config files need .conf: /etc/modprobe.d/blacklist, it will be ignored in a future release.

modprobe: WARNING: All config files need .conf: /etc/modprobe.d/pnp-hotplug, it will be ignored in a future release.

modprobe: WARNING: All config files need .conf: /etc/modprobe.d/display_class, it will be ignored in a future release.

[42949428.950000] kjournald starting.  Commit interval 5 seconds
[42949428.960000] EXT3 FS on sda7, internal journal
[42949428.960000] EXT3-fs: mounted filesystem with ordered data mode.
done.
Activating swapfile swap...done.
Setting up resolvconf...done.
Setting up networking....
Configuring network interfaces...done.
Setting console screen modes and fonts.
Mounted debugfs on /sys/kernel/debug.
INIT: Entering runlevel: 2
Starting enhanced syslogd: rsyslogd.
Starting OpenBSD Secure Shell server: sshd[42949433.890000] NET: Registered protocol family 10
[42949433.890000] lo: Disabled Privacy Extensions
[42949434.070000] eth0: Setting full-duplex based on MII#1 link partner capability of 45e1.
.
Not starting internet superserver: no services enabled.
Starting openntpd: ntpd.
Starting Postfix Mail Transport Agent: postfix.
Not starting S.M.A.R.T. daemon smartd, disabled via /etc/default/smartmontools (warning).
Setting sysfs variables....
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: crond.

Debian GNU/Linux squeeze/sid sidrun ttyS0

sidrun login: INIT: Switching to runlevel: 6
Stopping deferred execution scheduler: atd.
Stopping internet superserver: inetd.
Stopping openntpd: start-stop-daemon: warning: failed to kill 1344: No such process
ntpd.
Stopping Postfix Mail Transport Agent: postfix.
Stopping rsync daemon: rsync.
Stopping S.M.A.R.T. daemon: smartd.
Unmounted debugfs from /sys/kernel/debug.
Saving the system clock.
Stopping resolvconf...done.
Asking all remaining processes to terminate...[42950046.800000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950046.810000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950046.830000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950046.840000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950046.860000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950046.870000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950046.890000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950046.900000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950046.930000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950046.950000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950047.070000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950047.210000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950047.230000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950047.360000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950047.500000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950047.640000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950047.650000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950047.780000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950047.920000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950047.930000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950048.060000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950048.200000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950048.210000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950048.340000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950048.480000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950048.500000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950048.620000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950048.760000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950048.900000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950048.920000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950049.040000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950049.180000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950049.200000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950049.330000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950049.470000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950049.480000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950049.610000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950049.750000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950049.890000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950049.900000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950050.030000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950050.170000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950050.180000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950050.310000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950050.450000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950050.470000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950050.590000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950050.730000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950050.750000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950050.870000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950051.010000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950051.160000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950051.170000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950051.300000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950051.440000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950051.450000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950051.580000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950051.720000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950051.730000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950051.870000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950052.000000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950052.140000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950052.160000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950052.280000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950052.420000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950052.440000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950052.560000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950052.700000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950052.720000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950052.850000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950052.990000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950053.000000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950053.130000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950053.270000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950053.410000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950053.420000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950053.550000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950053.690000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950053.710000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950053.830000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950053.970000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950053.990000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950054.110000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950054.250000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950054.390000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950054.410000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950054.540000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950054.680000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950054.690000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950054.820000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950054.960000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950054.970000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950055.100000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950055.240000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950055.250000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950055.380000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950055.520000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950055.660000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950055.680000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950055.800000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950055.940000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950055.960000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950056.090000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950056.230000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950056.240000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950056.370000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950056.510000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950056.650000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950056.660000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950056.790000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950056.930000] rsyslogd (pid 1145): Illegal instruction (code 8) at 0000000000071d83
[42950056.930000] INFO: RCU detected CPU 0 stall (t=4295005693/1012 jiffies)
[42950056.930000] Backtrace:
[42950056.930000] Backtrace:
[42950056.930000] 
[42950056.930000] 
[42950056.930000] Bad Address (null pointer deref?): Code=15 regs=0000000063551460 (Addr=c00007ff63551380)
[42950056.930000] 
[42950056.930000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[42950056.93000001101111111100001110 Not tainted
[42950056.930000] r00-03  000000ff0806ff0e 0000000040552100 000000006fc00000 0000000063550f08
[42950056.930000] r04-07  0000000037de0000 ffffffffffe00008 0000000063550f08 0000000040557100
[42950056.930000] r08-11  000000000fc212c1 000000006bc23fd9 0000000040555100 0000000063550578
[42950056.930000] r12-15  0000000040552900 000000004055c100 0000000040556900 0000000000000002
[42950056.930000] r16-19  00000000000000000000001 0000000000000037 0000000063551290
[42950056.930000] r20-23  00000000ffffe000 00000000401165cc 00000000403f6d44 0000000000000010
[42950056.930000] r24-27  0000000000000000 0000000040116500 0000000040116ba0 0000000040552100
[42950056.930000] r28-31  ffffffff63551380 0000000000000350 0000000063551460 ffffffff63551390
[42950056.930000] sr00-03  0000000000001800 0000000000001800 0000000000000000 0000000000002800
[42950056.930000] 00000 0000000000000000 0000000000000000 0000000000000000
[42950056.930000] 
[42950056.930000] IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004011f978 000000004011f97c
[42950056.930000]  IIR: 0f8010dc    ISR: 000000003ffff800  IOR: c00007ff63551380
[42950056.930000]  CPU:        0   CR30: 0000000063550000 CR31: 0000000000008020
[42950056.930000]  ORIG_R28: 00000000635513c8
[42950056.930000]  IAOQ[0]: unwind_once+0x358/0x3b8
[42950056 IAOQ[1]: unwind_once+0x35c/0x3b8
[42950056.930000]  RP(r2): 0x6fc00000
[42950056.930000] Backtrace:
[42950056.930000] 
[429500
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       OFF        ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

processor                 system panic               1B00

*****************************************
Invalid choice. Q/q: quit EARLY BOOT VFP
*****************************************

-- 
Meelis Roos (mroos@ut.ee)      http://www.cs.ut.ee/~mroos/
