From: Helge Deller <deller@gmx.de>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Thu, 20 Nov 2008 08:55:30 +0100
Message-ID: <492517F2.9060703@gmx.de>
References: <49231FD0.9040409@gmx.de> <1227061902.10371.11.camel@localhost.localdomain> <20081119091327.GB3270@tilt.dandreoli.com> <49243DF1.2010206@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49243DF1.2010206@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge Deller wrote:
> James Bottomley wrote:
>>> Why don't we compare configs?  This is mine for ion:
>>> http://parisc-linux.org/~jejb/config-2.6.28-rc5-ion
> 
>  > Domenico Andreoli wrote:
>> https://mnl.crema.unimi.it/~cavok/config-2.6.28-rc5
> 
> Helge:
> and here is mine (32bit(!), usually works on C3000, B160L, 715/64 and 
> Tadpole PARISC laptop - similiar to B160L):
> http://gsyprf10.external.hp.com/~deller/config.2.6.28-rc5

I don't want to flood the mailing list with my problem.

But I continued with testing:
1) I modified James's ion-config for netbooting and built it. Crashed 
same way as Dave just reported in another mail (DEBUG_BLOCK_EXT_DEVT is 
enabled, you need to specify explicit textual name for "root=" boot option.)

2) To avoid possible cross-compiler bugs I built James's ion-config 
(with no modifications at all!) on the c3k natively. It booted yesterday 
nicely without any problems from local disk. Today, I booted the same 
kernel, again with no modifications or changes at all, just the same 
kernel which already was on the disk, and it brought up a Slab corruption:


HARD Booted.
palo ipl 1.14 root@penalosa Wed Oct  8 15:04:37 UTC 2008

Partition Start(MB) End(MB) Id Type
1               1     257   82 swap
2             258     278   f0 Palo
3             279    2048   83 ext2
4            2049    8678   83 ext2

PALO(F0) partition contains:
     0/vmlinux32 14996734 bytes @ 0x10140000
     0/ramdisk 6264632 bytes @ 0x10f8d4fe

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102 
palo_kernel=3/boot/vmlinux'
Selected kernel: /boot/vmlinux from partition 3
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 5140480 mediaptr 0x1000
Segment 1 load 0063c000 size 381320 mediaptr 0x4e8000
Segment 2 load 0069c000 size 215488 mediaptr 0x546000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.28-rc5 (root@c3000) (gcc version 4.1.3 20080623 
(prerelease) (Debian 4.1.2-23)) #4 SMP Wed 8
unwind_init: start = 0x405042e4, end = 0x40536d34, entries = 12965
FP[0] enabled: Rev 1 Model 19
The 64-bit Kernel has started...
console [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005dc0 00000481 00000000 00000002 777c3e84 100000f0 00000008 
000000b2 000000b2
vers  00000301
CPUID vers 19 rev 11 (0x0000026b)
capabilities 0x7
model 9000/785/C3700
Total Memory: 2048 MB
SMP: bootstrap CPU ID is 0
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 517120
Kernel command line: root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102 
palo_kernel=3/boot/vmlinux
PID hash table entries: 4096 (order: 12, 32768 bytes)
Console: colour dummy device 160x64
------------------------
| Locking API testsuite:
----------------------------------------------------------------------------
                                  | spin |wlock |rlock |mutex | wsem | 
rsem |
 
--------------------------------------------------------------------------
                      A-A deadlock:failed|failed|  ok 
|failed|failed|failed|
                  A-B-B-A deadlock:failed|failed|  ok 
|failed|failed|failed|
              A-B-B-C-C-A deadlock:failed|failed|  ok 
|failed|failed|failed|
              A-B-C-A-B-C deadlock:failed|failed|  ok 
|failed|failed|failed|
          A-B-B-C-C-D-D-A deadlock:failed|failed|  ok 
|failed|failed|failed|
          A-B-C-D-B-D-D-A deadlock:failed|failed|  ok 
|failed|failed|failed|
          A-B-C-D-B-C-D-A deadlock:failed|failed|  ok 
|failed|failed|failed|
                     double unlock:failed|failed|failed|  ok 
|failed|failed|
                   initialize 
held:failed|failed|failed|failed|failed|failed|
                  bad unlock order:  ok  |  ok  |  ok  |  ok  |  ok  | 
ok  |
 
--------------------------------------------------------------------------
               recursive read-lock:             |  ok  | 
|failed|
            recursive read-lock #2:             |  ok  | 
|failed|
             mixed read-write-lock:             |failed| 
|failed|
             mixed write-read-lock:             |failed| 
|failed|
 
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
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Memory: 2054144k/2097152k available (3352k kernel code, 42608k reserved, 
1619k data, 212k init)
virtual kernel memory layout:
     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)
     memory  : 0x0000000040000000 - 0x00000000c0000000   (2048 MB)
       .init : 0x000000004069c000 - 0x00000000406d1000   ( 212 kB)
       .data : 0x00000000404462d8 - 0x00000000405db000   (1619 kB)
       .text : 0x0000000040100000 - 0x00000000404462d8   (3352 kB)
Calibrating delay loop... 1495.04 BogoMIPS (lpj=2990080)
Mount-cache hash table entries: 256
Brought up 1 CPUs
net_namespace: 840 bytes
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfffffffffed00000 [10] { 12, 0x0, 0x582, 
0x0000b }
2. Elroy PCI Bridge at 0xfffffffffed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfffffffffed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfffffffffed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfffffffffed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
6. Allegro W2 at 0xfffffffffffa0000 [32] { 0, 0x0, 0x5dc, 0x00004 }
7. Memory at 0xfffffffffed10200 [49] { 1, 0x0, 0x09c, 0x00009 }
CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
Setting cache flush threshold to 180000 (1 CPUs online)
SBA found Astro 2.1 at 0xfffffffffed00000
Elroy version TR4.0 (0x5) found at 0xfffffffffed30000
PCI: Enabled native mode for NS87415 (pif=0x8f)
Elroy version TR4.0 (0x5) found at 0xfffffffffed32000
iosapic: no IRTE for 0000:01:04.0 (IRQ not connected?)
iosapic: no IRTE for 0000:01:05.0 (IRQ not connected?)
Elroy version TR4.0 (0x5) found at 0xfffffffffed38000
Elroy version TR4.0 (0x5) found at 0xfffffffffed3c000
iosapic: hpa not registered for 0000:03:02.0
powersw: Soft power switch at 0xfffffff0f0400804 enabled.
SCSI subsystem initialized
NET: Registered protocol family 2
IP route cache hash table entries: 65536 (order: 7, 524288 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
NET: Registered protocol family 1
Performance monitoring counters enabled for Allegro W2
Initializing RT-Tester: OK
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
msgmni has been set to 4012
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 68)
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
Linux agpgart interface v0.103
Serial: 8250/16550 driver4 ports, IRQ sharing disabled
serial8250: ttyS0 at I/O 0x3f8 (irq = 3) is a 16550A
console handover: boot [ttyB0] -> real [ttyS0]
serial8250: ttyS1 at I/O 0x2f8 (irq = 4) is a 16550A
brd: module loaded
sym0: <896> rev 0x7 at pci 0000:00:0f.0 irq 69
sym0: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
sym0: SCSI BUS has been reset.
sym0: SCSI BUS mode change from SE to SE.
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.3
sym1: <896> rev 0x7 at pci 0000:00:0f.1 irq 69
sym1: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.2.3
scsi 1:0:5:0: Direct-Access     SEAGATE  ST39102LC        HP01 PQ: 0 ANSI: 2
  target1:0:5: tagged command queuing enabled, command queue depth 16.
  target1:0:5: Beginning Domain Validation
  target1:0:5: asynchronous
  target1:0:5: wide asynchronous
  target1:0:5: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 15)
  target1:0:5: Domain Validation skipping write tests
  target1:0:5: Ending Domain Validation
scsi 1:0:6:0: Direct-Access     HP 36.4G ST336607LC       HPC3 PQ: 0 ANSI: 3
  target1:0:6: tagged command queuing enabled, command queue depth 16.
  target1:0:6: Beginning Domain Validation
  target1:0:6: asynchronous
  target1:0:6: wide asynchronous
  target1:0:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
  target1:0:6: Domain Validation skipping write tests
  target1:0:6: Ending Domain Validation
Driver 'sd' needs updating - please use bus_type methods
sd 1:0:5:0: [sda] 17773524 512-byte hardware sectors: (9.10 GB/8.47 GiB)
sd 1:0:5:0: [sda] Write Protect is off
sd 1:0:5:0: [sda] Write cache: disabled, read cache: enabled, supports 
DPO and FUA
sd 1:0:5:0: [sda] 17773524 512-byte hardware sectors: (9.10 GB/8.47 GiB)
sd 1:0:5:0: [sda] Write Protect is off
sd 1:0:5:0: [sda] Write cache: disabled, read cache: enabled, supports 
DPO and FUA
  sda: sda1 sda2 sda3 sda4
sd 1:0:5:0: [sda] Attached SCSI disk
sd 1:0:6:0: [sdb] 71132960 512-byte hardware sectors: (36.4 GB/33.9 GiB)
sd 1:0:6:0: [sdb] Write Protect is off
sd 1:0:6:0: [sdb] Write cache: disabled, read cache: enabled, supports 
DPO and FUA
sd 1:0:6:0: [sdb] 71132960 512-byte hardware sectors: (36.4 GB/33.9 GiB)
sd 1:0:6:0: [sdb] Write Protect is off
sd 1:0:6:0: [sdb] Write cache: disabled, read cache: enabled, supports 
DPO and FUA
  sdb: sdb1 sdb2 sdb3 sdb4
sd 1:0:6:0: [sdb] Attached SCSI disk
sd 1:0:5:0: Attached scsi generic sg0 type 0
sd 1:0:6:0: Attached scsi generic sg1 type 0
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
mice: PS/2 mouse device common for all mice
rtc-parisc rtc-parisc: rtc core: registered rtc-parisc as rtc0
TCP cubic registered
rtc-parisc rtc-parisc: setting system clock to 2008-11-20 07:34:21 UTC 
(1227166461)
EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access will be enabled during recovery.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: recovery complete.
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory:
Badness at kernel/smp.c:333
<...here is the known smp badness bug...>
212k freed
INIT: version 2.86 booting
.udev/ already exists on the static /dev! (warning).
Starting the hotplug events dispatcher: udevd.
Synthesizing the initial hotplug events...done.
Waiting for /dev to be fully populated...Linux Tulip driver version 
1.1.15 (Feb 27, 2007)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21142/43 Tulip rev 65 at MMIO 0xfffffffff2008000, 
00:30:6e:48:aa:64, IRQ 66.
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip1:  Index #1 - Media 10base2 (#1) described by a 21142 Serial PHY 
(2) block.
tulip1:  Index #2 - Media AUI (#2) described by a 21142 Serial PHY (2) 
block.
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
eth1: Digital DS21142/43 Tulip rev 33 at MMIO 0xfffffffff3004000, 
00:60:b0:7a:12:89, IRQ 72.
Slab corruption: size-128 start=00000000be8ab1d0, len=128
Redzone: 0x9d70000001/0x9f911029d74e35b.
Last user: [<0000000000000000>](0x0)
000: 00 00 00 00 00 00 00 02 00 00 00 00 00 0a 71 0c
010: 00 00 00 00 00 00 01 e8 00 00 00 00 00 00 00 30
020: 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00 04
Redzone: 0x9f911029d74e35b/0x9f911029d74e35b.
Last user: [<ffffffffffffffff>](0xfffffffffffffffc)
000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
Next obj: start=00000000be8ab268, len=128
Redzone: 0xd84156c5635688c0/0xd84156c5635688c0.
Last user: [<0000000040185f34>](add_notes_attrs+0x8c/0x1c0)
000: 00 00 00 00 bd c3 09 d8 00 00 00 01 00 00 00 00
010: 00 00 00 00 bd c1 4a 78 00 00 00 00 00 00 00 00
slab error in cache_alloc_debugcheck_after(): cache `size-128': double 
free, or memory outside object was oven
Backtrace:
  [<000000004011a6c4>] show_stack+0x14/0x20
  [<000000004011a6e8>] dump_stack+0x18/0x28
  [<00000000401cc054>] __slab_error+0x3c/0x48
  [<00000000401cc850>] cache_alloc_debugcheck_after+0x1d0/0x2f8
  [<00000000401cebf0>] kmem_cache_alloc+0xd0/0x1a8
  [<00000000401d7b9c>] __register_chrdev_region+0x54/0x210
  [<00000000401d7da0>] register_chrdev+0x48/0x190
  [<00000000000cf068>] init_oss_soundcore+0x28/0x60 [soundcore]
  [<00000000000cf0bc>] init_soundcore+0x1c/0x98 [soundcore]
  [<00000000401177f0>] do_one_initcall+0x50/0x1d0
  [<0000000040188988>] sys_init_module+0x100/0x2a8
  [<0000000040104ef8>] syscall_exit+0x0/0x14

00000000be8ab1c8: redzone 1:0x9d70000001, redzone 2:0x9f911029d74e35b
acenic.c: v0.92 08/05/2002  Jes Sorensen, linux-acenic@SunSITE.dk
                             http://home.cern.ch/~jes/gige/acenic.html
0000:02:01.0: Alteon AceNIC Gigabit Ethernet at 0xfffffffff3000000, irq 71
   Tigon II (Rev. 6), Firmware: 12.4.11, MAC: 00:30:6e:0f:91:d8
   PCI bus width: 64 bits, speed: 33MHz, latency: 248 clks
   Disabling PCI memory write and invalidate
0000:02:01.0: Firmware up and running
done.
Setting parameters of disc: (none).
Setting the system clock.
System Clock set to: Thu Nov 20 07:34:43 UTC 2008.
<...continues to boot until a login prompt>

My conclusion is:
There is some problem somewhere.
It does not show up always. Changing some kernel configuration may bring 
the bug up or it may not.
James, I think if you reboot your ion machine a few times or modify some 
kernel configs, you probably will hit the bug as well.

Helge
