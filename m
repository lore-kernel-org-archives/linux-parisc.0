Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCB29482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Jun 2001 04:44:39 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id ABA88B007; Mon,  4 Jun 2001 11:39:48 +0100 (BST)
Date: Mon, 4 Jun 2001 11:39:48 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: djweis@sjdjweis.com
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Failed boot on D310
Message-ID: <20010604113948.W25745@linuxcare.com>
References: <20010603192902.L25745@linuxcare.com> <Pine.LNX.4.21.0106031741030.18856-100000@oliver.internal.sjdjweis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0106031741030.18856-100000@oliver.internal.sjdjweis.com>; from djweis@sjdjweis.com on Sun, Jun 03, 2001 at 05:44:33PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jun 03, 2001 at 05:44:33PM -0500, djweis@sjdjweis.com wrote:
> 
> On Sun, 3 Jun 2001, Richard Hirst wrote:
> > On Sun, Jun 03, 2001 at 12:41:46PM -0500, djweis@sjdjweis.com wrote:
> > > On Sun, 3 Jun 2001, Richard Hirst wrote:
> > > > On Sun, Jun 03, 2001 at 08:33:23AM -0500, djweis@sjdjweis.com wrote:
> > > > > I've got a D310 with a 100mhz processor and 128 megs of RAM. I tried to
> > > > > boot the ISO version 0.9 last night, but it crashed on boot. I can get the
> > > > > exact error messages, it looked like a register dump. 
> > > > > 
> 
> > Ah, I'd assumed it got as far as starting the kernel and then the
> > kernel crashed.  In this case I think it has failed reading the
> > CD.  Can you read the CD on some other system to check it burned
> > ok?  Are you confident that the CD drive is P5 and is working?
> 
> Okay, I managed to get bootp and tftp set up enough to get an image over
> the wire. It did get into the kernel after a while and here are the boot
> messages:

I've untangled the formatting to make them more readable:

Main Menu: Enter command > boot lan
Interact with IPL (Y or N)?> n                                                 
Booting...
Network Station Address 080009-ae8800                                          
Boot IO Dependent Code (IODC) revision 2                                       

HARD Booted.
palo ipl bame@palinux Fri May 11 16:10:29 MDT 2001
/vmlinux 2622963 bytes @ 0x6800
/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/ram initrd=0/ramdisk cons'0/ramdisk 1678201 bytes @ 0x286df3
Kernel: partition 0 file /vmlinux
Ramdisk: partition 0 file /ramdisk
ELF32 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 1469948 mediaptr 0x1000
Segment 1 load 00268000 size 192312 mediaptr 0x168000
Segment 2 load 00298000 size 221184 mediaptr 0x197000
Segment 3 load 002fa7c8 size 73264 mediaptr 0x1cd7c8
Loading ramdisk 1678201 bytes @ 07e55000...
branching to kernel entry point 0x00100000
Set default PSW W bit to 0
PDC Console Initialized
Linux version 2.4.0-pa10 (root@slab) (gcc version 3.0 20010315 (prerelease)) #11
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...                                              
Determining PDC firmware type: Newer Box
setup_cmdline(0x64cc4,0x64cc4,0x7e55000,0x7feeb79)
PALO command line: 'HOME=/ TERM=linux root=/dev/ram console=ttyS0'
PALO initrd 7e55000-7feeb79
model   00004840 00000481 00000000 00000000 77361cea 100000f0 00000004 000000722
vers    0000000c
CPUID   vers 0 rev 0
model   9000/811/D310
Total Memory: 128 Mb
initrd: 17e55000-17feeb79
pagetable_init
On node 0 totalpages: 32768
zone(0): 32768 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Searching for devices...
Found devices:
1. UL 550 Lasi Core BA (11) at 0xf0100000, versions 0x2f, 0x0, 0x81, 0x0, 0x0,
2. UL 550 Core SCSI (10) at 0xf0106000, versions 0x2f, 0x0, 0x82, 0x0, 0x0
3. UL 350 Core LAN (802.3) (10) at 0xf0107000, versions 0x2f, 0x0, 0x8a, 0x0, 00
4. UL 550 Core Centronics (10) at 0xf0102000, versions 0x2f, 0x0, 0x74, 0x0, 0x
5. UL 550 Core PC Keyboard (10) at 0xf0108000, versions 0x2f, 0x0, 0x84, 0x0, 00
6. UL 550 Core PC Keyboard (10) at 0xf0108100, versions 0x2f, 0x0, 0x84, 0x0, 00
7. UL 550 Core Wax BA (11) at 0xffe00000, versions 0x31, 0x0, 0x8e, 0x0, 0x0
8. UL 550 Wax Core RS-232 (10) at 0xffe02000, versions 0x31, 0x0, 0x8c, 0x0, 0x0
9. UL 550 Wax EISA BA (11) at 0xfc000000, versions 0x31, 0x0, 0x90, 0x0, 0x0,
10. Gecko BOA BC GSC+ Port (7) at 0xfff80000, versions 0x500, 0x0, 0xc, 0x0, 0x0
11. Bluefish Add-on FW-SCSI (4) at 0xfff84000, versions 0x13, 0x1, 0x89, 0x0, 00
12. Unknown device (0) at 0xfffbe000, versions 0x484, 0x0, 0x4, 0x0, 0x81
13. UL Proc L 100 (1) at 0xfffbf000, versions 0x57, 0x0, 0x9, 0x0, 0x0
That's a total of 13 devices.
CPU(s): 1 x PA7100LC (PCX-L) at 100.000000 MHz
Kernel command line: HOME=/ TERM=linux root=/dev/ram console=ttyS0
Calibrating delay loop... 99.73 BogoMIPS
Memory: 125076k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xf0100000 found.
Wax at 0xffe00000 found.
Wax: HIL Keyboard-NMI registered.
Wax EISA bus adapter version 0x5761 at 0xffe00000
Initializing Lasi PS/2-keyboard port at 0xf0108000...
Support for Lasi PS/2-psaux not yet available !
Found i82596 at 0xf0107000, IRQ 87
early initialization of device eth0 is deferred
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 25<4>Lasi PS/2 transmit buffer timeout
Lasi PS/2 transmit buffer timeout
PS/2 transmit buffer timrequest_module[parport_lowlevel]: Root fs not mounted
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
eth0: 82596 at 0xf0107000, 08 00 09 AE 88 00 IRQ 87.
82596.c $Revision: 1.18 $
RAMDISK: Compressed image found at block 0
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI end
ttyS00 at iomem 0xffe02800 (irq = 121) is a 16550A

> There doesn't seem to be linefeeds at the end of the line, I hope it
> wraps correctly.

If you are using minicom, do 'ctrl-Z w' (assuming ctrl-z is the attention
char).  That turns on line wrap, so the output isn't truncated at 80 chars.
Also, 'ctrl-Z l' will let you turn on logging to a file.

> The mac address was read correctly. The ttyS00 line is the last thing to
> be printed.

For reference, my 715/old, which seems to have a similar initialisation
order to your system, continues something like this:

Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI ena bled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
lp0: using parport0 (interrupt-driven).
SCSI subsystem driver Revision: 1.00


I wonder whether the serial driver has done something which killed
the serial port.  My approach would be to set up a cross-compile
environment to build kernels with printk debugging to see where
it actually stops.  Don't know if you fancy doing that though...

Richard
