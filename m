Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10D85482A
	for <parisc-linux@parisc-linux.org>; Sun,  3 Jun 2001 16:43:06 -0600 (MDT)
Date: Sun, 3 Jun 2001 17:44:33 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Failed boot on D310
In-Reply-To: <20010603192902.L25745@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0106031741030.18856-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 3 Jun 2001, Richard Hirst wrote:
> On Sun, Jun 03, 2001 at 12:41:46PM -0500, djweis@sjdjweis.com wrote:
> > On Sun, 3 Jun 2001, Richard Hirst wrote:
> > > On Sun, Jun 03, 2001 at 08:33:23AM -0500, djweis@sjdjweis.com wrote:
> > > > I've got a D310 with a 100mhz processor and 128 megs of RAM. I trie=
d to
> > > > boot the ISO version 0.9 last night, but it crashed on boot. I can =
get the
> > > > exact error messages, it looked like a register dump.=20
> > > >=20

> Ah, I'd assumed it got as far as starting the kernel and then the
> kernel crashed.  In this case I think it has failed reading the
> CD.  Can you read the CD on some other system to check it burned
> ok?  Are you confident that the CD drive is P5 and is working?

Okay, I managed to get bootp and tftp set up enough to get an image over
the wire. It did get into the kernel after a while and here are the boot
messages:


Main Menu: Enter command > boot lan                                        =
     Interact with IPL (Y or N)?> n                                        =
                                                                           =
               Booting...                                                  =
                    Network Station Address 080009-ae8800                  =
                                                                           =
                              Boot IO Dependent Code (IODC) revision 2     =
                                                                           =
                                                                           =
                                             HARD Booted.                  =
                                                  palo ipl bame@palinux Fri=
 May 11 16:10:29 MDT 2001                              0/vmlinux 2622963 by=
tes @ 0x6800                                                0/palo-cmdline =
'0/vmlinux HOME=3D/ TERM=3Dlinux root=3D/dev/ram initrd=3D0/ramdisk cons'0/=
ramdisk 1678201 bytes @ 0x286df3                                           =
   Kernel: partition 0 file /vmlinux                                       =
        Ramdisk: partition 0 file /ramdisk                                 =
             ELF32 executable                                              =
                  Entry 00100000 first 00100000 n 4                        =
                       Segment 0 load 00100000 size 1469948 mediaptr 0x1000=
                            Segment 1 load 00268000 size 192312 mediaptr 0x=
168000                           Segment 2 load 00298000 size 221184 mediap=
tr 0x197000                           Segment 3 load 002fa7c8 size 73264 me=
diaptr 0x1cd7c8                            Loading ramdisk 1678201 bytes @ =
07e55000...                                     branching to kernel entry p=
oint 0x00100000                                      Set default PSW W bit =
to 0                                                      PDC Console Initi=
alized                                                         Linux versio=
n 2.4.0-pa10 (root@slab) (gcc version 3.0 20010315 (prerelease)) #11FP[0] e=
nabled: Rev 1 Model 13                                                   Th=
e 32-bit Kernel has started...                                             =
  =20
Determining PDC firmware type: Newer Box                                   =
     setup_cmdline(0x64cc4,0x64cc4,0x7e55000,0x7feeb79)                    =
          PALO command line: 'HOME=3D/ TERM=3Dlinux root=3D/dev/ram console=
=3DttyS0'              PALO initrd 7e55000-7feeb79                         =
                            model   00004840 00000481 00000000 00000000 773=
61cea 100000f0 00000004 000000722vers    0000000c                          =
                                      CPUID   vers 0 rev 0                 =
                                           model   9000/811/D310           =
                                                Total Memory: 128 Mb       =
                                                     initrd: 17e55000-17fee=
b79                                                       pagetable_init   =
                                                               On node 0 to=
talpages: 32768                                                     zone(0)=
: 32768 pages.                                                           zo=
ne(1): 0 pages.                                                            =
   zone(2): 0 pages.                                                       =
        Searching for devices...                                           =
             Found devices:                                                =
                  1. UL 550 Lasi Core BA (11) at 0xf0100000, versions 0x2f,=
 0x0, 0x81, 0x0, 0x0,  2. UL 550 Core SCSI (10) at 0xf0106000, versions 0x2=
f, 0x0, 0x82, 0x0, 0x0      3. UL 350 Core LAN (802.3) (10) at 0xf0107000, =
versions 0x2f, 0x0, 0x8a, 0x0, 004. UL 550 Core Centronics (10) at 0xf01020=
00, versions 0x2f, 0x0, 0x74, 0x0, 0x 5. UL 550 Core PC Keyboard (10) at 0x=
f0108000, versions 0x2f, 0x0, 0x84, 0x0, 006. UL 550 Core PC Keyboard (10) =
at 0xf0108100, versions 0x2f, 0x0, 0x84, 0x0, 007. UL 550 Core Wax BA (11) =
at 0xffe00000, versions 0x31, 0x0, 0x8e, 0x0, 0x0    8. UL 550 Wax Core RS-=
232 (10) at 0xffe02000, versions 0x31, 0x0, 0x8c, 0x0, 0x09. UL 550 Wax EIS=
A BA (11) at 0xfc000000, versions 0x31, 0x0, 0x90, 0x0, 0x0,   10. Gecko BO=
A BC GSC+ Port (7) at 0xfff80000, versions 0x500, 0x0, 0xc, 0x0, 0x011. Blu=
efish Add-on FW-SCSI (4) at 0xfff84000, versions 0x13, 0x1, 0x89, 0x0, 0012=
=2E Unknown device (0) at 0xfffbe000, versions 0x484, 0x0, 0x4, 0x0, 0x81  =
     13. UL Proc L 100 (1) at 0xfffbf000, versions 0x57, 0x0, 0x9, 0x0, 0x0=
          That's a total of 13 devices.                                    =
               CPU(s): 1 x PA7100LC (PCX-L) at 100.000000 MHz              =
                    Kernel command line: HOME=3D/ TERM=3Dlinux root=3D/dev/=
ram console=3DttyS0              Calibrating delay loop... 99.73 BogoMIPS  =
                                      Memory: 125076k available            =
                                           Dentry-cache hash table entries:=
 16384 (order: 5, 131072 bytes)                 Buffer-cache hash table ent=
ries: 4096 (order: 2, 16384 bytes)                   Page-cache hash table =
entries: 32768 (order: 5, 131072 bytes)                   Inode-cache hash =
table entries: 8192 (order: 4, 65536 bytes)                    POSIX confor=
mance testing by UNIFIX                                             Lasi ve=
rsion 0 at 0xf0100000 found.                                             Wa=
x at 0xffe00000 found.                                                     =
   Wax: HIL Keyboard-NMI registered.                                       =
        Wax EISA bus adapter version 0x5761 at 0xffe00000                  =
             Initializing Lasi PS/2-keyboard port at 0xf0108000...         =
                  Support for Lasi PS/2-psaux not yet available !          =
                       Found i82596 at 0xf0107000, IRQ 87                  =
                            early initialization of device eth0 is deferred=
                                 Linux NET4.0 for Linux 2.4                =
                                      Based upon Swansea University Compute=
r Society NET3.039                         Starting kswapd v1.8            =
                                                pty: 25<4>Lasi PS/2 transmi=
t buffer timeout                                     Lasi PS/2 transmit buf=
fer timeout                                                PS/2 transmit bu=
ffer timrequest_module[parport_lowlevel]: Root fs not mounted  lp: driver l=
oaded but no devices found                                          RAMDISK=
 driver initialized: 16 RAM disks of 4096K size 1024 blocksize           et=
h0: 82596 at 0xf0107000, 08 00 09 AE 88 00 IRQ 87.                         =
   82596.c $Revision: 1.18 $                                               =
        RAMDISK: Compressed image found at block 0                         =
             Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_=
IRQ SERIAL_PCI endttyS00 at iomem 0xffe02800 (irq =3D 121) is a 16550A     =
                                                                           =
                             =20


There doesn't seem to be linefeeds at the end of the line, I hope it
wraps correctly.

The mac address was read correctly. The ttyS00 line is the last thing to
be printed.

dave


--=20
Dave Weis             "I believe there are more instances of the abridgemen=
t
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent=20
                      and sudden usurpations."- James Madison
