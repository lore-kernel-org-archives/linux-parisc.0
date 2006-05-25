From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: HPMC in ppa_init()
Date: Thu, 25 May 2006 09:02:50 -0600
Message-ID: <20060525150250.GA6616@colo.lackof.org>
References: <20060525121929.DWFD5348.web2@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 kyjung@datatek.co.kr
To: ?????? <jyson@datatek.co.kr>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060525121929.DWFD5348.web2@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


1) Please _always_ keep the parisc-linux mailing list copied
   on kernel bug reports.

2) Please send email in "text/plain" format.
   I ignored everything you wrote in HTML.

3) Comments that follow are based on the Console output that you included.
   (Thanks - that's what I really needed)

> Backtrace:
>  [<10113644>] inb+0x60/0x7c
>  [<103a15ec>] ppa_init+0x144/0x258
>  [<103a3138>] __ppa_attach+0x1c0/0x340
>  [<102a5810>] parport_register_driver+0x84/0x124
>  [<10568950>] do_initcalls+0x58/0xf8
>  [<10103908>] init+0x44/0x158
>  [<1010bc5c>] ret_from_kernel_thread+0x1c/0x24

You will have to disable SCSI_PPA driver from your config.
It might be easiest to manually remove the driver from
the initrd.img file and from the /lib/modules on the root disk.

I looked at ppa_init() and it looks quite broken for hppa.
The problem is stuff like this:
static int ppa_byte_in(unsigned short base, char *buffer, int len)

"base" needs to be u32 (unsigned int).
parisc-linux needs more than 16 bits to represent an IO port address.
This _could_ work if the parallel port were under PCI Bus 0 _and_
no other garbage is in the top 16 bits of the register.

hth,
grant

On Thu, May 25, 2006 at 09:19:29PM +0900, ?????? wrote:
> <style> p {margin-top:0px;margin-bottom:0px;} </style><table border=3D0 w=
idth=3D100% bgcolor=3D'' cellpadding=3D0 cellspacing=3D0 align=3Dcenter><tr=
><td valign=3Dtop style=3D'padding:8pt;'><font size=3D2><P>Hi,</P>
> <P>.</P>
> <P>Sorry for late cause of my long travel.</P>
> <P>I'm tring to upgrade&nbsp;a kernel&nbsp;to&nbsp;2-6-15&nbsp;using 2-6-=
8 &nbsp;on hppa machine.<BR>There is more log information on the attated fi=
le.</P>
> <P>&nbsp;</P>
> <P>Package : kernel-image-2.6.15</P>
> <P>Base kernel version : 2-6-8</P>
> <P>Addressing : 32bit kernel</P>
> <P>Problem : Boot error</P>
> <P>Console message :</P>
> <P>Kernel panic: not syncing : High priority machine check (HPMC)</P>
> <P>&nbsp;</P>
> <P>Here is the information about HP server.<BR>Machime:&nbsp;HP C200</P>
> <P>CPU:&nbsp;PA8200 (PCX-U+)</P>
> <P>Memory: 256MB</P>
> <P>&nbsp;</P>
> <P>Could you please give me some tips to boot ?</P>
> <P>.</P>
> <P>Warm regards,</P>
> <P>Son</P>
> <P><BR><BR><BR>&nbsp;</P>
> <BLOCKQUOTE style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: =
5px; BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">---------[ ???? ???=
? ???? ]----------<BR><B>???? : </B>Re: kernel compile - HPMC error<BR><B>?=
??? : </B>2006/04/27 22:21<BR><B>?????? : </B>Grant Grundler &lt;grundler@p=
arisc-linux.org&gt;<BR><B>?????? : </B>?????? &lt;jyson@datatek.co.kr&gt;<B=
R><BR>
> <STYLE> p {margin-top:0px;margin-bottom:0px;} </STYLE>
>=20
> <TABLE cellSpacing=3D0 cellPadding=3D0 width=3D"90%" align=3Dcenter borde=
r=3D0>
> <TBODY>
> <TR>
> <TD style=3D"PADDING-RIGHT: 8pt; PADDING-LEFT: 8pt; PADDING-BOTTOM: 8pt; =
PADDING-TOP: 8pt" vAlign=3Dtop><PRE><PRE>Hi,
> I found this in my spam folder...can you please resend this
> as "Plain Text" (no HTML).
>=20
> Secondly, some guidance on how to report parisc-linux kernel bugs=20
> is available here:
> 	http://www.parisc-linux.org/faq/kernelbug-howto.html
>=20
> thanks,
> grant
>=20
> On Fri, Apr 14, 2006 at 10:30:12PM +0900, ?????? wrote:
> &gt; &lt;style&gt; p {margin-top:0px;margin-bottom:0px;} &lt;/style&gt;&l=
t;table border=3D0 width=3D100% bgcolor=3D'' cellpadding=3D0
> cellspacing=3D0 align=3Dcenter&gt;&lt;tr&gt;&lt;td valign=3Dtop style=3D'=
padding:8pt;'&gt;&lt;font size=3D2&gt;&lt;P&gt; &lt;/P&gt;
> &gt; &lt;P&gt;Hi.&lt;/P&gt;
> &gt; &lt;P&gt;&amp;nbsp;&lt;/P&gt;
> &gt; &lt;P&gt;I'm tring to make a kernel booting on hppa-debian linux.&lt=
;/P&gt;
> &gt; &lt;P&gt;I need a vmlinux and It has to be modified for me.&lt;/P&gt;
> &gt; &lt;P&gt;&amp;nbsp;&lt;/P&gt;
> &gt; &lt;P&gt;finally, I gained&amp;nbsp;a vmlinux but It didn't know any=
 hard disk.&lt;/P&gt;
> &gt; &lt;P&gt;I opened the /proc/partitions file, but there were nothing.=
&lt;/P&gt;
> &gt; &lt;P&gt;&amp;nbsp;&lt;/P&gt;
> &gt; &lt;P&gt;somedays after, &lt;/P&gt;
> &gt; &lt;P&gt;I found my machine needs a GSCtoPCI/Dino PCI support option=
 in kernel configuration.&lt;/P&gt;
> &gt; &lt;P&gt;when It&amp;nbsp;was booting the vmlinux knew two hard disk=
=2E yes, I have a two hard disk.&lt;/P&gt;
> &gt; &lt;P&gt;but during boot HPMC error accurred.&lt;/P&gt;
> &gt; &lt;P&gt;&amp;nbsp;&lt;/P&gt;
> &gt; &lt;P&gt;I think they are some mismatch each other between H/W and S=
/W or S/W and S/W or their version. my cpu is PA8200
> (PCX-U+)&lt;/P&gt;
> &gt; &lt;P&gt;How I can check them???&lt;/P&gt;&lt;/font&gt;&lt;/td&gt;&l=
t;/tr&gt;&lt;/table&gt;
> &gt;=20
> </PRE></PRE></FONT></TD></TR></TBODY></TABLE></BLOCKQUOTE></font></td></t=
r></table>

> =00
>=20
>=20
> Firmware Version  5.1
>=20
> Duplex Console IO Dependent Code (IODC) revision 1
>=20
> -------------------------------------------------------------------------=
-----
> =0D   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserv=
ed
> =0D----------------------------------------------------------------------=
--------
>=20
> =0D  Processor   Speed            State           Coprocessor State  I/D =
Cache=20
> =0D  ---------  --------   ---------------------  -----------------  ----=
---------
> =0D      0      200 MHz    Active                 Functional         512 =
KB/1 MB
>=20
> =0D  Central Bus Speed (in MHz) :        120
>=20
> =0D  Available memory (bytes)    : 268435456
> =0D  Good memory required (bytes):          0 (Not Set by OS)
> =0D  Primary boot path:    FWSCSI.6.0
> =0D  Alternate boot path:  0.0
> =0D  Console path:         0.0
> =0D  Keyboard path:        PS2
> =0D
> =0DCPU 0
> =0DWARNING:  Memory configuration is not optimized for performance. Refer
>           to the System Installation or Memory Installation manuals for=
=20
>           memory configuration guidelines.
> WARNING:  Memory SIMMs are not installed in the proper sequence. Refer
>           to the System Installation or Memory Installation manuals for
>           memory configuration guidelines.
>=20
>=20
> =0DSearching for device(s) with bootable media...
> =0DThis may take several minutes.
>=20
> =0DTo discontinue search, press any key (termination may not be immediate=
).
>=20
>=20
> =0D   Path Number        Device Path              Device Type and Utiliti=
es
> =0D   -----------        -----------------        -----------------------=
--
> =0D   P0                 FWSCSI.6.0               SEAGATE ST34572WS      =
=20
> =0D                                               IPL
> =0D   P1                 FWSCSI.5.0               SEAGATE ST19171W       =
=20
> =0D                                               IPL
>=20
>=20
> =0D
> =0DEnter Path Number or Device Path to continue boot sequence.  Enter NO =
to go
> =0Dto main menu.
> =0D> sea
> =0D
> =0DERROR:  Bad argument(s)
> =0D
> =0D
> =0DEnter Path Number or Device Path to continue boot sequence.  Enter NO =
to go
> =0Dto main menu.
> =0D> no
>=20
> =0D------- Main Menu ----------------------------------------------------=
---------
>=20
> =0D        Command                         Description
> =0D        -------                         -----------
> =0D        BOot [PRI|ALT|<path>]           Boot from specified path
> =0D        PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path
> =0D        SEArch [DIsplay|IPL] [<path>]   Search for boot devices
>=20
> =0D        COnfiguration [<command>]       Access Configuration menu/comm=
ands
> =0D        INformation [<command>]         Access Information menu/comman=
ds
> =0D        SERvice [<command>]             Access Service menu/commands
>=20
> =0D        DIsplay                         Redisplay the current menu
> =0D        HElp [<menu>|<command>]         Display help for menu or comma=
nd
> =0D        RESET                           Restart the system
> =0D-------
> =0DMain Menu: Enter command > sea
>=20
> =0DSearching for potential boot device(s)...
> =0DThis may take several minutes.
>=20
> =0DTo discontinue search, press any key (termination may not be immediate=
).
>=20
>=20
> =0D   Path Number        Device Path              Device Type
> =0D   -----------        -----------------        -----------
> =0D   P0                 SESCSI.2.0               SONY    CD-ROM CDU-76S =
=20
> =0D   P1                 FWSCSI.6.0               SEAGATE ST34572WS      =
=20
> =0D   P2                 FWSCSI.5.0               SEAGATE ST19171W       =
=20
>=20
>=20
> =0DMain Menu: Enter command > bo p2
> =0DInteract with IPL (Y, N, Q)?> y
> =0D
> Booting...=20
> Boot IO Dependent Code (IODC) revision 1
>=20
>=20
> HARD Booted.
> palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004
> =0DSkipping extended partition 6 - beyond reach of IPL
> =0D
> =0DPartition Start(MB) End(MB) Id Type
> =0D=0D1               1      31   f0 Palo
> =0D=0D2              32     156   83 ext2
> =0D=0D5             157    5404   83 ext2
> =0D
> =0DPALO(F0) partition contains:
> =0D    0/vmlinux32 4973737 bytes @ 0x48000
>=20
> =0DInformation: No console specified on kernel command line. This is norm=
al.
> =0DPALO will choose the console currently used by firmware (serial).Curre=
nt command line:
> =0D2/vmlinux root=3D/dev/sda5 initrd=3D2/initrd.img HOME=3D/ console=3Dtt=
yS0 TERM=3Dvt102
> =0D 0: 2/vmlinux
> =0D 1: root=3D/dev/sda5
> =0D 2: initrd=3D2/initrd.img
> =0D 3: HOME=3D/
> =0D 4: console=3DttyS0
> =0D 5: TERM=3Dvt102
>=20
> =0D<#>    edit the numbered field
> =0D'b'    boot with this command line
> =0D'r'    restore command line
> =0D'l'    list dir
> =0D? 0
> =0D2/vmlinux_0405_4
> =0DCurrent command line:
> =0D2/vmlinux_0405_4 root=3D/dev/sda5 initrd=3D2/initrd.img HOME=3D/ conso=
le=3DttyS0 TERM=3Dvt102
> =0D 0: 2/vmlinux_0405_4
> =0D 1: root=3D/dev/sda5
> =0D 2: initrd=3D2/initrd.img
> =0D 3: HOME=3D/
> =0D 4: console=3DttyS0
> =0D 5: TERM=3Dvt102
>=20
> =0D<#>    edit the numbered field
> =0D'b'    boot with this command line
> =0D'r'    restore command line
> =0D'l'    list dir
> =0D? 0=08 =08b
>=20
> =0DCommand line for kernel: 'root=3D/dev/sda5 HOME=3D/ console=3DttyS0 TE=
RM=3Dvt102 palo_kernel=3D2/vmlinux_0405_4'
> =0DSelected kernel: /vmlinux_0405_4 from partition 2
> =0DSelected ramdisk: /initrd.img from partition 2
> =0DELF32 executable
> =0DEntry 00100000 first 00100000 n 2
> =0DSegment 0 load 00100000 size 3823404 mediaptr 0x1000
> =0DSegment 1 load 004a6000 size 1151110 mediaptr 0x3a7000
> =0DLoading ramdisk 4972544 bytes @ 0fb30000...
> =0DBranching to kernel entry point 0x00100000.  If this is the last
> =0Dmessage you see, you may need to switch your console.  This is
> =0Da common symptom -- search the FAQ and mailing list at parisc-linux.org
>=20
> =0DLinux version 2.6.15.4 (root@datatek) (gcc version 3.3.5 (Debian 1:3.3=
=2E5-13)) #14 Sat Mar 6 12:46:17 KST 2027
> FP[0] enabled: Rev 0 Model 14
> The 32-bit Kernel has started...
> Initialized PDC Console for debugging.
> Determining PDC firmware type: System Map.
> model 000059d0 00000481 00000000 00000002 77647a2b 100000f0 00000008 0000=
00b2 000000b2
> vers  00000501
> CPUID vers 14 rev 23 (0x000001d7)
> capabilities 0x2
> model 9000/782/C200+
> Total Memory: 256 MB
> initrd: 1fb30000-1ffee000
> initrd: reserving 0fb30000-0ffee000 (mem_max 10000000)
> LED display at f0190001 registered
> Built 1 zonelists
> Kernel command line: root=3D/dev/sda5 HOME=3D/ console=3DttyS0 TERM=3Dvt1=
02 palo_kernel=3D2/vmlinux_0405_4
> PID hash table entries: 2048 (order: 11, 32768 bytes)
> Console: colour dummy device 160x64
> Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
> Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
> Memory: 262144k available
> Mount-cache hash table entries: 512
> checking if image is initramfs...it isn't (bad gzip magic numbers); looks=
 like an initrd
> NET: Registered protocol family 16
> EISA bus registered
> Searching for devices...
> Found devices:
> 1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0xf, 0x580, 0x0000b }
> 2. Dino PCI Bridge at 0xf2000000 [8/0] { 13, 0x3, 0x680, 0x0000a },  addi=
tional addresses: 0xf2800000=20
> 3. Raven U/L2 Dino RS-232 at 0xf2003000 [8/0/63] { 10, 0x0, 0x006, 0x0008=
c }
> 4. Raven+ w SE FWSCSI Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x056, 0x00=
081 },  additional addresses: 0xffd0c000 0xffc00000=20
> 5. Raven+ w SE FWSCSI Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x056=
, 0x0008c }
> 6. Raven+ w SE FWSCSI Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x056, =
0x00082 }
> 7. Raven+ w SE FWSCSI Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0=
x056, 0x00074 },  additional addresses: 0xffd01000 0xffd03000=20
> 8. Raven+ w SE FWSCSI Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x056,=
 0x0007b }
> 9. Raven+ w SE FWSCSI Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x=
056, 0x00084 }
> 10. Raven+ w SE FWSCSI Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0=
x056, 0x00084 }
> 11. U2-IOA BC GSC+ Port at 0xf203f000 [8/63] { 7, 0x1, 0x501, 0x0000c }
> 12. Raven U/L2 Dino PS/2 Port at 0xf2001000 [8/1] { 10, 0x0, 0x006, 0x000=
96 }
> 13. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0xf, 0x580, 0x0000b }
> 14. Coral SGC Graphics at 0xf6000000 [10/12] { 10, 0x0, 0x004, 0x00077 }
> 15. U2-IOA BC GSC+ Port at 0xf103f000 [10/63] { 7, 0x1, 0x501, 0x0000c }
> 16. Cujo PCI Bridge at 0xf1000000 [10/0] { 13, 0x1, 0x682, 0x0000a }
> 17. Dino RS-232 at 0xf1003000 [10/3] { 10, 0x0, 0x007, 0x0008c }
> 18. Raven U 200 (9000/780/C200) at 0xfffa0000 [32] { 0, 0x0, 0x59d, 0x000=
04 }
> 19. Memory at 0xfffb1000 [49] { 1, 0x0, 0x05d, 0x00009 }
> CPU(s): 1 x PA8200 (PCX-U+) at 200.000000 MHz
> Setting cache flush threshold to 2c0 (1 CPUs online)
> Found U2 at 0xfff88000
> Found U2 at 0xfff8a000
> Lasi version 0 at 0xffd00000 found.
> Dino version 3.1 found at 0xf2000000
> Cujo version 2.0 found at 0xf1000000
> Enabling Cujo 2.0 bug workaround
> Cujo: No PCI devices enabled.
> SCSI subsystem initialized
> unwind_init: start =3D 0x104a7af0, end =3D 0x104d86f0, entries =3D 12480
> NTFS driver 2.1.25 [Flags: R/O].
> JFS: nTxBlock =3D 1946, nTxLock =3D 15569
> io scheduler noop registered
> io scheduler deadline registered
> PDC Stable Storage facility v0.09
> Soft power switch enabled, polling @ 0xf0140000.
> STI GSC/PCI core graphics driver Version 0.9a
>     id 2d08c0a7-9a02587, conforms to spec rev. 8.07
>     graphics card name: HPA4450AX1280
> sticon: Initializing STI text console.
> Console: switching to colour STI console 160x64
> Console: switching to colour frame buffer device 160x64
> fb0: stifb 1280x1024-8 frame buffer device, HPA4450AX1280, id: 2d08c0a7, =
mmio: 0xf6100000
> tipar: parallel link cable driver, version 1.19
> Generic RTC Driver v1.07
> ppdev: user-space parallel port driver
> parkbd: no such parport
> serio: GSC PS/2 keyboard port at 0xffd08000 irq 20 @ 8:16:7
> serio: GSC PS/2 mouse port at 0xffd08100 irq 20 @ 8:16:8
> HP SDC: No SDC found.
> HP SDC MLC: Registering the System Domain Controller's HIL MLC.
> HP SDC MLC: Request for raw HIL ISR hook denied
> Serial: 8250/16550 driver $Revision: 1.90 $ 16 ports, IRQ sharing enabled
> 8:16:4: ttyS0 at MMIO 0xffd05800 (irq =3D 16) is a 16550A
> 8:0:63: ttyS1 at MMIO 0xf2003800 (irq =3D 21) is a 16550A
> =0Dparport_init_chip: initialize bidirectional-mode.
> =0Dparport0: PC-style at 0xffd02800, irq 18 [PCSPP,TRISTATE]
> =0Dtipar0: using parport0 (interrupt-driven)
> =0Dtipar0: link cable not found
> =0DRAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
> =0Dloop: loaded (max 8 devices)
> =0DCompaq SMART2 Driver (v 2.6.0)
> =0DHP CISS Driver (v 2.6.8)
> =0DUniform Multi-Platform E-IDE driver Revision: 7.00alpha2
> =0Dide: Assuming 33MHz system bus speed for PIO modes; override with ideb=
us=3Dxx
> =0DLoading Adaptec I2O RAID: Version 2.4 Build 5go
> =0DDetecting Adaptec I2O RAID controllers...
> =0DAdaptec aacraid driver (1.1-4 Mar  6 2027 12:26:05)
> =0Dsym0: <875> rev 0x4 at pci 0000:00:13.0 irq 22
> =0Dsym0: No NVRAM, ID 7, Fast-20, SE, parity checking
> =0Dsym0: SCSI BUS has been reset.
> =0Dscsi0 : sym-2.2.1
> =0D  Vendor: SEAGATE   Model: ST19171W          Rev: HP08
> =0D  Type:   Direct-Access                      ANSI SCSI revision: 02
> =0D target0:0:5: tagged command queuing enabled, command queue depth 16.
> =0D target0:0:5: Beginning Domain Validation
> =0D target0:0:5: asynchronous.
> =0D target0:0:5: wide asynchronous.
> =0D target0:0:5: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
> =0D target0:0:5: Domain Validation skipping write tests
> =0D target0:0:5: Ending Domain Validation
> =0D  Vendor: SEAGATE   Model: ST34572WS         Rev: HP00
> =0D  Type:   Direct-Access                      ANSI SCSI revision: 02
> =0D target0:0:6: tagged command queuing enabled, command queue depth 16.
> =0D target0:0:6: Beginning Domain Validation
> =0D target0:0:6: asynchronous.
> =0D target0:0:6: wide asynchronous.
> =0D target0:0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
> =0D target0:0:6: Domain Validation skipping write tests
> =0D target0:0:6: Ending Domain Validation
> =0Dmegaraid cmm: 2.20.2.6 (Release Date: Mon Mar 7 00:01:03 EST 2005)
> =0Dmegaraid: 2.20.4.6 (Release Date: Mon Mar 07 12:27:22 EST 2005)
> =0Dmegasas: 00.00.02.00-rc4 Fri Sep 16 12:37:08 EDT 2005
> =0D3ware Storage Controller device driver for Linux v1.26.02.001.
> =0D3ware 9000 Storage Controller device driver for Linux v2.26.02.004.
> =0Dppa: Version 2.07 (for Linux 2.4.x)
> =0D
>=20
> Backtrace:
> =0D [<10113644>] inb+0x60/0x7c
> =0D [<103a15ec>] ppa_init+0x144/0x258
> =0D [<103a3138>] __ppa_attach+0x1c0/0x340
> =0D [<102a5810>] parport_register_driver+0x84/0x124
> =0D [<10568950>] do_initcalls+0x58/0xf8
> =0D [<10103908>] init+0x44/0x158
> =0D [<1010bc5c>] ret_from_kernel_thread+0x1c/0x24
>=20
>=20
> =0DHigh Priority Machine Check (HPMC): Code=3D1 regs=3D104e3080 (Addr=3D0=
0000000)
>=20
> =0D     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> =0DPSW: 00000000000001000000000000001100 Not tainted
> =0Dr00-03  00000000 105ce010 10113644 1f2df840
> =0Dr04-07  00002801 00000002 00002802 00000008
> =0Dr08-11  00002800 ffffffff 105ce8c8 104f0ad8
> =0Dr12-15  3b9aca00 105ce810 104f1010 f0100000
> =0Dr16-19  f000167c f00001f8 f00001f0 f200006d
> =0Dr20-23  0000000e 0000000f 10258c38 00000000
> =0Dr24-27  0000000e 00000001 1f5d2c00 104d9010
> =0Dr28-31  00000020 000000c8 1fb042c0 10113644
> =0Dsr0-3   00000000 00000000 00000000 00000000
> =0Dsr4-7   00000000 00000000 00000000 00000000
>=20
> =0D      VZOUICununcqcqcqcqcqcrmunTDVZOUI
> =0DFPSR: 00000100000011100000000000000000
> =0DFPER1: 24850e03
> =0Dfr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
> =0Dfr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
> =0Dfr08-11  0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
> =0Dfr12-15  0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
> =0Dfr16-19  0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
> =0Dfr20-23  0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
> =0Dfr24-27  0000000000000000 0000000000000000 0000000000000000 0000000000=
000000
> =0Dfr28
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
