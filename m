Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflash.com (unknown [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24C56482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Jun 2001 15:59:47 -0600 (MDT)
From: Michael S.Zick <mszick@pflash.com>
To: <djweis@sjdjweis.com>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] D310 boot messages
Date: Mon, 4 Jun 2001 16:45:47 -0500
Content-Type: text/plain
References: <Pine.LNX.4.21.0106041410590.20217-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Message-Id: <01060416591200.00472@wolf01.my.home>
List-ID: <linux-parisc.vger.kernel.org>

Thanks for the feedback -

Your boot ends at the same point mine does -

I suspect that an entry needs to be made in /dev for the ttyB
device and probably a line in /etc/inittab to proc a getty on it -

But I am just guessing - a *nix expert will have to tell us how.

Your message listing tells me a lot - my 9000/720 uses the same
SCSI driver but doesn't work (yet) -

I have in the past (last week) built a working kernel - that used the
STI driver and did not need the "ttyB" hack to by-pass its call to
"register_console" in function "__init con_init of file linux/drivers/cha=
r/console.c

A seemingly related problem is getting my machine's HIL devices recognize=
d -
but the changes I made to fix the crator-on console_init fixed that also =
-
now, if I can only find my notes.

So - I will find how I did that - put it back into this V0.9 kernel, then=
 proceed to
learn why the LASI-Sim700 driver for the 53c7xx doesn't work on my model =
720.

I'll keep the list posted on what, if anything, I can find.

On Mon, 04 Jun 2001, djweis@sjdjweis.com wrote:
> I looked through the kernel source for a while and found the pdc/iodc
> console driver and changed my palo config to use ttyB and got a mostly
> complete boot! Here are the boot messages:
>=20
> Firmware Version  36.34
>=20
> Duplex Console IO Dependent Code (IODC) revision 4
>=20
> -----------------------------------------------------------------------=
-------
>    (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserve=
d
> -----------------------------------------------------------------------=
-------
>=20
>     Speed    Coprocessor State  Cache Size
>   ---------  -----------------  ----------
>    100 MHz   Functional          256 KB
>=20
>   128 MB of memory configured and tested.
>=20
>   Primary boot path:    4.5   (dec)  =20
>   Alternate boot path:  16/5.2   (dec)  =20
>   Console path:         0/0.0   (dec)  =20
>   Keyboard path:        16/7.0   (dec)  =20
>=20
> Processor is booting from first available device.
>=20
> To discontinue, press any key within 10 seconds.
>=20
> Boot terminated.
>=20
>=20
> ------- Main Menu -----------------------------------------------------=
--------
>=20
>         Command                         Description
>         -------                         -----------
>         BOot [PRI|ALT|<path>]           Boot from specified path
>         PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path
>         SEArch [DIsplay|IPL] [<path>]   Search for boot devices
>=20
>         COnfiguration [<command>]       Access Configuration menu/comma=
nds
>         INformation [<command>]         Access Information menu/command=
s
>         SERvice [<command>]             Access Service menu/commands
>=20
>         DIsplay                         Redisplay the current menu
>         HElp [<menu>|<command>]         Display help for menu or comman=
d
>         RESET                           Restart the system
> -------
> Main Menu: Enter command > boot lan
> Interact with IPL (Y or N)?> n
>=20
> Booting...=20
> Network Station Address 080009-ae8800
>=20
> Boot IO Dependent Code (IODC) revision 2
>=20
>=20
> HARD Booted.
> palo ipl 0.91 djweis@djweis.internal.sjdjweis.com Sun Jun  3 21:02:48 C=
DT 2001
> 0/vmlinux 2602334 bytes @ 0x7000
> Kernel: partition 0 file /vmlinux
> ELF32 executable
> Entry 00100000 first 00100000 n 5
> Segment 0 load 00100000 size 1507276 mediaptr 0x1000
> Segment 1 load 00270000 size 181552 mediaptr 0x171000
> Segment 2 load 002a0000 size 221560 mediaptr 0x19e000
> Segment 3 load 002d8000 size 8192 mediaptr 0x1d5000
> Segment 4 load 00305e88 size 75552 mediaptr 0x1d7e88
> branching to kernel entry point 0x00100000
> Set default PSW W bit to 0
> PDC Console Initialized
> Linux version 2.4.0-pa10 (djweis@djweis.internal.sjdjweis.com) (gcc ver=
sion 3.0 20010315 (prerelease)) #9 Mon Jun 4 12:50:30 CDT 2001
> FP[0] enabled: Rev 1 Model 13
> The 32-bit Kernel has started...
> Determining PDC firmware type: Newer Box
> setup_cmdline(0x65328,0x65328,0x0,0x0)
> PALO command line: 'HOME=3D/ TERM=3Dlinux root=3D/dev/nfs nfsroot=3D192=
=2E168.1.10 console=3DttyB'
> PALO initrd 0-0
> model   00004840 00000481 00000000 00000000 77361cea 100000f0 00000004 =
00000072 00000072
> vers    0000000c
> CPUID   vers 0 rev 0
> model   9000/811/D310
> Total Memory: 128 Mb
> initrd: 00000000-00000000
> pagetable_init
> On node 0 totalpages: 32768
> zone(0): 32768 pages.
> zone(1): 0 pages.
> zone(2): 0 pages.
> Searching for devices...
> Found devices:
> 1. UL 550 Lasi Core BA (11) at 0xf0100000, versions 0x2f, 0x0, 0x81, 0x=
0, 0x0,  additional addresses: 0xf010c000 0xf0100000=20
> 2. UL 550 Core SCSI (10) at 0xf0106000, versions 0x2f, 0x0, 0x82, 0x0, =
0x0
> 3. UL 350 Core LAN (802.3) (10) at 0xf0107000, versions 0x2f, 0x0, 0x8a=
, 0x0, 0x0
> 4. UL 550 Core Centronics (10) at 0xf0102000, versions 0x2f, 0x0, 0x74,=
 0x0, 0x0,  additional addresses: 0xf0101000 0xf0103000=20
> 5. UL 550 Core PC Keyboard (10) at 0xf0108000, versions 0x2f, 0x0, 0x84=
, 0x0, 0x0
> 6. UL 550 Core PC Keyboard (10) at 0xf0108100, versions 0x2f, 0x0, 0x84=
, 0x0, 0x0
> 7. UL 550 Core Wax BA (11) at 0xffe00000, versions 0x31, 0x0, 0x8e, 0x0=
, 0x0
> 8. UL 550 Wax Core RS-232 (10) at 0xffe02000, versions 0x31, 0x0, 0x8c,=
 0x0, 0x0
> 9. UL 550 Wax EISA BA (11) at 0xfc000000, versions 0x31, 0x0, 0x90, 0x0=
, 0x0,  additional addresses: 0xf0088000=20
> 10. Gecko BOA BC GSC+ Port (7) at 0xfff80000, versions 0x500, 0x0, 0xc,=
 0x0, 0x0
> 11. Bluefish Add-on FW-SCSI (4) at 0xfff84000, versions 0x13, 0x1, 0x89=
, 0x0, 0x80
> 12. Unknown device (0) at 0xfffbe000, versions 0x484, 0x0, 0x4, 0x0, 0x=
81
> 13. UL Proc L 100 (1) at 0xfffbf000, versions 0x57, 0x0, 0x9, 0x0, 0x0
> That's a total of 13 devices.
> CPU(s): 1 x PA7100LC (PCX-L) at 100.000000 MHz
> Kernel command line: HOME=3D/ TERM=3Dlinux root=3D/dev/nfs nfsroot=3D19=
2.168.1.10 console=3DttyB
> Calibrating delay loop... 99.73 BogoMIPS
> Memory: 126668k available
> Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
> Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
> Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
> Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
> POSIX conformance testing by UNIFIX
> Lasi version 0 at 0xf0100000 found.
> LED display at f010c000 registered
> Wax at 0xffe00000 found.
> Wax: HIL Keyboard-NMI registered.
> Wax EISA bus adapter version 0x5761 at 0xffe00000
> Initializing Lasi PS/2-keyboard port at 0xf0108000...
> Support for Lasi PS/2-psaux not yet available !
> Found i82596 at 0xf0107000, IRQ 87
> early initialization of device eth0 is deferred
> Linux NET4.0 for Linux 2.4
> Based upon Swansea University Computer Society NET3.039
> Starting kswapd v1.8
> pty: 256 U<4>Lasi PS/2 transmit buffer timeout
> Lasi PS/2 transmit buffer timeout
> /2 transmit buffer timlp: driver loaded but no devices found
> RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
> eth0: 82596 at 0xf0107000, 08 00 09 AE 88 00 IRQ 87.
> 82596.c $Revision: 1.18 $
> Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIA=
L_PCI enabled
> Testing ttyS0 (0x0000, 0xffe02800)...
> ttyS00 at iomem 0xffe02800 (irq =3D 121) is a 16550A
> Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
> parport_init_chip: initialize bidirectional-mode.
> parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
> lp0: using parport0 (interrupt-driven).
> SCSI subsystem driver Revision: 1.00
> sim700: Configuring 53c710 (SCSI-ID 7) at f0106100, IRQ 86, options 0
> scsi0: Revision 0x2
> Post test1, istat 01, sstat0 00, dstat 84
> sim700: WARNING IRQ probe failed, (returned 0)
> scsi0: Good, target data areas are dma coherent
> scsi0: test 1 completed ok.
> scsi0 : LASI/Simple 53c7xx
>   Vendor: HP        Model: C1537A            Rev: HP02
>   Type:   Sequential-Access                  ANSI SCSI revision: 02
>   Vendor: TOSHIBA   Model: CD-ROM XM-5401TA  Rev: 1036
>   Type:   CD-ROM                             ANSI SCSI revision: 02
> zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
> ncr53c8xx: 53c720 detected
> ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
> ncr53c720-0: restart (scsi reset).
> scsi1 : ncr53c8xx - version 3.3b
>   Vendor: SEAGATE   Model: ST32550W          Rev: HP10
>   Type:   Direct-Access                      ANSI SCSI revision: 02
>   Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
>   Type:   Direct-Access                      ANSI SCSI revision: 02
>   Vendor: SEAGATE   Model: ST32550W          Rev: HP10
>   Type:   Direct-Access                      ANSI SCSI revision: 02
>   Vendor: SEAGATE   Model: ST34371W          Rev: HPM2
>   Type:   Direct-Access                      ANSI SCSI revision: 02
>   Vendor: SEAGATE   Model: ST34573WC         Rev: HP05
>   Type:   Direct-Access                      ANSI SCSI revision: 02
> ncr53c720-0-<5,0>: tagged command queue depth set to 8
> ncr53c720-0-<8,0>: tagged command queue depth set to 8
> ncr53c720-0-<9,0>: tagged command queue depth set to 8
> ncr53c720-0-<10,0>: tagged command queue depth set to 8
> ncr53c720-0-<11,0>: tagged command queue depth set to 8
> Detected scsi tape st0 at scsi0, channel 0, id 0, lun 0
> st: bufsize 32768, wrt 30720, max init. buffers 4, s/g segs 16.
> Detected scsi disk sda at scsi1, channel 0, id 5, lun 0
> Detected scsi disk sdb at scsi1, channel 0, id 8, lun 0
> Detected scsi disk sdc at scsi1, channel 0, id 9, lun 0
> Detected scsi disk sdd at scsi1, channel 0, id 10, lun 0
> Detected scsi disk sde at scsi1, channel 0, id 11, lun 0
> ncr53c720-0-<5,0>: wide msgout: 1-2-3-1.
> ncr53c720-0-<5,0>: wide msgin: 1-2-3-1.
> ncr53c720-0-<5,0>: wide: wide=3D1 chg=3D0.
> ncr53c720-0-<5,0>: sync_msgout: 1-3-1-19-8.
> ncr53c720-0-<5,0>: sync msgin: 1-3-1-19-8.
> ncr53c720-0-<5,0>: sync: per=3D25 scntl3=3D0x10 ofs=3D8 fak=3D0 chg=3D0=
=2E
> ncr53c720-0-<5,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
> SCSI device sda: 4165272 512-byte hdwr sectors (2133 MB)
> Partition check:
>  sda: unknown partition table
> ncr53c720-0-<8,0>: wide msgout: 1-2-3-1.
> ncr53c720-0-<8,0>: wide msgin: 1-2-3-1.
> ncr53c720-0-<8,0>: wide: wide=3D1 chg=3D0.
> ncr53c720-0-<8,0>: sync_msgout: 1-3-1-19-8.
> ncr53c720-0-<8,0>: sync msgin: 1-3-1-19-8.
> ncr53c720-0-<8,0>: sync: per=3D25 scntl3=3D0x10 ofs=3D8 fak=3D0 chg=3D0=
=2E
> ncr53c720-0-<8,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
> SCSI device sdb: 8388314 512-byte hdwr sectors (4295 MB)
>  sdb: unknown partition table
> ncr53c720-0-<9,0>: wide msgout: 1-2-3-1.
> ncr53c720-0-<9,0>: wide msgin: 1-2-3-1.
> ncr53c720-0-<9,0>: wide: wide=3D1 chg=3D0.
> ncr53c720-0-<9,0>: sync_msgout: 1-3-1-19-8.
> ncr53c720-0-<9,0>: sync msgin: 1-3-1-19-8.
> ncr53c720-0-<9,0>: sync: per=3D25 scntl3=3D0x10 ofs=3D8 fak=3D0 chg=3D0=
=2E
> ncr53c720-0-<9,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
> SCSI device sdc: 4165272 512-byte hdwr sectors (2133 MB)
>  sdc: unknown partition table
> ncr53c720-0-<10,0>: wide msgout: 1-2-3-1.
> ncr53c720-0-<10,0>: wide msgin: 1-2-3-1.
> ncr53c720-0-<10,0>: wide: wide=3D1 chg=3D0.
> ncr53c720-0-<10,0>: sync_msgout: 1-3-1-19-8.
> ncr53c720-0-<10,0>: sync msgin: 1-3-1-19-8.
> ncr53c720-0-<10,0>: sync: per=3D25 scntl3=3D0x10 ofs=3D8 fak=3D0 chg=3D=
0.
> ncr53c720-0-<10,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
> SCSI device sdd: 8388314 512-byte hdwr sectors (4295 MB)
>  sdd: unknown partition table
> ncr53c720-0-<11,0>: wide msgout: 1-2-3-1.
> ncr53c720-0-<11,0>: wide msgin: 1-2-3-1.
> ncr53c720-0-<11,0>: wide: wide=3D1 chg=3D0.
> ncr53c720-0-<11,0>: sync_msgout: 1-3-1-19-8.
> ncr53c720-0-<11,0>: sync msgin: 1-3-1-19-8.
> ncr53c720-0-<11,0>: sync: per=3D25 scntl3=3D0x10 ofs=3D8 fak=3D0 chg=3D=
0.
> ncr53c720-0-<11,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
> SCSI device sde: 8388314 512-byte hdwr sectors (4295 MB)
>  sde: unknown partition table
> Detected scsi CD-ROM sr0 at scsi0, channel 0, id 2, lun 0
> Uniform CD-ROM driver Revision: 3.12
> linear personality registered
> raid0 personality registered
> raid1 personality registered
> raid5 personality registered
> raid5: measuring checksumming speed
>    8regs     :    75.819 MB/sec
>    8regs_prefetch:    75.819 MB/sec
>    32regs    :    88.392 MB/sec
>    32regs_prefetch:    88.392 MB/sec
> raid5: using function: 32regs_prefetch (88.392 MB/sec)
> md driver 0.90.0 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
> md.c: sizeof(mdp_super_t) =3D 4096
> NET4: Linux TCP/IP 1.0 for NET4.0
> IP Protocols: ICMP, UDP, TCP
> IP: routing cache hash table of 512 buckets, 4Kbytes
> TCP: Hash tables configured (established 8192 bind 16384)
> eth0: link ok.
> Sending BOOTP requests.... OK
> IP-Config: Got BOOTP answer from 192.168.1.10, my address is 192.168.1.=
25
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> Looking up port of RPC 100003/2 on 192.168.1.10
> Looking up port of RPC 100005/2 on 192.168.1.10
> VFS: Mounted root (nfs filesystem) readonly.
> Warning: unable to open an initial console.
>=20
> So now, what major and minor should /dev/ttyB have to
> function? /dev/console is 5 1 on my nfsroot.
>=20
> Good job getting it to work this well, especially since it's listed as
> untested! Also, the LCD on the front doesn't seem to do anything. What
> needs to happen for that to work?
>=20
> dave
>=20
>=20
> --=20
> Dave Weis             "I believe there are more instances of the abridg=
ement
> djweis@sjdjweis.com   of the freedom of the people by gradual and silen=
t
>                       encroachments of those in power than by violent=20
>                       and sudden usurpations."- James Madison
>=20
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
