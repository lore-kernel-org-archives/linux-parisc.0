Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gw.scieneer.com (gw.scieneer.com [203.44.134.129])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F61C482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 May 2001 13:33:20 -0600 (MDT)
Received: from scieneer.com (IDENT:dtc@dtc-pc.scieneer.com [10.0.0.100])
	by gw.scieneer.com (8.11.0/8.8.7) with ESMTP id f4DJXAH00767
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 May 2001 05:33:10 +1000
Sender: dtc@scieneer.com
Message-ID: <3AFEE176.28EBFC7A@scieneer.com>
Date: Mon, 14 May 2001 05:33:10 +1000
From: "Douglas T. Crosher" <dtc@scieneer.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240?
References: <3AFE1F8B.725C1B8B@scieneer.com> <20010513122336.A25045@beavis.ybsoft.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
...
> I have to fess up on this one, since this machine uses both the
> ccio-dma driver and the 32-bit pdc translator :)  I hve been testing
> on a C200 that uses the ccio-dma driver and the 32-bit translator
> also ... but I have not been able to boot the machine with a 64-bit
> kernel yet.  I think it is a problem with the ccio-dma driver, but
> I have been unable to find the error yet.
> 
> Booting the machine with a 32-bit kernel should work fine ... if it
> does not, post the output to the list again we can try to help debug

Below is the output for the 32 bit kernel which proceeds in
a similar manner to the 64 bit kernel and has the same problems.

Regards
Douglas Crosher

-=-=-

HARD Booted.
palo ipl <> Sun May 13 11:53:13 EST 2001
0/vmlinux 2614364 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=10.0.0.100
console=ttyS0'
Kernel: partition 0 file /vmlinux
ELF32 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 1516512 mediaptr 0x1000
Segment 1 load 00274000 size 181808 mediaptr 0x174000
Segment 2 load 002a4000 size 219576 mediaptr 0x1a1000
Segment 3 load 002dc000 size 8192 mediaptr 0x1d7000
Segment 4 load 0030a068 size 75520 mediaptr 0x1d9068
branching to kernel entry point 0x00100000
Set default PSW W bit to 0
PDC Console Initialized
Linux version 2.4.0 () (gcc version 3.0 20010427 (prerelease)) #8 Mon May 14
05:02:36 EST 2001
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: Newer Box
setup_cmdline(0x64cc4,0x64cc4,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=10.0.0.100
console=ttyS0'
PALO initrd 0-0
model   00005b50 00000491 00000000 00000002 77c5684a 100000f0 00000008 000000b2
000000b2
vers    00000501
cpuid   000001d7
CPUID   vers 14 rev 23
model   9000/782/J2240
Total Memory: 96 Mb
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 24576
zone(0): 24576 pages.
zone(1): 0 pages.
zone(2): 0 pages.
led_init: chassis info: model=0 (LCD), lcd_width=16, cmd_delay=40, actcnt=32,
maxcnt=32
led_init: min_cmd_delay = 40 uS
LCD display at f0190000,f0190001 registered
Searching for devices...
Found devices:
1. SummitHawk Dino RS-232 (10) at 0xfc003000, versions 0x5d, 0x0, 0x8c, 0x0, 0x0
2. SummitHawk Dino RS-232 (10) at 0xf1607000, versions 0x5d, 0x0, 0x8c, 0x0, 0x0
3. SummitHawk 230 Core BA (11) at 0xffd00000, versions 0x5c, 0x0, 0x81, 0x0,
0x0,  additional addresses: 0xffd0c000 0xffc00000 
4. SummitHawk 230 Core SCSI (10) at 0xffd06000, versions 0x5c, 0x0, 0x82, 0x0,
0x0
5. SummitHawk 230 Core Centronics (10) at 0xffd02000, versions 0x5c, 0x0, 0x74,
0x0, 0x0,  additional addresses: 0xffd01000 0xffd03000 
6. SummitHawk 230 Core Audio (10) at 0xffd04000, versions 0x5c, 0x4, 0x7b, 0x0,
0x0
7. SummitHawk 230 Core PC Keyboard (10) at 0xffd08000, versions 0x5c, 0x0, 0x84,
0x0, 0x0
8. SummitHawk 230 Core PC Keyboard (10) at 0xffd08100, versions 0x5c, 0x0, 0x84,
0x0, 0x0
9. U2-IOA BC GSC+ Port (7) at 0xfc03f000, versions 0x501, 0x1, 0xc, 0x3, 0x0
10. U2-IOA BC GSC+ Port (7) at 0xf163f000, versions 0x501, 0x1, 0xc, 0x3, 0x0
11. Cujo PCI Bridge (13) at 0xf1604000, versions 0x682, 0x1, 0xa, 0x1, 0x0
12. Dino PCI Bridge (13) at 0xfc004000, versions 0x680, 0x3, 0xa, 0x0, 0x0, 
additional addresses: 0xfc800000 
13. Unknown device (13) at 0xfc000000, versions 0x5d, 0x3, 0xa, 0x0, 0x0
14. U2-IOA BC Runway Port (12) at 0xfff88000, versions 0x580, 0xf, 0xb, 0x1,
0x50
15. U2-IOA BC Runway Port (12) at 0xfff8a000, versions 0x580, 0xf, 0xb, 0x1,
0x50
16. SummitHawk U+ (0) at 0xfffa0000, versions 0x5b5, 0x0, 0x4, 0x0, 0x91
17. SummitHawk U+ (0) at 0xfffa2000, versions 0x5b5, 0x0, 0x4, 0x0, 0x91
18. SummitHawk Memory (1) at 0xfffb1000, versions 0x83, 0x0, 0x9, 0x0, 0x0
That's a total of 18 devices.
CONFIG_SMP=n  ignoring additional CPUs
Warning : device (0, 0x5b5, 0x0, 0x4, 0x0) NOT claimed by CPU PARISC
CPU(s): 1 x PA8200 (PCX-U+) at 236.000000 MHz
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=10.0.0.100
console=ttyS0
Calibrating delay loop... 470.22 BogoMIPS
Memory: 94416k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
Initializing Lasi PS/2-keyboard port at 0xffd08000...
Support for Lasi PS/2-psaux not yet available !
Dino version 3.1 (bridge mode) found at 0xfc004000
Dino version J2240 (bridge mode) found at 0xfc000000
dino_bridge_init: IO_ADDR_EN hasn't been configured.
kernel BUG at dino.c:795!
ccio found U2 I/O MMU at 0xfff88000
io_io_high: 0xfff80000 io_io_low: 0xf4000000
ccio found U2 I/O MMU at 0xfff8a000
io_io_high: 0xf4000000 io_io_low: 0xf1600000
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI
enabled
busdevice_alloc_irq(0x102e0244): No known LASI/ASP/WAX owns device at 0xfc003000
!
IRQ not found for serial device at 0xfc003000
Warning : device (10, 0x5d, 0x0, 0x8c, 0x0) NOT claimed by serial device 715/new
or similiar
busdevice_alloc_irq(0x102e027c): No known LASI/ASP/WAX owns device at 0xf1607000
!
IRQ not found for serial device at 0xf1607000
Warning : device (10, 0x5d, 0x0, 0x8c, 0x0) NOT claimed by serial device 715/new
or similiar

Dumping Stack from 10034000 to 10034a80:
4000 00000000 00000040 00000000 00000000 10289440 00000001 00000000 ffffffff
...
4a60 00000000 00000000 10108c2c 10106744 11111111 00000000 3e743615 25db7828

Kernel Fault: Code=26 regs=10034840 (Addr=00000004)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001110
r0-3     00000000 102e30c0 1010cd98 10297194
r4-7     0000ffff 0000002f 00000000 0000000f
r8-11    00002000 102f8d64 0004000e 102a4674
r12-15   000000f2 000000fa f0140000 00000007
r16-19   f000173c f0000218 f0000210 ffffffff
r20-23   1029c11c 102f59e8 101f1750 ffffffff
r24-27   0000002f 0000ffff 00000000 10274010
r28-31   00000000 0000002f 10034a80 1010cd98
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101f177c 101f1780
 IIR: 0cc81099    ISR: 00000000  IOR: 00000004
ORIG_R28: 55555555
