From: Helge Deller <deller@gmx.de>
Subject: Re: [RFT] irq changes (was Re: [git] parisc: Changes to ref refs/heads/parisc)
Date: Sat, 20 Nov 2010 23:01:32 +0100
Message-ID: <4CE8453C.5020106@gmx.de>
References: <201010140531.o9E5VRYK010123@hera.kernel.org> <20101014153931.GI24144@bombadil.infradead.org> <4CE04DCF.7040306@gmx.de> <20101115195606.GA8332@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101115195606.GA8332@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/15/2010 08:56 PM, Kyle McMartin wrote:
> On Sun, Nov 14, 2010 at 09:59:59PM +0100, Helge Deller wrote:
>> I just got again a chance to boot up my b160L and 715/64 machines.
>>
>> Both broke due to the IRQ changes. I did reverted all of your IRQ
>> patches (based on current Linus head branch) and now they boot
>> again.
>> Basically they just hang during the SCSI initialization (timeouts
>> while detectings discs).
>>
>> So, there is something wrong for Lasi/GSC and Dino busses....
>>
>> Any idea?
>>
> No, but I'll take a look, it's probably something simple and stupid that
> I missed. :/

I tried to look into it, but I'm somewhat lost.

This is what I get on my B160L.
Same result btw on the 715/64.


Booting...
Network Station Address 080009-ef34f5
System IP Address 192.168.178.65
Server IP Address 192.168.178.50

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl 1.13 root@c3000 Mon Apr  3 23:30:38 CEST 2006

Boot image contains:
     0/vmlinux32 7688520 bytes @ 0x9800

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'HOME=/ root=/dev/sda3  ip=bootp 
panic_timeout=60 console=ttyS0 TERM=vt102 palo_kernel='
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 
32-bit kernelELF32 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 6172672 mediaptr 0x1000
Segment 1 load 0072c000 size 311016 mediaptr 0x5e4000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.37-rc2-32bit+ (deller@p100.box) (gcc version 4.4.1 
(GCC) ) #282 Sat Nov 20 22:32:27 CET 2010
unwind_init: start = 0x10640000, end = 0x1067f610, entries = 16225
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005020 00000481 00000000 02020202 7794d7fe 100000f0 00000004 
000000ba 000000ba
vers  00000008
CPUID vers 15 rev 8 (0x000001e8)
capabilities 0x2
model 9000/778/B160L
Total Memory: 128 MB
LED display at f0190001 registered
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
Kernel command line: HOME=/ root=/dev/sda3 pa64root=sda5 ip=bootp 
panic_timeout=60 console=ttyS0 TERM=vt102 palo_kernel=0/vmlx
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 123100k/131072k available (4152k kernel code, 7972k reserved, 
1851k data, 304k init)
virtual kernel memory layout:
     vmalloc : 0x00810000 - 0x0f000000   ( 231 MB)
     memory  : 0x10000000 - 0x18000000   ( 128 MB)
       .init : 0x1072c000 - 0x10778000   ( 304 kB)
       .data : 0x1050e3a0 - 0x106dd170   (1851 kB)
       .text : 0x10100000 - 0x1050e3a0   (4152 kB)
NR_IRQS:96
Console: colour dummy device 128x48
Calibrating delay loop... 106.08 BogoMIPS (lpj=530432)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
xor: measuring software checksum speed
    8regs     :   131.200 MB/sec
    8regs_prefetch:   130.800 MB/sec
    32regs    :   198.800 MB/sec
    32regs_prefetch:   198.400 MB/sec
xor: using function: 32regs (198.800 MB/sec)
atomic64 test passed
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Phantom PseudoBC GSC+ Port at 0xffc00000 [8] { 7, 0x0, 0x504, 0x00000 }
2. Dino PCI Bridge at 0xfff80000 [8/0] { 13, 0x3, 0x680, 0x0000a }
3. Merlin+ 132 Dino RS-232 at 0xfff83000 [8/0/63] { 10, 0x0, 0x022, 
0x0008c }
4. Merlin 160 Core FW-SCSI at 0xfff8c000 [8/12] { 4, 0x0, 0x03d, 0x00089 }
5. Merlin 160 Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x03d, 0x00081 }, 
additional addresses: 0xffd0c000 0xffc00000
6. Merlin 160 Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x03d, 0x0008c }
7. Merlin 160 Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x03d, 0x00082 }
8. Merlin 160 Core LAN (802.3) at 0xffd07000 [8/16/6] { 10, 0x0, 0x03d, 
0x0008a }
9. Merlin 160 Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x03d, 
0x00074 }, additional addresses: 0xffd01000 0xffd03000
10. Merlin 160 Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x03d, 0x0007b }
11. Merlin 160 Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x03d, 
0x00084 }
12. Merlin 160 Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x03d, 
0x00084 }
13. Coral SGC Graphics at 0xfa000000 [8/4] { 10, 0x0, 0x004, 0x00077 }
14. Coral SGC Graphics at 0xf4000000 [8/8] { 10, 0x0, 0x004, 0x00077 }
15. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 
0x00085 }, additional addresses: 0xf0011000
16. Merlin L2 160 (9000/778/B160L) at 0xfffbe000 [62] { 0, 0x0, 0x502, 
0x00004 }
17. Memory at 0xfffbf000 [63] { 1, 0x0, 0x067, 0x00009 }
18. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096 }
CPU(s): 1 x PA7300LC (PCX-L2) at 160.000000 MHz
Setting cache flush threshold to ac0 (1 CPUs online)
Lasi version 0 at 0xffd00000 found.
Dino version 3.1 found at 0xfff80000
Dino: No PCI devices enabled.
powersw: Soft power switch at 0xf0140000 enabled.
bio: create slab <bio-0> at 0
raid6: int32x1     59 MB/s
raid6: int32x2     76 MB/s
raid6: int32x4     86 MB/s
raid6: int32x8     58 MB/s
raid6: using algorithm int32x4 (86 MB/s)
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Switching to clocksource cr16
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 4096 (order: 3, 32768 bytes)
TCP bind hash table entries: 4096 (order: 4, 81920 bytes)
TCP: Hash tables configured (established 4096 bind 4096)
TCP reno registered
UDP hash table entries: 128 (order: 0, 6144 bytes)
UDP-Lite hash table entries: 128 (order: 0, 6144 bytes)
NET: Registered protocol family 1
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Enabling PDC chassis warnings support v0.05
Initializing RT-Tester: OK
====[ backtrace testing ]===========
Testing a backtrace from process context.
The following trace is a kernel self test and not a bug!
Backtrace:
  [<10118558>] show_stack+0x18/0x28
  [<10111544>] dump_stack+0x1c/0x2c
  [<101732c8>] backtrace_regression_test+0x50/0x128
  [<10116454>] do_one_initcall+0x6c/0x2b8
  [<1072d850>] kernel_init+0xe0/0x184
  [<10102c5c>] ret_from_kernel_thread+0x1c/0x24

Testing a backtrace from irq context.
The following trace is a kernel self test and not a bug!
Backtrace:
  [<10118558>] show_stack+0x18/0x28
  [<10111544>] dump_stack+0x1c/0x2c
  [<10173258>] backtrace_test_irq_callback+0x18/0x38
  [<101403b4>] tasklet_action+0xbc/0xdc
  [<10140cfc>] __do_softirq+0xd8/0x1a4
  [<1011527c>] do_softirq+0x3c/0x60
  [<10140e54>] run_ksoftirqd+0x8c/0x138
  [<10157238>] kthread+0xa4/0xac
  [<10102c5c>] ret_from_kernel_thread+0x1c/0x24

Testing a saved backtrace.
The following trace is a kernel self test and not a bug!
  [<10121eb4>] save_stack_trace+0x28/0x60
  [<10173368>] backtrace_regression_test+0xf0/0x128
  [<10116454>] do_one_initcall+0x6c/0x2b8
  [<1072d850>] kernel_init+0xe0/0x184
  [<10102c5c>] ret_from_kernel_thread+0x1c/0x24
  [<ffffffff>] 0xffffffff
====[ end of backtrace testing ]====
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
msgmni has been set to 240
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
PDC Stable Storage facility v0.30
STI GSC/PCI core graphics driver Version 0.9a
     id 2bcb015a-9a02587, conforms to spec rev. 8.04
     graphics card name: HPA4071B
     id 2d08c0a7-9a02587, conforms to spec rev. 8.07
     graphics card name: HPA4450AX1024
     id 2d08c0a7-9a02587, conforms to spec rev. 8.07
     graphics card name: INTERNAL_EG_X1024
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-32 frame buffer device, HPA4071B, id: 2bcb015a, 
mmio: 0xfa100000
fb1: stifb 1024x768-8 frame buffer device, HPA4450AX1024, id: 2d08c0a7, 
mmio: 0xf4100000
fb2: stifb 1024x768-8 frame buffer device, INTERNAL_EG_X1024, id: 
2d08c0a7, mmio: 0xf8100000
Linux agpgart interface v0.103
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
8:16:4: ttyS0 at MMIO 0xffd05800 (irq = 16) is a 16550A
console [ttyS0] enabled, bootconsole disabled
console [ttyS0] enabled, bootconsole disabled
8:0:63: ttyS1 at MMIO 0xfff83800 (irq = 22) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 19 [PCSPP,TRISTATE]
parport0: fix this legacy no-device port driver!
brd: module loaded
loop: module loaded
Uniform Multi-Platform E-IDE driver
ide-gd driver 1.18
ide-cd driver 5.00
zalon_probe: Zalon version 1, IRQ 67
ncr53c720-0: rev 0xf irq 67
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3g

------------ HERE it starts "hanging" (output is very slow) --------------
-
It seems the zalon/720 driver is not getting any interrupts.
zalon seems to use the GSC chip.
- --------------------------------------------------------------------------



scsi 0:0:1:0: Device offlined - not ready after error recovery
scsi 0:0:2:0: Device offlined - not ready after error recovery
scsi 0:0:3:0: Device offlined - not ready after error recovery
scsi 0:0:4:0: Device offlined - not ready after error recovery
scsi 0:0:5:0: Device offlined - not ready after error recovery
scsi 0:0:6:0: Device offlined - not ready after error recovery
scsi 0:0:8:0: Device offlined - not ready after error recovery
scsi 0:0:9:0: Device offlined - not ready after error recovery
scsi 0:0:10:0: Device offlined - not ready after error recovery
scsi 0:0:11:0: Device offlined - not ready after error recovery
scsi 0:0:12:0: Device offlined - not ready after error recovery
scsi 0:0:13:0: Device offlined - not ready after error recovery
scsi 0:0:14:0: Device offlined - not ready after error recovery
scsi 0:0:15:0: Device offlined - not ready after error recovery
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
scsi 1:0:1:0: New error handler wants to abort command

scsi 1:0:1:0: CDB: cdb[0]=0x12: 12 00 00 00 24 00
scsi 1:0:1:0: New error handler wants BUS reset, cmd 17e35ee0

scsi 1:0:1:0: CDB: cdb[0]=0x12: 12 00 00 00 24 00
INFO: task scsi_eh_1:544 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
scsi_eh_1     D 10102d30     0   544      2 0x00000000
Backtrace:
  [<10111ffc>] schedule+0x288/0x510
  [<101125f4>] schedule_timeout+0x1a0/0x1fc
  [<10111bac>] wait_for_common+0xdc/0x188
  [<10111d64>] wait_for_completion+0x1c/0x2c
  [<1039e128>] NCR_700_bus_reset+0x104/0x180
  [<1037ad70>] scsi_try_bus_reset+0x38/0x138
  [<1037c44c>] scsi_eh_ready_devs+0x498/0x6b8
  [<1037cbfc>] scsi_error_handler+0x43c/0x44c
  [<10157238>] kthread+0xa4/0xac
  [<10102c5c>] ret_from_kernel_thread+0x1c/0x24

and so on...

