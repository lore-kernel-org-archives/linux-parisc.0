From: Helge Deller <deller@gmx.de>
Subject: crash in mux_poll on K200/Kittyhawk (was: Hardware-List (fwd))
Date: Tue, 4 Sep 2007 23:44:29 +0200
Message-ID: <200709042344.30215.deller__32414.2569945709$1416624432$gmane$org@gmx.de>
References: <20070828215632.R6291@saddam.controlq.com> <200709042213.25542.deller@gmx.de> <20070904172254.Q31055@saddam.controlq.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: debian-hppa@lists.debian.org
To: rob@controlq.com,
 parisc-linux@lists.parisc-linux.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20070904172254.Q31055@saddam.controlq.com>
Resent-Message-ID: <Cs_fs.A.XxB.gNd3GB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Forwarding to parisc-linux mailing list.....

Can someone with MUX knowledge take a look into this problem ?
Additionally, does someone knows what this device is ?
> 12. unknown device at 0xf190c000 [10/4/12] { 2, 0x0, 0x004, 0x0005f }

Thanks,
Helge

On Tuesday 04 September 2007, Rob Sciuk wrote:
> On Tue, 4 Sep 2007, Helge Deller wrote:
> > On Wednesday 29 August 2007, Rob Sciuk wrote:
> >>> I'm having some difficulties with Debian 4.0R1 on an HP9000 Series
> >>> K200, also experienced similar behaviours with Sarge 3.1R6 and Debian
> >>> 4.0R0, where the install freezes/panics at the point at which it
> >>> states:
> >>>
> >>>   	Freeing unused kernel memory: 328K freed.
> >>>
> >>> The Gentoo 2007.0 release on the otherhand goes on to boot the full
> >>> live cd.  I'd very much like to run Debian, though I am just now
> >>> putting Gentoo on a 712/60, and I might resort to that for the K200.
> >>> Can you help me out here or provide pointers which can get me through
> >>> the boot process ??
> >
> > Hi Rob,
> > could you please post the full boot log (e.g. captured with minicom on serial port) ?
> > Helge
> 
> Full log is attached, captured with cu/tip on FreeBSD

Firmware Version  2.9

Duplex Console IO Dependent Code (IODC) revision 4

------------------------------------------------------------------------------
   (c) Copyright 1990-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------

      0      100  MHz   Active                 Functional          256 KB
      1      100  MHz   Idle                   Functional          256 KB

  Central Bus Speed (in MHz)  :        100  
  Available Memory (bytes)    :  536870912  
  Good Memory Required (bytes):   19648512  


   Primary boot path:    10/0.6   (dec)
   Alternate boot path:  10/12/5.2   (dec)
   Console path:         10/4/0.0   (dec)
   Keyboard path:        10/12/7.0   (dec)

-------
Main Menu: Enter command or menu > boot alt
Booting... 
Boot IO Dependent Code (IODC) revision 0

HARD Booted.
palo ipl 1.14 root@duet Sat Apr  8 16:08:16 EDT 2006
Boot image contains:
    0/vmlinux32 4191629 bytes @ 0x3885800
    0/vmlinux64 5798357 bytes @ 0x32fd800
    0/ramdisk 4466902 bytes @ 0x2eb1800

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/ram ramdisk_size=12579' console=ttyB0 TERM=vt102 palo_kernel=0'0/vmlinux'
Selected kernel: '0/vmlinux from partition 0
Selected ramdisk: /ramdisk from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 32-bit kernelELF32 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 2392744 mediaptr 0x1000
Segment 1 load 00349000 size 499712 mediaptr 0x24a000
Segment 2 load 00400000 size 381062 mediaptr 0x2c4000
Loading ramdisk 4466902 bytes @ 1fbac000...

Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org


Linux version 2.6.18-5-parisc (Debian 2.6.18.dfsg.1-13) (dannf@debian.org) (gcc version 4.1.2 20061115 (prerelease) (Debian 4.1.1-21)) #1 Fri Jun 1 00:54:09 UTC 2007
FP[0] enabled: Rev 1 Model 11
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 000058b0 00000491 00000000 00000002 40696e39 100000f1 00000004 0000008a 0000008a
vers  0000000d
CPUID vers 11 rev 13 (0x0000016d)
model 9000/819/K200
Total Memory: 512 MB
initrd: 2fbac000-2ffee8d6
initrd: reserving 1fbac000-1ffee8d6 (mem_max 20000000)
drivers/parisc/led.c: KittyHawk-Machine (hversion 0x58b) found, LED detection skipped.
LCD display at f0190000,f0190001 registered
Built 1 zonelists.  Total pages: 131072
Kernel command line: root=/dev/ram ramdisk_size=12579' console=ttyB0 TERM=vt102 palo_kernel=0'0/vmlinux
PID hash table entries: 4096 (order: 12, 16384 bytes)
start_kernel(): bug: interrupts were enabled early
Console: colour dummy device 160x64
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 524288k available
Security Framework v1.0.0 initialized
SELinux:  Disabled at boot.
Capability LSM initialized
Mount-cache hash table entries: 512
checking if image is initramfs... it is
Freeing initrd memory: 4362k freed
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0x7, 0x580, 0x0000b }
2. KittyHawk GSY Core BA at 0xffd00000 [10/12] { 11, 0x0, 0x015, 0x00081 }, additional addresses: 0xffd0c000 0xffc00000 
3. KittyHawk GSY Core SCSI at 0xffd06000 [10/12/5] { 10, 0x0, 0x015, 0x00082 }
4. KittyHawk GSY Core LAN (802.3) at 0xffd07000 [10/12/6] { 10, 0x0, 0x015, 0x0008a }
5. KittyHawk GSY Core Centronics at 0xffd02000 [10/12/0] { 10, 0x0, 0x015, 0x00074 }, additional addresses: 0xffd01000 0xffd03000 
6. KittyHawk GSY Core PS/2 Port at 0xffd08000 [10/12/7] { 10, 0x0, 0x015, 0x00084 }
7. KittyHawk GSY Core PS/2 Port at 0xffd08100 [10/12/8] { 10, 0x0, 0x015, 0x00084 }
8. KittyHawk GSY Core FW-SCSI at 0xf1800000 [10/0] { 4, 0x1, 0x015, 0x00089 }
9. Gecko BOA BC GSC+ Port at 0xf1804000 [10/4] { 7, 0x0, 0x500, 0x0000c }
10. Eole CAP/MUX at 0xf1900000 [10/4/0] { 5, 0x0, 0x015, 0x0000d }
11. Wizard SCSI at 0xf1904000 [10/4/4] { 4, 0x0, 0x004, 0x0003b }
12. unknown device at 0xf190c000 [10/4/12] { 2, 0x0, 0x004, 0x0005f }

Helge: ^^^ huh ???

13. Gecko BOA BC HP-PB Port at 0xf193c000 [10/4/60] { 7, 0x0, 0x103, 0x0000c }
14. U2-IOA BC GSC+ Port at 0xf183f000 [10/63] { 7, 0x1, 0x501, 0x0000c }
15. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0x7, 0x580, 0x0000b }
16. U2-IOA BC GSC+ Port at 0xf103f000 [8/63] { 7, 0x1, 0x501, 0x0000c }
17. KittyHawk DC2 100 (K200) at 0xfffa0000 [32] { 0, 0x0, 0x58b, 0x00004 }
18. KittyHawk DC2 100 (K200) at 0xfffa2000 [34] { 0, 0x0, 0x58b, 0x00004 }
19. Memory at 0xfffb1000 [49] { 1, 0x0, 0x053, 0x00009 }
Enabling regular chassis codes support v0.05
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 34 failed with error 1

Helge: ^^^^???

CPU(s): 1 x PA7200 (PCX-T') at 100.000000 MHz
Setting cache flush threshold to 660 (1 CPUs online)
Found U2 at 0xfff8a000
Found U2 at 0xfff88000
Lasi version 0 at 0xffd00000 found.
Found GeckoBoa at 0xf1804000
NET: Registered protocol family 2
IP route cache hash table entries: 16384 (order: 4, 65536 bytes)
TCP established hash table entries: 65536 (order: 6, 262144 bytes)
TCP bind hash table entries: 32768 (order: 5, 131072 bytes)
TCP: Hash tables configured (established 65536 bind 32768)
TCP reno registered
Enabling PDC chassis warnings support v0.05
unwind_init: start = 0x1034acc0, end = 0x1036fa70, entries = 9435
audit: initializing netlink socket (disabled)
audit(1045223588.036:1): initialized
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Initializing Cryptographic API
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
PDC Stable Storage facility v0.30
Soft power switch support not available.
STI GSC/PCI core graphics driver Version 0.9a
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
Serial mux driver (8 ports) Revision: 0.3
ttyB0 at MMIO 0xf1900800 (polled) is a Mux
ttyB1 at MMIO 0xf1900880 (polled) is a Mux
ttyB2 at MMIO 0xf1900900 (polled) is a Mux
ttyB3 at MMIO 0xf1900980 (polled) is a Mux
ttyB4 at MMIO 0xf1900a00 (polled) is a Mux
ttyB5 at MMIO 0xf1900a80 (polled) is a Mux
ttyB6 at MMIO 0xf1900b00 (polled) is a Mux
ttyB7 at MMIO 0xf1900b80 (polled) is a Mux
RAMDISK driver initialized: 16 RAM disks of 12579K size 1024 blocksize
serio: GSC PS/2 keyboard port at 0x00028000 irq 19 @ 10:12:7
serio: GSC PS/2 mouse port at 0x0002a100 irq 19 @ 10:12:8
mice: PS/2 mouse device common for all mice
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
Freeing unused kernel memory: 328k freed

FLT  0000Backtrace:
 [<1012f7ac>] run_timer_softirq+0x124/0x1bc
 [<1012b72c>] __do_softirq+0x58/0xc4
 [<10103f28>] __lock_text_end+0x38/0x48
 [<1010b068>] intr_return+0x0/0xc

Kernel Fault: Code=26 regs=2fd78600 (Addr=00000110)
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  0004ff0f 10370010 1012f7ac 103e7e84
r04-07  0000000d 00000000 00000000 00000000
r08-11  00000000 faf87e40 00000013 00000000
r12-15  00030c4c 00000008 00000007 1013d4e0
r16-19  2fd78240 103810b0 00000002 00000000
r20-23  0000f000 c1b32767 1026b740 3e4cd8aa
r24-27  0000002b 10383300 0000000d 10371010
r28-31  00002000 103d3010 2fd78600 1012f7ac
sr00-03  00000000 00000000 00000000 00000325
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1026ba00 1026ba04
 IIR: 48b50220    ISR: 00000000  IOR: 00000110
 CPU:        0   CR30: 2fd78000 CR31: 10404000
 ORIG_R28: 2fb84200
 IAOQ[0]: mux_poll+0x2c0/0x2d4
 IAOQ[1]: mux_poll+0x2c4/0x2d4
 RP(r2): run_timer_softirq+0x124/0x1bc
Kernel panic - not syncing: Kernel Fault


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
