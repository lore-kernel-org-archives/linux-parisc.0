From: "Paul (NCC/CS)." <pts@bom.gov.au>
Subject: [parisc-linux] almost booted a K420...
Date: Thu, 12 Apr 2007 13:19:03 +1000
Message-ID: <461DA527.8FF91FC1__2951.48098744011$1416624330$gmane$org@bom.gov.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------FA5F61965C3D21BB5BB20A8B"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------FA5F61965C3D21BB5BB20A8B
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Hello,

thought i'd have another go at my HP sitting in the corner,
with the new CD debian-40r0-hppa-netinst.iso .

It seemed to boot the kernel but eventually I got:
>>>
Freeing unused kernel memory: 328k freed

FLT  0000Kernel panic - not syncing: Kernel Fault
>>>

It's a HP9000/869 K420 with PA7200 cpu's.

The debian info seems to suggest this should boot
with a serial console.

Can anyone offer me a direction in which to go to
>from here?

the boot output is attached,

thanks,
chs,
Paul.








--

____________________________________________

Paul
Australian Bureau Of Meteorology
____________________________________________




"In a world without walls and fences,
who needs windows and gates ?"

"Computers are like air conditioners.
Both stop working, if you open windows."






--------------FA5F61965C3D21BB5BB20A8B
Content-Type: text/plain; charset=us-ascii;
 name="hp_boot_output.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="hp_boot_output.txt"

Main Menu: Enter command or menu > boot 10/12/5.2
Interact with IPL (Y or N)?> n

Booting... 
Boot IO Dependent Code (IODC) revision 0


HARD Booted.
palo ipl 1.14 root@duet Sat Apr  8 16:08:16 EDT 2006

Boot image contains:
    0/vmlinux32 4190085 bytes @ 0xd08800
    0/vmlinux64 5796516 bytes @ 0x781000
    0/ramdisk 4468640 bytes @ 0x335000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/ram ramdisk_size=12580' console=ttyB0 TERM=vt
102 palo_kernel=0'0/vmlinux'
Selected kernel: '0/vmlinux from partition 0
Selected ramdisk: /ramdisk from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 32-bit ker
nelELF32 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 2392744 mediaptr 0x1000
Segment 1 load 00349000 size 499712 mediaptr 0x24a000
Segment 2 load 00400000 size 381060 mediaptr 0x2c4000
Loading ramdisk 4468640 bytes @ 3fbac000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.18-4-parisc (Debian 2.6.18.dfsg.1-11) (waldi@debian.org) (gcc v
ersion 4.1.2 20061115 (prerelease) (Debian 4.1.1-21)) #1 Wed Feb 21 07:41:17 MST 
2007
FP[0] enabled: Rev 1 Model 11
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 000058d0 00000491 00000000 00000002 544120d7 100000f1 00000004 0000008a 000
0008a
vers  0000000d
CPUID vers 11 rev 13 (0x0000016d)
model 9000/869/K420
Total Memory: 1152 MB
initrd: 4fbac000-4ffeefa0
initrd: reserving 3fbac000-3ffeefa0 (mem_max 48000000)
Built 1 zonelists.  Total pages: 294912
Kernel command line: root=/dev/ram ramdisk_size=12580' console=ttyB0 TERM=vt102 p
alo_kernel=0'0/vmlinux
PID hash table entries: 4096 (order: 12, 16384 bytes)
start_kernel(): bug: interrupts were enabled early
Console: colour dummy device 160x64
Dentry cache hash table entries: 262144 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 131072 (order: 7, 524288 bytes)
Memory: 1179648k available
Security Framework v1.0.0 initialized
SELinux:  Disabled at boot.
Capability LSM initialized
Mount-cache hash table entries: 512
checking if image is initramfs... it is
Freeing initrd memory: 4363k freed
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0x7, 0x580, 0x0000b }
2. KittyHawk GSY Core BA at 0xffd00000 [10/12] { 11, 0x0, 0x015, 0x00081 }, addit
ional addresses: 0xffd0c000 0xffc00000 
3. KittyHawk GSY Core SCSI at 0xffd06000 [10/12/5] { 10, 0x0, 0x015, 0x00082 }
4. KittyHawk GSY Core LAN (802.3) at 0xffd07000 [10/12/6] { 10, 0x0, 0x015, 0x000
8a }
5. KittyHawk GSY Core Centronics at 0xffd02000 [10/12/0] { 10, 0x0, 0x015, 0x0007
4 }, additional addresses: 0xffd01000 0xffd03000 
6. KittyHawk GSY Core PS/2 Port at 0xffd08000 [10/12/7] { 10, 0x0, 0x015, 0x00084
 }
7. KittyHawk GSY Core PS/2 Port at 0xffd08100 [10/12/8] { 10, 0x0, 0x015, 0x00084
 }
8. KittyHawk GSY Core FW-SCSI at 0xf1800000 [10/0] { 4, 0x1, 0x015, 0x00089 }
9. Gecko BOA BC GSC+ Port at 0xf1804000 [10/4] { 7, 0x0, 0x500, 0x0000c }
10. Eole CAP/MUX at 0xf1900000 [10/4/0] { 5, 0x0, 0x015, 0x0000d }
11. Wizard SCSI at 0xf1904000 [10/4/4] { 4, 0x0, 0x004, 0x0003b }
12. Wizard SCSI at 0xf190c000 [10/4/12] { 4, 0x0, 0x004, 0x0003b }
13. Interphase NIO-100BaseTX at 0xf1910000 [10/4/16] { 4, 0x0, 0x004, 0x00382 }
14. Gecko BOA BC HP-PB Port at 0xf193c000 [10/4/60] { 7, 0x0, 0x103, 0x0000c }
15. U2-IOA BC GSC+ Port at 0xf183f000 [10/63] { 7, 0x1, 0x501, 0x0000c }
16. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0x7, 0x580, 0x0000b }
17. U2-IOA BC GSC+ Port at 0xf103f000 [8/63] { 7, 0x1, 0x501, 0x0000c }
18. ThunderHawk DC3 120 1M (K420) at 0xfffa0000 [32] { 0, 0x0, 0x58d, 0x00004 }
19. ThunderHawk DC3 120 1M (K420) at 0xfffa2000 [34] { 0, 0x0, 0x58d, 0x00004 }
20. ThunderHawk DC3 120 1M (K420) at 0xfffa4000 [36] { 0, 0x0, 0x58d, 0x00004 }
21. ThunderHawk DC3 120 1M (K420) at 0xfffa6000 [38] { 0, 0x0, 0x58d, 0x00004 }
22. Memory at 0xfffb1000 [49] { 1, 0x0, 0x032, 0x00009 }
Enabling regular chassis codes support v0.05
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 34 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 36 failed with error 1
CONFIG_SMP=n  ignoring additional CPUs
CPU: probe of 38 failed with error 1
CPU(s): 1 x PA7200 (PCX-T') at 120.000000 MHz
Setting cache flush threshold to 4a0 (1 CPUs online)
Found U2 at 0xfff8a000
Found U2 at 0xfff88000
Lasi version 0 at 0xffd00000 found.
LED display at ffd0c000 registered
Found GeckoBoa at 0xf1804000
NET: Registered protocol family 2
IP route cache hash table entries: 65536 (order: 6, 262144 bytes)
TCP established hash table entries: 262144 (order: 8, 1048576 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
Enabling PDC chassis warnings support v0.05
unwind_init: start = 0x1034acc0, end = 0x1036f7b0, entries = 9391
audit: initializing netlink socket (disabled)
audit(1062307039.536:1): initialized
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
RAMDISK driver initialized: 16 RAM disks of 12580K size 1024 blocksize
serio: GSC PS/2 keyboard port at 0x00028000 irq 19 @ 10:12:7
serio: GSC PS/2 mouse port at 0x0002a100 irq 19 @ 10:12:8
mice: PS/2 mouse device common for all mice
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
Freeing unused kernel memory: 328k freed

FLT  0000Kernel panic - not syncing: Kernel Fault

--------------FA5F61965C3D21BB5BB20A8B
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------FA5F61965C3D21BB5BB20A8B--
