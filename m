From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] new gcc-default for hppa
Date: Tue, 14 Jan 2003 07:57:01 +0100
Message-ID: <3DED9A660000572D__15586.0720588409$1416622108$gmane$org@ocpmta3.freegates.net>
References: <20030113193826.GA1938@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: "Randolph Chung" <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: grundler@dsl2.external.hp.com
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030113193826.GA1938@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>On Mon, Jan 13, 2003 at 07:36:03PM +0100, jsoe0708@tiscali.be wrote:
>> Well as mentionned in another mail, I just compile the 2.4.20-pa21 wit=
h
>> this new release and it always compile well, always boot well but also=

>as
>> soon as a network connection is tempted the system still crash.
>> 
>> And ? it just printout Stack Dump: (thousand time) but nothing more??
>> Do I do again something wrong?
>
>probably not. the stack dump is something I sometimes comment out
>since it interfers with the register dump (which is more interesting).
>
Allright...
>
>> never the less, Here I got the pim info:
>> PROCESSOR PIM INFORMATION
>
>> GR2 =3D 0000000010110850
>> Func: inb, Off: 7c, Addr: 0x10110850
>
>> I do not know if it is relevant but HTH (me no :( )
>
>Knowing it's inb() helps a bit. But we really need to know
>who called inb. Unless we get a nice stack unwind, we just
>have to guess based on activity that caused the crash and
>last dmesg output from the console.
>
>Sounds like the networking card you are attempting to
>use isn't enabled properly by the driver.
>Can you remind me which type of machine this is running
>on and which type of NIC you are using?
>
The system on which I test it is a b2k with
...
Searching for devices...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000 [10], versions 0x582, 0x0, 0xb=

2. Elroy PCI Bridge (13) at 0xfed30000 [10/0], versions 0x782, 0x0, 0xa
3. Elroy PCI Bridge (13) at 0xfed32000 [10/1], versions 0x782, 0x0, 0xa
4. Kazoo W+ (0) at 0xfffa0000 [32], versions 0x5d0, 0x0, 0x4
5. Memory (1) at 0xfed10200 [49], versions 0x9d, 0x0, 0x9
CPU(s): 1 x PA8600 (PCX-W+) at 400.000000 MHz
SBA found Astro 2.1 at 0xfed00000
lba version TR4.0 (0x5) found at 0xfed30000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
PCI: Ignoring BAR0-3 of IDE controller 00:0e.0
lba version TR4.0 (0x5) found at 0xfed32000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch enabled, polling @ 0xf0400804.
SuperIO: Found NS87560 Legacy I/O device at 00:0e.1 (IRQ 64) 
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]
Starting kswapd
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
STI GSC/PCI graphics driver version 0.9
STI PCI graphic ROM found at f4940000 (128 kB), fb at fb000000 (16 MB)
STI word mode ROM at f4940044, hpa at fb000000
STI id 35acda16-9a02587, conforms to spec rev. 8.0c
STI device: HPA4982A
stifb: Unsupported gfx card id 0x35acda16
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL=
_PCI
enabled
ttyS00 at port 0x03f8 (irq =3D 99) is a 16550A
ttyS01 at port 0x02f8 (irq =3D 100) is a 16550A
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre12 (Aug 9, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at 0xf00, 00:30:D3:01:5A:3B, IRQ 66.
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) bloc=
k.
tulip_mii_recover: 100 ms
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
tulip1:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth1: Digital DS21143 Tulip rev 65 at 0x12100, 00:30:6E:06:23:D0, IRQ 130=
.
Uniform Multi-Platform E-IDE driver Revision: 7.00beta-2.4
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=3D=
xx
....

No chance, as you can see, the two interfaces are of the same time.
(I also have a b180 but the buildin NIC is also "Digital DS21143 Tulip re=
v
65" :( )

Thanks to your attention,
        Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
