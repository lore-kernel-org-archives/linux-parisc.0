From: Helge Deller <deller@gmx.de>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Fri, 18 May 2012 23:09:10 +0200
Message-ID: <4FB6BA76.6010101@gmx.de>
References: <4FA9975C.5060708@bergerie>   <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>   <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>   <4FAEE943.2030203@gmx.de> <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>   <4FB182F8.2040403@gmx.de> <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>   <1337069366.3005.10.camel@dabdike.lan>  <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net>  <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net>  <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>  <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>  <4FB2C129.90307@bell.net> <4FB550F1.7080104@gmx.de> <1337328744.2938.5.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: John David Anglin <dave.anglin@bell.net>,
	Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1337328744.2938.5.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/18/2012 10:12 AM, James Bottomley wrote:
> On Thu, 2012-05-17 at 21:26 +0200, Helge Deller wrote:
>> But I think we still have a problem.
>> I'm using 3.4.0-rc7, have pulled all fixes from James "fixes" branch,
>> and Dave's "vmlinux.lds" patch.
>>
>> The 32bit machines (715/64 and B160L) boot nicely into userspace.
>> The 64bit machine (C3000) crashes directly when switching to userspace.
>>
>> Do we still have another problem somewhere?
>> Or is it introduced because of the vmlinux.lds patch?
>> (Reminder: without the vmlinux.lds patch the C3000 hangs directly at
>> bootup after printing memory information...)
> I'm not seeing it on my rp3410 ... I'm going to have to find the J box
> (which I think is closest to your C3000 ... that's an astro system) and
> boot it.
[crash log removed - new one see below]
> What this says is something went wrong in the tmpalias space because 
> it fell through to the fault path. How much memory does this system 
> have (and what's the layout map)? It's 64 bit but you're booting it 
> with a 32 bit kernel ... I'm wondering if there's no space for 
> tmpalias. James 

James, here is the full kernel log. Does this help?

---
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing...
This box can boot either 32 or 64-bit kernels...Only see a 32-bit 
kernel, using thatELF32 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 6549504 mediaptr 0x1000
Segment 1 load 00788000 size 175988 mediaptr 0x640000
Segment 2 load 007b3000 size 144916 mediaptr 0x66b000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Initializing cgroup subsys cpuset
Initializing cgroup subsys cpu
Linux version 3.4.0-rc7-32bit+ (deller@p100) (gcc version 4.6.4 20120514 
(prerelease) (GCC) ) #10 Thu May 17 21:12:16 CEST 2012
unwind_init: start = 0x10690000, end = 0x106d5170, entries = 17687
FP[0] enabled: Rev 1 Model 19
The 32-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005dc0 00000481 00000000 00000002 777c3e84 100000f0 00000008 
000000b2 000000b2
vers  00000301
CPUID vers 19 rev 11 (0x0000026b)
capabilities 0x7
model 9000/785/C3700
Total Memory: 2048 MB
LCD display at f05d0008,f05d0000 registered
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 520192
Kernel command line: HOME=/ root=/dev/sda3 pa64root=sda5 b160Lroot=sda5 
ip=bootp panic_timeout=60 console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 4096 (order: 2, 16384 bytes)
Dentry cache hash table entries: 262144 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 131072 (order: 7, 524288 bytes)
allocated 4194304 bytes of page_cgroup
please try 'cgroup_disable=memory' option if you don't want memory cgroups
Memory: 2065896k/2097152k available (4404k kernel code, 31256k reserved, 
1969k data, 316k init)
virtual kernel memory layout:
     vmalloc : 0x00008000 - 0x0f000000   ( 239 MB)
     memory  : 0x10000000 - 0x90000000   (2048 MB)
       .init : 0x10788000 - 0x107d7000   ( 316 kB)
       .data : 0x1054d304 - 0x10739770   (1969 kB)
       .text : 0x10100000 - 0x1054d304   (4404 kB)
NR_IRQS:96
Console: colour dummy device 128x48
Calibrating delay loop... 1495.85 BogoMIPS (lpj=7479296)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
Initializing cgroup subsys cpuacct
Initializing cgroup subsys memory
Initializing cgroup subsys devices
Initializing cgroup subsys freezer
Initializing cgroup subsys blkio
xor: measuring software checksum speed
    8regs     :  1822.000 MB/sec
    8regs_prefetch:  1798.400 MB/sec
    32regs    :  1443.600 MB/sec
    32regs_prefetch:  1442.800 MB/sec
xor: using function: 8regs (1822.000 MB/sec)
atomic64 test passed
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
6. Allegro W2 at 0xfffa0000 [32] { 0, 0x0, 0x5dc, 0x00004 }
7. Memory at 0xfed10200 [49] { 1, 0x0, 0x09c, 0x00009 }
CPU(s): 1 x PA8700 (PCX-W2) at 750.000000 MHz
Setting cache flush threshold to 1a0 (1 CPUs online)
SBA found Astro 2.1 at 0xfed00000
Elroy version TR4.0 (0x5) found at 0xfed30000
LBA 10:0: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0x1fff]
pci_bus 0000:00: root bus resource [mem 0xf2000000-0xf23fffff]
PCI: Enabled native mode for NS87415 (pif=0x8f)
Elroy version TR4.0 (0x5) found at 0xfed32000
LBA 10:1: PCI host bridge to bus 0000:01
pci_bus 0000:01: root bus resource [io  0x12000-0x13fff] (bus address 
[0x2000-0x3fff])
pci_bus 0000:01: root bus resource [mem 0xf6000000-0xf6ffffff]
pci_bus 0000:01: root bus resource [mem 0xf2400000-0xf27fffff]
pci 0000:01:04.0: no compatible bridge window for [mem 
0xf6000000-0xf7ffffff]
iosapic: no IRTE for 0000:01:04.0 (IRQ not connected?)
pci 0000:01:05.0: no compatible bridge window for [mem 
0xf8000000-0xf8ffffff pref]
iosapic: no IRTE for 0000:01:05.0 (IRQ not connected?)
pci 0000:01:06.0: PCI bridge to [bus 02-ff]
pci 0000:01:06.0: can't handle 64-bit address space for bridge
pci 0000:01:06.0: no compatible bridge window for [??? 0x00000000 flags 0x0]
pci 0000:01:06.0: no compatible bridge window for [mem 
0xf9000000-0xfbffffff]
pci 0000:01:06.0: no compatible bridge window for [??? 0x00000000 flags 0x0]
pci 0000:01:06.0: no compatible bridge window for [??? 0x00000000 flags 0x0]
pci 0000:01:06.0: device not available (can't reserve [mem 
0xf9000000-0xfbffffff])
pci 0000:01:06.0: Error enabling bridge (-22), continuing
Elroy version TR4.0 (0x5) found at 0xfed38000
LBA 10:4: PCI host bridge to bus 0000:03
pci_bus 0000:03: root bus resource [io  0x28000-0x29fff] (bus address 
[0x8000-0x9fff])
pci_bus 0000:03: root bus resource [mem 0xf3000000-0xf33fffff]
Elroy version TR4.0 (0x5) found at 0xfed3c000
LBA 10:6: PCI host bridge to bus 0000:04
pci_bus 0000:04: root bus resource [io  0x3c000-0x3dfff] (bus address 
[0xc000-0xdfff])
pci_bus 0000:04: root bus resource [mem 0xf4000000-0xf5ffffff]
pci_bus 0000:04: root bus resource [mem 0xf3800000-0xf3bfffff]
iosapic: hpa not registered for 0000:04:02.0
powersw: Soft power switch at 0xf0400804 enabled.
bio: create slab <bio-0> at 0
raid6: int32x1    393 MB/s
raid6: int32x2    481 MB/s
raid6: int32x4    524 MB/s
raid6: int32x8    478 MB/s
raid6: using algorithm int32x4 (524 MB/s)
vgaarb: device added: PCI:0000:02:00.0,decodes=io+mem,owns=none,locks=none
vgaarb: loaded
vgaarb: bridge control possible 0000:02:00.0
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Switching to clocksource cr16
NET: Registered protocol family 2
IP route cache hash table entries: 65536 (order: 6, 262144 bytes)
TCP established hash table entries: 262144 (order: 9, 2097152 bytes)
TCP bind hash table entries: 65536 (order: 8, 1310720 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP: reno registered
UDP hash table entries: 1024 (order: 3, 49152 bytes)
UDP-Lite hash table entries: 1024 (order: 3, 49152 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 67)
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
Enabling PDC chassis warnings support v0.05
Initializing RT-Tester: OK
====[ backtrace testing ]===========
Testing a backtrace from process context.
The following trace is a kernel self test and not a bug!
Backtrace:
  [<10119bc8>] dump_stack+0x1c/0x2c
  [<1017d35c>] backtrace_regression_test+0x44/0x124
  [<10117f48>] do_one_initcall+0x258/0x2b8
  [<1078a208>] kernel_init+0x184/0x214
  [<1010405c>] ret_from_kernel_thread+0x1c/0x24

Testing a backtrace from irq context.
The following trace is a kernel self test and not a bug!
Backtrace:
  [<10119bc8>] dump_stack+0x1c/0x2c
  [<1017d2f8>] backtrace_test_irq_callback+0x18/0x38
  [<10139840>] tasklet_action+0x78/0xdc
  [<10139dd4>] __do_softirq+0x130/0x17c
  [<10139e90>] run_ksoftirqd+0x70/0x124
  [<101512f4>] kthread+0xac/0xb4
  [<1010405c>] ret_from_kernel_thread+0x1c/0x24

Testing a saved backtrace.
The following trace is a kernel self test and not a bug!
  [<101234b0>] save_stack_trace+0x28/0x60
  [<1017d408>] backtrace_regression_test+0xf0/0x124
  [<10117f48>] do_one_initcall+0x258/0x2b8
  [<1078a208>] kernel_init+0x184/0x214
  [<1010405c>] ret_from_kernel_thread+0x1c/0x24
  [<ffffffff>] 0xffffffff
====[ end of backtrace testing ]====
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
msgmni has been set to 4034
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
start plist test
end plist test
PDC Stable Storage facility v0.30
STI GSC/PCI core graphics driver Version 0.9a
sti 0000:01:04.0: device not available (can't reserve [mem 
0xf6000000-0xf7ffffff])
sti 0000:01:04.0: Cannot enable PCI device
sti: probe of 0000:01:04.0 failed with error -22
STI PCI graphic ROM found at f3800000 (2048 kB), fb at f4000000 (32 MB)
     id 35acda30-9a02587, conforms to spec rev. 8.0d
     graphics card name: A1262A
sticon: Initializing STI text console.
Console: switching to colour STI console 128x48
matroxfb 0000:02:00.0: enabling SERR and PARITY (0007 -> 0147)
matroxfb: Matrox G450 detected
PInS memtype = 4
matroxfb: cannot determine memory size
matroxfb: probe of 0000:02:00.0 failed with error -1
stifb: 'A1262A' (id: 0x35acda30) not supported.
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
serial8250: ttyS0 at I/O 0x3f8 (irq = 3) is a 16550A
console [ttyS0] enabled, bootconsole disabled
console [ttyS0] enabled, bootconsole disabled
serial8250: ttyS1 at I/O 0x2f8 (irq = 4) is a 16550A
Linux agpgart interface v0.103
brd: module loaded
loop: module loaded
Uniform Multi-Platform E-IDE driver
ns87415 0000:00:0e.0: IDE controller (0x100b:0x0002 rev 0x03)
ns87415 0000:00:0e.0: 100% native mode on irq 7
     ide0: BM-DMA at 0x0a00-0x0a07
     ide1: BM-DMA at 0x0a08-0x0a0f
hda: CD-532E-B, ATAPI CD/DVD-ROM drive
ide0 at 0xf00-0xf07,0xe02 on irq 7
ide1 at 0xd00-0xd07,0xb02 on irq 7
ide-gd driver 1.18
ide-cd driver 5.00
ide-cd: hda: ATAPI 32X CD-ROM drive, 128kB Cache
cdrom: Uniform CD-ROM driver Revision: 3.20
sym0: <896> rev 0x7 at pci 0000:00:0f.0 irq 68
sym0: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
sym0: SCSI BUS has been reset.
sym0: SCSI BUS mode change from SE to SE.
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.3
sym1: <896> rev 0x7 at pci 0000:00:0f.1 irq 68
sym1: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.2.3
scsi 1:0:5:0: Direct-Access     SEAGATE  ST39102LC        HP01 PQ: 0 ANSI: 2
scsi target1:0:5: tagged command queuing enabled, command queue depth 16.
scsi target1:0:5: Beginning Domain Validation
scsi target1:0:5: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 15)
scsi target1:0:5: Domain Validation skipping write tests
scsi target1:0:5: Ending Domain Validation
scsi 1:0:6:0: Direct-Access     HP 36.4G ST336607LC       HPC3 PQ: 0 ANSI: 3
scsi target1:0:6: tagged command queuing enabled, command queue depth 16.
scsi target1:0:6: Beginning Domain Validation
scsi target1:0:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
scsi target1:0:6: Domain Validation skipping write tests
scsi target1:0:6: Ending Domain Validation
st: Version 20101219, fixed bufsize 32768, s/g segs 256
sd 1:0:5:0: Attached scsi generic sg0 type 0
sd 1:0:6:0: Attached scsi generic sg1 type 0
Linux Tulip driver version 1.1.15 (Feb 27, 2007)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1
net eth0: Digital DS21142/43 Tulip rev 65 at Port 0x1000, 
00:30:6e:48:aa:64, IRQ 65
tulip1: EEPROM default media type Autosense
tulip1: Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block
tulip1: Index #1 - Media 10base2 (#1) described by a 21142 Serial PHY 
(2) block
tulip1: Index #2 - Media AUI (#2) described by a 21142 Serial PHY (2) block
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101
sd 1:0:5:0: [sda] 17773524 512-byte logical blocks: (9.10 GB/8.47 GiB)
sd 1:0:6:0: [sdb] 71132960 512-byte logical blocks: (36.4 GB/33.9 GiB)
sd 1:0:5:0: [sda] Write Protect is off
sd 1:0:6:0: [sdb] Write Protect is off
net eth1: Digital DS21142/43 Tulip rev 33 at Port 0x28000, 
00:60:b0:7a:12:89, IRQ 71
LASI 82596 driver - Revision: 1.30
sd 1:0:5:0: [sda] Write cache: disabled, read cache: enabled, supports 
DPO and FUA
sd 1:0:6:0: [sdb] Write cache: disabled, read cache: enabled, supports 
DPO and FUA
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci_hcd 0000:00:0e.2: OHCI Host Controller
ohci_hcd 0000:00:0e.2: new USB bus registered, assigned bus number 1
ohci_hcd 0000:00:0e.2: irq 1, io mem 0xf2007000
  sda: sda1 sda2 sda3 sda4
  sdb: sdb1 sdb2 sdb3 sdb4
usb usb1: New USB device found, idVendor=1d6b, idProduct=0001
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: OHCI Host Controller
usb usb1: Manufacturer: Linux 3.4.0-rc7-32bit+ ohci_hcd
usb usb1: SerialNumber: 0000:00:0e.2
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
uhci_hcd: USB Universal Host Controller Interface driver
mousedev: PS/2 mouse device common for all mice
sd 1:0:6:0: [sdb] Attached SCSI disk
sd 1:0:5:0: [sda] Attached SCSI disk
rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
md: raid10 personality registered for level 10
md: raid6 personality registered for level 6
md: raid5 personality registered for level 5
md: raid4 personality registered for level 4
device-mapper: uevent: version 1.0.3
device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) initialised: 
dm-devel@redhat.com
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
oprofile: using timer interrupt.
TCP: cubic registered
NET: Registered protocol family 17
rtc-generic rtc-generic: setting system clock to 2012-05-18 21:06:15 UTC 
(1337375175)
Sending BOOTP requests . OK
IP-Config: Got BOOTP answer from 192.168.178.50, my address is 
192.168.178.66
IP-Config: Complete:
      device=eth0, addr=192.168.178.66, mask=255.255.255.0, gw=192.168.178.1
      host=c3000, domain=box, nis-domain=(none)
      bootserver=192.168.178.50, rootserver=192.168.178.50, rootpath=
md: Waiting for all devices to be available before autodetect
md: If you don't use raid, use raid=noautodetect
md: Autodetecting RAID arrays.
md: Scanned 0 and added 0 devices.
md: autorun ...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sda3): mounted filesystem with writeback data mode
VFS: Mounted root (ext3 filesystem) readonly on device 8:3.
Freeing unused kernel memory: 316k freed
Backtrace:
  [<10119560>] clear_user_page_asm+0x44/0x6c
  [<101195dc>] clear_user_page+0x54/0x6c
  [<101bbaa8>] handle_pte_fault+0x5dc/0x7a8
  [<101bbd3c>] handle_mm_fault+0xc8/0x120
  [<101bbffc>] __get_user_pages+0x160/0x3c4
  [<101bc348>] get_user_pages+0x50/0x60
  [<101e169c>] get_arg_page+0x64/0xe8
  [<101e182c>] copy_strings+0x10c/0x248
  [<101e1990>] copy_strings_kernel+0x28/0x44
  [<101e328c>] do_execve+0x2a0/0x36c
  [<10120424>] sys_execve+0x44/0x7c
  [<10104084>] __execve+0x20/0x34
  [<10133b9c>] vprintk+0x1d8/0x4f4
  [<10133ee8>] printk+0x30/0x40
  [<10118550>] free_initmem+0x154/0x184
  [<10117cbc>] init_post+0xa0/0xd4


Kernel Fault: Code=26 regs=8fc30940 (Addr=0f2ff000)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001110 Not tainted
r00-03  0006ff0e 00000040 10119560 8fc308c0
r04-07  106e5820 107d2000 0000000f 10768020
r08-11  ffeffff1 8f0aeffc 8f08ce40 00000001
r12-15  00000000 00000017 00000001 00000000
r16-19  00004400 00000020 00000000 ffffffff
r20-23  00000000 00000000 00000001 00000040
r24-27  1090aa40 ffeffff1 0000fa40 106e2020
r28-31  0f2ff000 0007d8a3 8fc30940 0007d045
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10100eec 10100ef0
  IIR: 0f801280    ISR: 00000000  IOR: 0f2ff000
  CPU:        0   CR30: 8fc30000 CR31: ffffffff
  ORIG_R28: 8f812728
  IAOQ[0]: __clear_user_page_asm+0x20/0x70
  IAOQ[1]: __clear_user_page_asm+0x24/0x70
  RP(r2): clear_user_page_asm+0x44/0x6c
Backtrace:
  [<10119560>] clear_user_page_asm+0x44/0x6c
  [<101195dc>] clear_user_page+0x54/0x6c
  [<101bbaa8>] handle_pte_fault+0x5dc/0x7a8
  [<101bbd3c>] handle_mm_fault+0xc8/0x120
  [<101bbffc>] __get_user_pages+0x160/0x3c4
  [<101bc348>] get_user_pages+0x50/0x60
  [<101e169c>] get_arg_page+0x64/0xe8
  [<101e182c>] copy_strings+0x10c/0x248
  [<101e1990>] copy_strings_kernel+0x28/0x44
  [<101e328c>] do_execve+0x2a0/0x36c
  [<10120424>] sys_execve+0x44/0x7c
  [<10104084>] __execve+0x20/0x34
  [<10133b9c>] vprintk+0x1d8/0x4f4
  [<10133ee8>] printk+0x30/0x40
  [<10118550>] free_initmem+0x154/0x184
  [<10117cbc>] init_post+0xa0/0xd4

Kernel panic - not syncing: Kernel Fault

