Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.poczta.onet.pl (smtp1.poczta.onet.pl [213.180.130.31])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2245483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Nov 2003 10:42:48 -0700 (MST)
Message-ID: <002901c3aad6$87fb1c10$64d71399@Damian>
From: =?iso-8859-2?Q?Damian_Muchli=F1ski?= <mudamian@poczta.onet.pl>
To: <parisc-linux@lists.parisc-linux.org>
Date: Fri, 14 Nov 2003 18:41:25 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0025_01C3AADE.E8216470"
Subject: [parisc-linux] Linux on HP
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This is a multi-part message in MIME format.

------=_NextPart_000_0025_01C3AADE.E8216470
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0026_01C3AADE.E82471B0"


------=_NextPart_001_0026_01C3AADE.E82471B0
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hello

I'm trying to set-up linux on HP computer. First I've tried Debian =
Stable
Woody relase with 2.4.17 kernel but i got message WARNING! Stack pointer
and cr30 do not correspond! I've found on newsgroup that because of old
version of gcc and kernel and I should use newer version. So I have
downloaded palinux-2.4.22-pa13-20031022-netinst.iso from your
website,check md5, burned and booted.
Unfortunately it hangs on "searching for devices" without any more info.
I would be very gratefull if you could help me solve this problem. Maybe
somemone else had similar problem.
=20
 I've attached files with bugreport.


Thanks for any suggestions, waiting for reply from you.

------=_NextPart_001_0026_01C3AADE.E82471B0
Content-Type: text/html;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-2">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman"=20
size=3D3>Hello<BR><BR>I'm trying to set-up linux on HP computer. First =
I've tried=20
Debian Stable<BR>Woody relase with 2.4.17 kernel but i got message =
WARNING!=20
Stack pointer<BR>and cr30 do not correspond! I've found on newsgroup =
that=20
because of old<BR>version of gcc and kernel and I should use newer =
version. So I=20
have<BR>downloaded palinux-2.4.22-pa13-20031022-netinst.iso from=20
your<BR>website,check md5, burned and booted.<BR>Unfortunately it hangs =
on=20
"searching for devices" without any more info.<BR>I would be very =
gratefull if=20
you could help me solve this problem. Maybe<BR>somemone else had similar =

problem.</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>&nbsp;<BR><?fontfamily><?param Arial><?smaller> I've attached =
<?fontfamily><?param Arial><?smaller>files with =
bugreport.<?/smaller><?/fontfamily><BR><BR><BR>Thanks for any =
suggestions,=20
waiting for reply from you.</FONT><BR></DIV></FONT></BODY></HTML>

------=_NextPart_001_0026_01C3AADE.E82471B0--

------=_NextPart_000_0025_01C3AADE.E8216470
Content-Type: text/plain;
	name="komunikat 2.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="komunikat 2.txt"

Main Menu: Enter command > bo ide                                =20
Interact with IPL (Y, N, Q)?> y                              =20

Booting...         =20
Boot IO Dependent Code (IODC) revision 0                                 =
      =20


HARD Booted.           =20
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002                   =
                                  =20

Boot image contains:                   =20
    0/vmlinux32 3687647 bytes @ 0x608000                                 =
      =20
    0/vmlinux64 4719374 bytes @ 0x98c800                                 =
      =20
    0/ramdisk 2663046 bytes @ 0xe0d000                                   =
  =20

Information: No console specified on kernel command line. This is =
normal.                                                                  =
      =20
PALO will choose the console currently used by firmware (serial).Current =
command                                                                  =
             =20
 line:     =20
0/vmlinux ramdisk_size=3D8192 root=3D/dev/ram initrd=3D0/ramdisk =
console=3DttyS0 TERM=3Dvt                                                =
                               =20
102  =20
 0: 0/vmlinux            =20
 1: ramdisk_size=3D8192                    =20
 2: root=3D/dev/ram                =20
 3: initrd=3D0/ramdisk                   =20
 4: console=3DttyS0                =20
 5: TERM=3Dvt102             =20

Edit which field?                =20
(or 'b' to boot with this command line)? b                               =
          =20

Command line for kernel: 'ramdisk_size=3D8192 root=3D/dev/ram =
console=3DttyS0 TERM=3Dvt1                                               =
                                =20
02 palo_kernel=3D0/vmlinux'                        =20
Selected kernel: /vmlinux from partition 0                               =
          =20
Selected ramdisk: /ramdisk from partition 0                              =
            =20
Warning: kernel name doesn't end with 32 or 64 -- Guessing...            =
                                                =20
This box can boot either 32 or 64-bit kernels...Both kernels available, =
choosing                                                                 =
              =20
 32-bit kernelELF32 execut                       =20
Entry 00100000 first 00100000 n 5                                =20
Segment 0 load 00100000 size 2024492 mediaptr 0x1000                     =
                              =20
Segment 1 load 002f0000 size 299320 mediaptr 0x1f0000                    =
                                =20
Segment 2 load 0033c000 size 401408 mediaptr 0x23a000                    =
                                =20
Segment 3 load 003a0000 size 32768 mediaptr 0x29c000                     =
                              =20
Segment 4 load 003c90f8 size 102032 mediaptr 0x2a40f8                    =
                                =20
Loading ramdisk 2663046 bytes @ 3fd65000...                              =
            =20
Branching to kernel entry point 0x00100000.  If this is the last         =
                                                      =20
message you see, you may need to switch your console.  This is           =
                                                  =20
a common symptom -- search the FAQ and mail                              =
          =20

Linux version 2.4.17-32 (root@paer) (gcc version 3.0.4) #1 Sat Mar 16 =
17:09:00 M                                                               =
                =20
ST 2002      =20
FP[0] enabled: Rev 1 Model 19                            =20
The 32-bit Kernel has started...                               =20
Determining PDC firmware type: System Map.                               =
          =20
model 00005dc0 00000481 00000000 00000002 77634812 100000f0 00000008 =
000000b2 00                                                              =
                 =20
0000b2     =20
vers  00000203             =20
CPUID vers 19 rev 7 (0x00000267)                               =20
model 9000/785/C3700                   =20
Total Memory: 2048 Mb                    =20
initrd: 4fd65000-4ffef286                        =20
initrd: reserving 3fd65000-3ffef286 (mem_max 80000000)                   =
                                  =20
pagetable_init             =20
On node 0 totalpages: 524288                           =20
zone(0): 524288 page                  =20
zone(1): 0 pages.                =20
zone(2): 0 pages.                =20
LCD display at f05d0008,f05d0000 registered                              =
            =20
Kernel command line: ramdisk_size=3D8192 root=3D/dev/ram console=3DttyS0 =
TERM=3Dvt102 pa                                                          =
                     =20
lo_kernel=3D0/vmlinux                  =20
Console: colour dummy device 160x64                                  =20
Calibrating delay loop... 1497.49 BogoMIPS                               =
          =20
Memory: 2058652k available                         =20
Dentry-cache hash table entries: 262144 (order: 9, 2097152 bytes)        =
                                                        =20
Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)         =
                                                      =20
Mount-cache hash table entries: 32768 (order: 6, 262144 bytes)           =
                                                  =20
Buffer-cache hash table entries: 1310                                  =20
Page-cache hash table entries: 524288 (order: 9, 2097152 bytes)          =
                                                    =20
Searching for devices...                       =20
Found devices:             =20
1. Astro BC Runway Port (12) at 0xfed00000 [10], versions 0x582, 0x0, =
0xb                                                                      =
  =20
2. Elroy PCI Bridge (13) at 0xfed30000 [10/0], versions 0x782, 0x0, 0xa  =
                                                                    =20
3. Elroy PCI Bridge (13) at 0xfed32000 [10/1], versions 0x782, 0x0, 0xa  =
                                                                    =20
4. Elroy PCI Bridge (13) at 0xfed38000 [10/4], versions 0x782, 0x0, 0xa  =
                                                                    =20
5. Elroy PCI Bridge (13) at 0xfed3c000 [10/6], versions 0x782, 0x0, 0xa  =
                                                                    =20
6. Unknown machine (0) at 0xfffa0000 [32], version                       =
                         =20
7. Memory (1) at 0xfed10200 [49], versions 0x9c, 0x0, 0x9                =
                                        =20
CPU(s): 1 x PA8600 (PCX-W+) at 750.000000 MHz                            =
                =20
SBA found Astro 2.1 at 0xfed00000                                =20
lba version TR4.0 (0x5) found at 0xfed30000                              =
            =20
lba version TR4.0 (0x5) found at 0xfed32000                              =
            =20
lba version TR4.0 (0x5) found at 0xfed38000                              =
            =20
lba version TR4.0 (0x5) found at 0xfed3c000                              =
            =20
iosapic: hpa not registered for PCI device 103c:1008 (Hewlett-Packard =
Company)                                                                 =
            =20
POSIX conformance testing by UNIFIX                                  =20
Linux NET4.0 for Linux 2.4                         =20
Based upon Swansea University Computer Society NET3.039                  =
                                    =20
Initializing RT netlink socket                             =20
Enabled soft power switch (polling mode, io=3D0xf0400804).               =
                                        =20
SuperIO: Found NS87560 Legacy I/O device at 00:0e.1 (IRQ 64)             =
                                              =20
SuperIO: Serial port 1 at 0x3f8                              =20
SuperIO: Serial port 2 at 0x2f8                              =20
SuperIO: Parallel port at 0x378                              =20
SuperIO: Floppy controller at 0x3f0                                  =20
SuperIO: ACPI at 0x7e0                     =20
SuperIO: USB regulator enabled                             =20
parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]                       =
                          =20
Starting kswapd              =20
Journalled Block Device driver loaded                                    =
=20
PCI graphic ROM found at f7000000 (2048 kB), fb @ fa000000 (32 MB)       =
                                                          =20
STI word mode ROM at f7000044, hpa=3Dfa000000                            =
              =20
STI word mode ROM, id 35acda30-9a02587, conforms to spec rev. 8.0d       =
                                                          =20
STI device: A1299B                 =20
pty: 256 Unix98 ptys configured                              =20
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ =
SERIAL_PCI en                                                            =
                   =20
abled    =20
ttyS00 at port 0x03f8 (irq =3D 99) is a 16550A                           =
                =20
ttyS01 at port 0x02f8 (irq =3D 100) is a 16550A                          =
                  =20
lp0: using parport0 (interrupt-driven).                                  =
    =20
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)     =
                                                              =20
block: 128 slots per queue, batch=3D32                                   =
=20
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize    =
                                                                =20
Uniform Multi-Platform E-IDE driver Revision: 6.31                       =
                          =20
ide: Assuming 33MHz system bus speed for PIO modes; override with =
idebus=3Dxx                                                              =
            =20
NS87415: IDE controller on PCI bus 00 dev 70                             =
              =20
NS87415: chipset revision 3                          =20
NS87415: 100% native mode on irq 103                                   =20
    ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio       =
                                                          =20
    ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio       =
                                                          =20
hda: HL-DT-ST GCE-8481B, ATAPI CD/DVD-ROM drive                          =
                    =20
ide0 at 0xf00-0xf07,0xe02 on                         =20
hda: ATAPI 40X CD-ROM CD-R/RW drive, 2048kB Cache                        =
                        =20
Uniform CD-ROM driver Revision: 3.12                                   =20
loop: loaded (max 8 devices)                           =20
Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)                     =
                              =20
tulip0: no phy info, aborting mtable build                               =
          =20
tulip0:  MII transceiver #1 config 1200 status 7809 advertising 01e1.    =
                                                                =20
eth0: Digital DS21143 Tulip rev 65 at 0x1000, 00:30:6E:21:4B:D2, IRQ 66. =
                                                                      =20
SCSI subsystem driver Revision: 1.00                                   =20
sym53c8xx: at PCI bus 0, device 15, function 0                           =
                  =20
sym53c8xx: 53c896 detected                         =20
sym53c8xx: at PCI bus 0, device 15, function 1                           =
                  =20
sym53c8xx: 53c896 detected                         =20
sym53c896-0: rev 0x7 on pci bus 0 device 15 function 0 irq 65            =
                                                =20
sym53c896-0: ID 7, Fast-20, Parity Checking                              =
            =20


Linux version 2.4.17-32 (root@paer) (gcc version 3.0.4) #1 Sat Mar 16 =
17:09:00 M                                                               =
                =20
ST 2002      =20
FP[0] enabled: Rev 1 Model 19                            =20
The 32-bit Kernel has started...                               =20
Determining PDC firmware type: System Map.                               =
          =20
model 00005dc0 00000481 00000000 00000002 77634812 100000f0 00000008 =
000000b2 00                                                              =
                 =20
0000b2     =20
vers  00000203             =20
CPUID vers 19 rev 7 (0x00000267)                               =20
model 9000/785/C3700                   =20
Total Memory: 2048 Mb                    =20
initrd: 4fd65000-4ffef286                        =20
initrd: reserving 3fd65000-3ffef286 (mem_max 80000000)                   =
                                  =20
pagetable_init             =20
On node 0 totalpages: 524288                           =20
zone(0): 524288 pages.                     =20
zone(1): 0 pages.                =20
zone(2): 0 pages.                =20
LCD display at f05d0008,f05d0000 registered                              =
            =20
Kernel command line: ramdisk_size=3D8192 root=3D/dev/ram console=3DttyS0 =
TERM=3Dvt102 pa                                                          =
                     =20
lo_kernel=3D0/vmlinux                  =20
Console: colour dummy device 160x64                                  =20
Calibrating delay loop... 1497.49 BogoMIPS                               =
          =20
Memory: 2058652k available                         =20
Dentry-cache hash table entries: 262144 (order: 9, 2097152 bytes)        =
                                                        =20
Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)         =
                                                      =20
Mount-cache hash table entries: 32768 (order: 6, 262144 bytes)           =
                                                  =20
Buffer-cache hash table entries: 131072 (order: 7, 524288 bytes)         =
                                                      =20
Page-cache hash table entries: 524288 (order: 9, 2097152 bytes)          =
                                                    =20
Searching for devices...                       =20
Found devices:             =20
1. Astro BC Runway Port (12) at 0xfed00000 [10], versions 0x582, 0x0, =
0xb                                                                      =
  =20
2. Elroy PCI Bridge (13) at 0xfed30000 [10/0], versions 0x782, 0x0, 0xa  =
                                                                    =20
3. Elroy PCI Bridge (13) at 0xfed32000 [10/1], versions 0x782, 0x0, 0xa  =
                                                                    =20
4. Elroy PCI Bridge (13) at 0xfed38000 [10/4], versions 0x782, 0x0, 0xa  =
                                                                    =20
5. Elroy PCI Bridge (13) at 0xfed3c000 [10/6], versions 0x782, 0x0, 0xa  =
                                                                    =20
6. Unknown machine (0) at 0xfffa0000 [32], versions 0x5dc, 0x0, 0x4      =
                                                            =20
7. Memory (1) at 0xfed10200 [49], versions 0x9c, 0x0, 0x9                =
                                        =20
CPU(s): 1 x PA8600 (PCX-W+) at 750.000000 MHz                            =
                =20
SBA found Astro 2.1 at 0xfed00000                                =20
lba version TR4.0 (0x5) found at 0xfed30000                              =
            =20
lba version TR4.0 (0x5) found at 0xfed32000                              =
            =20
lba version TR4.0 (0x5) found at 0xfed38000                              =
            =20
lba version TR4.0 (0x5) found at 0x                                =20
iosapic: hpa not registered for PCI device 103c:1008 (Hewlett-Packard =
Company)                                                                 =
            =20
POSIX conformance testing by UNIFIX                                  =20
Linux NET4.0 for Linux 2.4                         =20
Based upon Swansea University Computer Society NET3.039                  =
                                    =20
Initializing RT netlink socket                             =20
Enabled soft power switch (polling mode, io=3D0xf0400804).               =
                                        =20
SuperIO: Found NS87560 Legacy I/O device at 00:0e.1 (IRQ 64)             =
                                              =20
SuperIO: Serial port 1 at 0x3f8                              =20
SuperIO: Serial port 2 at 0x2f8                              =20
SuperIO: Parallel port at 0x378                              =20
SuperIO: Floppy controller at 0x3f0                                  =20
SuperIO: ACPI at 0x7e0                     =20
SuperIO: USB reg              =20
parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]                       =
                          =20
Starting kswapd              =20
Journalled Block Device driver loaded                                    =
=20
PCI graphic ROM found at f7000000 (2048 kB), fb @ fa000000 (32 MB)       =
                                                          =20
STI word mode ROM at f7000044, hpa=3Dfa000000                            =
              =20
STI word mode ROM, id 35acda30-9a02587, conforms to spec rev. 8.0d       =
                                                          =20
STI device: A1299B                 =20
pty: 256 Unix98 ptys configured                              =20
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ =
SERIAL_PCI en                                                            =
                   =20
abled    =20
ttyS00 at port 0x03f8 (irq =3D 99) is a 16550A                           =
                =20
ttyS01 at port 0x02f8 (irq =3D 100) is a 16550A                          =
                  =20
lp0: using parport0 (interrupt-driven).                                  =
    =20
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)     =
                                                              =20
block: 128 slots per queue, batch=3D32                                   =
=20
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize    =
                                                                =20
Uniform Multi-Platform E-IDE driver Revision: 6.31                       =
                          =20
ide: Assuming 33MHz system bus speed for PIO modes; override with =
idebus=3Dxx                                                              =
            =20
NS87415: IDE controller on PCI bus 00 dev 70                             =
              =20
NS87415: chipset revision 3                          =20
NS87415: 100% native mode on irq 103                                   =20
    ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:p         =
                                                    =20
    ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio       =
                                                          =20
hda: HL-DT-ST GCE-8481B, ATAPI CD/DVD-ROM drive                          =
                    =20
ide0 at 0xf00-0xf07,0xe02 on irq 103                                   =20
hda: ATAPI 40X CD-ROM CD-R/RW drive, 2048kB Cache                        =
                        =20
Uniform CD-ROM driver Revision: 3.12                                   =20
loop: loaded (max 8 devices)                           =20
Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)                     =
                              =20
tulip0: no phy info, aborting mtable build                               =
          =20
tulip0:  MII transceiver #1 config 1200 status 7809 advertising 01e1.    =
                                                                =20
eth0: Digital DS21143 Tulip rev 65 at 0x1000, 00:30:6E:21:4B:D2, IRQ 66. =
                                                                      =20
SCSI subsystem driver Revision: 1.00                                   =20
sym53c8xx: at PCI bus 0, device 15, function 0                           =
                  =20
sym53c8xx: 53c896 detected                         =20
sym53c8xx: at PCI bus 0, device 15, function 1                           =
                  =20
sym53c8xx: 53c896 detected                         =20
sym53c896-0: rev 0x7 on pci bus 0 device 15 function 0 irq 65            =
                                                =20
sym53c896-0: ID 7, Fast-20, Parity Checking                              =
            =20
WARNING! Stack pointer and cr30 do not correspond!                       =
                          =20
Dumping virtual address stack instead                                    =
=20

Dumping Stack from 0x203e8000 to 0x203e8b00:                             =
              =20
8000 1cf21f4b 60933501 39928bc5 c150df50 7325178b 82a1bea1 e64a2f17 =
05437d43                                                                 =
          =20
8020 cce2eb7d 0af04fd4 99b363a9 15962afa 33107201 2b5ae0a6 66565151 =
56c3741enter command > sea                             =20

Searching for potential bo
8040 ccda17f1 adf05d6e 99b42fe3 5be0badd 331eea95 b7b7c0e8 663dd52b =
6f6f81d1l minutes.                             =20

To discontinue search, press any k
8060 cc0d1f05 dea9b6f0 981a3e0b bd536de1 30347c17 7aa6dbc3 601e4d7d =
f53b02d4                                =20


   Path Number        Device Path      =20
8080 c03c9afb ea7605a9 807935f7 d4ec0b53 00f26bef a9d816a7 01e4d7df =
53b02d4f   -----------        -----------------        -----------       =
          =20
80a0 03bf1aed a716efcc 077e35db 4e2ddf99 0e8adee5 9c2d0a60 1d15bdcb =
385a14c1           HL-DT-ST GCE-8481B                                    =
          =20
80c0 3a5dcec5 70c29cd0 74cd28d9 e1f38cf2 e99a51b3 c3e719e5 d334a367 =
87ce33cb18406LC                                                          =
      =20
  =20
80e0 a66946cf 0f9c6797 4ca438cd 1f4e7a7c 993ec4c9 3ee                    =
                               =20
8200 38d02703 3c1cffcd 71d6fb55 784f4ac8 e3db43f9 f0e820c2 c7b687f3 =
e1d04185                         =20

  Available memory:             2147483648 bytes
8220 8f6d0fe7 c3a0830b 1eda1fcf 87410617 3db43f9f 0e820c2f 7b1eca6d =
1d72ad0c      15732736 bytes                                             =
  =20

  Prim
8240 f64b2189 3a93ef4a ece0f641 75516bc6 d9b759d1 ead462de b36eb3a3 =
d5a8c5bdot path:  SCSI.6.0                               =20
  Console path:         S
8260 66dd6747 ab518b7b cdbace8f 56a316f7 9b03284d ad3098bc 3606509b =
5a613179th:        USB                          =20

----- Main Menu -----------------
8280 6c7a1465 b4b4d7a0 d8f428cb 6969af41 b19ee4c5 d2a5ebd0 633dc98b =
a54bd7a1                                           =20

      Command                =20
82a0 c67b9317 4a97af43 8c81937d 9559ebd4 190326fb 2ab                 =20
                                =20
-----    =20
Main Menu: Enter command > bo id
83e0 d9ceaf65 82cccd20 b39d5ecb 05999a41 674c08c5 0b4581d0 ceeea4d9 =
16fdb6f2                   =20

Booting...         =20
Boot IO Dependent Code (IODC) rev
8400 9dabfce1 2d8dd8b6 3b214c91 5b6d043e 76342c71 b6acbd2e ec6858e3 =
6d597a5dlo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002             =
          =20
8420 d8a60495 dac441e8 b14c092b b58883d1 62981257 6b1107a3 c54691fd =
d654ba140/vmlinux32 4250101 bytes @ 0x458800                             =
          =20
8440 8a8d23fb aca97429 151a47f7 5952e853 2a423abd b2d365f4 5484757b =
65a6cbe9   =20
    0/ramdisk 2656756 bytes @ 0xdac800                                =20
8460 a97e5fa5 cb3b2280 52fcbf4b 96764501 a5f97e97 2ceman                 =
                               =20
8560 c99f7ee9 fd53e01a 933efdd3 faa7c035 267dfba7 f54f806b 4cfbf74f =
ea9f00d7                                             =20
This box can boot either 32 o
8580 99f7ee9f d53e01af 33efdd3f aa7c035f 67dfba7f 54f806bf cfc9c1ad =
a986b82c                                                     =20
 32-bit kernelELF32 e
85a0 9f93835b 530d7059 3f51b3e5 a66c55e0 7ea367cb 4cd8abc1 fd307ac5 =
99c7e2d0                            =20
Segment 0 load 00100000 size 2359528 mediaptr=20
85c0 fa60f58b 338fc5a1 f4b75e45 67693e10 e91809d9 cea4c972 d23013b3 =
9d4992e542000 size 488912 mediaptr 0x242000                              =
          =20
85e0 a4602767 3a9325cb 48b6fb9d 7550fec4 911b4269 ead748da 223684d3 =
d5ae91b5                                         =20
Segment 3 load 003fc000 size 8192
8600 446d09a7 ab5d236b 88da134f 56ba46d7 11c293cd ad0238fc 2385279b =
5a0471f9 4 load 00400000 size 32768 mediaptr 0x2fa000                    =
          =20
8620 477cfa65 b47e56a0 8ef9f4cb 68fcad41 1d855cc5 d18264 mediapt         =
                               =20
86a0 478145f1 eb440e6e 8f028be3 d6881cdd 1e0517c7 ad1039bb 3c0a2f8f =
5a2073773.0.4) #1 Wed Oct 22 17:45:10                                    =
          =20
86c0 7862ea4d b43653bc f0c5d49b 686ca779 e1fd1c65 d0affba0 c3fa38cb =
a15ff741l 19                            =20
The 32-bit Kernel has started...         =20
86e0 87f47197 42bfee83 0f9e567d 85096854 1f3cacfb 0a12d0a9 3e0feca5 =
14531400                             =20
model 00005dc0 00000481 00000000 00000002 776
8700 7c696c19 28d09d52 f8a46d61 51d78ff6 f13e6f91 a3d                    =
                               =20
8740 49b1bbe1 f040f036 936377c3 e081e06d 26c6ef87 c103c0db 4d8ddf0f =
820781b7d: 4fd66000-4ffee9f4                        =20
initrd: reserving 3fd66000-3ff
8760 9b1bbe1f 040f036f 3641c96d 0868b38c 6cf52789 10a7d24a d99cfa41 =
213911c6=20
pagetable_init             =20
On node 0 totalpages: 524288                =20
8780 b34f41d1 420496de 66e836f1 847f98ee cdd06de3 08ff31dd 9bd66e95 =
1188d6e8             =20
zone(2): 0 pages.                =20
LCD display at f05d0008,f0
87a0 37da6879 23671882 6fc265a1 46b88456 dff27e11 8d07bdfe bfe4fc23 =
1a0f7bfdine: ramdisk_size=3D8192 root=3D/dev/ram console=3DttyS0 =
TERM=3Dvt102 pa           =20
87c0 7fbf4d15 346842a8 ff082f79 68a63002 fe66eba1 d13ad556 fccdd743 =
a275aaadl=3D0/vmlinux                  =20
Console: colour dummy device 160x64         =20
87e0 f99bae87 44eb555b f341e85d 89a01fe4 e683d0bb 13497.49 BogoMIP       =
                               =20
-------
8900 d7762b37 6520e5f3 ae9ae33d ca377eb4 5d35c67b 946efd69 ba6b8cf7 =
28ddfad3                                                                 =
      =20

 =20
8920 74a1acbd 51cd40f4 e935ec29 a3ec34ba d26bd853 47d86975 a4a105f5 =
8fc667b8                                                                 =
     =20
  --
8940 49420beb 1f8ccf71 92f2a285 3f6f2bb0 2593f059 7ea8e232 4b5155e1 =
fd277136                                                                 =
          =20
8960 96a2abc3 fa4ee26d 2d455787 f49dc4db 5a8aaf0f e93b89b7 b5155e1f =
d277136f36 kB                                                            =
          =20
8980 6a2abc3f a4ee26df d455787f 49dc4dbf a8dc45ad 93ce2e2c 51b88b5b =
279c5c59                          =20

  Available memory:             2147483648 byte
89a0 a307a3e5 4f4e0de0 4679f299 9eeaae92 8cf3e533 3ddod memory required: =
                               =20
89a0 a307a3e5 4f4e0de0 4679f299 9eeaae92 8cf3e533 3ddod memory required: =
                               =20
8aa0 8736bfb7 37b59133 0e1bca3d 6f1d9734 1c412129 de4d9b3a 38824253 =
bc9b3675
8ac0 710484a7 79366ceb e27fbc1d f21a6c84 c4ff783b e434d909 89fef077 =
c869b213
8ae0 13fde0ef 90d36427 27fbc1df 21a6c84f 4f8136ed 433b25cc 9f74d889 =
8600feca

High Priority Machine Check (HPMC): Code=3D1 regs=3D102f3080 =
(Addr=3D00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111101000001101 Not tainted
r00-03  00000000 00000000 1034bda0 000f4000
r04-07  12378350 00000010 12378000 00000000
r08-11  00000002 1237800c 12378050 10323010
r12-15  00000000 10376c08 102d2000 00000038
r16-19  0000000f 103234d4 10323010 000f423f
r20-23  0000000f f4005014 00000001 f4005000
r24-27  000f423f 000bb800 00000001 102f0010
r28-31  00000000 00001d4c 103e8b00 10201f40
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1034be68 1034be6c
 IIR: 0ea00013    ISR: a607ffd0  IOR: 01405014
 CPU:        0   CR30: 103e8000 CR31: 103a0000
 ORIG_R28: 00000000

------=_NextPart_000_0025_01C3AADE.E8216470
Content-Type: text/plain;
	name="komunikat.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="komunikat.txt"


Firmware Version 1.6                   =20

Duplex Console IO Dependent Code (IODC) revision 1                       =
                          =20

-------------------------------------------------------------------------=
-----                                                                    =
         =20
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved =
                                                                      =20
-------------------------------------------------------------------------=
-----                                                                    =
         =20

  Processor   Speed            State           Coprocessor State  I/D =
Cache                                                                    =
      =20
  ---------  --------   ---------------------  ----------                =
                                      =20
      0      750 MHz    Active                 Functional         768 =
kB/1536 kB                                                               =
                =20


  Central Bus Speed:                   120 MHz                           =
                  =20

  Available memory:             2147483648 bytes                         =
                      =20
  Good memory required:           15732736 bytes                         =
                      =20

  Primary boot path:    FWSCSI.6.0                                 =20
  Alternate boot path:  SCSI.6.0                               =20
  Console path:         SERIAL_1.9600.8.none                             =
              =20
  Keyboard path:        USB                          =20

----- Main Menu =
-------------------------------------------------------------            =
                                                                =20

      Command                           Description                      =
                            =20
      -------                           -----------                      =
                            =20
      BOot [PRI|ALT|<path>]             Boot from specified path         =
                                                      =20
      PAth [PRI|ALT|CON|KEY [<path>]]   Display or modify a path         =
                                                      =20
      SEArch [DIsplay|[[IPL] [<path>]]] Search for boot devices          =
                                                    =20

      COnfiguration [<command>]         Access Configuration =
menu/commands                                                            =
             =20
      INformation [<command>]           Access Information menu/commands =
                                                                      =20
      SERvice [<command>]               Access Service menu/commands     =
                                                              =20

      DIsplay                           Redisplay th                     =
                            =20
      HElp [<menu>|<command>]           Display help for menu or command =
                                                                      =20
      RESET                             Restart the system               =
                                          =20
-----    =20
Main Menu: Enter command > bo ide                                =20
Interact with IPL (Y, N, Q)?> y                              =20

Booting...         =20
Boot IO Dependent Code (IODC) revision 0                                 =
      =20


HARD Booted.           =20
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002                   =
                                  =20

Boot image contains:                   =20
    0/vmlinux32 4250101 bytes @ 0x458800                                 =
      =20
    0/vmlinux64 5527820 bytes @ 0x866800                                 =
      =20
    0/ramdisk 2656756 bytes @ 0xdac800                                   =
  =20

Information: No console specified on kernel comman                       =
                         =20
PALO will choose the console currently used by firmware (serial).Current =
command                                                                  =
             =20
 line:     =20
0/vmlinux ramdisk_size=3D8192 root=3D/dev/ram initrd=3D0/ramdisk =
console=3DttyS0 TERM=3Dvt                                                =
                               =20
102  =20
 0: 0/vmlinux            =20
 1: ramdisk_size=3D8192                    =20
 2: root=3D/dev/ram                =20
 3: initrd=3D0/ramdisk                   =20
 4: console=3DttyS0                =20
 5: TERM=3Dvt102             =20

Edit which field?                =20
(or 'b' to boot with this command line)? b                               =
          =20

Command line for kernel: 'ramdisk_size=3D8192 root=3D/dev/ram =
console=3DttyS0 TERM=3Dvt1                                               =
                                =20
02 palo_kernel=3D0/vmlinux'                        =20
Selected kernel: /vmlinux from partition 0                               =
          =20
Selected ramdisk: /ramdisk                         =20
Warning: kernel name doesn't end with 32 or 64 -- Guessing...            =
                                                =20
This box can boot either 32 or 64-bit kernels...Both kernels available, =
choosing                                                                 =
              =20
 32-bit kernelELF32 executable                             =20
Entry 00100268 first 00100000 n 6                                =20
Segment 0 load 00100000 size 2359528 mediaptr 0x1000                     =
                              =20
Segment 1 load 00342000 size 488912 mediaptr 0x242000                    =
                                =20
Segment 2 load 003bc000 size 252764 mediaptr 0x2ba000                    =
                                =20
Segment 3 load 003fc000 size 8192 mediaptr 0x2f8000                      =
                            =20
Segment 4 load 00400000 size 32768 mediaptr 0x2fa000                     =
                              =20
Segment 5 load 0042ab70 size 121264 mediapt                              =
          =20
Loading ramdisk 2656756 bytes @ 3fd66000...                              =
            =20
Branching to kernel entry point 0x00100268.  If this is the last         =
                                                      =20
message you see, you may need to switch your console.  This is           =
                                                  =20
a common symptom -- search the FAQ and mailing list at parisc-linux.org  =
                                                                    =20

Linux version 2.4.22-32 (root@k2000) (gcc version 3.0.4) #1 Wed Oct 22 =
17:45:10                                                                 =
             =20
CEST 2003        =20
FP[0] enabled: Rev 1 Model 19                            =20
The 32-bit Kernel has started...                               =20
Determining PDC firmware type: System Map.                               =
          =20
model 00005dc0 00000481 00000000 00000002 77634812 100000f0 00000008 =
000000b                                                                  =
        =20
0000b2     =20
vers  00000203             =20
CPUID vers 19 rev 7 (0x00000267)
capabilities 0x7
model 9000/785/C3700
Total Memory: 2048 Mb
initrd: 4fd66000-4ffee9f4
initrd: reserving 3fd66000-3ffee9f4 (mem_max 80000000)
pagetable_init
On node 0 totalpages: 524288
zone(0): 524288 pages.
zone(1): 0 pages.
zone(2): 0 pages.
LCD display at f05d0008,f05d0000 registered
Kernel command line: ramdisk_size=3D8192 root=3D/dev/ram console=3DttyS0 =
TERM=3Dvt102 pa
lo_kernel=3D0/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 1497.49 BogoMIPS
Memory: 2066424k available
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Inode cache hash table entries: 131072 (order: 8, 1048576 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer cache hash table entries: 131072 (order: 7, 524288 bytes)
Page-cache hash table entries: 524288 (order: 9, 2097152 bytes)
Searching for devices...
------=_NextPart_000_0025_01C3AADE.E8216470--
