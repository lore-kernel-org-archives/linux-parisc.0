From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Timer and IPI IRQ handler type mismatches
Date: Sat, 11 Jun 2011 11:29:28 -0400
Message-ID: <20110611152927.GA23753@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

With CONFIG_DEBUG_SHIRQ, I see the error messages shown below:
Think IRQF_SHARED flag may need to be set.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

dave@mx3210:~/gnu/gcc/objdir$ dmesg
Linux version 3.0.0-rc2+ (dave@mx3210) (gcc version 4.5.3 20110101 (prerelease) [gcc-4_5-branch revision 168387] (GCC) ) #4 SMP Fri Jun 10 20:20:02 EDT 2011
unwind_init: start = 0x404d0000, end = 0x404ff410, entries = 12097
FP[0] enabled: Rev 1 Model 20
The 64-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00008870 00000491 00000000 00000002 3e0505e7352af711 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 20 rev 4 (0x00000284)
capabilities 0x35
model 9000/800/rp3440  
parisc_cache_init: Only equivalent aliasing supported!
Memory Ranges:
 0) Start 0x0000000000000000 End 0x000000003fffffff Size   1024 MB
 1) Start 0x0000000100000000 End 0x000000027fdfffff Size   6142 MB
 2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
Total Memory: 10238 MB
initrd: 7f61a000-7ffeea6c
initrd: reserving 3f61a000-3ffeea6c (mem_max 27fe00000)
On node 0 totalpages: 262144
free_area_init_node: node 0, pgdat 405145c0, node_mem_map 419f6000
  Normal zone: 3584 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 258560 pages, LIFO batch:31
On node 1 totalpages: 1572352
free_area_init_node: node 1, pgdat 40515340, node_mem_map 140000000
  Normal zone: 21497 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 1550855 pages, LIFO batch:31
On node 2 totalpages: 786432
free_area_init_node: node 2, pgdat 405160c0, node_mem_map 4080000000
  Normal zone: 10752 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 775680 pages, LIFO batch:31
PERCPU: Embedded 9 pages/cpu @00000000427ff000 s7808 r8192 d20864 u36864
pcpu-alloc: s7808 r8192 d20864 u36864 alloc=9*4096
pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0] 06 [0] 07 
pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11 [0] 12 [0] 13 [0] 14 [0] 15 
pcpu-alloc: [0] 16 [0] 17 [0] 18 [0] 19 [0] 20 [0] 21 [0] 22 [0] 23 
pcpu-alloc: [0] 24 [0] 25 [0] 26 [0] 27 [0] 28 [0] 29 [0] 30 [0] 31 
SMP: bootstrap CPU ID is 0
Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2585095
Kernel command line: root=/dev/sda5 console=ttyS1 HOME=/ palo_kernel=2/vmlinux
PID hash table entries: 4096 (order: 3, 32768 bytes)
Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Memory: 10278020k/10483712k available (3278k kernel code, 205692k reserved, 1421k data, 212k init)
virtual kernel memory layout:
    vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    memory  : 0x0000000040000000 - 0x0000004140000000   (266240 MB)
      .init : 0x000000004065c000 - 0x0000000040691000   ( 212 kB)
      .data : 0x0000000040433890 - 0x0000000040596ed0   (1421 kB)
      .text : 0x0000000040100000 - 0x0000000040433890   (3278 kB)
Hierarchical RCU implementation.
NR_IRQS:128
Console: colour dummy device 160x64
------------------------
| Locking API testsuite:
----------------------------------------------------------------------------
                                 | spin |wlock |rlock |mutex | wsem | rsem |
  --------------------------------------------------------------------------
                     A-A deadlock:failed|failed|  ok  |failed|failed|failed|
                 A-B-B-A deadlock:failed|failed|  ok  |failed|failed|failed|
             A-B-B-C-C-A deadlock:failed|failed|  ok  |failed|failed|failed|
             A-B-C-A-B-C deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-B-C-C-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-C-D-B-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
         A-B-C-D-B-C-D-A deadlock:failed|failed|  ok  |failed|failed|failed|
                    double unlock:failed|failed|failed|  ok  |failed|failed|
                  initialize held:failed|failed|failed|failed|failed|failed|
                 bad unlock order:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
  --------------------------------------------------------------------------
              recursive read-lock:             |  ok  |             |failed|
           recursive read-lock #2:             |  ok  |             |failed|
            mixed read-write-lock:             |failed|             |failed|
            mixed write-read-lock:             |failed|             |failed|
  --------------------------------------------------------------------------
     hard-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     hard-irqs-on + irq-safe-A/21:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/21:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/12:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/21:failed|failed|  ok  |
         hard-safe-A + irqs-on/12:failed|failed|  ok  |
         soft-safe-A + irqs-on/12:failed|failed|  ok  |
         hard-safe-A + irqs-on/21:failed|failed|  ok  |
         soft-safe-A + irqs-on/21:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/321:failed|failed|  ok  |
      hard-irq lock-inversion/123:failed|failed|  ok  |
      soft-irq lock-inversion/123:failed|failed|  ok  |
      hard-irq lock-inversion/132:failed|failed|  ok  |
      soft-irq lock-inversion/132:failed|failed|  ok  |
      hard-irq lock-inversion/213:failed|failed|  ok  |
      soft-irq lock-inversion/213:failed|failed|  ok  |
      hard-irq lock-inversion/231:failed|failed|  ok  |
      soft-irq lock-inversion/231:failed|failed|  ok  |
      hard-irq lock-inversion/312:failed|failed|  ok  |
      soft-irq lock-inversion/312:failed|failed|  ok  |
      hard-irq lock-inversion/321:failed|failed|  ok  |
      soft-irq lock-inversion/321:failed|failed|  ok  |
      hard-irq read-recursion/123:  ok  |
      soft-irq read-recursion/123:  ok  |
      hard-irq read-recursion/132:  ok  |
      soft-irq read-recursion/132:  ok  |
      hard-irq read-recursion/213:  ok  |
      soft-irq read-recursion/213:  ok  |
      hard-irq read-recursion/231:  ok  |
      soft-irq read-recursion/231:  ok  |
      hard-irq read-recursion/312:  ok  |
      soft-irq read-recursion/312:  ok  |
      hard-irq read-recursion/321:  ok  |
      soft-irq read-recursion/321:  ok  |
--------------------------------------------------------
144 out of 218 testcases failed, as expected. |
----------------------------------------------------
Calibrating delay loop... 1594.36 BogoMIPS (lpj=3188736)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 256
Brought up 1 CPUs
atomic64 test passed
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Storm Peak Slow at 0xfffffffffe780000 [128] { 0, 0x0, 0x887, 0x00004 }
2. Storm Peak Slow at 0xfffffffffe781000 [129] { 0, 0x0, 0x887, 0x00004 }
3. Storm Peak Slow at 0xfffffffffe798000 [152] { 0, 0x0, 0x887, 0x00004 }
4. Storm Peak Slow at 0xfffffffffe799000 [153] { 0, 0x0, 0x887, 0x00004 }
5. Everest Mako Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x0af, 0x00009 }
6. Pluto BC McKinley Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x880, 0x0000c }
7. Mercury PCI Bridge at 0xfffffffffed20000 [0/0] { 13, 0x0, 0x783, 0x0000a }
8. Mercury PCI Bridge at 0xfffffffffed22000 [0/1] { 13, 0x0, 0x783, 0x0000a }
9. Mercury PCI Bridge at 0xfffffffffed24000 [0/2] { 13, 0x0, 0x783, 0x0000a }
10. Mercury PCI Bridge at 0xfffffffffed26000 [0/3] { 13, 0x0, 0x783, 0x0000a }
11. Mercury PCI Bridge at 0xfffffffffed28000 [0/4] { 13, 0x0, 0x783, 0x0000a }
12. Mercury PCI Bridge at 0xfffffffffed2c000 [0/6] { 13, 0x0, 0x783, 0x0000a }
13. Mercury PCI Bridge at 0xfffffffffed2e000 [0/7] { 13, 0x0, 0x783, 0x0000a }
14. BMC IPMI Mgmt Ctlr at 0xfffffff0f05b0000 [16] { 15, 0x0, 0x004, 0x000c0 }
Releasing cpu 1 now, hpa=fffffffffe781000
FP[1] enabled: Rev 1 Model 20
IRQ handler type mismatch for IRQ 64
current handler: timer
Backtrace:
 [<0000000040116540>] dump_stack+0x18/0x28
 [<000000004019fa5c>] __setup_irq+0x584/0x590
 [<000000004019fd58>] setup_irq+0x58/0xc8
 [<0000000040662554>] init_IRQ+0xac/0x138
 [<0000000040663628>] smp_cpu_init+0x140/0x160
 [<000000004066366c>] smp_callin+0x24/0x78
 [<0000000040146c30>] enqueue_task_fair+0x58/0x70
 [<0000000040146f7c>] pick_next_entity+0x84/0x118

IRQ handler type mismatch for IRQ 65
current handler: IPI
Backtrace:
 [<0000000040116540>] dump_stack+0x18/0x28
 [<000000004019fa5c>] __setup_irq+0x584/0x590
 [<000000004019fd58>] setup_irq+0x58/0xc8
 [<0000000040662590>] init_IRQ+0xe8/0x138
 [<0000000040663628>] smp_cpu_init+0x140/0x160
 [<000000004066366c>] smp_callin+0x24/0x78
 [<0000000040146c30>] enqueue_task_fair+0x58/0x70
 [<0000000040146f7c>] pick_next_entity+0x84/0x118

Releasing cpu 2 now, hpa=fffffffffe798000
FP[2] enabled: Rev 1 Model 20
IRQ handler type mismatch for IRQ 64
current handler: timer
Backtrace:
 [<0000000040116540>] dump_stack+0x18/0x28
 [<000000004019fa5c>] __setup_irq+0x584/0x590
Releasing cpu 3 now, hpa=fffffffffe799000
 [<000000004019fd58>] setup_irq+0x58/0xc8
 [<0000000040662554>] init_IRQ+0xac/0x138
 [<0000000040663628>] smp_cpu_init+0x140/0x160
 [<000000004066366c>] smp_callin+0x24/0x78
 [<00000000401170c0>] schedule+0x240/0x530
 [<0000000040179e88>] kthread+0x98/0xd8
 [<000000004010407c>] ret_from_kernel_thread+0x24/0x40

IRQ handler type mismatch for IRQ 65
current handler: IPI
Backtrace:
 [<0000000040116540>] dump_stack+0x18/0x28
 [<000000004019fa5c>] __setup_irq+0x584/0x590
 [<000000004019fd58>] setup_irq+0x58/0xc8
 [<0000000040662590>] init_IRQ+0xe8/0x138
 [<0000000040663628>] smp_cpu_init+0x140/0x160
 [<000000004066366c>] smp_callin+0x24/0x78
 [<00000000401170c0>] schedule+0x240/0x530
 [<0000000040179e88>] kthread+0x98/0xd8
FP[3] enabled: Rev 1 Model 20
 [<000000004010407c>] ret_from_kernel_thread+0x24/0x40

IRQ handler type mismatch for IRQ 64
CPU(s): 4 x PA8800 (Mako) at 800.006400 MHz
current handler: timer
Backtrace:
 [<0000000040116540>] dump_stack+0x18/0x28
 [<000000004019fa5c>] __setup_irq+0x584/0x590
 [<000000004019fd58>] setup_irq+0x58/0xc8
 [<0000000040662554>] init_IRQ+0xac/0x138
 [<0000000040663628>] smp_cpu_init+0x140/0x160
 [<000000004066366c>] smp_callin+0x24/0x78
 [<00000000401170c0>] schedule+0x240/0x530
 [<0000000040179e88>] kthread+0x98/0xd8
 [<000000004010407c>] ret_from_kernel_thread+0x24/0x40

IRQ handler type mismatch for IRQ 65
current handler: IPI
Backtrace:
 [<0000000040116540>] dump_stack+0x18/0x28
 [<000000004019fa5c>] __setup_irq+0x584/0x590
 [<000000004019fd58>] setup_irq+0x58/0xc8
 [<0000000040662590>] init_IRQ+0xe8/0x138
 [<0000000040663628>] smp_cpu_init+0x140/0x160
 [<000000004066366c>] smp_callin+0x24/0x78
 [<00000000401170c0>] schedule+0x240/0x530
 [<0000000040179e88>] kthread+0x98/0xd8
 [<000000004010407c>] ret_from_kernel_thread+0x24/0x40

Whole cache flush 59429611 cycles, flushing 5836800 bytes 583933 cycles
Setting cache flush threshold to 2000000 (4 CPUs online)
SBA found Pluto 2.3 at 0xfffffffffed00000
Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
pci 0000:00:01.0: [1033:0035] type 0 class 0x000c03
pci 0000:00:01.0: reg 10: [mem 0x80002000-0x80002fff]
pci 0000:00:01.0: supports D1 D2
pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
pci 0000:00:01.0: PME# disabled
pci 0000:00:01.1: [1033:0035] type 0 class 0x000c03
pci 0000:00:01.1: reg 10: [mem 0x80001000-0x80001fff]
pci 0000:00:01.1: supports D1 D2
pci 0000:00:01.1: PME# supported from D0 D1 D2 D3hot
pci 0000:00:01.1: PME# disabled
pci 0000:00:01.2: [1033:00e0] type 0 class 0x000c03
pci 0000:00:01.2: reg 10: [mem 0x80000000-0x800000ff]
pci 0000:00:01.2: supports D1 D2
pci 0000:00:01.2: PME# supported from D0 D1 D2 D3hot
pci 0000:00:01.2: PME# disabled
pci 0000:00:02.0: [1095:0649] type 0 class 0x000101
pci 0000:00:02.0: reg 10: [io  0x0d18-0x0d1f]
pci 0000:00:02.0: reg 14: [io  0x0d24-0x0d27]
pci 0000:00:02.0: reg 18: [io  0x0d10-0x0d17]
pci 0000:00:02.0: reg 1c: [io  0x0d20-0x0d23]
pci 0000:00:02.0: reg 20: [io  0x0d00-0x0d0f]
pci 0000:00:02.0: supports D1 D2
Mercury version TR3.2 (0x32) found at 0xfffffffffed22000
pci 0000:20:01.0: [1000:0021] type 0 class 0x000100
pci 0000:20:01.0: reg 10: [io  0x2100-0x21ff]
pci 0000:20:01.0: reg 14: [mem 0x90015000-0x900153ff 64bit]
pci 0000:20:01.0: reg 1c: [mem 0x90012000-0x90013fff 64bit]
pci 0000:20:01.0: supports D1 D2
pci 0000:20:01.1: [1000:0021] type 0 class 0x000100
pci 0000:20:01.1: reg 10: [io  0x2000-0x20ff]
pci 0000:20:01.1: reg 14: [mem 0x90014000-0x900143ff 64bit]
pci 0000:20:01.1: reg 1c: [mem 0x90010000-0x90011fff 64bit]
pci 0000:20:01.1: supports D1 D2
pci 0000:20:02.0: [14e4:1645] type 0 class 0x000200
pci 0000:20:02.0: reg 10: [mem 0x90000000-0x9000ffff 64bit]
pci 0000:20:02.0: PME# supported from D3hot D3cold
pci 0000:20:02.0: PME# disabled
Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
Mercury version TR3.2 (0x32) found at 0xfffffffffed28000
Mercury version TR3.2 (0x32) found at 0xfffffffffed2c000
Mercury version TR3.2 (0x32) found at 0xfffffffffed2e000
pci 0000:e0:01.0: [103c:1290] type 0 class 0x000780
pci 0000:e0:01.0: reg 18: [mem 0xf4051000-0xf405100f]
pci 0000:e0:01.1: [103c:1048] type 0 class 0x000700
pci 0000:e0:01.1: reg 10: [mem 0xf4050000-0xf4050fff]
pci 0000:e0:01.1: reg 18: [mem 0xf4020000-0xf403ffff pref]
pci 0000:e0:02.0: [1002:5159] type 0 class 0x000300
pci 0000:e0:02.0: reg 10: [mem 0xf0000000-0xf3ffffff pref]
pci 0000:e0:02.0: reg 14: [io  0xe000-0xe0ff]
pci 0000:e0:02.0: reg 18: [mem 0xf4040000-0xf404ffff]
pci 0000:e0:02.0: reg 30: [mem 0xf4000000-0xf401ffff pref]
pci 0000:e0:02.0: supports D1 D2
LBA: Truncating lmmio_space [fffffffff0000000/fffffffffecffffe] to [fffffffff0000000,fffffffffe77ffff]
powersw: Soft power switch support not available.
bio: create slab <bio-0> at 0
vgaarb: device added: PCI:0000:e0:02.0,decodes=io+mem,owns=io+mem,locks=none
vgaarb: loaded
vgaarb: bridge control possible 0000:e0:02.0
NET: Registered protocol family 2
IP route cache hash table entries: 524288 (order: 10, 4194304 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
UDP hash table entries: 8192 (order: 6, 262144 bytes)
UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes)
NET: Registered protocol family 1
PCI: CLS 64 bytes
Trying to unpack rootfs image as initramfs...
Freeing initrd memory: 10066k freed
Performance monitoring counters enabled for Storm Peak Slow
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
msgmni has been set to 20093
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
start plist test
end plist test
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
0000:e0:01.0: ttyS0 at MMIO 0xfffffffff4051000 (irq = 73) is a 16550A
0000:e0:01.1: ttyS1 at MMIO 0xfffffffff4050000 (irq = 73) is a 16550A
console [ttyS1] enabled, bootconsole disabled
0000:e0:01.1: ttyS2 at MMIO 0xfffffffff4050010 (irq = 73) is a 16550A
0000:e0:01.1: ttyS3 at MMIO 0xfffffffff4050038 (irq = 73) is a 16550A
Linux agpgart interface v0.103
brd: module loaded
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
mousedev: PS/2 mouse device common for all mice
rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
TCP cubic registered
No RTC device found, ALARM timers will not wake from suspend
rtc-generic rtc-generic: setting system clock to 2011-06-11 00:47:41 UTC (1307753261)
Freeing unused kernel memory: 212k freed
SCSI subsystem initialized
libata version 3.00 loaded.
pata_cmd64x 0000:00:02.0: Secondary port is disabled
sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 70
scsi0 : pata_cmd64x
scsi2 : pata_cmd64x
ata1: PATA max UDMA/100 cmd 0xd18 ctl 0xd24 bmdma 0xd00 irq 69
ata2: DUMMY
pata_cmd64x: active 10 recovery 10 setup 3.
pata_cmd64x: active 10 recovery 10 setup 3.
ata1.00: ATAPI: DW-224E, C.0B, max UDMA/33
pata_cmd64x: active 3 recovery 1 setup 1.
sym0: PA-RISC Firmware, ID 7, Fast-80, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi1 : sym-2.2.3
ata1.00: configured for UDMA/33
scsi 0:0:0:0: CD-ROM            TEAC     DW-224E          C.0B PQ: 0 ANSI: 5
sr0: scsi3-mmc drive: 24x/24x writer cd/rw xa/form2 cdda tray
cdrom: Uniform CD-ROM driver Revision: 3.20
sr 0:0:0:0: Attached scsi CD-ROM sr0
sr 0:0:0:0: Attached scsi generic sg0 type 5
scsi 1:0:0:0: Direct-Access     FUJITSU  MAJ3364MC        HP12 PQ: 0 ANSI: 2
scsi target1:0:0: tagged command queuing enabled, command queue depth 16.
scsi target1:0:0: Beginning Domain Validation
scsi target1:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 62)
scsi target1:0:0: Ending Domain Validation
scsi 1:0:0:0: Attached scsi generic sg1 type 0
sym1: <1010-66> rev 0x1 at pci 0000:20:01.1 irq 71
sym1: PA-RISC Firmware, ID 7, Fast-80, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi3 : sym-2.2.3
tg3.c:v3.119 (May 18, 2011)
sd 1:0:0:0: [sda] 71132960 512-byte logical blocks: (36.4 GB/33.9 GiB)
sd 1:0:0:0: [sda] Write Protect is off
sd 1:0:0:0: [sda] Mode Sense: ab 00 10 08
sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
 sda: sda1 sda2 sda3 < sda5 sda6 sda7 >
sd 1:0:0:0: [sda] Attached SCSI disk
tg3 0000:20:02.0: eth0: Tigon3 [partno(BCM95700A6) rev 0105] (PCI:66MHz:64-bit) MAC address 00:30:6e:4b:16:4d
tg3 0000:20:02.0: eth0: attached PHY is 5701 (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[0])
tg3 0000:20:02.0: eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[0]
tg3 0000:20:02.0: eth0: dma_rwctrl[76ff2d0f] dma_mask[32-bit]
EXT3-fs: barriers not enabled
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sda5): mounted filesystem with writeback data mode
udev[989]: starting version 164
Adding 979928k swap on /dev/sda6.  Priority:-1 extents:1 across:979928k 
EXT3-fs (sda5): using internal journal
loop: module loaded
EXT3-fs: barriers not enabled
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sda7): using internal journal
EXT3-fs (sda7): mounted filesystem with writeback data mode
NET: Registered protocol family 10
ADDRCONF(NETDEV_UP): eth0: link is not ready
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
tg3 0000:20:02.0: eth0: Link is up at 100 Mbps, full duplex
tg3 0000:20:02.0: eth0: Flow control is off for TX and off for RX
ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
eth0: no IPv6 routers present

