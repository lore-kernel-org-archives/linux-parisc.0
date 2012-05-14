From: Helge Deller <deller@gmx.de>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Tue, 15 May 2012 00:11:04 +0200
Message-ID: <4FB182F8.2040403@gmx.de>
References: <4FA9975C.5060708@bergerie> <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net> <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl> <4FAEE943.2030203@gmx.de> <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070101010100020709070002"
Cc: Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------070101010100020709070002
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2012 03:10 AM, John David Anglin wrote:
> I had a successful bot of 3.4.0-rc7+ this evening.
>
> I updated my running kernel patch to 3.4.  The futex patch is removed 
> and Srivatsa S. Bhat's
> patch added.

Ok, I applied your patch now.
I used latest binutils and (as suggested by Dave) gcc-4.6 branch.
I built Kernel 3.4.0-rc7 as 32bit-binary for my c3000, b160L and 715/64.

The c3000 booted nicely into userspace.

The B160L and the 715/64 (both 32bit-only PA1.X machines) crashed with 
the following trace.
All logs attached.

Any ideas?

Helge



swapper (pid 1): Illegal instruction (code 8)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000000000000000000000000 Not tainted
r00-03  00000000 00000001 101bc460 19c246c0
r04-07  00000017 19e6a5f8 19c22db8 ffeffff1
r08-11  0f2ff000 0f000000 00000033 fff00ff1
r12-15  00000000 00000017 00000001 00000000
r16-19  00000000 00000043 00000000 107e9a80
r20-23  19c245c8 10957000 00000001 00000001
r24-27  00000000 00000000 0000fa80 106e2020
r28-31  0f2ff000 000094b9 19c24740 00009271
sr00-03  00000000 00000001 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10101110 10101114
  IIR: 078112a0    ISR: 00000000  IOR: 0f2ff000
  CPU:        0   CR30: 19c24000 CR31: f00effff
  ORIG_R28: 19e84ffc
  IAOQ[0]: flush_dcache_page_asm+0x28/0x7c
  IAOQ[1]: flush_dcache_page_asm+0x2c/0x7c
  RP(r2): __get_user_pages+0x38c/0x3c4
Backtrace:
  [<101bc460>] __get_user_pages+0x38c/0x3c4
  [<101bc580>] get_user_pages+0x50/0x60
  [<101e1a1c>] get_arg_page+0x64/0xe8
  [<101e1bac>] copy_strings+0x10c/0x248
  [<101e1d10>] copy_strings_kernel+0x28/0x44
  [<101e360c>] do_execve+0x2a0/0x36c
  [<10120598>] sys_execve+0x44/0x7c
  [<10104084>] __execve+0x20/0x34
  [<10133d2c>] vprintk+0x1d8/0x4f4
  [<10134078>] printk+0x30/0x40
  [<10118550>] free_initmem+0x154/0x184
  [<10117cbc>] init_post+0xa0/0xd4
  [<1078a294>] kernel_init+0x210/0x214


--------------070101010100020709070002
Content-Type: text/plain;
 name="715_64.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="715_64.log"

Command line for kernel: 'HOME=/ root=/dev/sda5 pa64root=sda5 ip=bootp panic_timeout=60 console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 32-bit kernelELF32 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 6549504 mediaptr 0x1000
Segment 1 load 00788000 size 176308 mediaptr 0x640000
Segment 2 load 007b4000 size 144916 mediaptr 0x66c000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Initializing cgroup subsys cpuset
Initializing cgroup subsys cpu
Linux version 3.4.0-rc7-32bit+ (deller@p100) (gcc version 4.6.4 20120514 (prerelease) (GCC) ) #1 Mon May 14 23:10:09 CEST 2012
unwind_init: start = 0x10690000, end = 0x106d5190, entries = 17689
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: Snake.
model 000060a0 00000481 00000000 00000000 773c7d2c 00000000 00000004 00000072 00000072
vers  0000000c
model 9000/715
ic_size 20000 dc_size 20000 it_size 40
DC  base 0x0 stride 0x20 count 0x1000 loop 0x1
dc_conf = 0x61402000  alias 6 blk 1 line 2 shift 0
        wt 0 sh 0 cst 1 hv 0
IC  base 0x0 stride 0x20 count 0x1000 loop 0x1
ic_conf = 0x61402000  alias 6 blk 1 line 2 shift 0
        wt 0 sh 0 cst 1 hv 0
D-TLB conf: sh 3 page 1 cst 1 aid 0 pad1 0
I-TLB conf: sh 3 page 1 cst 1 aid 0 pad1 0
Total Memory: 160 MB
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 40640
Kernel command line: HOME=/ root=/dev/sda5 pa64root=sda5 ip=bootp panic_timeout=60 console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 1024 (order: 0, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
allocated 327680 bytes of page_cgroup
please try 'cgroup_disable=memory' option if you don't want memory cgroups
Memory: 154772k/163840k available (4405k kernel code, 9068k reserved, 1968k data, 320k init)
virtual kernel memory layout:
    vmalloc : 0x00810000 - 0x0f000000   ( 231 MB)
    memory  : 0x10000000 - 0x1a000000   ( 160 MB)
      .init : 0x10788000 - 0x107d8000   ( 320 kB)
      .data : 0x1054d6c4 - 0x10739770   (1968 kB)
      .text : 0x10100000 - 0x1054d6c4   (4405 kB)
NR_IRQS:96
Console: colour dummy device 128x48
Calibrating delay loop... 63.48 BogoMIPS (lpj=317440)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
Initializing cgroup subsys cpuacct
Initializing cgroup subsys memory
Initializing cgroup subsys devices
Initializing cgroup subsys freezer
Initializing cgroup subsys blkio
xor: measuring software checksum speed
   8regs     :    44.800 MB/sec
   8regs_prefetch:    44.800 MB/sec
   32regs    :    72.800 MB/sec
   32regs_prefetch:    72.800 MB/sec
xor: using function: 32regs_prefetch (72.800 MB/sec)
atomic64 test passed
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Mirage Jr GSC Builtin Graphics at 0xf8000000 [1] { 10, 0x0, 0x012, 0x00085 }
2. Mirage Jr Core BA at 0xf0100000 [2] { 11, 0x0, 0x028, 0x00081 }
3. Mirage Jr Core SCSI at 0xf0106000 [2/0/1] { 10, 0x0, 0x028, 0x00082 }
4. Mirage Jr Core LAN (802.3) at 0xf0107000 [2/0/2] { 10, 0x0, 0x028, 0x0008a }
5. Mirage Jr Core RS-232 at 0xf0105000 [2/0/4] { 10, 0x0, 0x028, 0x0008c }
6. Mirage Jr Core Centronics at 0xf0102000 [2/0/6] { 10, 0x0, 0x028, 0x00074 }
7. Mirage Jr Audio at 0xf0104000 [2/0/8] { 10, 0x0, 0x028, 0x0007b }
8. Mirage Jr Core PC Floppy at 0xf010a000 [2/0/10] { 10, 0x0, 0x028, 0x00083 }
9. Mirage Jr Core PS/2 Port at 0xf0108000 [2/0/11] { 10, 0x0, 0x028, 0x00084 }
10. Mirage Jr Core PS/2 Port at 0xf0108100 [2/0/12] { 10, 0x0, 0x028, 0x00084 }
11. Mirage Jr Wax EISA BA at 0xfc000000 [4] { 11, 0x0, 0x028, 0x00090 }
12. Mirage Jr Wax BA at 0xf0200000 [5] { 11, 0x0, 0x012, 0x0008e }
13. Mirage Jr Wax HIL at 0xf0201000 [5/0/1] { 10, 0x0, 0x012, 0x00073 }
14. Mirage Jr Wax RS-232 at 0xf0202000 [5/0/2] { 10, 0x0, 0x012, 0x0008c }
15. Mirage Jr (715/64) at 0xfffbe000 [8] { 0, 0x0, 0x60a, 0x00004 }
16. Memory at 0xfffbf000 [9] { 1, 0x0, 0x04a, 0x00009 }
CPU(s): 1 x PA7100LC (PCX-L) at 64.000000 MHz
Setting cache flush threshold to e0 (1 CPUs online)
Lasi version 0 at 0xf0100000 found.
LED display at f00e0000 registered
wax at 0xf0200000 found.
Wax EISA Adapter found at 0xfc000000
Enumerating EISA bus
EISA: Probing bus 0 at 4
EISA: Mainboard HWPC000 detected.
EISA: Detected 0 cards.
powersw: Gecko-style soft power switch enabled.
bio: create slab <bio-0> at 0
raid6: int32x1     26 MB/s
raid6: int32x2     29 MB/s
raid6: int32x4     33 MB/s
raid6: int32x8     21 MB/s
raid6: using algorithm int32x4 (33 MB/s)
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Switching to clocksource cr16
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 5, 163840 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP: reno registered
UDP hash table entries: 128 (order: 0, 6144 bytes)
UDP-Lite hash table entries: 128 (order: 0, 6144 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Chassis warnings not supported.
Initializing RT-Tester: OK
====[ backtrace testing ]===========
Testing a backtrace from process context.
The following trace is a kernel self test and not a bug!
Backtrace:
 [<10119d14>] dump_stack+0x1c/0x2c
 [<1017d4ec>] backtrace_regression_test+0x44/0x124
 [<10117f48>] do_one_initcall+0x258/0x2b8
 [<1078a208>] kernel_init+0x184/0x214
 [<1010405c>] ret_from_kernel_thread+0x1c/0x24

Testing a backtrace from irq context.
The following trace is a kernel self test and not a bug!
Backtrace:
 [<10119d14>] dump_stack+0x1c/0x2c
 [<1017d488>] backtrace_test_irq_callback+0x18/0x38
 [<101399d0>] tasklet_action+0x78/0xdc
 [<10139f64>] __do_softirq+0x130/0x17c
 [<1013a020>] run_ksoftirqd+0x70/0x124
 [<10151484>] kthread+0xac/0xb4
 [<1010405c>] ret_from_kernel_thread+0x1c/0x24

Testing a saved backtrace.
The following trace is a kernel self test and not a bug!
 [<10123624>] save_stack_trace+0x28/0x60
 [<1017d598>] backtrace_regression_test+0xf0/0x124
 [<10117f48>] do_one_initcall+0x258/0x2b8
 [<1078a208>] kernel_init+0x184/0x214
 [<1010405c>] ret_from_kernel_thread+0x1c/0x24
 [<ffffffff>] 0xffffffff
====[ end of backtrace testing ]====
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
msgmni has been set to 302
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
start plist test
end plist test
EISA EEPROM at 0x00810400
PDC Stable Storage facility v0.30
STI GSC/PCI core graphics driver Version 0.9a
    id 2b4ded6d-40a00499, conforms to spec rev. 8.04
    graphics card name: HPA208LC1024
sticon: Initializing STI text console.
Console: switching to colour STI console 128x48
Console: switching to colour frame buffer device 128x48
fb0: stifb 1024x768-8 frame buffer device, HPA208LC1024, id: 2b4ded6d, mmio: 0xf8100000
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
2:0:4: ttyS0 at MMIO 0xf0105800 (irq = 18) is a 16550A
console [ttyS0] enabled, bootconsole disabled
console [ttyS0] enabled, bootconsole disabled
5:0:2: ttyS1 at MMIO 0xf0202800 (irq = 25) is a 16550A
Linux agpgart interface v0.103
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 19 [PCSPP,TRISTATE]
parport0: fix this legacy no-device port driver!
brd: module loaded
loop: module loaded
Uniform Multi-Platform E-IDE driver
ide-gd driver 1.18
ide-cd driver 5.00
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2 
scsi0 : LASI SCSI 53c700
scsi 0:0:6:0: Direct-Access     QUANTUM  FIREBALL_TM3200S 300X PQ: 0 ANSI: 2
scsi target0:0:6: Beginning Domain Validation
scsi 0:0:6:0: Enabling Tag Command Queuing
scsi target0:0:6: asynchronous
scsi target0:0:6: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 8)
scsi target0:0:6: Domain Validation skipping write tests
scsi target0:0:6: Ending Domain Validation
st: Version 20101219, fixed bufsize 32768, s/g segs 256
sd 0:0:6:0: Attached scsi generic sg0 type 0
sd 0:0:6:0: [sda] 6281856 512-byte logical blocks: (3.21 GB/2.99 GiB)
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xf0107000, IRQ 17
eth0: 82596 at 0xf0107000, 08:00:09:c2:9e:60 IRQ 17.
sd 0:0:6:0: [sda] Write Protect is off
sd 0:0:6:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
uhci_hcd: USB Universal Host Controller Interface driver
serio: gsc-ps2-keyboard port at 0x0081a000 irq 22 @ 2:0:11
serio: gsc-ps2-mouse port at 0x0081c100 irq 22 @ 2:0:12
mousedev: PS/2 mouse device common for all mice
rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
md: raid10 personality registered for level 10
md: raid6 personality registered for level 6
md: raid5 personality registered for level 5
md: raid4 personality registered for level 4
device-mapper: uevent: version 1.0.3
 sda: sda1 sda2 sda3 < sda5 sda6 >
device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) initialised: dm-devel@redhat.com
sd 0:0:6:0: [sda] Attached SCSI disk
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
oprofile: using timer interrupt.
TCP: cubic registered
NET: Registered protocol family 17
rtc-generic rtc-generic: setting system clock to 1970-01-04 01:59:05 UTC (266345)
Sending BOOTP requests . OK
IP-Config: Got BOOTP answer from 192.168.178.50, my address is 192.168.178.64
IP-Config: Complete:
     device=eth0, addr=192.168.178.64, mask=255.255.255.0, gw=192.168.178.1
     host=pa64, domain=box, nis-domain=(none)
     bootserver=192.168.178.50, rootserver=192.168.178.50, rootpath=
md: Waiting for all devices to be available before autodetect
md: If you don't use raid, use raid=noautodetect
md: Autodetecting RAID arrays.
md: Scanned 0 and added 0 devices.
md: autorun ...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sda5): mounted filesystem with writeback data mode
VFS: Mounted root (ext3 filesystem) readonly on device 8:5.
Freeing unused kernel memory: 320k freed
      _______________________________                                                                                                                                                                                                        
     < Your System ate a SPARC! Gah! >                                                                                                                                                                                                       
      -------------------------------                                                                                                                                                                                                        
             \   ^__^                                                                                                                                                                                                                        
                 (__)\       )\/\                                                                                                                                                                                                            
                  U  ||----w |                                                                                                                                                                                                               
                     ||     ||                                                                                                                                                                                                               
swapper (pid 1): Illegal instruction (code 8)                                                                                                                                                                                                
                                                                                                                                                                                                                                             
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                                                                                                                                                                                        
PSW: 00000000000000000000000000000000 Not tainted                                                                                                                                                                                            
r00-03  00000000 00000001 101bc460 19c246c0                                                                                                                                                                                                  
r04-07  00000017 19e6a5f8 19c22db8 ffeffff1                                                                                                                                                                                                  
r08-11  0f2ff000 0f000000 00000033 fff00ff1                                                                                                                                                                                                  
r12-15  00000000 00000017 00000001 00000000                                                                                                                                                                                                  
r16-19  00000000 00000043 00000000 107e9a80                                                                                                                                                                                                  
r20-23  19c245c8 10957000 00000001 00000001                                                                                                                                                                                                  
r24-27  00000000 00000000 0000fa80 106e2020                                                                                                                                                                                                  
r28-31  0f2ff000 000094b9 19c24740 00009271                                                                                                                                                                                                  
sr00-03  00000000 00000001 00000000 00000000                                                                                                                                                                                                 
sr04-07  00000000 00000000 00000000 00000000                                                                                                                                                                                                 
                                                                                                                                                                                                                                             
IASQ: 00000000 00000000 IAOQ: 10101110 10101114                                                                                                                                                                                              
 IIR: 078112a0    ISR: 00000000  IOR: 0f2ff000                                                                                                                                                                                               
 CPU:        0   CR30: 19c24000 CR31: f00effff                                                                                                                                                                                               
 ORIG_R28: 19e84ffc                                                                                                                                                                                                                          
 IAOQ[0]: flush_dcache_page_asm+0x28/0x7c                                                                                                                                                                                                    
 IAOQ[1]: flush_dcache_page_asm+0x2c/0x7c                                                                                                                                                                                                    
 RP(r2): __get_user_pages+0x38c/0x3c4                                                                                                                                                                                                        
Backtrace:                                                                                                                                                                                                                                   
 [<101bc460>] __get_user_pages+0x38c/0x3c4                                                                                                                                                                                                   
 [<101bc580>] get_user_pages+0x50/0x60                                                                                                                                                                                                       
 [<101e1a1c>] get_arg_page+0x64/0xe8                                                                                                                                                                                                         
 [<101e1bac>] copy_strings+0x10c/0x248                                                                                                                                                                                                       
 [<101e1d10>] copy_strings_kernel+0x28/0x44                                                                                                                                                                                                  
 [<101e360c>] do_execve+0x2a0/0x36c                                                                                                                                                                                                          
 [<10120598>] sys_execve+0x44/0x7c                                                                                                                                                                                                           
 [<10104084>] __execve+0x20/0x34                                                                                                                                                                                                             
 [<10133d2c>] vprintk+0x1d8/0x4f4                                                                                                                                                                                                            
 [<10134078>] printk+0x30/0x40                                                                                                                                                                                                               
 [<10118550>] free_initmem+0x154/0x184                                                                                                                                                                                                       
 [<10117cbc>] init_post+0xa0/0xd4                                                                                                                                                                                                            
 [<1078a294>] kernel_init+0x210/0x214                                                                                                                                                                                                        
                                                                                                                                                                                                                                             
Backtrace:                                                                                                                                                                                                                                   
 [<10119d14>] dump_stack+0x1c/0x2c                                                                                                                                                                                                           
 [<1011a290>] die_if_kernel+0xc0/0x1c0                                                                                                                                                                                                       
 [<1011a988>] handle_interruption+0x324/0x6c4                                                                                                                                                                                                
 [<10105078>] intr_check_sig+0x0/0x34                                                                                                                                                                                                        
 [<101d78e0>] mem_cgroup_charge_common+0x50/0x6c                                                                                                                                                                                             
                                                                                                                                                                                                                                             
---[ end trace 47c58df5faf7bacb ]---                                                                                                                                                                                                         
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000bCommand line for kernel: 'HOME=/ root=/dev/sda5 pa64root=sda5 ip=bootp panic_timeout=60 console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux'

--------------070101010100020709070002
Content-Type: text/plain;
 name="b160L.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="b160L.log"

Command line for kernel: 'HOME=/ root=/dev/sda5 pa64root=sda5 ip=bootp panic_timeout=60 console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 32-bit kernelELF32 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 6549504 mediaptr 0x1000
Segment 1 load 00788000 size 176308 mediaptr 0x640000
Segment 2 load 007b4000 size 144916 mediaptr 0x66c000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Initializing cgroup subsys cpuset
Initializing cgroup subsys cpu
Linux version 3.4.0-rc7-32bit+ (deller@p100) (gcc version 4.6.4 20120514 (prerelease) (GCC) ) #1 Mon May 14 23:10:09 CEST 2012
unwind_init: start = 0x10690000, end = 0x106d5190, entries = 17689
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005020 00000481 00000000 02020202 7794d7fe 100000f0 00000004 000000ba 000000ba
vers  00000008
CPUID vers 15 rev 8 (0x000001e8)
capabilities 0x2
model 9000/778/B160L
ic_size 10000 dc_size 10000 it_size 60
DC  base 0x0 stride 0x20 count 0x400 loop 0x2
dc_conf = 0x41402000  alias 4 blk 1 line 2 shift 0
        wt 0 sh 0 cst 1 hv 0
IC  base 0x0 stride 0x20 count 0x400 loop 0x2
ic_conf = 0x41402000  alias 4 blk 1 line 2 shift 0
        wt 0 sh 0 cst 1 hv 0
D-TLB conf: sh 3 page 1 cst 1 aid 0 pad1 0
I-TLB conf: sh 3 page 1 cst 1 aid 0 pad1 0
Total Memory: 128 MB
LED display at f0190001 registered
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
Kernel command line: HOME=/ root=/dev/sda5 pa64root=sda5 ip=bootp panic_timeout=60 console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
allocated 262144 bytes of page_cgroup
please try 'cgroup_disable=memory' option if you don't want memory cgroups
Memory: 122460k/131072k available (4405k kernel code, 8612k reserved, 1968k data, 320k init)
virtual kernel memory layout:
    vmalloc : 0x00810000 - 0x0f000000   ( 231 MB)
    memory  : 0x10000000 - 0x18000000   ( 128 MB)
      .init : 0x10788000 - 0x107d8000   ( 320 kB)
      .data : 0x1054d6c4 - 0x10739770   (1968 kB)
      .text : 0x10100000 - 0x1054d6c4   (4405 kB)
NR_IRQS:96
Console: colour dummy device 128x48
Calibrating delay loop... 106.39 BogoMIPS (lpj=531968)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
Initializing cgroup subsys cpuacct
Initializing cgroup subsys memory
Initializing cgroup subsys devices
Initializing cgroup subsys freezer
Initializing cgroup subsys blkio
xor: measuring software checksum speed
   8regs     :   130.800 MB/sec
   8regs_prefetch:   130.800 MB/sec
   32regs    :   198.400 MB/sec
   32regs_prefetch:   198.400 MB/sec
xor: using function: 32regs_prefetch (198.400 MB/sec)
atomic64 test passed
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Phantom PseudoBC GSC+ Port at 0xffc00000 [8] { 7, 0x0, 0x504, 0x00000 }
2. Dino PCI Bridge at 0xfff80000 [8/0] { 13, 0x3, 0x680, 0x0000a }
3. Merlin+ 132 Dino RS-232 at 0xfff83000 [8/0/63] { 10, 0x0, 0x022, 0x0008c }
4. Merlin 160 Core FW-SCSI at 0xfff8c000 [8/12] { 4, 0x0, 0x03d, 0x00089 }
5. Merlin 160 Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x03d, 0x00081 }, additional addresses: 0xffd0c000 0xffc00000 
6. Merlin 160 Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x03d, 0x0008c }
7. Merlin 160 Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x03d, 0x00082 }
8. Merlin 160 Core LAN (802.3) at 0xffd07000 [8/16/6] { 10, 0x0, 0x03d, 0x0008a }
9. Merlin 160 Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x03d, 0x00074 }, additional addresses: 0xffd01000 0xffd03000 
10. Merlin 160 Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x03d, 0x0007b }
11. Merlin 160 Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x03d, 0x00084 }
12. Merlin 160 Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x03d, 0x00084 }
13. Coral SGC Graphics at 0xfa000000 [8/4] { 10, 0x0, 0x004, 0x00077 }
14. Coral SGC Graphics at 0xf4000000 [8/8] { 10, 0x0, 0x004, 0x00077 }
15. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 0x00085 }, additional addresses: 0xf0011000 
16. Merlin L2 160 (9000/778/B160L) at 0xfffbe000 [62] { 0, 0x0, 0x502, 0x00004 }
17. Memory at 0xfffbf000 [63] { 1, 0x0, 0x067, 0x00009 }
18. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096 }
CPU(s): 1 x PA7300LC (PCX-L2) at 160.000000 MHz
Setting cache flush threshold to 8a0 (1 CPUs online)
Lasi version 0 at 0xffd00000 found.
Dino version 3.1 found at 0xfff80000
Dino: No PCI devices enabled.
dino 8:0: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
powersw: Soft power switch at 0xf0140000 enabled.
bio: create slab <bio-0> at 0
raid6: int32x1     60 MB/s
raid6: int32x2     71 MB/s
raid6: int32x4     85 MB/s
raid6: int32x8     61 MB/s
raid6: using algorithm int32x4 (85 MB/s)
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
TCP: reno registered
UDP hash table entries: 128 (order: 0, 6144 bytes)
UDP-Lite hash table entries: 128 (order: 0, 6144 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Enabling PDC chassis warnings support v0.05
Initializing RT-Tester: OK
====[ backtrace testing ]===========
Testing a backtrace from process context.
The following trace is a kernel self test and not a bug!
Backtrace:
 [<10119d14>] dump_stack+0x1c/0x2c
 [<1017d4ec>] backtrace_regression_test+0x44/0x124
 [<10117f48>] do_one_initcall+0x258/0x2b8
 [<1078a208>] kernel_init+0x184/0x214
 [<1010405c>] ret_from_kernel_thread+0x1c/0x24

Testing a backtrace from irq context.
The following trace is a kernel self test and not a bug!
Backtrace:
 [<10119d14>] dump_stack+0x1c/0x2c
 [<1017d488>] backtrace_test_irq_callback+0x18/0x38
 [<101399d0>] tasklet_action+0x78/0xdc
 [<10139f64>] __do_softirq+0x130/0x17c
 [<1013a020>] run_ksoftirqd+0x70/0x124
 [<10151484>] kthread+0xac/0xb4
 [<1010405c>] ret_from_kernel_thread+0x1c/0x24

Testing a saved backtrace.
The following trace is a kernel self test and not a bug!
 [<10123624>] save_stack_trace+0x28/0x60
 [<1017d598>] backtrace_regression_test+0xf0/0x124
 [<10117f48>] do_one_initcall+0x258/0x2b8
 [<1078a208>] kernel_init+0x184/0x214
 [<1010405c>] ret_from_kernel_thread+0x1c/0x24
 [<ffffffff>] 0xffffffff
====[ end of backtrace testing ]====
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
msgmni has been set to 239
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
start plist test
end plist test
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
fb0: stifb 1280x1024-32 frame buffer device, HPA4071B, id: 2bcb015a, mmio: 0xfa100000
fb1: stifb 1024x768-8 frame buffer device, HPA4450AX1024, id: 2d08c0a7, mmio: 0xf4100000
fb2: stifb 1024x768-8 frame buffer device, INTERNAL_EG_X1024, id: 2d08c0a7, mmio: 0xf8100000
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
8:16:4: ttyS0 at MMIO 0xffd05800 (irq = 16) is a 16550A
console [ttyS0] enabled, bootconsole disabled
console [ttyS0] enabled, bootconsole disabled
8:0:63: ttyS1 at MMIO 0xfff83800 (irq = 22) is a 16550A
Linux agpgart interface v0.103
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
scsi 0:0:6:0: Direct-Access     SEAGATE  ST32171W         HP03 PQ: 0 ANSI: 2
scsi target0:0:6: Beginning Domain Validation
scsi target0:0:6: asynchronous
scsi target0:0:6: wide asynchronous
scsi target0:0:6: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
scsi target0:0:6: Domain Validation skipping write tests
scsi target0:0:6: Ending Domain Validation
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
scsi 1:0:1:0: CD-ROM            PHILIPS  PCA80SC          V3-0 PQ: 0 ANSI: 2
scsi target1:0:1: Beginning Domain Validation
scsi target1:0:1: asynchronous
scsi target1:0:1: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 8)
scsi target1:0:1: Domain Validation skipping write tests
scsi target1:0:1: Ending Domain Validation
st: Version 20101219, fixed bufsize 32768, s/g segs 256
sd 0:0:6:0: [sda] 4194685 512-byte logical blocks: (2.14 GB/2.00 GiB)
sd 0:0:6:0: [sda] Write Protect is off
sr0: scsi-1 drive
cdrom: Uniform CD-ROM driver Revision: 3.20
sd 0:0:6:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
sd 0:0:6:0: Attached scsi generic sg0 type 0
sr 1:0:1:0: Attached scsi generic sg1 type 5
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xffd07000, IRQ 18
eth0: 82596 at 0xffd07000, 08:00:09:ef:34:f5 IRQ 18.
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
uhci_hcd: USB Universal Host Controller Interface driver
serio: gsc-ps2-keyboard port at 0x0081a000 irq 21 @ 8:16:7
serio: gsc-ps2-mouse port at 0x0081c100 irq 21 @ 8:16:8
 sda: sda1 sda2 sda3 < sda5 sda6 >
mousedev: PS/2 mouse device common for all mice
rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
md: raid10 personality registered for level 10
md: raid6 personality registered for level 6
md: raid5 personality registered for level 5
md: raid4 personality registered for level 4
device-mapper: uevent: version 1.0.3
sd 0:0:6:0: [sda] Attached SCSI disk
device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) initialised: dm-devel@redhat.com
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
oprofile: using timer interrupt.
TCP: cubic registered
NET: Registered protocol family 17
rtc-generic rtc-generic: setting system clock to 1987-04-14 10:58:29 UTC (545396309)
Sending BOOTP requests . OK
IP-Config: Got BOOTP answer from 192.168.178.50, my address is 192.168.178.65
IP-Config: Complete:
     device=eth0, addr=192.168.178.65, mask=255.255.255.0, gw=192.168.178.1
     host=b160, domain=box, nis-domain=(none)
     bootserver=192.168.178.50, rootserver=192.168.178.50, rootpath=
md: Waiting for all devices to be available before autodetect
md: If you don't use raid, use raid=noautodetect
md: Autodetecting RAID arrays.
md: Scanned 0 and added 0 devices.
md: autorun ...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs (sda5): mounted filesystem with writeback data mode
VFS: Mounted root (ext3 filesystem) readonly on device 8:5.
Freeing unused kernel memory: 320k freed
      _______________________________ 
     < Your System ate a SPARC! Gah! >
      ------------------------------- 
             \   ^__^
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
swapper (pid 1): Illegal instruction (code 8)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000000000000000000000000 Not tainted
r00-03  00000000 00000001 101bc460 17c246c0
r04-07  00000017 17eaa5f8 17c22db8 ffeffff1
r08-11  0f2ff000 0f000000 00000033 fff00ff1
r12-15  00000000 00000017 00000001 00000000
r16-19  00000000 00000043 00000000 107e8a80
r20-23  17c245c8 108fc000 00000001 00000001
r24-27  00000000 00000000 0000fa80 106e2020
r28-31  0f2ff000 000074ee 17c24740 000072e6
sr00-03  00000000 00000001 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10101110 10101114
 IIR: 078112a0    ISR: 00000000  IOR: 0f2ff000
 CPU:        0   CR30: 17c24000 CR31: f0102978
 ORIG_R28: 17ec4ffc
 IAOQ[0]: flush_dcache_page_asm+0x28/0x7c
 IAOQ[1]: flush_dcache_page_asm+0x2c/0x7c
 RP(r2): __get_user_pages+0x38c/0x3c4
Backtrace:
 [<101bc460>] __get_user_pages+0x38c/0x3c4
 [<101bc580>] get_user_pages+0x50/0x60
 [<101e1a1c>] get_arg_page+0x64/0xe8
 [<101e1bac>] copy_strings+0x10c/0x248
 [<101e1d10>] copy_strings_kernel+0x28/0x44
 [<101e360c>] do_execve+0x2a0/0x36c
 [<10120598>] sys_execve+0x44/0x7c
 [<10104084>] __execve+0x20/0x34
 [<10133d2c>] vprintk+0x1d8/0x4f4
 [<10134078>] printk+0x30/0x40
 [<10118550>] free_initmem+0x154/0x184
 [<10117cbc>] init_post+0xa0/0xd4
 [<1078a294>] kernel_init+0x210/0x214

Backtrace:
 [<10119d14>] dump_stack+0x1c/0x2c
 [<1011a290>] die_if_kernel+0xc0/0x1c0
 [<1011a988>] handle_interruption+0x324/0x6c4
 [<10105078>] intr_check_sig+0x0/0x34
 [<101d78e0>] mem_cgroup_charge_common+0x50/0x6c
 [<101bc440>] __get_user_pages+0x36c/0x3c4
 [<101bc580>] get_user_pages+0x50/0x60
 [<101e1a1c>] get_arg_page+0x64/0xe8
 [<101e1bac>] copy_strings+0x10c/0x248
 [<101e1d10>] copy_strings_kernel+0x28/0x44
 [<101e360c>] do_execve+0x2a0/0x36c
 [<10120598>] sys_execve+0x44/0x7c
 [<10104084>] __execve+0x20/0x34
 [<10133d2c>] vprintk+0x1d8/0x4f4
 [<10134078>] printk+0x30/0x40
 [<10118550>] free_initmem+0x154/0x184

---[ end trace 3da5cee95bb8512d ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b


--------------070101010100020709070002
Content-Type: text/plain;
 name="c3000.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="c3000.log"

Command line for kernel: 'HOME=/ root=/dev/sda3 pa64root=sda5 ip=bootp panic_timeout=60 console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... 
This box can boot either 32 or 64-bit kernels...Only see a 32-bit kernel, using thatELF32 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 6549504 mediaptr 0x1000
Segment 1 load 00788000 size 176308 mediaptr 0x640000
Segment 2 load 007b4000 size 144916 mediaptr 0x66c000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Initializing cgroup subsys cpuset
Initializing cgroup subsys cpu
Linux version 3.4.0-rc7-32bit+ (deller@p100) (gcc version 4.6.4 20120514 (prerelease) (GCC) ) #1 Mon May 14 23:10:09 CEST 2012
unwind_init: start = 0x10690000, end = 0x106d5190, entries = 17689
FP[0] enabled: Rev 1 Model 19
The 32-bit Kernel has started...
bootconsole [ttyB0] enabled
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005dc0 00000481 00000000 00000002 777c3e84 100000f0 00000008 000000b2 000000b2
vers  00000301
CPUID vers 19 rev 11 (0x0000026b)
capabilities 0x7
model 9000/785/C3700
ic_size c0000 dc_size 180000 it_size f0
DC  base 0x0 stride 0x40 count 0x6000 loop 0x1
dc_conf = 0xb1802000  alias 11 blk 1 line 4 shift 0
        wt 0 sh 0 cst 1 hv 0
IC  base 0x20000 stride 0x40 count 0xc00 loop 0x1
ic_conf = 0x91802000  alias 9 blk 1 line 4 shift 0
        wt 0 sh 0 cst 1 hv 0
D-TLB conf: sh 3 page 1 cst 1 aid 0 pad1 0
I-TLB conf: sh 3 page 1 cst 1 aid 3 pad1 0
Total Memory: 2048 MB
LCD display at f05d0008,f05d0000 registered
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 520192
Kernel command line: HOME=/ root=/dev/sda3 pa64root=sda5 ip=bootp panic_timeout=60 console=ttyS0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 4096 (order: 2, 16384 bytes)
Dentry cache hash table entries: 262144 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 131072 (order: 7, 524288 bytes)
allocated 4194304 bytes of page_cgroup
please try 'cgroup_disable=memory' option if you don't want memory cgroups
Memory: 2065892k/2097152k available (4405k kernel code, 31260k reserved, 1968k data, 320k init)
virtual kernel memory layout:
    vmalloc : 0x00008000 - 0x0f000000   ( 239 MB)
    memory  : 0x10000000 - 0x90000000   (2048 MB)
      .init : 0x10788000 - 0x107d8000   ( 320 kB)
      .data : 0x1054d6c4 - 0x10739770   (1968 kB)
      .text : 0x10100000 - 0x1054d6c4   (4405 kB)
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
   8regs     :  1749.200 MB/sec
   8regs_prefetch:  1727.600 MB/sec
   32regs    :  1446.400 MB/sec
   32regs_prefetch:  1436.800 MB/sec
xor: using function: 8regs (1749.200 MB/sec)
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
Setting cache flush threshold to 8a0 (1 CPUs online)
SBA found Astro 2.1 at 0xfed00000
Elroy version TR4.0 (0x5) found at 0xfed30000
LBA 10:0: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0x1fff]
pci_bus 0000:00: root bus resource [mem 0xf2000000-0xf23fffff]
PCI: Enabled native mode for NS87415 (pif=0x8f)
Elroy version TR4.0 (0x5) found at 0xfed32000
LBA 10:1: PCI host bridge to bus 0000:01
pci_bus 0000:01: root bus resource [io  0x12000-0x13fff] (bus address [0x2000-0x3fff])
pci_bus 0000:01: root bus resource [mem 0xf6000000-0xf6ffffff]
pci_bus 0000:01: root bus resource [mem 0xf2400000-0xf27fffff]
pci 0000:01:04.0: no compatible bridge window for [mem 0xf6000000-0xf7ffffff]
iosapic: no IRTE for 0000:01:04.0 (IRQ not connected?)
pci 0000:01:05.0: no compatible bridge window for [mem 0xf8000000-0xf8ffffff pref]
iosapic: no IRTE for 0000:01:05.0 (IRQ not connected?)
pci 0000:01:06.0: PCI bridge to [bus 02-ff]
pci 0000:01:06.0: can't handle 64-bit address space for bridge
pci 0000:01:06.0: no compatible bridge window for [??? 0x00000000 flags 0x0]
pci 0000:01:06.0: no compatible bridge window for [mem 0xf9000000-0xfbffffff]
pci 0000:01:06.0: no compatible bridge window for [??? 0x00000000 flags 0x0]
pci 0000:01:06.0: no compatible bridge window for [??? 0x00000000 flags 0x0]
pci 0000:01:06.0: device not available (can't reserve [mem 0xf9000000-0xfbffffff])
pci 0000:01:06.0: Error enabling bridge (-22), continuing
Elroy version TR4.0 (0x5) found at 0xfed38000
LBA 10:4: PCI host bridge to bus 0000:03
pci_bus 0000:03: root bus resource [io  0x28000-0x29fff] (bus address [0x8000-0x9fff])
pci_bus 0000:03: root bus resource [mem 0xf3000000-0xf33fffff]
Elroy version TR4.0 (0x5) found at 0xfed3c000
LBA 10:6: PCI host bridge to bus 0000:04
pci_bus 0000:04: root bus resource [io  0x3c000-0x3dfff] (bus address [0xc000-0xdfff])
pci_bus 0000:04: root bus resource [mem 0xf4000000-0xf5ffffff]
pci_bus 0000:04: root bus resource [mem 0xf3800000-0xf3bfffff]
iosapic: hpa not registered for 0000:04:02.0
powersw: Soft power switch at 0xf0400804 enabled.
bio: create slab <bio-0> at 0
raid6: int32x1    393 MB/s
raid6: int32x2    481 MB/s
raid6: int32x4    524 MB/s
raid6: int32x8    477 MB/s
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
 [<10119d14>] dump_stack+0x1c/0x2c
 [<1017d4ec>] backtrace_regression_test+0x44/0x124
 [<10117f48>] do_one_initcall+0x258/0x2b8
 [<1078a208>] kernel_init+0x184/0x214
 [<1010405c>] ret_from_kernel_thread+0x1c/0x24

Testing a backtrace from irq context.
The following trace is a kernel self test and not a bug!
Backtrace:
 [<10119d14>] dump_stack+0x1c/0x2c
 [<1017d488>] backtrace_test_irq_callback+0x18/0x38
 [<101399d0>] tasklet_action+0x78/0xdc
 [<10139f64>] __do_softirq+0x130/0x17c
 [<1013a020>] run_ksoftirqd+0x70/0x124
 [<10151484>] kthread+0xac/0xb4
 [<1010405c>] ret_from_kernel_thread+0x1c/0x24

Testing a saved backtrace.
The following trace is a kernel self test and not a bug!
 [<10123624>] save_stack_trace+0x28/0x60
 [<1017d598>] backtrace_regression_test+0xf0/0x124
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
sti 0000:01:04.0: device not available (can't reserve [mem 0xf6000000-0xf7ffffff])
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
net eth0: Digital DS21142/43 Tulip rev 65 at Port 0x1000, 00:30:6e:48:aa:64, IRQ 65
tulip1: EEPROM default media type Autosense
tulip1: Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block
tulip1: Index #1 - Media 10base2 (#1) described by a 21142 Serial PHY (2) block
tulip1: Index #2 - Media AUI (#2) described by a 21142 Serial PHY (2) block
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101
sd 1:0:5:0: [sda] 17773524 512-byte logical blocks: (9.10 GB/8.47 GiB)
sd 1:0:6:0: [sdb] 71132960 512-byte logical blocks: (36.4 GB/33.9 GiB)
sd 1:0:5:0: [sda] Write Protect is off
sd 1:0:6:0: [sdb] Write Protect is off
net eth1: Digital DS21142/43 Tulip rev 33 at Port 0x28000, 00:60:b0:7a:12:89, IRQ 71
LASI 82596 driver - Revision: 1.30
sd 1:0:5:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
sd 1:0:6:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA
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
device-mapper: ioctl: 4.22.0-ioctl (2011-10-19) initialised: dm-devel@redhat.com
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
oprofile: using timer interrupt.
TCP: cubic registered
NET: Registered protocol family 17
rtc-generic rtc-generic: setting system clock to 2012-05-14 21:31:39 UTC (1337031099)
Sending BOOTP requests . OK
IP-Config: Got BOOTP answer from 192.168.178.50, my address is 192.168.178.66
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
Freeing unused kernel memory: 320k freed
modprobe: FATAL: Could not load /lib/modules/3.4.0-rc7-32bit+/modules.dep: No such file or directory

INIT: version 2.88 booting

--------------070101010100020709070002--
