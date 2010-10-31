From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Sun, 31 Oct 2010 15:46:26 -0400
Message-ID: <20101031194623.GA8288@hiauly1.hia.nrc.ca>
References: <20101031174018.GA26539@hiauly1.hia.nrc.ca> <20101031180214.GA7501@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="gKMricLos+KVdGMg"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101031180214.GA7501@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, 31 Oct 2010, John David Anglin wrote:

> On Sun, 31 Oct 2010, John David Anglin wrote:
> 
> > Attached hpmc dumps.  It appears that struct pci_hba_data *l is
> > causes the hpmc.  Maybe defining some of the DEBUG_LBA* macros
> > would provide more info.

Attached console output with debug macros enabled.  Also, attached
new hpmc dump as this one seems different.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="hpmc-2010-10-31-2.txt"

Booting... 
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.17 root@c3k Sun Mar  7 16:13:48 MST 2010
Skipping extended partition 6 - beyond reach of IPL

Partition Start(MB) End(MB) Id Type
1               1      31   f0 Palo
2              32     156   83 ext2
5             157    6832   83 ext2

PALO(F0) partition contains:
    0/vmlinux64 6241289 bytes @ 0x48000

Command line for kernel: 'root=/dev/sdb5 console=ttyS1 HOME=/ palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
Selected ramdisk: /initrd.img from partition 2
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 5115904 mediaptr 0x1000
Segment 1 load 0066f890 size 489088 mediaptr 0x4e2890
Segment 2 load 006e8000 size 319296 mediaptr 0x55a000
Loading ramdisk 11802446 bytes @ 3f4ad000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.36+ (dave@mx3210) (gcc version 4.3.5 (GCC) ) #4 SMP Sun Oct 31 14:51:20 EDT 2010
[    0.000000] unwind_init: start = 0x40504000, end = 0x40535060, entries = 12550
[    0.000000] WARNING: Out of order unwind entry! 0000000040505410 and 0000000040505420
[    0.000000] WARNING: Out of order unwind entry! 0000000040505420 and 0000000040505430
[    0.000000] WARNING: Out of order unwind entry! 0000000040506040 and 0000000040506050
[    0.000000] WARNING: Out of order unwind entry! 0000000040506050 and 0000000040506060
[    0.000000] FP[0] enabled: Rev 1 Model 20
[    0.000000] The 64-bit Kernel has started...
[    0.000000] bootconsole [ttyB0] enabled
[    0.000000] Initialized PDC Console for debugging.
[    0.000000] Determining PDC firmware type: 64 bit PAT.
[    0.000000] model 00008870 00000491 00000000 00000002 3e0505e7352af711 100000f0 00000008 000000b2 000000b2
[    0.000000] vers  00000301
[    0.000000] CPUID vers 20 rev 4 (0x00000284)
[    0.000000] capabilities 0x35
[    0.000000] model 9000/800/rp3440  
[    0.000000] parisc_cache_init: Only equivalent aliasing supported!
[    0.000000] Memory Ranges:
[    0.000000]  0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
[    0.000000]  1) Start 0x0000000100000000 End 0x000000027fdfffff Size   6142 MB
[    0.000000]  2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
[    0.000000] Total Memory: 10238 MB
[    0.000000] initrd: 7f4ad000-7ffee74e
[    0.000000] initrd: reserving 3f4ad000-3ffee74e (mem_max 27fe00000)
[    0.000000] PERCPU: Embedded 10 pages/cpu @00000000428a4000 s12096 r8192 d20672 u65536
[    0.000000] pcpu-alloc: s12096 r8192 d20672 u65536 alloc=16*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 
[    0.000000] SMP: bootstrap CPU ID is 0
[    0.000000] Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2585095
[    0.000000] Kernel command line: root=/dev/sdb5 console=ttyS1 HOME=/ palo_kernel=2/vmlinux
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
[    0.000000] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.000000] Memory: 10276732k/10483712k available (3469k kernel code, 206980k reserved, 1477k data, 312k init)
[    0.000000] virtual kernel memory layout:
[    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
[    0.000000]     memory  : 0x0000000040000000 - 0x0000004140000000   (266240 MB)
[    0.000000]       .init : 0x00000000406e8000 - 0x0000000040736000   ( 312 kB)
[    0.000000]       .data : 0x00000000404634d0 - 0x00000000405d49d0   (1477 kB)
[    0.000000]       .text : 0x0000000040100000 - 0x00000000404634d0   (3469 kB)
[    0.000000] SLUB: Genslabs=9, HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=8
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	CONFIG_RCU_FANOUT set to non-default value of 32
[    0.000000] 	RCU-based detection of stalled CPUs is disabled.
[    0.000000] 	Verbose stalled-CPUs detection is disabled.
[    0.000000] NR_IRQS:128
[    0.000000] Console: colour dummy device 160x64
[    0.000000] Calibrating delay loop... 1597.44 BogoMIPS (lpj=3194880)
[    0.096000] pid_max: default: 32768 minimum: 301
[    0.096000] Security Framework initialized
[    0.096000] SELinux:  Disabled at boot.
[    0.096000] Mount-cache hash table entries: 256
[    0.104000] Initializing cgroup subsys ns
[    0.104000] Initializing cgroup subsys cpuacct
[    0.104000] Initializing cgroup subsys devices
[    0.108000] Initializing cgroup subsys freezer
[    0.108000] Initializing cgroup subsys net_cls
[    0.116000] Brought up 1 CPUs
[    0.116000] devtmpfs: initialized
[    0.120000] regulator: core version 0.5
[    0.124000] NET: Registered protocol family 16
[    0.124000] EISA bus registered
[    0.132000] Searching for devices...
[    0.256000] Found devices:
[    0.256000] 1. Storm Peak Slow at 0xfffffffffe780000 [128] { 0, 0x0, 0x887, 0x00004 }
[    0.260000] 2. Storm Peak Slow at 0xfffffffffe781000 [129] { 0, 0x0, 0x887, 0x00004 }
[    0.260000] 3. Storm Peak Slow at 0xfffffffffe798000 [152] { 0, 0x0, 0x887, 0x00004 }
[    0.264000] 4. Storm Peak Slow at 0xfffffffffe799000 [153] { 0, 0x0, 0x887, 0x00004 }
[    0.272000] 5. Everest Mako Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0af, 0x00009 }
[    0.280000] 6. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
[    0.288000] 7. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
[    0.288000] 8. Mercury PCI Bridge at 0xfffffffffed22000 [0/1] { 13, 0x0, 0x783, 0x0000a }
[    0.296000] 9. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
[    0.300000] 10. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
[    0.308000] 11. Mercury PCI Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x783, 0x0000a }
[    0.316000] 12. Mercury PCI Bridge at 0xfffffffffed2c000 [0/6] { 13, 0x0, 0x783, 0x0000a }
[    0.324000] 13. Mercury PCI Bridge at 0xfffffffffed2e000 [0/7] { 13, 0x0, 0x783, 0x0000a }
[    0.324000] 14. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
[    0.332000] Enabling PDC_PAT chassis codes support v0.05
[    0.880000] Releasing cpu 1 now, hpa=fffffffffe781000
[    0.928000] FP[1] enabled: Rev 1 Model 20
[    0.948000] Releasing cpu 2 now, hpa=fffffffffe798000
[    0.996000] FP[2] enabled: Rev 1 Model 20
[    1.024000] Releasing cpu 3 now, hpa=fffffffffe799000
[    1.072000] FP[3] enabled: Rev 1 Model 20
[    1.092000] CPU(s): 4 x PA8800 (Mako) at 800.005900 MHz
[    1.096000] Setting cache flush threshold to 2000000 (4 CPUs online)
[    1.136000] SBA found Pluto 2.3 at 0xfffffffffed00000
[    1.184000] lba_set_iregs() ibase 0x40000000 imask 0x0
[    1.204000] lba_set_iregs() ibase 0x40000000 imask 0x0
[    1.228000] lba_set_iregs() ibase 0x40000000 imask 0x0
[    1.248000] lba_set_iregs() ibase 0x40000000 imask 0x0
[    1.272000] lba_set_iregs() ibase 0x40000000 imask 0x0
[    1.292000] lba_set_iregs() ibase 0x40000000 imask 0x0
[    1.312000] lba_set_iregs() ibase 0x40000000 imask 0x0
[    1.336000] Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
[    1.392000] mercury_cfg_read(0+ 0) -> 0xffffffff
[    1.392000] mercury_cfg_read(800+ 0) -> 0x351033
[    1.392000] mercury_cfg_read(800+ e) -> 0x80
[    1.392000] mercury_cfg_read(800+ 6) -> 0x210
[    1.392000] mercury_cfg_read(800+34) -> 0x40
[    1.400000] mercury_cfg_read(800+40) -> 0x1
[    1.400000] mercury_cfg_read(800+41) -> 0x0
[    1.408000] mercury_cfg_read(800+ 8) -> 0xc031041
[    1.408000] mercury_cfg_read(800+ 6) -> 0x210
[    1.412000] mercury_cfg_read(800+34) -> 0x40
[    1.412000] mercury_cfg_read(800+40) -> 0x1
[    1.416000] mercury_cfg_read(800+41) -> 0x0
[    1.420000] mercury_cfg_read(800+3d) -> 0x1
[    1.420000] mercury_cfg_read(800+3c) -> 0x0
[    1.428000] mercury_cfg_read(800+ 4) -> 0x146
[    1.428000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    1.436000] mercury_cfg_read(800+10) -> 0x80002000
[    1.436000] mercury_cfg_write(800+10) <- 0xffffffff (c)
[    1.444000] mercury_cfg_read(800+10) -> 0xfffff000
[    1.444000] mercury_cfg_write(800+10) <- 0x80002000 (c)
[    1.452000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    1.452000] mercury_cfg_read(800+ 4) -> 0x146
[    1.456000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    1.456000] mercury_cfg_read(800+14) -> 0x0
[    1.456000] mercury_cfg_write(800+14) <- 0xffffffff (c)
[    1.464000] mercury_cfg_read(800+14) -> 0x0
[    1.464000] mercury_cfg_write(800+14) <- 0x0 (c)
[    1.472000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    1.472000] mercury_cfg_read(800+ 4) -> 0x146
[    1.480000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    1.480000] mercury_cfg_read(800+18) -> 0x0
[    1.484000] mercury_cfg_write(800+18) <- 0xffffffff (c)
[    1.488000] mercury_cfg_read(800+18) -> 0x0
[    1.492000] mercury_cfg_write(800+18) <- 0x0 (c)
[    1.492000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    1.500000] mercury_cfg_read(800+ 4) -> 0x146
[    1.500000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    1.508000] mercury_cfg_read(800+1c) -> 0x0
[    1.508000] mercury_cfg_write(800+1c) <- 0xffffffff (c)
[    1.516000] mercury_cfg_read(800+1c) -> 0x0
[    1.516000] mercury_cfg_write(800+1c) <- 0x0 (c)
[    1.516000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    1.524000] mercury_cfg_read(800+ 4) -> 0x146
[    1.524000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    1.528000] mercury_cfg_read(800+20) -> 0x0
[    1.528000] mercury_cfg_write(800+20) <- 0xffffffff (c)
[    1.536000] mercury_cfg_read(800+20) -> 0x0
[    1.536000] mercury_cfg_write(800+20) <- 0x0 (c)
[    1.544000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    1.544000] mercury_cfg_read(800+ 4) -> 0x146
[    1.552000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    1.552000] mercury_cfg_read(800+24) -> 0x0
[    1.560000] mercury_cfg_write(800+24) <- 0xffffffff (c)
[    1.560000] mercury_cfg_read(800+24) -> 0x0
[    1.560000] mercury_cfg_write(800+24) <- 0x0 (c)
[    1.564000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    1.564000] mercury_cfg_read(800+ 4) -> 0x146
[    1.572000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    1.572000] mercury_cfg_read(800+30) -> 0x0
[    1.580000] mercury_cfg_write(800+30) <- 0xfffff800 (c)
[    1.580000] mercury_cfg_read(800+30) -> 0x0
[    1.588000] mercury_cfg_write(800+30) <- 0x0 (c)
[    1.588000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    1.596000] mercury_cfg_read(800+2c) -> 0x1033
[    1.596000] mercury_cfg_read(800+2e) -> 0x35
[    1.600000] mercury_cfg_read(800+ 6) -> 0x210
[    1.600000] mercury_cfg_read(800+34) -> 0x40
[    1.600000] mercury_cfg_read(800+40) -> 0x1
[    1.608000] mercury_cfg_read(800+41) -> 0x0
[    1.608000] mercury_cfg_read(800+ 6) -> 0x210
[    1.616000] mercury_cfg_read(800+34) -> 0x40
[    1.616000] mercury_cfg_read(800+40) -> 0x1
[    1.624000] mercury_cfg_read(800+41) -> 0x0
[    1.624000] mercury_cfg_read(800+ 6) -> 0x210
[    1.624000] mercury_cfg_read(800+34) -> 0x40
[    1.632000] mercury_cfg_read(800+40) -> 0x1
[    1.632000] mercury_cfg_read(800+42) -> 0x7e02
[    1.640000] mercury_cfg_read(800+44) -> 0x0
[    1.640000] mercury_cfg_write(800+44) <- 0x8000 (c)
[    1.652000] mercury_cfg_read(800+ 6) -> 0x210
[    1.652000] mercury_cfg_read(800+34) -> 0x40
[    1.660000] mercury_cfg_read(800+40) -> 0x1
[    1.660000] mercury_cfg_read(800+41) -> 0x0
[    1.660000] mercury_cfg_read(900+ 0) -> 0x351033
[    1.672000] mercury_cfg_read(900+ e) -> 0x0
[    1.672000] mercury_cfg_read(900+ 6) -> 0x210
[    1.680000] mercury_cfg_read(900+34) -> 0x40
[    1.680000] mercury_cfg_read(900+40) -> 0x1
[    1.688000] mercury_cfg_read(900+41) -> 0x0
[    1.688000] mercury_cfg_read(900+ 8) -> 0xc031041
[    1.696000] mercury_cfg_read(900+ 6) -> 0x210
[    1.696000] mercury_cfg_read(900+34) -> 0x40
[    1.696000] mercury_cfg_read(900+40) -> 0x1
[    1.708000] mercury_cfg_read(900+41) -> 0x0
[    1.708000] mercury_cfg_read(900+3d) -> 0x2
[    1.716000] mercury_cfg_read(900+3c) -> 0x0
[    1.716000] mercury_cfg_read(900+ 4) -> 0x146
[    1.728000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    1.728000] mercury_cfg_read(900+10) -> 0x80001000
[    1.736000] mercury_cfg_write(900+10) <- 0xffffffff (c)
[    1.736000] mercury_cfg_read(900+10) -> 0xfffff000
[    1.748000] mercury_cfg_write(900+10) <- 0x80001000 (c)
[    1.748000] mercury_cfg_write(900+ 4) <- 0x146 (c)
[    1.752000] mercury_cfg_read(900+ 4) -> 0x146
[    1.752000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    1.756000] mercury_cfg_read(900+14) -> 0x0
[    1.764000] mercury_cfg_write(900+14) <- 0xffffffff (c)
[    1.764000] mercury_cfg_read(900+14) -> 0x0
[    1.776000] mercury_cfg_write(900+14) <- 0x0 (c)
[    1.776000] mercury_cfg_write(900+ 4) <- 0x146 (c)
[    1.784000] mercury_cfg_read(900+ 4) -> 0x146
[    1.784000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    1.792000] mercury_cfg_read(900+18) -> 0x0
[    1.792000] mercury_cfg_write(900+18) <- 0xffffffff (c)
[    1.800000] mercury_cfg_read(900+18) -> 0x0
[    1.800000] mercury_cfg_write(900+18) <- 0x0 (c)
[    1.808000] mercury_cfg_write(900+ 4) <- 0x146 (c)
[    1.808000] mercury_cfg_read(900+ 4) -> 0x146
[    1.816000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    1.816000] mercury_cfg_read(900+1c) -> 0x0
[    1.820000] mercury_cfg_write(900+1c) <- 0xffffffff (c)
[    1.828000] mercury_cfg_read(900+1c) -> 0x0
[    1.828000] mercury_cfg_write(900+1c) <- 0x0 (c)
[    1.836000] mercury_cfg_write(900+ 4) <- 0x146 (c)
[    1.836000] mercury_cfg_read(900+ 4) -> 0x146
[    1.844000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    1.844000] mercury_cfg_read(900+20) -> 0x0
[    1.852000] mercury_cfg_write(900+20) <- 0xffffffff (c)
[    1.852000] mercury_cfg_read(900+20) -> 0x0
[    1.860000] mercury_cfg_write(900+20) <- 0x0 (c)
[    1.860000] mercury_cfg_write(900+ 4) <- 0x146 (c)
[    1.864000] mercury_cfg_read(900+ 4) -> 0x146
[    1.864000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    1.876000] mercury_cfg_read(900+24) -> 0x0
[    1.876000] mercury_cfg_write(900+24) <- 0xffffffff (c)
[    1.888000] mercury_cfg_read(900+24) -> 0x0
[    1.888000] mercury_cfg_write(900+24) <- 0x0 (c)
[    1.888000] mercury_cfg_write(900+ 4) <- 0x146 (c)
[    1.896000] mercury_cfg_read(900+ 4) -> 0x146
[    1.896000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    1.908000] mercury_cfg_read(900+30) -> 0x0
[    1.908000] mercury_cfg_write(900+30) <- 0xfffff800 (c)
[    1.916000] mercury_cfg_read(900+30) -> 0x0
[    1.916000] mercury_cfg_write(900+30) <- 0x0 (c)
[    1.924000] mercury_cfg_write(900+ 4) <- 0x146 (c)
[    1.924000] mercury_cfg_read(900+2c) -> 0x1033
[    1.936000] mercury_cfg_read(900+2e) -> 0x35
[    1.936000] mercury_cfg_read(900+ 6) -> 0x210
[    1.936000] mercury_cfg_read(900+34) -> 0x40
[    1.944000] mercury_cfg_read(900+40) -> 0x1
[    1.944000] mercury_cfg_read(900+41) -> 0x0
[    1.956000] mercury_cfg_read(900+ 6) -> 0x210
[    1.956000] mercury_cfg_read(900+34) -> 0x40
[    1.964000] mercury_cfg_read(900+40) -> 0x1
[    1.968000] mercury_cfg_read(900+41) -> 0x0
[    1.968000] mercury_cfg_read(900+ 6) -> 0x210
[    1.976000] mercury_cfg_read(900+34) -> 0x40
[    1.976000] mercury_cfg_read(900+40) -> 0x1
[    1.988000] mercury_cfg_read(900+42) -> 0x7e02
[    1.988000] mercury_cfg_read(900+44) -> 0x0
[    1.996000] mercury_cfg_write(900+44) <- 0x8000 (c)
[    1.996000] mercury_cfg_read(900+ 6) -> 0x210
[    2.008000] mercury_cfg_read(900+34) -> 0x40
[    2.008000] mercury_cfg_read(900+40) -> 0x1
[    2.008000] mercury_cfg_read(900+41) -> 0x0
[    2.016000] mercury_cfg_read(a00+ 0) -> 0xe01033
[    2.016000] mercury_cfg_read(a00+ e) -> 0x0
[    2.024000] mercury_cfg_read(a00+ 6) -> 0x210
[    2.024000] mercury_cfg_read(a00+34) -> 0x40
[    2.036000] mercury_cfg_read(a00+40) -> 0x1
[    2.036000] mercury_cfg_read(a00+41) -> 0x0
[    2.044000] mercury_cfg_read(a00+ 8) -> 0xc032002
[    2.044000] mercury_cfg_read(a00+ 6) -> 0x210
[    2.044000] mercury_cfg_read(a00+34) -> 0x40
[    2.052000] mercury_cfg_read(a00+40) -> 0x1
[    2.052000] mercury_cfg_read(a00+41) -> 0x0
[    2.060000] mercury_cfg_read(a00+3d) -> 0x3
[    2.060000] mercury_cfg_read(a00+3c) -> 0x0
[    2.072000] mercury_cfg_read(a00+ 4) -> 0x146
[    2.072000] mercury_cfg_write(a00+ 4) <- 0x144 (c)
[    2.072000] mercury_cfg_read(a00+10) -> 0x80000000
[    2.080000] mercury_cfg_write(a00+10) <- 0xffffffff (c)
[    2.092000] mercury_cfg_read(a00+10) -> 0xffffff00
[    2.092000] mercury_cfg_write(a00+10) <- 0x80000000 (c)
[    2.100000] mercury_cfg_write(a00+ 4) <- 0x146 (c)
[    2.100000] mercury_cfg_read(a00+ 4) -> 0x146
[    2.104000] mercury_cfg_write(a00+ 4) <- 0x144 (c)
[    2.108000] mercury_cfg_read(a00+14) -> 0x0
[    2.108000] mercury_cfg_write(a00+14) <- 0xffffffff (c)
[    2.120000] mercury_cfg_read(a00+14) -> 0x0
[    2.120000] mercury_cfg_write(a00+14) <- 0x0 (c)
[    2.128000] mercury_cfg_write(a00+ 4) <- 0x146 (c)
[    2.128000] mercury_cfg_read(a00+ 4) -> 0x146
[    2.140000] mercury_cfg_write(a00+ 4) <- 0x144 (c)
[    2.140000] mercury_cfg_read(a00+18) -> 0x0
[    2.152000] mercury_cfg_write(a00+18) <- 0xffffffff (c)
[    2.152000] mercury_cfg_read(a00+18) -> 0x0
[    2.160000] mercury_cfg_write(a00+18) <- 0x0 (c)
[    2.160000] mercury_cfg_write(a00+ 4) <- 0x146 (c)
[    2.168000] mercury_cfg_read(a00+ 4) -> 0x146
[    2.168000] mercury_cfg_write(a00+ 4) <- 0x144 (c)
[    2.168000] mercury_cfg_read(a00+1c) -> 0x0
[    2.176000] mercury_cfg_write(a00+1c) <- 0xffffffff (c)
[    2.176000] mercury_cfg_read(a00+1c) -> 0x0
[    2.188000] mercury_cfg_write(a00+1c) <- 0x0 (c)
[    2.188000] mercury_cfg_write(a00+ 4) <- 0x146 (c)
[    2.196000] mercury_cfg_read(a00+ 4) -> 0x146
[    2.196000] mercury_cfg_write(a00+ 4) <- 0x144 (c)
[    2.208000] mercury_cfg_read(a00+20) -> 0x0
[    2.208000] mercury_cfg_write(a00+20) <- 0xffffffff (c)
[    2.216000] mercury_cfg_read(a00+20) -> 0x0
[    2.220000] mercury_cfg_write(a00+20) <- 0x0 (c)
[    2.228000] mercury_cfg_write(a00+ 4) <- 0x146 (c)
[    2.228000] mercury_cfg_read(a00+ 4) -> 0x146
[    2.236000] mercury_cfg_write(a00+ 4) <- 0x144 (c)
[    2.236000] mercury_cfg_read(a00+24) -> 0x0
[    2.236000] mercury_cfg_write(a00+24) <- 0xffffffff (c)
[    2.244000] mercury_cfg_read(a00+24) -> 0x0
[    2.244000] mercury_cfg_write(a00+24) <- 0x0 (c)
[    2.252000] mercury_cfg_write(a00+ 4) <- 0x146 (c)
[    2.256000] mercury_cfg_read(a00+ 4) -> 0x146
[    2.260000] mercury_cfg_write(a00+ 4) <- 0x144 (c)
[    2.260000] mercury_cfg_read(a00+30) -> 0x0
[    2.268000] mercury_cfg_write(a00+30) <- 0xfffff800 (c)
[    2.268000] mercury_cfg_read(a00+30) -> 0x0
[    2.276000] mercury_cfg_write(a00+30) <- 0x0 (c)
[    2.276000] mercury_cfg_write(a00+ 4) <- 0x146 (c)
[    2.284000] mercury_cfg_read(a00+2c) -> 0x1033
[    2.284000] mercury_cfg_read(a00+2e) -> 0xe0
[    2.284000] mercury_cfg_read(a00+ 6) -> 0x210
[    2.288000] mercury_cfg_read(a00+34) -> 0x40
[    2.292000] mercury_cfg_read(a00+40) -> 0x1
[    2.296000] mercury_cfg_read(a00+41) -> 0x0
[    2.296000] mercury_cfg_read(a00+ 6) -> 0x210
[    2.304000] mercury_cfg_read(a00+34) -> 0x40
[    2.304000] mercury_cfg_read(a00+40) -> 0x1
[    2.312000] mercury_cfg_read(a00+41) -> 0x0
[    2.312000] mercury_cfg_read(a00+ 6) -> 0x210
[    2.312000] mercury_cfg_read(a00+34) -> 0x40
[    2.320000] mercury_cfg_read(a00+40) -> 0x1
[    2.320000] mercury_cfg_read(a00+42) -> 0x7e02
[    2.324000] mercury_cfg_read(a00+44) -> 0x0
[    2.324000] mercury_cfg_write(a00+44) <- 0x8000 (c)
[    2.332000] mercury_cfg_read(a00+ 6) -> 0x210
[    2.332000] mercury_cfg_read(a00+34) -> 0x40
[    2.332000] mercury_cfg_read(a00+40) -> 0x1
[    2.340000] mercury_cfg_read(a00+41) -> 0x0
[    2.340000] mercury_cfg_read(b00+ 0) -> 0xffffffff
[    2.348000] mercury_cfg_read(c00+ 0) -> 0xffffffff
[    2.348000] mercury_cfg_read(d00+ 0) -> 0xffffffff
[    2.356000] mercury_cfg_read(e00+ 0) -> 0xffffffff
[    2.356000] mercury_cfg_read(f00+ 0) -> 0xffffffff
[    2.360000] mercury_cfg_read(1000+ 0) -> 0x6491095
[    2.364000] mercury_cfg_read(1000+ e) -> 0x0
[    2.368000] mercury_cfg_read(1000+ 6) -> 0x290
[    2.368000] mercury_cfg_read(1000+34) -> 0x60
[    2.376000] mercury_cfg_read(1000+60) -> 0x1
[    2.376000] mercury_cfg_read(1000+61) -> 0x0
[    2.376000] mercury_cfg_read(1000+ 8) -> 0x1018f02
[    2.384000] mercury_cfg_read(1000+ 6) -> 0x290
[    2.384000] mercury_cfg_read(1000+34) -> 0x60
[    2.392000] mercury_cfg_read(1000+60) -> 0x1
[    2.392000] mercury_cfg_read(1000+61) -> 0x0
[    2.396000] mercury_cfg_read(1000+3d) -> 0x1
[    2.396000] mercury_cfg_read(1000+3c) -> 0xe
[    2.404000] mercury_cfg_read(1000+ 4) -> 0x145
[    2.404000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    2.412000] mercury_cfg_read(1000+10) -> 0xd19
[    2.412000] mercury_cfg_write(1000+10) <- 0xffffffff (c)
[    2.420000] mercury_cfg_read(1000+10) -> 0xfffffff9
[    2.420000] mercury_cfg_write(1000+10) <- 0xd19 (c)
[    2.420000] mercury_cfg_write(1000+ 4) <- 0x145 (c)
[    2.428000] mercury_cfg_read(1000+ 4) -> 0x145
[    2.428000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    2.432000] mercury_cfg_read(1000+14) -> 0xd25
[    2.432000] mercury_cfg_write(1000+14) <- 0xffffffff (c)
[    2.440000] mercury_cfg_read(1000+14) -> 0xfffffffd
[    2.440000] mercury_cfg_write(1000+14) <- 0xd25 (c)
[    2.448000] mercury_cfg_write(1000+ 4) <- 0x145 (c)
[    2.448000] mercury_cfg_read(1000+ 4) -> 0x145
[    2.456000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    2.456000] mercury_cfg_read(1000+18) -> 0xd11
[    2.464000] mercury_cfg_write(1000+18) <- 0xffffffff (c)
[    2.464000] mercury_cfg_read(1000+18) -> 0xfffffff9
[    2.468000] mercury_cfg_write(1000+18) <- 0xd11 (c)
[    2.468000] mercury_cfg_write(1000+ 4) <- 0x145 (c)
[    2.476000] mercury_cfg_read(1000+ 4) -> 0x145
[    2.476000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    2.484000] mercury_cfg_read(1000+1c) -> 0xd21
[    2.484000] mercury_cfg_write(1000+1c) <- 0xffffffff (c)
[    2.492000] mercury_cfg_read(1000+1c) -> 0xfffffffd
[    2.492000] mercury_cfg_write(1000+1c) <- 0xd21 (c)
[    2.500000] mercury_cfg_write(1000+ 4) <- 0x145 (c)
[    2.500000] mercury_cfg_read(1000+ 4) -> 0x145
[    2.504000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    2.504000] mercury_cfg_read(1000+20) -> 0xd01
[    2.512000] mercury_cfg_write(1000+20) <- 0xffffffff (c)
[    2.512000] mercury_cfg_read(1000+20) -> 0xfffffff1
[    2.520000] mercury_cfg_write(1000+20) <- 0xd01 (c)
[    2.520000] mercury_cfg_write(1000+ 4) <- 0x145 (c)
[    2.528000] mercury_cfg_read(1000+ 4) -> 0x145
[    2.528000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    2.536000] mercury_cfg_read(1000+24) -> 0x0
[    2.536000] mercury_cfg_write(1000+24) <- 0xffffffff (c)
[    2.540000] mercury_cfg_read(1000+24) -> 0x0
[    2.540000] mercury_cfg_write(1000+24) <- 0x0 (c)
[    2.548000] mercury_cfg_write(1000+ 4) <- 0x145 (c)
[    2.548000] mercury_cfg_read(1000+ 4) -> 0x145
[    2.548000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    2.556000] mercury_cfg_read(1000+30) -> 0x0
[    2.556000] mercury_cfg_write(1000+30) <- 0xfffff800 (c)
[    2.564000] mercury_cfg_read(1000+30) -> 0x0
[    2.564000] mercury_cfg_write(1000+30) <- 0x0 (c)
[    2.572000] mercury_cfg_write(1000+ 4) <- 0x145 (c)
[    2.572000] mercury_cfg_read(1000+2c) -> 0x1095
[    2.576000] mercury_cfg_read(1000+2e) -> 0x649
[    2.576000] mercury_cfg_read(1000+ 9) -> 0x8f
[    2.584000] mercury_cfg_read(1000+ 6) -> 0x290
[    2.584000] mercury_cfg_read(1000+34) -> 0x60
[    2.592000] mercury_cfg_read(1000+60) -> 0x1
[    2.592000] mercury_cfg_read(1000+61) -> 0x0
[    2.592000] mercury_cfg_read(1000+ 6) -> 0x290
[    2.600000] mercury_cfg_read(1000+34) -> 0x60
[    2.600000] mercury_cfg_read(1000+60) -> 0x1
[    2.608000] mercury_cfg_read(1000+61) -> 0x0
[    2.608000] mercury_cfg_read(1000+ 6) -> 0x290
[    2.612000] mercury_cfg_read(1000+34) -> 0x60
[    2.612000] mercury_cfg_read(1000+60) -> 0x1
[    2.620000] mercury_cfg_read(1000+62) -> 0x622
[    2.620000] mercury_cfg_read(1000+ 6) -> 0x290
[    2.620000] mercury_cfg_read(1000+34) -> 0x60
[    2.628000] mercury_cfg_read(1000+60) -> 0x1
[    2.628000] mercury_cfg_read(1000+61) -> 0x0
[    2.636000] mercury_cfg_read(1800+ 0) -> 0xffffffff
[    2.636000] mercury_cfg_read(2000+ 0) -> 0xffffffff
[    2.644000] mercury_cfg_read(2800+ 0) -> 0xffffffff
[    2.644000] mercury_cfg_read(3000+ 0) -> 0xffffffff
[    2.648000] mercury_cfg_read(3800+ 0) -> 0xffffffff
[    2.648000] mercury_cfg_read(4000+ 0) -> 0xffffffff
[    2.656000] mercury_cfg_read(4800+ 0) -> 0xffffffff
[    2.656000] mercury_cfg_read(5000+ 0) -> 0xffffffff
[    2.664000] mercury_cfg_read(5800+ 0) -> 0xffffffff
[    2.664000] mercury_cfg_read(6000+ 0) -> 0xffffffff
[    2.672000] mercury_cfg_read(6800+ 0) -> 0xffffffff
[    2.672000] mercury_cfg_read(7000+ 0) -> 0xffffffff
[    2.676000] mercury_cfg_read(7800+ 0) -> 0xffffffff
[    2.680000] mercury_cfg_read(8000+ 0) -> 0xffffffff
[    2.684000] mercury_cfg_read(8800+ 0) -> 0xffffffff
[    2.684000] mercury_cfg_read(9000+ 0) -> 0xffffffff
[    2.692000] mercury_cfg_read(9800+ 0) -> 0xffffffff
[    2.692000] mercury_cfg_read(a000+ 0) -> 0xffffffff
[    2.700000] mercury_cfg_read(a800+ 0) -> 0xffffffff
[    2.700000] mercury_cfg_read(b000+ 0) -> 0xffffffff
[    2.708000] mercury_cfg_read(b800+ 0) -> 0xffffffff
[    2.708000] mercury_cfg_read(c000+ 0) -> 0xffffffff
[    2.712000] mercury_cfg_read(c800+ 0) -> 0xffffffff
[    2.712000] mercury_cfg_read(d000+ 0) -> 0xffffffff
[    2.720000] mercury_cfg_read(d800+ 0) -> 0xffffffff
[    2.720000] mercury_cfg_read(e000+ 0) -> 0xffffffff
[    2.728000] mercury_cfg_read(e800+ 0) -> 0xffffffff
[    2.728000] mercury_cfg_read(f000+ 0) -> 0xffffffff
[    2.736000] mercury_cfg_read(f800+ 0) -> 0xffffffff
[    2.736000] lba_fixup_bus(0x000000007f0cac00) bus 0 platform_data 0x000000007f007c00
[    2.744000] lba_fixup_bus() PCI00 Ports [0/ffff]/100
[    2.744000] lba_fixup_bus() PCI00 LMMIO [ffffffff80000000/ffffffff8fffffff]/200
[    2.752000] lba_fixup_bus() 0000:00:01.0
[    2.756000] lba_fixup_bus() MMIO [80002000/80002fff] -> [ffffffff80002000/ffffffff80002fff]
[    2.756000] mercury_cfg_read(800+3d) -> 0x1
[    2.764000] lba_fixup_bus() 0000:00:01.1
[    2.764000] lba_fixup_bus() MMIO [80001000/80001fff] -> [ffffffff80001000/ffffffff80001fff]
[    2.772000] mercury_cfg_read(900+3d) -> 0x2
[    2.780000] lba_fixup_bus() 0000:00:01.2
[    2.780000] lba_fixup_bus() MMIO [80000000/800000ff] -> [ffffffff80000000/ffffffff800000ff]
[    2.784000] mercury_cfg_read(a00+3d) -> 0x3
[    2.784000] lba_fixup_bus() 0000:00:02.0
[    2.792000] lba_fixup_bus() I/O Ports [d18/d1f] -> [d18/d1f]
[    2.792000] lba_fixup_bus() I/O Ports [d24/d27] -> [d24/d27]
[    2.800000] lba_fixup_bus() I/O Ports [d10/d17] -> [d10/d17]
[    2.800000] lba_fixup_bus() I/O Ports [d20/d23] -> [d20/d23]
[    2.808000] lba_fixup_bus() I/O Ports [d00/d0f] -> [d00/d0f]
[    2.808000] mercury_cfg_read(1000+3d) -> 0x1
[    2.816000] LBA pci_bus_size_bridges()
[    2.816000] LBA pci_bus_assign_resources()
[    2.820000] 
[    2.820000] LBA PIOP resource tree
[    2.824000] 
[    2.824000] LBA LMMIO resource tree
[    2.852000] Mercury version TR3.2 (0x32) found at 0xfffffffffed22000
[    2.908000] mercury_cfg_read(0+ 0) -> 0xffffffff
[    2.908000] mercury_cfg_read(800+ 0) -> 0x211000
[    2.908000] mercury_cfg_read(800+ e) -> 0x80
[    2.908000] mercury_cfg_read(800+ 6) -> 0x230
[    2.908000] mercury_cfg_read(800+34) -> 0x40
[    2.916000] mercury_cfg_read(800+40) -> 0x1
[    2.916000] mercury_cfg_read(800+41) -> 0x0
[    2.924000] mercury_cfg_read(800+ 8) -> 0x1000001
[    2.924000] mercury_cfg_read(800+ 6) -> 0x230
[    2.928000] mercury_cfg_read(800+34) -> 0x40
[    2.928000] mercury_cfg_read(800+40) -> 0x1
[    2.928000] mercury_cfg_read(800+41) -> 0x0
[    2.936000] mercury_cfg_read(800+3d) -> 0x1
[    2.936000] mercury_cfg_read(800+3c) -> 0x0
[    2.944000] mercury_cfg_read(800+ 4) -> 0x147
[    2.944000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    2.952000] mercury_cfg_read(800+10) -> 0x2101
[    2.952000] mercury_cfg_write(800+10) <- 0xffffffff (c)
[    2.960000] mercury_cfg_read(800+10) -> 0xffffff01
[    2.960000] mercury_cfg_write(800+10) <- 0x2101 (c)
[    2.964000] mercury_cfg_write(800+ 4) <- 0x147 (c)
[    2.968000] mercury_cfg_read(800+ 4) -> 0x147
[    2.968000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    2.972000] mercury_cfg_read(800+14) -> 0x90015004
[    2.972000] mercury_cfg_write(800+14) <- 0xffffffff (c)
[    2.980000] mercury_cfg_read(800+14) -> 0xfffffc04
[    2.980000] mercury_cfg_write(800+14) <- 0x90015004 (c)
[    2.988000] mercury_cfg_write(800+ 4) <- 0x147 (c)
[    2.988000] mercury_cfg_read(800+18) -> 0x0
[    2.996000] mercury_cfg_write(800+18) <- 0xffffffff (c)
[    2.996000] mercury_cfg_read(800+18) -> 0xffffffff
[    3.000000] mercury_cfg_write(800+18) <- 0x0 (c)
[    3.000000] mercury_cfg_read(800+ 4) -> 0x147
[    3.008000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    3.008000] mercury_cfg_read(800+1c) -> 0x90012004
[    3.020000] mercury_cfg_write(800+1c) <- 0xffffffff (c)
[    3.020000] mercury_cfg_read(800+1c) -> 0xffffe004
[    3.028000] mercury_cfg_write(800+1c) <- 0x90012004 (c)
[    3.032000] mercury_cfg_write(800+ 4) <- 0x147 (c)
[    3.040000] mercury_cfg_read(800+20) -> 0x0
[    3.040000] mercury_cfg_write(800+20) <- 0xffffffff (c)
[    3.048000] mercury_cfg_read(800+20) -> 0xffffffff
[    3.048000] mercury_cfg_write(800+20) <- 0x0 (c)
[    3.056000] mercury_cfg_read(800+ 4) -> 0x147
[    3.056000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    3.060000] mercury_cfg_read(800+24) -> 0x0
[    3.060000] mercury_cfg_write(800+24) <- 0xffffffff (c)
[    3.068000] mercury_cfg_read(800+24) -> 0x0
[    3.068000] mercury_cfg_write(800+24) <- 0x0 (c)
[    3.076000] mercury_cfg_write(800+ 4) <- 0x147 (c)
[    3.076000] mercury_cfg_read(800+ 4) -> 0x147
[    3.076000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    3.084000] mercury_cfg_read(800+30) -> 0x0
[    3.084000] mercury_cfg_write(800+30) <- 0xfffff800 (c)
[    3.092000] mercury_cfg_read(800+30) -> 0x0
[    3.092000] mercury_cfg_write(800+30) <- 0x0 (c)
[    3.096000] mercury_cfg_write(800+ 4) <- 0x147 (c)
[    3.096000] mercury_cfg_read(800+2c) -> 0x0
[    3.104000] mercury_cfg_read(800+2e) -> 0x0
[    3.104000] mercury_cfg_read(800+ 6) -> 0x230
[    3.112000] mercury_cfg_read(800+34) -> 0x40
[    3.112000] mercury_cfg_read(800+40) -> 0x1
[    3.112000] mercury_cfg_read(800+41) -> 0x0
[    3.120000] mercury_cfg_read(800+ 6) -> 0x230
[    3.120000] mercury_cfg_read(800+34) -> 0x40
[    3.124000] mercury_cfg_read(800+40) -> 0x1
[    3.128000] mercury_cfg_read(800+41) -> 0x0
[    3.132000] mercury_cfg_read(800+ 6) -> 0x230
[    3.132000] mercury_cfg_read(800+34) -> 0x40
[    3.132000] mercury_cfg_read(800+40) -> 0x1
[    3.140000] mercury_cfg_read(800+42) -> 0x602
[    3.140000] mercury_cfg_read(800+ 6) -> 0x230
[    3.148000] mercury_cfg_read(800+34) -> 0x40
[    3.148000] mercury_cfg_read(800+40) -> 0x1
[    3.156000] mercury_cfg_read(800+41) -> 0x0
[    3.156000] mercury_cfg_read(900+ 0) -> 0x211000
[    3.164000] mercury_cfg_read(900+ e) -> 0x80
[    3.164000] mercury_cfg_read(900+ 6) -> 0x230
[    3.164000] mercury_cfg_read(900+34) -> 0x40
[    3.168000] mercury_cfg_read(900+40) -> 0x1
[    3.168000] mercury_cfg_read(900+41) -> 0x0
[    3.176000] mercury_cfg_read(900+ 8) -> 0x1000001
[    3.176000] mercury_cfg_read(900+ 6) -> 0x230
[    3.184000] mercury_cfg_read(900+34) -> 0x40
[    3.184000] mercury_cfg_read(900+40) -> 0x1
[    3.184000] mercury_cfg_read(900+41) -> 0x0
[    3.192000] mercury_cfg_read(900+3d) -> 0x2
[    3.192000] mercury_cfg_read(900+3c) -> 0x0
[    3.196000] mercury_cfg_read(900+ 4) -> 0x147
[    3.200000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    3.204000] mercury_cfg_read(900+10) -> 0x2001
[    3.204000] mercury_cfg_write(900+10) <- 0xffffffff (c)
[    3.212000] mercury_cfg_read(900+10) -> 0xffffff01
[    3.212000] mercury_cfg_write(900+10) <- 0x2001 (c)
[    3.220000] mercury_cfg_write(900+ 4) <- 0x147 (c)
[    3.220000] mercury_cfg_read(900+ 4) -> 0x147
[    3.228000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    3.228000] mercury_cfg_read(900+14) -> 0x90014004
[    3.232000] mercury_cfg_write(900+14) <- 0xffffffff (c)
[    3.232000] mercury_cfg_read(900+14) -> 0xfffffc04
[    3.240000] mercury_cfg_write(900+14) <- 0x90014004 (c)
[    3.240000] mercury_cfg_write(900+ 4) <- 0x147 (c)
[    3.248000] mercury_cfg_read(900+18) -> 0x0
[    3.248000] mercury_cfg_write(900+18) <- 0xffffffff (c)
[    3.256000] mercury_cfg_read(900+18) -> 0xffffffff
[    3.256000] mercury_cfg_write(900+18) <- 0x0 (c)
[    3.256000] mercury_cfg_read(900+ 4) -> 0x147
[    3.264000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    3.264000] mercury_cfg_read(900+1c) -> 0x90010004
[    3.268000] mercury_cfg_write(900+1c) <- 0xffffffff (c)
[    3.272000] mercury_cfg_read(900+1c) -> 0xffffe004
[    3.276000] mercury_cfg_write(900+1c) <- 0x90010004 (c)
[    3.276000] mercury_cfg_write(900+ 4) <- 0x147 (c)
[    3.284000] mercury_cfg_read(900+20) -> 0x0
[    3.284000] mercury_cfg_write(900+20) <- 0xffffffff (c)
[    3.292000] mercury_cfg_read(900+20) -> 0xffffffff
[    3.292000] mercury_cfg_write(900+20) <- 0x0 (c)
[    3.300000] mercury_cfg_read(900+ 4) -> 0x147
[    3.300000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    3.308000] mercury_cfg_read(900+24) -> 0x0
[    3.308000] mercury_cfg_write(900+24) <- 0xffffffff (c)
[    3.312000] mercury_cfg_read(900+24) -> 0x0
[    3.312000] mercury_cfg_write(900+24) <- 0x0 (c)
[    3.320000] mercury_cfg_write(900+ 4) <- 0x147 (c)
[    3.320000] mercury_cfg_read(900+ 4) -> 0x147
[    3.328000] mercury_cfg_write(900+ 4) <- 0x144 (c)
[    3.328000] mercury_cfg_read(900+30) -> 0x0
[    3.328000] mercury_cfg_write(900+30) <- 0xfffff800 (c)
[    3.336000] mercury_cfg_read(900+30) -> 0x0
[    3.336000] mercury_cfg_write(900+30) <- 0x0 (c)
[    3.344000] mercury_cfg_write(900+ 4) <- 0x147 (c)
[    3.344000] mercury_cfg_read(900+2c) -> 0x0
[    3.348000] mercury_cfg_read(900+2e) -> 0x0
[    3.348000] mercury_cfg_read(900+ 6) -> 0x230
[    3.356000] mercury_cfg_read(900+34) -> 0x40
[    3.356000] mercury_cfg_read(900+40) -> 0x1
[    3.364000] mercury_cfg_read(900+41) -> 0x0
[    3.364000] mercury_cfg_read(900+ 6) -> 0x230
[    3.364000] mercury_cfg_read(900+34) -> 0x40
[    3.372000] mercury_cfg_read(900+40) -> 0x1
[    3.372000] mercury_cfg_read(900+41) -> 0x0
[    3.376000] mercury_cfg_read(900+ 6) -> 0x230
[    3.380000] mercury_cfg_read(900+34) -> 0x40
[    3.384000] mercury_cfg_read(900+40) -> 0x1
[    3.384000] mercury_cfg_read(900+42) -> 0x602
[    3.384000] mercury_cfg_read(900+ 6) -> 0x230
[    3.392000] mercury_cfg_read(900+34) -> 0x40
[    3.392000] mercury_cfg_read(900+40) -> 0x1
[    3.400000] mercury_cfg_read(900+41) -> 0x0
[    3.400000] mercury_cfg_read(a00+ 0) -> 0xffffffff
[    3.408000] mercury_cfg_read(b00+ 0) -> 0xffffffff
[    3.408000] mercury_cfg_read(c00+ 0) -> 0xffffffff
[    3.412000] mercury_cfg_read(d00+ 0) -> 0xffffffff
[    3.412000] mercury_cfg_read(e00+ 0) -> 0xffffffff
[    3.420000] mercury_cfg_read(f00+ 0) -> 0xffffffff
[    3.420000] mercury_cfg_read(1000+ 0) -> 0x164514e4
[    3.428000] mercury_cfg_read(1000+ e) -> 0x0
[    3.428000] mercury_cfg_read(1000+ 6) -> 0x2b0
[    3.428000] mercury_cfg_read(1000+34) -> 0x40
[    3.436000] mercury_cfg_read(1000+40) -> 0x7
[    3.436000] mercury_cfg_read(1000+41) -> 0x48
[    3.444000] mercury_cfg_read(1000+48) -> 0x1
[    3.444000] mercury_cfg_read(1000+49) -> 0x50
[    3.448000] mercury_cfg_read(1000+50) -> 0x3
[    3.452000] mercury_cfg_read(1000+51) -> 0x58
[    3.456000] mercury_cfg_read(1000+58) -> 0x5
[    3.456000] mercury_cfg_read(1000+59) -> 0x0
[    3.456000] mercury_cfg_read(1000+ 8) -> 0x2000015
[    3.464000] mercury_cfg_read(1000+ 6) -> 0x2b0
[    3.464000] mercury_cfg_read(1000+34) -> 0x40
[    3.472000] mercury_cfg_read(1000+40) -> 0x7
[    3.472000] mercury_cfg_read(1000+44) -> 0x3fff9
[    3.480000] mercury_cfg_read(1000+3d) -> 0x1
[    3.480000] mercury_cfg_read(1000+3c) -> 0x82
[    3.484000] mercury_cfg_read(1000+ 4) -> 0x146
[    3.488000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    3.488000] mercury_cfg_read(1000+10) -> 0x90000004
[    3.492000] mercury_cfg_write(1000+10) <- 0xffffffff (c)
[    3.500000] mercury_cfg_read(1000+10) -> 0xffff0004
[    3.500000] mercury_cfg_write(1000+10) <- 0x90000004 (c)
[    3.508000] mercury_cfg_write(1000+ 4) <- 0x146 (c)
[    3.508000] mercury_cfg_read(1000+14) -> 0x0
[    3.508000] mercury_cfg_write(1000+14) <- 0xffffffff (c)
[    3.516000] mercury_cfg_read(1000+14) -> 0xffffffff
[    3.524000] mercury_cfg_write(1000+14) <- 0x0 (c)
[    3.524000] mercury_cfg_read(1000+ 4) -> 0x146
[    3.524000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    3.528000] mercury_cfg_read(1000+18) -> 0x0
[    3.528000] mercury_cfg_write(1000+18) <- 0xffffffff (c)
[    3.536000] mercury_cfg_read(1000+18) -> 0x0
[    3.536000] mercury_cfg_write(1000+18) <- 0x0 (c)
[    3.544000] mercury_cfg_write(1000+ 4) <- 0x146 (c)
[    3.544000] mercury_cfg_read(1000+ 4) -> 0x146
[    3.552000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    3.552000] mercury_cfg_read(1000+1c) -> 0x0
[    3.560000] mercury_cfg_write(1000+1c) <- 0xffffffff (c)
[    3.560000] mercury_cfg_read(1000+1c) -> 0x0
[    3.564000] mercury_cfg_write(1000+1c) <- 0x0 (c)
[    3.564000] mercury_cfg_write(1000+ 4) <- 0x146 (c)
[    3.572000] mercury_cfg_read(1000+ 4) -> 0x146
[    3.572000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    3.580000] mercury_cfg_read(1000+20) -> 0x0
[    3.580000] mercury_cfg_write(1000+20) <- 0xffffffff (c)
[    3.588000] mercury_cfg_read(1000+20) -> 0x0
[    3.588000] mercury_cfg_write(1000+20) <- 0x0 (c)
[    3.588000] mercury_cfg_write(1000+ 4) <- 0x146 (c)
[    3.596000] mercury_cfg_read(1000+ 4) -> 0x146
[    3.596000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    3.600000] mercury_cfg_read(1000+24) -> 0x0
[    3.600000] mercury_cfg_write(1000+24) <- 0xffffffff (c)
[    3.608000] mercury_cfg_read(1000+24) -> 0x0
[    3.608000] mercury_cfg_write(1000+24) <- 0x0 (c)
[    3.616000] mercury_cfg_write(1000+ 4) <- 0x146 (c)
[    3.616000] mercury_cfg_read(1000+ 4) -> 0x146
[    3.624000] mercury_cfg_write(1000+ 4) <- 0x144 (c)
[    3.624000] mercury_cfg_read(1000+30) -> 0x0
[    3.628000] mercury_cfg_write(1000+30) <- 0xfffff800 (c)
[    3.632000] mercury_cfg_read(1000+30) -> 0x0
[    3.636000] mercury_cfg_write(1000+30) <- 0x0 (c)
[    3.636000] mercury_cfg_write(1000+ 4) <- 0x146 (c)
[    3.644000] mercury_cfg_read(1000+2c) -> 0x103c
[    3.644000] mercury_cfg_read(1000+2e) -> 0x12a4
[    3.652000] mercury_cfg_read(1000+ 6) -> 0x2b0
[    3.652000] mercury_cfg_read(1000+34) -> 0x40
[    3.652000] mercury_cfg_read(1000+40) -> 0x7
[    3.660000] mercury_cfg_read(1000+41) -> 0x48
[    3.660000] mercury_cfg_read(1000+48) -> 0x1
[    3.664000] mercury_cfg_read(1000+49) -> 0x50
[    3.664000] mercury_cfg_read(1000+50) -> 0x3
[    3.672000] mercury_cfg_read(1000+51) -> 0x58
[    3.672000] mercury_cfg_read(1000+58) -> 0x5
[    3.680000] mercury_cfg_read(1000+59) -> 0x0
[    3.680000] mercury_cfg_read(1000+ 6) -> 0x2b0
[    3.680000] mercury_cfg_read(1000+34) -> 0x40
[    3.688000] mercury_cfg_read(1000+40) -> 0x7
[    3.688000] mercury_cfg_read(1000+ 6) -> 0x2b0
[    3.696000] mercury_cfg_read(1000+34) -> 0x40
[    3.696000] mercury_cfg_read(1000+40) -> 0x7
[    3.700000] mercury_cfg_read(1000+41) -> 0x48
[    3.700000] mercury_cfg_read(1000+48) -> 0x1
[    3.700000] mercury_cfg_read(1000+4a) -> 0xc002
[    3.708000] mercury_cfg_read(1000+4c) -> 0x2100
[    3.708000] mercury_cfg_write(1000+4c) <- 0xa000 (c)
[    3.716000] mercury_cfg_read(1000+ 6) -> 0x2b0
[    3.716000] mercury_cfg_read(1000+34) -> 0x40
[    3.724000] mercury_cfg_read(1000+40) -> 0x7
[    3.724000] mercury_cfg_read(1000+41) -> 0x48
[    3.732000] mercury_cfg_read(1000+48) -> 0x1
[    3.732000] mercury_cfg_read(1000+49) -> 0x50
[    3.736000] mercury_cfg_read(1000+50) -> 0x3
[    3.736000] mercury_cfg_read(1800+ 0) -> 0xffffffff
[    3.736000] mercury_cfg_read(2000+ 0) -> 0xffffffff
[    3.744000] mercury_cfg_read(2800+ 0) -> 0xffffffff
[    3.744000] mercury_cfg_read(3000+ 0) -> 0xffffffff
[    3.752000] mercury_cfg_read(3800+ 0) -> 0xffffffff
[    3.752000] mercury_cfg_read(4000+ 0) -> 0xffffffff
[    3.760000] mercury_cfg_read(4800+ 0) -> 0xffffffff
[    3.760000] mercury_cfg_read(5000+ 0) -> 0xffffffff
[    3.768000] mercury_cfg_read(5800+ 0) -> 0xffffffff
[    3.768000] mercury_cfg_read(6000+ 0) -> 0xffffffff
[    3.772000] mercury_cfg_read(6800+ 0) -> 0xffffffff
[    3.772000] mercury_cfg_read(7000+ 0) -> 0xffffffff
[    3.780000] mercury_cfg_read(7800+ 0) -> 0xffffffff
[    3.780000] mercury_cfg_read(8000+ 0) -> 0xffffffff
[    3.788000] mercury_cfg_read(8800+ 0) -> 0xffffffff
[    3.788000] mercury_cfg_read(9000+ 0) -> 0xffffffff
[    3.796000] mercury_cfg_read(9800+ 0) -> 0xffffffff
[    3.796000] mercury_cfg_read(a000+ 0) -> 0xffffffff
[    3.804000] mercury_cfg_read(a800+ 0) -> 0xffffffff
[    3.804000] mercury_cfg_read(b000+ 0) -> 0xffffffff
[    3.808000] mercury_cfg_read(b800+ 0) -> 0xffffffff
[    3.808000] mercury_cfg_read(c000+ 0) -> 0xffffffff
[    3.816000] mercury_cfg_read(c800+ 0) -> 0xffffffff
[    3.816000] mercury_cfg_read(d000+ 0) -> 0xffffffff
[    3.824000] mercury_cfg_read(d800+ 0) -> 0xffffffff
[    3.824000] mercury_cfg_read(e000+ 0) -> 0xffffffff
[    3.832000] mercury_cfg_read(e800+ 0) -> 0xffffffff
[    3.832000] mercury_cfg_read(f000+ 0) -> 0xffffffff
[    3.840000] mercury_cfg_read(f800+ 0) -> 0xffffffff
[    3.840000] lba_fixup_bus(0x000000007f0cb400) bus 32 platform_data 0x000000007f128000
[    3.844000] lba_fixup_bus() PCI20 Ports [10000/1ffff]/100
[    3.852000] lba_fixup_bus() PCI20 LMMIO [ffffffff90000000/ffffffff9fffffff]/200
[    3.852000] lba_fixup_bus() 0000:20:01.0
[    3.860000] lba_fixup_bus() I/O Ports [2100/21ff] -> [12100/121ff]
[    3.860000] lba_fixup_bus() MMIO [90015000/900153ff] -> [ffffffff90015000/ffffffff900153ff]
[    3.868000] lba_fixup_bus() MMIO [90012000/90013fff] -> [ffffffff90012000/ffffffff90013fff]
[    3.876000] mercury_cfg_read(800+3d) -> 0x1
[    3.880000] lba_fixup_bus() 0000:20:01.1
[    3.880000] lba_fixup_bus() I/O Ports [2000/20ff] -> [12000/120ff]
[    3.888000] lba_fixup_bus() MMIO [90014000/900143ff] -> [ffffffff90014000/ffffffff900143ff]
[    3.888000] lba_fixup_bus() MMIO [90010000/90011fff] -> [ffffffff90010000/ffffffff90011fff]
[    3.896000] mercury_cfg_read(900+3d) -> 0x2
[    3.904000] lba_fixup_bus() 0000:20:02.0
[    3.904000] lba_fixup_bus() MMIO [90000000/9000ffff] -> [ffffffff90000000/ffffffff9000ffff]
[    3.912000] mercury_cfg_read(1000+3d) -> 0x1
[    3.912000] LBA pci_bus_size_bridges()
[    3.916000] LBA pci_bus_assign_resources()
[    3.916000] 
[    3.916000] LBA PIOP resource tree
[    3.924000] 
[    3.924000] LBA LMMIO resource tree
[    3.948000] Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
[    4.004000] mercury_cfg_read(0+ 0) -> 0xffffffff
[    4.004000] mercury_cfg_read(800+ 0) -> 0xffffffff
[    4.004000] mercury_cfg_read(1000+ 0) -> 0xffffffff
[    4.004000] mercury_cfg_read(1800+ 0) -> 0xffffffff
[    4.004000] mercury_cfg_read(2000+ 0) -> 0xffffffff
[    4.012000] mercury_cfg_read(2800+ 0) -> 0xffffffff
[    4.012000] mercury_cfg_read(3000+ 0) -> 0xffffffff
[    4.016000] mercury_cfg_read(3800+ 0) -> 0xffffffff
[    4.020000] mercury_cfg_read(4000+ 0) -> 0xffffffff
[    4.024000] mercury_cfg_read(4800+ 0) -> 0xffffffff
[    4.024000] mercury_cfg_read(5000+ 0) -> 0xffffffff
[    4.032000] mercury_cfg_read(5800+ 0) -> 0xffffffff
[    4.032000] mercury_cfg_read(6000+ 0) -> 0xffffffff
[    4.040000] mercury_cfg_read(6800+ 0) -> 0xffffffff
[    4.040000] mercury_cfg_read(7000+ 0) -> 0xffffffff
[    4.048000] mercury_cfg_read(7800+ 0) -> 0xffffffff
[    4.048000] mercury_cfg_read(8000+ 0) -> 0xffffffff
[    4.052000] mercury_cfg_read(8800+ 0) -> 0xffffffff
[    4.052000] mercury_cfg_read(9000+ 0) -> 0xffffffff
[    4.060000] mercury_cfg_read(9800+ 0) -> 0xffffffff
[    4.060000] mercury_cfg_read(a000+ 0) -> 0xffffffff
[    4.068000] mercury_cfg_read(a800+ 0) -> 0xffffffff
[    4.068000] mercury_cfg_read(b000+ 0) -> 0xffffffff
[    4.076000] mercury_cfg_read(b800+ 0) -> 0xffffffff
[    4.076000] mercury_cfg_read(c000+ 0) -> 0xffffffff
[    4.084000] mercury_cfg_read(c800+ 0) -> 0xffffffff
[    4.084000] mercury_cfg_read(d000+ 0) -> 0xffffffff
[    4.088000] mercury_cfg_read(d800+ 0) -> 0xffffffff
[    4.088000] mercury_cfg_read(e000+ 0) -> 0xffffffff
[    4.096000] mercury_cfg_read(e800+ 0) -> 0xffffffff
[    4.096000] mercury_cfg_read(f000+ 0) -> 0xffffffff
[    4.104000] mercury_cfg_read(f800+ 0) -> 0xffffffff
[    4.104000] lba_fixup_bus(0x000000007f0cbc00) bus 64 platform_data 0x000000007f128400
[    4.112000] lba_fixup_bus() PCI40 Ports [20000/2ffff]/100
[    4.120000] lba_fixup_bus() PCI40 LMMIO [ffffffffa0000000/ffffffffafffffff]/200
[    4.120000] LBA pci_bus_size_bridges()
[    4.124000] LBA pci_bus_assign_resources()
[    4.124000] 
[    4.124000] LBA PIOP resource tree
[    4.132000] 
[    4.132000] LBA LMMIO resource tree
[    4.156000] Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
[    4.212000] mercury_cfg_read(0+ 0) -> 0xffffffff
[    4.212000] mercury_cfg_read(800+ 0) -> 0xffffffff
[    4.212000] mercury_cfg_read(1000+ 0) -> 0xffffffff
[    4.212000] mercury_cfg_read(1800+ 0) -> 0xffffffff
[    4.212000] mercury_cfg_read(2000+ 0) -> 0xffffffff
[    4.220000] mercury_cfg_read(2800+ 0) -> 0xffffffff
[    4.220000] mercury_cfg_read(3000+ 0) -> 0xffffffff
[    4.224000] mercury_cfg_read(3800+ 0) -> 0xffffffff
[    4.224000] mercury_cfg_read(4000+ 0) -> 0xffffffff
[    4.236000] mercury_cfg_read(4800+ 0) -> 0xffffffff
[    4.236000] mercury_cfg_read(5000+ 0) -> 0xffffffff
[    4.248000] mercury_cfg_read(5800+ 0) -> 0xffffffff
[    4.248000] mercury_cfg_read(6000+ 0) -> 0xffffffff
[    4.260000] mercury_cfg_read(6800+ 0) -> 0xffffffff
[    4.260000] mercury_cfg_read(7000+ 0) -> 0xffffffff
[    4.268000] mercury_cfg_read(7800+ 0) -> 0xffffffff
[    4.268000] mercury_cfg_read(8000+ 0) -> 0xffffffff
[    4.276000] mercury_cfg_read(8800+ 0) -> 0xffffffff
[    4.276000] mercury_cfg_read(9000+ 0) -> 0xffffffff
[    4.284000] mercury_cfg_read(9800+ 0) -> 0xffffffff
[    4.288000] mercury_cfg_read(a000+ 0) -> 0xffffffff
[    4.292000] mercury_cfg_read(a800+ 0) -> 0xffffffff
[    4.292000] mercury_cfg_read(b000+ 0) -> 0xffffffff
[    4.300000] mercury_cfg_read(b800+ 0) -> 0xffffffff
[    4.300000] mercury_cfg_read(c000+ 0) -> 0xffffffff
[    4.308000] mercury_cfg_read(c800+ 0) -> 0xffffffff
[    4.308000] mercury_cfg_read(d000+ 0) -> 0xffffffff
[    4.316000] mercury_cfg_read(d800+ 0) -> 0xffffffff
[    4.316000] mercury_cfg_read(e000+ 0) -> 0xffffffff
[    4.324000] mercury_cfg_read(e800+ 0) -> 0xffffffff
[    4.324000] mercury_cfg_read(f000+ 0) -> 0xffffffff
[    4.328000] mercury_cfg_read(f800+ 0) -> 0xffffffff
[    4.328000] lba_fixup_bus(0x000000007f0cc400) bus 96 platform_data 0x000000007f128800
[    4.336000] lba_fixup_bus() PCI60 Ports [30000/3ffff]/100
[    4.344000] lba_fixup_bus() PCI60 LMMIO [ffffffffb0000000/ffffffffbfffffff]/200
[    4.344000] LBA pci_bus_size_bridges()
[    4.352000] LBA pci_bus_assign_resources()
[    4.352000] 
[    4.352000] LBA PIOP resource tree
[    4.360000] 
[    4.360000] LBA LMMIO resource tree
[    4.380000] Mercury version TR3.2 (0x32) found at 0xfffffffffed28000
[    4.436000] mercury_cfg_read(0+ 0) -> 0xffffffff
[    4.436000] mercury_cfg_read(800+ 0) -> 0xffffffff
[    4.436000] mercury_cfg_read(1000+ 0) -> 0xffffffff
[    4.436000] mercury_cfg_read(1800+ 0) -> 0xffffffff
[    4.440000] mercury_cfg_read(2000+ 0) -> 0xffffffff
[    4.444000] mercury_cfg_read(2800+ 0) -> 0xffffffff
[    4.444000] mercury_cfg_read(3000+ 0) -> 0xffffffff
[    4.452000] mercury_cfg_read(3800+ 0) -> 0xffffffff
[    4.452000] mercury_cfg_read(4000+ 0) -> 0xffffffff
[    4.460000] mercury_cfg_read(4800+ 0) -> 0xffffffff
[    4.460000] mercury_cfg_read(5000+ 0) -> 0xffffffff
[    4.468000] mercury_cfg_read(5800+ 0) -> 0xffffffff
[    4.468000] mercury_cfg_read(6000+ 0) -> 0xffffffff
[    4.476000] mercury_cfg_read(6800+ 0) -> 0xffffffff
[    4.476000] mercury_cfg_read(7000+ 0) -> 0xffffffff
[    4.480000] mercury_cfg_read(7800+ 0) -> 0xffffffff
[    4.480000] mercury_cfg_read(8000+ 0) -> 0xffffffff
[    4.488000] mercury_cfg_read(8800+ 0) -> 0xffffffff
[    4.488000] mercury_cfg_read(9000+ 0) -> 0xffffffff
[    4.496000] mercury_cfg_read(9800+ 0) -> 0xffffffff
[    4.496000] mercury_cfg_read(a000+ 0) -> 0xffffffff
[    4.504000] mercury_cfg_read(a800+ 0) -> 0xffffffff
[    4.504000] mercury_cfg_read(b000+ 0) -> 0xffffffff
[    4.512000] mercury_cfg_read(b800+ 0) -> 0xffffffff
[    4.512000] mercury_cfg_read(c000+ 0) -> 0xffffffff
[    4.516000] mercury_cfg_read(c800+ 0) -> 0xffffffff
[    4.516000] mercury_cfg_read(d000+ 0) -> 0xffffffff
[    4.524000] mercury_cfg_read(d800+ 0) -> 0xffffffff
[    4.524000] mercury_cfg_read(e000+ 0) -> 0xffffffff
[    4.532000] mercury_cfg_read(e800+ 0) -> 0xffffffff
[    4.532000] mercury_cfg_read(f000+ 0) -> 0xffffffff
[    4.540000] mercury_cfg_read(f800+ 0) -> 0xffffffff
[    4.540000] lba_fixup_bus(0x000000007f0ccc00) bus 128 platform_data 0x000000007f128c00
[    4.548000] lba_fixup_bus() PCI80 Ports [40000/4ffff]/100
[    4.552000] lba_fixup_bus() PCI80 LMMIO [ffffffffc0000000/ffffffffcfffffff]/200
[    4.552000] LBA pci_bus_size_bridges()
[    4.560000] LBA pci_bus_assign_resources()
[    4.560000] 
[    4.560000] LBA PIOP resource tree
[    4.568000] 
[    4.568000] LBA LMMIO resource tree
[    4.588000] Mercury version TR3.2 (0x32) found at 0xfffffffffed2c000
[    4.644000] mercury_cfg_read(0+ 0) -> 0xffffffff
[    4.648000] mercury_cfg_read(800+ 0) -> 0xffffffff
[    4.648000] mercury_cfg_read(1000+ 0) -> 0xffffffff
[    4.648000] mercury_cfg_read(1800+ 0) -> 0xffffffff
[    4.648000] mercury_cfg_read(2000+ 0) -> 0xffffffff
[    4.652000] mercury_cfg_read(2800+ 0) -> 0xffffffff
[    4.652000] mercury_cfg_read(3000+ 0) -> 0xffffffff
[    4.660000] mercury_cfg_read(3800+ 0) -> 0xffffffff
[    4.660000] mercury_cfg_read(4000+ 0) -> 0xffffffff
[    4.668000] mercury_cfg_read(4800+ 0) -> 0xffffffff
[    4.668000] mercury_cfg_read(5000+ 0) -> 0xffffffff
[    4.676000] mercury_cfg_read(5800+ 0) -> 0xffffffff
[    4.676000] mercury_cfg_read(6000+ 0) -> 0xffffffff
[    4.684000] mercury_cfg_read(6800+ 0) -> 0xffffffff
[    4.684000] mercury_cfg_read(7000+ 0) -> 0xffffffff
[    4.688000] mercury_cfg_read(7800+ 0) -> 0xffffffff
[    4.688000] mercury_cfg_read(8000+ 0) -> 0xffffffff
[    4.696000] mercury_cfg_read(8800+ 0) -> 0xffffffff
[    4.696000] mercury_cfg_read(9000+ 0) -> 0xffffffff
[    4.704000] mercury_cfg_read(9800+ 0) -> 0xffffffff
[    4.704000] mercury_cfg_read(a000+ 0) -> 0xffffffff
[    4.712000] mercury_cfg_read(a800+ 0) -> 0xffffffff
[    4.712000] mercury_cfg_read(b000+ 0) -> 0xffffffff
[    4.720000] mercury_cfg_read(b800+ 0) -> 0xffffffff
[    4.720000] mercury_cfg_read(c000+ 0) -> 0xffffffff
[    4.724000] mercury_cfg_read(c800+ 0) -> 0xffffffff
[    4.724000] mercury_cfg_read(d000+ 0) -> 0xffffffff
[    4.732000] mercury_cfg_read(d800+ 0) -> 0xffffffff
[    4.732000] mercury_cfg_read(e000+ 0) -> 0xffffffff
[    4.740000] mercury_cfg_read(e800+ 0) -> 0xffffffff
[    4.740000] mercury_cfg_read(f000+ 0) -> 0xffffffff
[    4.748000] mercury_cfg_read(f800+ 0) -> 0xffffffff
[    4.748000] lba_fixup_bus(0x000000007f0cd400) bus 192 platform_data 0x000000007f129000
[    4.756000] lba_fixup_bus() PCIc0 Ports [50000/5ffff]/100
[    4.760000] lba_fixup_bus() PCIc0 LMMIO [ffffffffe0000000/ffffffffefffffff]/200
[    4.760000] LBA pci_bus_size_bridges()
[    4.768000] LBA pci_bus_assign_resources()
[    4.768000] 
[    4.768000] LBA PIOP resource tree
[    4.776000] 
[    4.776000] LBA LMMIO resource tree
[    4.800000] Mercury version TR3.2 (0x32) found at 0xfffffffffed2e000
[    4.852000] mercury_cfg_read(0+ 0) -> 0xffffffff
[    4.852000] mercury_cfg_read(800+ 0) -> 0x1290103c
[    4.856000] mercury_cfg_read(800+ e) -> 0x80
[    4.856000] mercury_cfg_read(800+ 6) -> 0x290
[    4.856000] mercury_cfg_read(800+34) -> 0x48
[    4.860000] mercury_cfg_read(800+48) -> 0x1
[    4.860000] mercury_cfg_read(800+49) -> 0x0
[    4.868000] mercury_cfg_read(800+ 8) -> 0x7800001
[    4.868000] mercury_cfg_read(800+ 6) -> 0x290
[    4.876000] mercury_cfg_read(800+34) -> 0x48
[    4.876000] mercury_cfg_read(800+48) -> 0x1
[    4.876000] mercury_cfg_read(800+49) -> 0x0
[    4.884000] mercury_cfg_read(800+3d) -> 0x1
[    4.884000] mercury_cfg_read(800+3c) -> 0x0
[    4.892000] mercury_cfg_read(800+ 4) -> 0x146
[    4.892000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    4.896000] mercury_cfg_read(800+10) -> 0x0
[    4.896000] mercury_cfg_write(800+10) <- 0xffffffff (c)
[    4.904000] mercury_cfg_read(800+10) -> 0x0
[    4.904000] mercury_cfg_write(800+10) <- 0x0 (c)
[    4.904000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    4.912000] mercury_cfg_read(800+ 4) -> 0x146
[    4.912000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    4.920000] mercury_cfg_read(800+14) -> 0x0
[    4.920000] mercury_cfg_write(800+14) <- 0xffffffff (c)
[    4.928000] mercury_cfg_read(800+14) -> 0x0
[    4.928000] mercury_cfg_write(800+14) <- 0x0 (c)
[    4.932000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    4.932000] mercury_cfg_read(800+ 4) -> 0x146
[    4.940000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    4.940000] mercury_cfg_read(800+18) -> 0xf4051000
[    4.948000] mercury_cfg_write(800+18) <- 0xffffffff (c)
[    4.948000] mercury_cfg_read(800+18) -> 0xfffffff0
[    4.956000] mercury_cfg_write(800+18) <- 0xf4051000 (c)
[    4.956000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    4.964000] mercury_cfg_read(800+ 4) -> 0x146
[    4.964000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    4.968000] mercury_cfg_read(800+1c) -> 0x0
[    4.972000] mercury_cfg_write(800+1c) <- 0xffffffff (c)
[    4.976000] mercury_cfg_read(800+1c) -> 0x0
[    4.976000] mercury_cfg_write(800+1c) <- 0x0 (c)
[    4.976000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    4.984000] mercury_cfg_read(800+ 4) -> 0x146
[    4.984000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    4.992000] mercury_cfg_read(800+20) -> 0x0
[    4.992000] mercury_cfg_write(800+20) <- 0xffffffff (c)
[    5.000000] mercury_cfg_read(800+20) -> 0x0
[    5.000000] mercury_cfg_write(800+20) <- 0x0 (c)
[    5.004000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    5.008000] mercury_cfg_read(800+ 4) -> 0x146
[    5.012000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    5.012000] mercury_cfg_read(800+24) -> 0x0
[    5.020000] mercury_cfg_write(800+24) <- 0xffffffff (c)
[    5.020000] mercury_cfg_read(800+24) -> 0x0
[    5.020000] mercury_cfg_write(800+24) <- 0x0 (c)
[    5.028000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    5.028000] mercury_cfg_read(800+ 4) -> 0x146
[    5.036000] mercury_cfg_write(800+ 4) <- 0x144 (c)
[    5.036000] mercury_cfg_read(800+30) -> 0x0
[    5.040000] mercury_cfg_write(800+30) <- 0xfffff800 (c)
[    5.040000] mercury_cfg_read(800+30) -> 0x0
[    5.052000] mercury_cfg_write(800+30) <- 0x0 (c)
[    5.052000] mercury_cfg_write(800+ 4) <- 0x146 (c)
[    5.060000] mercury_cfg_read(800+2c) -> 0x103c
[    5.060000] mercury_cfg_read(800+2e) -> 0x1291
[    5.072000] mercury_cfg_read(800+ 6) -> 0x290
[    5.072000] mercury_cfg_read(800+34) -> 0x48
[    5.072000] mercury_cfg_read(800+48) -> 0x1
[    5.080000] mercury_cfg_read(800+49) -> 0x0
[    5.080000] mercury_cfg_read(800+ 6) -> 0x290
[    5.088000] mercury_cfg_read(800+34) -> 0x48
[    5.088000] mercury_cfg_read(800+48) -> 0x1
[    5.092000] mercury_cfg_read(800+49) -> 0x0
[    5.092000] mercury_cfg_read(800+ 6) -> 0x290
[    5.100000] mercury_cfg_read(800+34) -> 0x48
[    5.100000] mercury_cfg_read(800+48) -> 0x1
[    5.100000] mercury_cfg_read(800+4a) -> 0x2
[    5.108000] mercury_cfg_read(800+ 6) -> 0x290
[    5.108000] mercury_cfg_read(800+34) -> 0x48
[    5.116000] mercury_cfg_read(800+48) -> 0x1
[    5.116000] mercury_cfg_read(800+49) -> 0x0
[    5.124000] mercury_cfg_read(900+ 0) -> 0x1048103c
[    5.124000] mercury_cfg_read(900+ e) -> 0x80
[    5.124000] mercury_cfg_read(900+ 6) -> 0x290
[    5.128000] mercury_cfg_read(900+34) -> 0x48
[    5.128000] mercury_cfg_read(900+48) -> 0x1
[    5.136000] mercury_cfg_read(900+49) -> 0x0
[    5.136000] mercury_cfg_read(900+ 8) -> 0x7000203
[    5.144000] mercury_cfg_read(900+ 6) -> 0x290
[    5.144000] mercury_cfg_read(900+34) -> 0x48
[    5.152000] mercury_cfg_read(900+48) -> 0x1
[    5.152000] mercury_cfg_read(900+49) -> 0x0
[    5.152000] mercury_cfg_read(900+3d) -> 0x1
[    5.160000] mercury_cfg_read(900+3c) -> 0x0
[    5.160000] mercury_cfg_read(900+ 4) -> 0x142
[    5.164000] mercury_cfg_write(900+ 4) <- 0x140 (c)



Firmware Version  46.34

Duplex Console IO Dependent Code (IODC) revision 1

PROCESSOR PIM INFORMATION

Original Product Number:  A7136A
Current Product Number:   A7136A


-----------------  Processor 0 HPMC Information - PDC Version: 46.34  ------ 

Timestamp =   Sun Oct  31 19:28:34 GMT 2010    (20:10:10:31:19:28:34)

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
       0xe800035c00e00000 0x000000000000c46c
       0x57000f7300e00000 0x8040004000000000
       0xf600105e00e00000 0xfffffff0f0c00000
       0x140003b200e00000 0x000000000000000b
       0x5600100b00e00000 0x0000000000000194
       0x5600106400e00000 0xfffffff0f0435110


General Registers 0 - 31
00-03  0000000000000000  000000000000cde0  000000000000c2b0  00000000005f2140
04-07  fffffffff4050000  0000000000000000  00000000005f21c0  0000000000000000
08-11  0000000000000037  0000000000000060  00000000005f2140  0000000000000000
12-15  00000000005f21c0  0000000000000037  00000000005f3508  00000000405781e0
16-19  0000000000000000  00000000406d5270  00000000406d5270  fffffffff4050005
20-23  00000000005f21c0  0000000000000003  0000000000000190  0000000000000037
24-27  00000000005f21c0  00000000005f2140  fffffffff4050000  000000000000d010
28-31  00000000406c4270  00000000005f3608  00000000005f36e8  0000000000000020

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  00000000000000c0  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000103000  ff80000000000000
16-19  0000001e8b013030  0000000000000000  000000000000c46c  000000000e601027
20-23  00000000ae07ffd0  c000000014050005  0000000008000008  8000000000000000
24-27  00000000005d7000  00000000005d7000  eff1ffddadbe93c7  0000000040000b80
28-31  0000000040000b80  eff1ffddadbe93c7  000000007f058000  eff1ffddadbe93c7

Space Registers 0 - 7
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x000000000000c470
Check Type                   = 0x20000000
Cpu State                    = 0x9e000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000

Floating Point Registers 0 - 31
00-03  0014081f0000001f  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000
24-27  0000000000000000  00000000001b6000  000000007f0803d8  00000000405c97a0
28-31  0000000000000802  0000000000000000  0000000000000000  0000000000000000

PIM Revision                 = 0x0000000000000001                
CPU ID                       = 0x0000000000000014
CPU Revision                 = 0x0000000000000031
Cpu Serial Number            = 0x46100b89e43f0503
Check Summary                = 0x8040004000000000
SAL Timestamp                = 0x000000004ccdc362
System Firmware Rev.         = 0x00000ba20000121a
PDC Relocation Address       = 0xfffffff0f0c00000
Available Memory             = 0x000000027fe00000
CPU Diagnose Register 2      = 0x3112002000002008
MIB_STAT                     = 0x0040000000200000
MIB_LOG1                     = 0x0000000000555500
MIB_LOG2                     = 0x0000800000000000
MIB_ECC_DATA                 = 0x808800007fffbfd8
ICache Info                  = 0x0000000000000000
DCache Info                  = 0x0000000000000000
Sharedcache Info1            = 0x0000000000000000
Sharedcache Info2            = 0x0000000000000040
MIB_RSLOG1                   = 0x0000000000000004
MIB_RSLOG2                   = 0x0000010000000000
MIB_RQLOG                    = 0x040c1405fffe1510
MIB_REQLOGa                  = 0x8000000000000200
MIB_REQLOGb                  = 0x01000aa400000000
Reserved                     = 0x0000000000000000
Cache Repair Detail          = 0x0000000000000000

PIM Detail Text:



--gKMricLos+KVdGMg--
