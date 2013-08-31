From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc debian kernel - missing  modules for C8000 - linux-image-3.10-2-parisc64-smp
Date: Sat, 31 Aug 2013 13:13:38 -0400
Message-ID: <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl>
References: <521A7589.5000503@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-16-230059757"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <521A7589.5000503@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-16-230059757
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On 25-Aug-13, at 5:22 PM, Helge Deller wrote:

> Can you maybe try to enable those kernel options generally on the  
> 64bit SMP/UP kernels too (either as module or built-in):
>
> For the IDE CDROM:
> CONFIG_BLK_DEV_SIIMAGE=y
>
> For the built-in SCSI controller:
> CONFIG_FUSION=y
> CONFIG_FUSION_SPI=y
>
> Built-in NIC:
> CONFIG_E1000=y   (not CONFIG_E1000E)
>
> and for Radeon DRM:
> CONFIG_DRM_RADEON=y
> CONFIG_AGP=y
> CONFIG_AGP_PARISC=y
> CONFIG_VGA_ARB=y
> CONFIG_VGA_ARB_MAX_GPUS=16
> CONFIG_DRM=y
> CONFIG_DRM_KMS_HELPER=y
> CONFIG_DRM_TTM=y
> CONFIG_BACKLIGHT_LCD_SUPPORT=y  (<-- seems to be needed).


I added the above to my rp3440 config as modules.  Adding the above as  
built-in made the kernel too big
to link without using long calls.  This exposed a bug in 64-bit ld.   
It crashed linking trying to print "cannot reach"
errors.  This is fixed in the latest binutils upload to the archive  
and the binutils source.

With radeon support enabled, I get a consistent warning at kernel/ 
workqueue.c:1378.  See attached output
from dmesg.  Possibly, it has something to do with ring test failure.

Thoughts?

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-16-230059757
Content-Disposition: attachment; filename="dmesg.txt"
Content-Type: text/plain; x-unix-mode=0644; name="dmesg.txt"
Content-Transfer-Encoding: 7bit

Linux version 3.11.0-rc7+ (dave@mx3210) (gcc version 4.8.1 (GCC) ) #1 SMP Sat Aug 31 11:35:56 EDT 2013
unwind_init: start = 0x405c9000, end = 0x405ffa40, entries = 13988
FP[0] enabled: Rev 1 Model 20
The 64-bit Kernel has started...
Default page size is 4KB.
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
 1) Start 0x0000000100000000 End 0x00000001ffdfffff Size   4094 MB
 2) Start 0x0000004040000000 End 0x00000040ffffffff Size   3072 MB
Total Memory: 8190 MB
initrd: 7e1c6000-7ebee641
initrd: reserving 3e1c6000-3ebee641 (mem_max 1ffe00000)
On node 0 totalpages: 262144
free_area_init_node: node 0, pgdat 4061b900, node_mem_map 41725000
  Normal zone: 3584 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 262144 pages, LIFO batch:31
On node 1 totalpages: 1048064
free_area_init_node: node 1, pgdat 4061c5c0, node_mem_map 140000000
  Normal zone: 14329 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 1048064 pages, LIFO batch:31
On node 2 totalpages: 786432
free_area_init_node: node 2, pgdat 4061d280, node_mem_map 4080000000
  Normal zone: 10752 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 786432 pages, LIFO batch:31
PERCPU: Embedded 14 pages/cpu @000000004252e000 s26752 r8192 d22400 u57344
pcpu-alloc: s26752 r8192 d22400 u57344 alloc=14*4096
pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0] 06 [0] 07 
pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11 [0] 12 [0] 13 [0] 14 [0] 15 
pcpu-alloc: [0] 16 [0] 17 [0] 18 [0] 19 [0] 20 [0] 21 [0] 22 [0] 23 
pcpu-alloc: [0] 24 [0] 25 [0] 26 [0] 27 [0] 28 [0] 29 [0] 30 [0] 31 
SMP: bootstrap CPU ID is 0
Built 3 zonelists in Zone order, mobility grouping on.  Total pages: 2067975
Kernel command line: root=UUID=ac66c6a1-0b08-481d-a400-9fb6e7a49f1b console=ttyS1 HOME=/ rootfstype=xfs palo_kernel=2/vmlinuz
PID hash table entries: 4096 (order: 3, 32768 bytes)
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
Sorting __ex_table...
Memory: 8223672K/8386560K available (4167K kernel code, 886K rwdata, 732K rodata, 256K init, 398K bss, 162888K reserved)
virtual kernel memory layout:
    vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
    memory  : 0x0000000040000000 - 0x0000004140000000   (266240 MB)
      .init : 0x0000000040790000 - 0x00000000407d0000   ( 256 kB)
      .data : 0x0000000040511c18 - 0x00000000406a64d0   (1618 kB)
      .text : 0x0000000040100000 - 0x0000000040511c18   (4167 kB)
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
  --------------------------------------------------------------------------
  | Wound/wait tests |
  ---------------------
                  ww api failures:  ok  |  ok  |  ok  |
               ww contexts mixing:failed|  ok  |
             finishing ww context:  ok  |  ok  |  ok  |  ok  |
               locking mismatches:  ok  |  ok  |  ok  |
                 EDEADLK handling:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
           spinlock nest unlocked:failed|
  -----------------------------------------------------
                                 |block | try  |context|
  -----------------------------------------------------
                          context:failed|  ok  |  ok  |
                              try:failed|  ok  |failed|
                            block:failed|  ok  |failed|
                         spinlock:failed|  ok  |failed|
--------------------------------------------------------
153 out of 253 testcases failed, as expected. |
----------------------------------------------------
Calibrating delay loop... 1594.16 BogoMIPS (lpj=7970816)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 256
Brought up 1 CPUs
devtmpfs: initialized
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
Enabling PDC_PAT chassis codes support v0.05
Releasing cpu 1 now, hpa=fffffffffe781000
FP[1] enabled: Rev 1 Model 20
Releasing cpu 2 now, hpa=fffffffffe798000
FP[2] enabled: Rev 1 Model 20
Releasing cpu 3 now, hpa=fffffffffe799000
FP[3] enabled: Rev 1 Model 20
CPU(s): 4 x PA8800 (Mako) at 800.013300 MHz
Whole cache flush 8999457 cycles, flushing 7143424 bytes 722653 cycles
Setting cache flush threshold to 2000000 (4 CPUs online)
SBA found Pluto 2.3 at 0xfffffffffed00000
Mercury version TR3.2 (0x32) found at 0xfffffffffed20000
LBA 0:0: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
pci_bus 0000:00: root bus resource [mem 0xffffffff80000000-0xffffffff8fffffff] (bus address [0x80000000-0x8fffffff])
pci_bus 0000:00: root bus resource [mem 0xffffff0004000000-0xffffff0fffffffff]
pci_bus 0000:00: root bus resource [bus 00-07]
pci 0000:00:01.0: [1033:0035] type 00 class 0x0c0310
pci 0000:00:01.0: reg 0x10: [mem 0xffffffff80002000-0xffffffff80002fff]
pci 0000:00:01.0: supports D1 D2
pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
pci 0000:00:01.1: [1033:0035] type 00 class 0x0c0310
pci 0000:00:01.1: reg 0x10: [mem 0xffffffff80001000-0xffffffff80001fff]
pci 0000:00:01.1: supports D1 D2
pci 0000:00:01.1: PME# supported from D0 D1 D2 D3hot
pci 0000:00:01.2: [1033:00e0] type 00 class 0x0c0320
pci 0000:00:01.2: reg 0x10: [mem 0xffffffff80000000-0xffffffff800000ff]
pci 0000:00:01.2: supports D1 D2
pci 0000:00:01.2: PME# supported from D0 D1 D2 D3hot
pci 0000:00:02.0: [1095:0649] type 00 class 0x01018f
pci 0000:00:02.0: reg 0x10: [io  0x0d18-0x0d1f]
pci 0000:00:02.0: reg 0x14: [io  0x0d24-0x0d27]
pci 0000:00:02.0: reg 0x18: [io  0x0d10-0x0d17]
pci 0000:00:02.0: reg 0x1c: [io  0x0d20-0x0d23]
pci 0000:00:02.0: reg 0x20: [io  0x0d00-0x0d0f]
pci 0000:00:02.0: supports D1 D2
Mercury version TR3.2 (0x32) found at 0xfffffffffed22000
LBA 0:1: PCI host bridge to bus 0000:20
pci_bus 0000:20: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
pci_bus 0000:20: root bus resource [mem 0xffffffff90000000-0xffffffff9fffffff] (bus address [0x90000000-0x9fffffff])
pci_bus 0000:20: root bus resource [mem 0xffffff1004000000-0xffffff1fffffffff]
pci_bus 0000:20: root bus resource [bus 20-27]
pci 0000:20:01.0: [1000:0021] type 00 class 0x010000
pci 0000:20:01.0: reg 0x10: [io  0x12100-0x121ff]
pci 0000:20:01.0: reg 0x14: [mem 0xffffffff90015000-0xffffffff900153ff 64bit]
pci 0000:20:01.0: reg 0x1c: [mem 0xffffffff90012000-0xffffffff90013fff 64bit]
pci 0000:20:01.0: supports D1 D2
pci 0000:20:01.1: [1000:0021] type 00 class 0x010000
pci 0000:20:01.1: reg 0x10: [io  0x12000-0x120ff]
pci 0000:20:01.1: reg 0x14: [mem 0xffffffff90014000-0xffffffff900143ff 64bit]
pci 0000:20:01.1: reg 0x1c: [mem 0xffffffff90010000-0xffffffff90011fff 64bit]
pci 0000:20:01.1: supports D1 D2
pci 0000:20:02.0: [14e4:1645] type 00 class 0x020000
pci 0000:20:02.0: reg 0x10: [mem 0xffffffff90000000-0xffffffff9000ffff 64bit]
pci 0000:20:02.0: PME# supported from D3hot D3cold
Mercury version TR3.2 (0x32) found at 0xfffffffffed24000
LBA 0:2: PCI host bridge to bus 0000:40
pci_bus 0000:40: root bus resource [io  0x20000-0x2ffff] (bus address [0x0000-0xffff])
pci_bus 0000:40: root bus resource [mem 0xffffffffa0000000-0xffffffffafffffff] (bus address [0xa0000000-0xafffffff])
pci_bus 0000:40: root bus resource [mem 0xffffff2004000000-0xffffff2fffffffff]
pci_bus 0000:40: root bus resource [bus 40-47]
Mercury version TR3.2 (0x32) found at 0xfffffffffed26000
LBA 0:3: PCI host bridge to bus 0000:60
pci_bus 0000:60: root bus resource [io  0x30000-0x3ffff] (bus address [0x0000-0xffff])
pci_bus 0000:60: root bus resource [mem 0xffffffffb0000000-0xffffffffbfffffff] (bus address [0xb0000000-0xbfffffff])
pci_bus 0000:60: root bus resource [mem 0xffffff3004000000-0xffffff3fffffffff]
pci_bus 0000:60: root bus resource [bus 60-67]
Mercury version TR3.2 (0x32) found at 0xfffffffffed28000
LBA: lmmio_space [0xffffffffc0000000-0xffffffffdfffffff] - new
LBA 0:4: PCI host bridge to bus 0000:80
pci_bus 0000:80: root bus resource [io  0x40000-0x4ffff] (bus address [0x0000-0xffff])
pci_bus 0000:80: root bus resource [mem 0xffffffffc0000000-0xffffffffdfffffff] (bus address [0xc0000000-0xdfffffff])
pci_bus 0000:80: root bus resource [mem 0xffffff4004000000-0xffffff4fffffffff]
pci_bus 0000:80: root bus resource [bus 80-87]
Mercury version TR3.2 (0x32) found at 0xfffffffffed2c000
LBA 0:6: PCI host bridge to bus 0000:c0
pci_bus 0000:c0: root bus resource [io  0x50000-0x5ffff] (bus address [0x0000-0xffff])
pci_bus 0000:c0: root bus resource [mem 0xffffffffe0000000-0xffffffffefffffff] (bus address [0xe0000000-0xefffffff])
pci_bus 0000:c0: root bus resource [mem 0xffffff6004000000-0xffffff6fffffffff]
pci_bus 0000:c0: root bus resource [bus c0-c7]
Mercury version TR3.2 (0x32) found at 0xfffffffffed2e000
LBA: lmmio_space [0xfffffffff0000000-0xfffffffffe77ffff] - new
LBA 0:7: PCI host bridge to bus 0000:e0
pci_bus 0000:e0: root bus resource [io  0x60000-0x6ffff] (bus address [0x0000-0xffff])
pci_bus 0000:e0: root bus resource [mem 0xfffffffff0000000-0xfffffffffe77ffff] (bus address [0xf0000000-0xfe77ffff])
pci_bus 0000:e0: root bus resource [mem 0xffffff7004000000-0xffffff7fffffffff]
pci_bus 0000:e0: root bus resource [bus e0-e7]
pci 0000:e0:01.0: [103c:1290] type 00 class 0x078000
pci 0000:e0:01.0: reg 0x18: [mem 0xfffffffff4051000-0xfffffffff405100f]
pci 0000:e0:01.1: [103c:1048] type 00 class 0x070002
pci 0000:e0:01.1: reg 0x10: [mem 0xfffffffff4050000-0xfffffffff4050fff]
pci 0000:e0:01.1: reg 0x18: [mem 0xfffffffff4020000-0xfffffffff403ffff pref]
pci 0000:e0:02.0: [1002:5159] type 00 class 0x030000
pci 0000:e0:02.0: reg 0x10: [mem 0xfffffffff0000000-0xfffffffff3ffffff pref]
pci 0000:e0:02.0: reg 0x14: [io  0x6e000-0x6e0ff]
pci 0000:e0:02.0: reg 0x18: [mem 0xfffffffff4040000-0xfffffffff404ffff]
pci 0000:e0:02.0: reg 0x30: [mem 0xfffffffff4000000-0xfffffffff401ffff pref]
pci 0000:e0:02.0: supports D1 D2
powersw: Soft power switch support not available.
bio: create slab <bio-0> at 0
vgaarb: device added: PCI:0000:e0:02.0,decodes=io+mem,owns=io+mem,locks=none
vgaarb: loaded
vgaarb: bridge control possible 0000:e0:02.0
NET: Registered protocol family 2
TCP established hash table entries: 65536 (order: 8, 1048576 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 65536 bind 65536)
TCP: reno registered
UDP hash table entries: 4096 (order: 5, 131072 bytes)
UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 64 bytes
Trying to unpack rootfs image as initramfs...
Freeing initrd memory: 10400K (000000007e1c6000 - 000000007ebee000)
Performance monitoring counters enabled for Storm Peak Slow
msgmni has been set to 16082
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
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
hidraw: raw HID events driver (C) Jiri Kosina
TCP: cubic registered
rtc-generic rtc-generic: setting system clock to 2013-08-31 16:09:46 UTC (1377965386)
Freeing unused kernel memory: 256K (0000000040790000 - 00000000407d0000)
udevd[890]: starting version 175
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
SCSI subsystem initialized
PTP clock support registered
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
tg3.c:v3.132 (May 21, 2013)
libata version 3.00 loaded.
usbcore: registered new device driver usb
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
pata_cmd64x 0000:00:02.0: Secondary port is disabled
ehci-pci: EHCI PCI platform driver
scsi0 : pata_cmd64x
scsi1 : pata_cmd64x
ata1: PATA max UDMA/100 cmd 0xd18 ctl 0xd24 bmdma 0xd00 irq 69
ata2: DUMMY
pata_cmd64x: active 10 recovery 10 setup 3.
pata_cmd64x: active 10 recovery 10 setup 3.
ehci-pci 0000:00:01.2: EHCI Host Controller
ehci-pci 0000:00:01.2: new USB bus registered, assigned bus number 1
ehci-pci 0000:00:01.2: irq 68, io mem 0xffffffff80000000
ehci-pci 0000:00:01.2: USB 2.0 started, EHCI 0.95
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 3.11.0-rc7+ ehci_hcd
usb usb1: SerialNumber: 0000:00:01.2
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 5 ports detected
ata1.00: ATAPI: DW-224E, C.0B, max UDMA/33
pata_cmd64x: active 3 recovery 1 setup 1.
ata1.00: configured for UDMA/33
scsi 0:0:0:0: CD-ROM            TEAC     DW-224E          C.0B PQ: 0 ANSI: 5
usb 1-2: new high-speed USB device number 2 using ehci-pci
sr0: scsi3-mmc drive: 24x/24x writer cd/rw xa/form2 cdda tray
cdrom: Uniform CD-ROM driver Revision: 3.20
sr 0:0:0:0: Attached scsi CD-ROM sr0
usb 1-2: New USB device found, idVendor=1058, idProduct=0748
usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=5
usb 1-2: Product: My Passport 0748
usb 1-2: Manufacturer: Western Digital
usb 1-2: SerialNumber: 575836314542325A33383231
sr 0:0:0:0: Attached scsi generic sg0 type 5
usb-storage 1-2:1.0: USB Mass Storage device detected
scsi2 : usb-storage 1-2:1.0
usbcore: registered new interface driver usb-storage
tg3 0000:20:02.0 eth0: Tigon3 [partno(BCM95700A6) rev 0105] (PCI:66MHz:64-bit) MAC address 00:30:6e:4b:16:4d
tg3 0000:20:02.0 eth0: attached PHY is 5701 (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[0])
tg3 0000:20:02.0 eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[0]
tg3 0000:20:02.0 eth0: dma_rwctrl[76ff2d0f] dma_mask[32-bit]
sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 70
sym0: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym0: SCSI BUS has been reset.
scsi3 : sym-2.2.3
scsi 2:0:0:0: Direct-Access     WD       My Passport 0748 1022 PQ: 0 ANSI: 6
scsi 2:0:0:0: Attached scsi generic sg1 type 0
sd 2:0:0:0: [sda] Spinning up disk...
scsi 3:0:0:0: Direct-Access     FUJITSU  MAJ3364MC        HP12 PQ: 0 ANSI: 2
scsi target3:0:0: tagged command queuing enabled, command queue depth 16.
scsi target3:0:0: Beginning Domain Validation
scsi target3:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
scsi target3:0:0: Ending Domain Validation
sd 3:0:0:0: Attached scsi generic sg2 type 0
sd 3:0:0:0: [sdb] 71132960 512-byte logical blocks: (36.4 GB/33.9 GiB)
sd 3:0:0:0: [sdb] Write Protect is off
sd 3:0:0:0: [sdb] Mode Sense: ab 00 10 08
....ready
sd 2:0:0:0: [sda] 3906963456 512-byte logical blocks: (2.00 TB/1.81 TiB)
sd 2:0:0:0: [sda] Write Protect is off
sd 2:0:0:0: [sda] Mode Sense: 47 00 10 08
sd 2:0:0:0: [sda] No Caching mode page present
sd 2:0:0:0: [sda] Assuming drive cache: write through
sd 2:0:0:0: [sda] No Caching mode page present
sd 2:0:0:0: [sda] Assuming drive cache: write through
 sda: sda1 sda2
sd 2:0:0:0: [sda] No Caching mode page present
sd 2:0:0:0: [sda] Assuming drive cache: write through
sd 2:0:0:0: [sda] Attached SCSI disk
sd 3:0:0:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
 sdb: sdb1 sdb2 sdb3 < sdb5 sdb6 sdb7 >
sd 3:0:0:0: [sdb] Attached SCSI disk
sym1: <1010-66> rev 0x1 at pci 0000:20:01.1 irq 71
sym1: No NVRAM, ID 7, Fast-80, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi4 : sym-2.2.3
scsi 4:0:2:0: Direct-Access     SEAGATE  ST3300007LC      0005 PQ: 0 ANSI: 3
scsi target4:0:2: tagged command queuing enabled, command queue depth 16.
scsi target4:0:2: Beginning Domain Validation
scsi target4:0:2: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
scsi target4:0:2: Ending Domain Validation
sd 4:0:2:0: Attached scsi generic sg3 type 0
sd 4:0:2:0: [sdc] 585937500 512-byte logical blocks: (300 GB/279 GiB)
sd 4:0:2:0: [sdc] Write Protect is off
sd 4:0:2:0: [sdc] Mode Sense: ab 00 10 08
sd 4:0:2:0: [sdc] Write cache: disabled, read cache: enabled, supports DPO and FUA
 sdc: sdc1 sdc2 sdc3 sdc4 < sdc5 sdc6 sdc7 >
sd 4:0:2:0: [sdc] Attached SCSI disk
device-mapper: ioctl: 4.25.0-ioctl (2013-06-26) initialised: dm-devel@redhat.com
raid6: int64x1    796 MB/s
raid6: int64x2    994 MB/s
raid6: int64x4   1071 MB/s
raid6: int64x8   1016 MB/s
raid6: using algorithm int64x4 (1071 MB/s)
raid6: using intx1 recovery algorithm
xor: measuring software checksum speed
   8regs     :  3745.200 MB/sec
   8regs_prefetch:  2818.800 MB/sec
   32regs    :  3263.200 MB/sec
   32regs_prefetch:  2842.400 MB/sec
xor: using function: 8regs (3745.200 MB/sec)
bio: create slab <bio-1> at 1
Btrfs loaded
SGI XFS with ACLs, security attributes, realtime, large block/inode numbers, no debug enabled
XFS (sdc5): Mounting Filesystem
XFS (sdc5): Ending clean mount
udevd[1167]: starting version 175
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-pci: OHCI PCI platform driver
ohci-pci 0000:00:01.0: OHCI PCI host controller
ohci-pci 0000:00:01.0: new USB bus registered, assigned bus number 2
ohci-pci 0000:00:01.0: irq 66, io mem 0xffffffff80002000
[drm] Initialized drm 1.1.0 20060810
usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb2: Product: OHCI PCI host controller
usb usb2: Manufacturer: Linux 3.11.0-rc7+ ohci_hcd
usb usb2: SerialNumber: 0000:00:01.0
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 3 ports detected
ohci-pci 0000:00:01.1: OHCI PCI host controller
ohci-pci 0000:00:01.1: new USB bus registered, assigned bus number 3
ohci-pci 0000:00:01.1: irq 67, io mem 0xffffffff80001000
[drm] radeon kernel modesetting enabled.
radeon 0000:e0:02.0: enabling SERR and PARITY (0187 -> 01c7)
[drm] initializing kernel modesetting (RV100 0x1002:0x5159 0x103C:0x1292).
[drm] register mmio base: 0xF4040000
[drm] register mmio size: 65536
[drm] GPU not posted. posting now...
radeon 0000:e0:02.0: VRAM: 64M 0xFFFFFFFFF0000000 - 0xFFFFFFFFF3FFFFFF (8M used)
radeon 0000:e0:02.0: GTT: 512M 0xFFFFFFFFD0000000 - 0xFFFFFFFFEFFFFFFF
[drm] Detected VRAM RAM=64M, BAR=64M
[drm] RAM width 64bits DDR
[TTM] Zone  kernel: Available graphics memory: 4117164 kiB
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[TTM] Initializing pool allocator
[drm] radeon: 8M of VRAM memory ready
[drm] radeon: 512M of GTT memory ready.
[drm] GART: num cpu pages 131072, num gpu pages 131072
[drm] PCI GART of 512M enabled (table at 0x0000000042380000).
radeon 0000:e0:02.0: WB disabled
radeon 0000:e0:02.0: fence driver on ring 0 use gpu addr 0xffffffffd0000000 and cpu addr 0x000000007c712000
[drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[drm] Driver supports precise vblank timestamp query.
------------[ cut here ]------------
WARNING: at kernel/workqueue.c:1378
Modules linked in: radeon(+) cfbfillrect cfbimgblt cfbcopyarea i2c_algo_bit drm_kms_helper ttm drm i2c_core ohci_pci(+) ohci_hcd backlight xfs exportfs btrfs xor lzo_compress zlib_deflate raid6_pq crc32c libcrc32c dm_mod zalon7xx lasi700 53c700 hilkbd sd_mod crc_t10dif usb_storage sg sr_mod cdrom ehci_pci pata_cmd64x ehci_hcd sym53c8xx tg3 usbcore libata scsi_transport_spi ptp usb_common pps_core scsi_mod
CPU: 3 PID: 1218 Comm: modprobe Not tainted 3.11.0-rc7+ #1
task: 000000007f619038 ti: 000000007c51c000 task.ti: 000000007c51c000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000000000001110 Not tainted
r00-03  000000000804000e 000000007c51d2b0 000000004015ec88 000000007c51d2b0
r04-07  0000000040768840 0000000042560d00 000000007c455f20 000000007c455f28
r08-11  000000007c51d350 000000007fc40600 0000000000000020 0000000000000020
r12-15  0000000000000003 0000000000000001 000000004078c040 000000007c51c288
r16-19  0000000000000050 0000000000000000 000000007c51c410 0000000000000000
usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb3: Product: OHCI PCI host controller
usb usb3: Manufacturer: Linux 3.11.0-rc7+ ohci_hcd
usb usb3: SerialNumber: 0000:00:01.1
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
r20-23  0000000000000000 4000000000000000 c800000000000000 f900000000000000
r24-27  000000007c455f20 000000007c455f20 000000004255d600 0000000040768840
r28-31  0000000000000001 000000007c51d350 000000007c51d380 0000000000000000
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000113000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004015ee5c 000000004015ee60
 IIR: 03ffe01f    ISR: 0000000010240000  IOR: 000000095755d600
 CPU:        3   CR30: 000000007c51c000 CR31: ffffffffffffffff
 ORIG_R28: 0000000000000001
 IAOQ[0]: __queue_work+0x2dc/0x360
 IAOQ[1]: __queue_work+0x2e0/0x360
 RP(r2): __queue_work+0x108/0x360
Backtrace:
 [<000000004015ef64>] queue_work_on+0x84/0xa8
 [<000000001df55dfc>] r100_irq_process+0x2ec/0x5d8 [radeon]
 [<000000001df48cc4>] radeon_driver_irq_preinstall_kms+0x16c/0x1a0 [radeon]
 [<000000001ce8d024>] drm_irq_install+0x11c/0x3c0 [drm]
 [<000000001df48f8c>] radeon_irq_kms_init+0x8c/0x168 [radeon]
 [<000000001df5aeac>] r100_startup+0x22c/0x3c8 [radeon]
 [<000000001df5b880>] r100_init+0x348/0x5c0 [radeon]
 [<000000001defbff4>] radeon_device_init+0x79c/0x9d0 [radeon]
 [<000000001deff588>] radeon_driver_load_kms+0xb8/0x1a8 [radeon]
 [<000000001ce9682c>] drm_get_pci_dev+0x28c/0x390 [drm]
 [<000000001def96e4>] radeon_pci_probe+0xcc/0x120 [radeon]
 [<000000004035fd24>] pci_device_probe+0xc4/0xf8
 [<00000000403d0f88>] really_probe+0xd0/0x328
 [<00000000403d1398>] __driver_attach+0x100/0x108
 [<00000000403ce240>] bus_for_each_dev+0xa0/0x100
 [<00000000403d087c>] driver_attach+0x34/0x48

---[ end trace e80e0a4cc6460a7f ]---
[drm] radeon: irq initialized.
[drm] Loading R100 Microcode
[drm] radeon: ring at 0xFFFFFFFFD0001000
[drm:r100_ring_test] *ERROR* radeon: ring test failed (scratch(0x15E4)=0xCAFEDEAD)
[drm:r100_cp_init] *ERROR* radeon: cp isn't working (-22).
radeon 0000:e0:02.0: failed initializing CP (-22).
radeon 0000:e0:02.0: Disabling GPU acceleration
[drm] radeon: cp finalized
[drm] No TV DAC info found in BIOS
[drm] Radeon Display Connectors
[drm] Connector 0:
[drm]   VGA-1
[drm]   DDC: 0x60 0x60 0x60 0x60 0x60 0x60 0x60 0x60
[drm]   Encoders:
[drm]     CRT1: INTERNAL_DAC1
[drm] Connector 1:
[drm]   DVI-I-1
[drm]   HPD1
[drm]   DDC: 0x64 0x64 0x64 0x64 0x64 0x64 0x64 0x64
[drm]   Encoders:
[drm]     CRT2: INTERNAL_DAC2
[drm]     DFP1: INTERNAL_TMDS1
radeon 0000:e0:02.0: No connectors reported connected with modes
[drm] Cannot find any crtc or sizes - going 1024x768
[drm] fb mappable at 0xFFFFFFFFF0040000
[drm] vram apper at 0xFFFFFFFFF0000000
[drm] size 786432
[drm] fb depth is 8
[drm]    pitch is 1024
Console: switching to colour frame buffer device 128x48
radeon 0000:e0:02.0: fb0: radeondrmfb frame buffer device
radeon 0000:e0:02.0: registered panic notifier
[drm] Initialized radeon 2.34.0 20080528 for 0000:e0:02.0 on minor 0
Adding 7815616k swap on /dev/sdc3.  Priority:-1 extents:1 across:7815616k 
XFS (sdc7): Mounting Filesystem
XFS (sdc7): Ending clean mount
XFS (sdc6): Mounting Filesystem
XFS (sdc6): Ending clean mount
XFS (sda1): Mounting Filesystem
XFS (sda1): Ending clean mount
NET: Registered protocol family 10
IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
tg3 0000:20:02.0 eth0: Link is up at 100 Mbps, full duplex
tg3 0000:20:02.0 eth0: Flow control is on for TX and on for RX
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Loading iSCSI transport class v2.0-870.
iscsi: registered transport (tcp)
postgres (3599): /proc/3599/oom_adj is deprecated, please use /proc/3599/oom_score_adj instead.

--Apple-Mail-16-230059757--
