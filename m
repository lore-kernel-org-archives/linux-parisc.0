Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from adansonia.wanadoo.fr (smtp-rt-14.wanadoo.fr [193.252.19.224])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9AE56482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Mar 2001 14:36:10 -0700 (MST)
Message-ID: <009401c0b961$fec40780$140101a8@home233>
Reply-To: "jean-yves.guillevic" <jean-yves.guillevic@wanadoo.fr>
From: "jean-yves.guillevic" <jean-yves.guillevic@wanadoo.fr>
To: <parisc-linux@lists.parisc-linux.org>,
	<grundler@puffin.external.hp.com>
Date: Fri, 30 Mar 2001 23:40:08 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0090_01C0B972.C1511260"
Subject: [parisc-linux] Hello PARISC-LINUX A short boot
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0090_01C0B972.C1511260
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0091_01C0B972.C1511260"


------=_NextPart_001_0091_01C0B972.C1511260
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello All

I was given an old HP715 in good state but not working.
After a while..., i got a few char on the screen and no more.
(the machine was ready to work :-)
I build a linux-box with an old P75 grab some gz/tgz to build=20
a boot disk for this machine. (using  the PA-LINUX links thanks to all =
of contributors)
i connect a serial terminal. then it boot....:-):-)=20
but stop leaving me with the contents of CAPTURE.TXT ( 2 boots).
i plug in the graphic card : it does the same but on screen.

does someone can tell me about the status of the firmware of this =
machine???=20
shall i replace with=20
is there something to do on the hardware???
to me it is the paralel port or something to do with it.
i tryed two kernel :vmlinux-20010115 and vmlinux-20010305 but it does =
the same.
=20
i got a tape with a firmware patch ready to put in but i read that it is =
possible to build a kernel
without parallel support. (less risks for the machine)
where can i find the patchs between PDC ROM rev 1.0 and PDC ROM rev 1.6
if i make a rev 1.6 patch do i have to make a rev 1.5 rev 1.4 etc...?
who can tell me whitch solution is the best and why.

is the following text from your faq the solution for me
a.. I'm booting parisc linux on an early Series 700 workstation, and the =
machine hangs after printing:=20
  ASP version 1 at ..... found
What's going on?=20
This was a bug in the parallel port driver, which was fixed in CVS on =
2001-02-16. You can workaround the problem by using a newer kernel or by =
reconfiguring your kernel and removing support for the parallel port =
(CONFIG_PARPORT_GSC).=20

Salutations
jean-yves.guillevic@wanadoo.fr





------=_NextPart_001_0091_01C0B972.C1511260
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD W3 HTML//EN">
<HTML>
<HEAD>

<META content=3Dtext/html;charset=3Diso-8859-1 =
http-equiv=3DContent-Type><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 =
Transitional//EN">
<META content=3D'"MSHTML 4.72.3612.1706"' name=3DGENERATOR>
<STYLE></STYLE>

</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Hello All</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I was given an old HP715 in good state =
but not=20
working.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>After a while..., i got a few char on =
the screen=20
and no more.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(the machine was ready to work =
:-)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I build a linux-box with an old P75 =
grab some=20
gz/tgz <FONT face=3DArial size=3D2>to build </FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3DArial size=3D2>a boot disk =
for this=20
machine. </FONT></FONT><FONT face=3DArial size=3D2>(using&nbsp; the =
PA-LINUX links=20
thanks to all of contributors)</FONT><FONT face=3DArial =
size=3D2></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>i connect a serial terminal. =
</FONT><FONT=20
face=3DArial size=3D2>then it boot....:-):-) </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>but stop leaving me with the contents =
of=20
CAPTURE.TXT ( 2&nbsp;boots).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>i plug in the graphic card : it does =
the same but=20
on screen.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>does someone can tell me about the =
status of the=20
firmware of this machine??? </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>shall i replace with </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>is there something to do on the=20
hardware???</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>to me it is the paralel port or =
something to do=20
with it.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>i tryed two kernel :</FONT><FONT =
face=3DArial=20
size=3D2>vmlinux-20010115 and vmlinux-20010305 but it does the =
same.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i got a tape with a firmware patch =
ready to put in=20
but i read that&nbsp;it is possible to build a kernel</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>without parallel support. (less risks =
for the=20
machine)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>where can i find the patchs between PDC =
ROM rev 1.0=20
and PDC ROM rev 1.6</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>if i make a rev 1.6 patch do i have to =
make a rev=20
1.5 rev 1.4 etc...?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>who can tell me whitch solution is the =
best and=20
why.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>is the following text from your faq the =
solution=20
for me</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<LI>I'm booting parisc linux on an early Series 700 workstation, and the =
machine=20
hangs after printing: <PRE>  ASP version 1 at ..... found</PRE>What's =
going on?=20
<P>This was a bug in the parallel port driver, which was fixed in CVS on =

2001-02-16. You can workaround the problem by using a newer kernel or by =

reconfiguring your kernel and removing support for the parallel port=20
(CONFIG_PARPORT_GSC). </P></FONT></LI></DIV>
<DIV><FONT face=3DArial size=3D2>Salutations</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><A=20
href=3D"mailto:jean-yves.guillevic@wanadoo.fr">jean-yves.guillevic@wanado=
o.fr</A></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_001_0091_01C0B972.C1511260--

------=_NextPart_000_0090_01C0B972.C1511260
Content-Type: text/plain;
	name="Capture.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Capture.txt"




(c) Copyright.  Hewlett-Packard Company.  1992.
All rights reserved.
Portions of this code are (c) Copyright Samsung Electronics Co., Ltd, =
91, 92

PDC ROM rev. 1.0
IODC ROM rev. 1.0
64 MB of memory have been configured.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.....

Booting from:     scsi.2.0     MAXTOR  7213-SCSI

Soft booted.
palo ipl root@jygx mer mar 28 15:57:54 CEST 2001
0/vmlinux 2134906 bytes @ 0x44000
0/palo-cmdline '2/vmlinux HOME=3D/ TERM=3Dlinux console=3Dtty'
/dev/ida1  f0         32      16352
/dev/ida2  83     102400     311296
/dev/ida3  82      16384      86016
Kernel: partition 2 file /vmlinux
ext2 block size 1024
ext2_mount(partition 2) returns 0
ext2_open(/vmlinux) =3D 3
ELF32 executable
Entry 00100160 first 00100000 n 5
Segment 0 load 00100000 size 1426732 mediaptr 0x1000
Segment 1 load 0025e000 size 173080 mediaptr 0x15e000
Segment 2 load 0028c000 size 117508 mediaptr 0x189000
Segment 3 load 002ac000 size 8192 mediaptr 0x1a6000
Segment 4 load 002d7144 size 496 mediaptr 0x1a8144
branching to kernel entry point 0x00100160
PDC Console Initialized
The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02d8000
start_parisc(0x64d58,0x64d58,0x0,0x0)
PALO command line: 'HOME=3D/ TERM=3Dlinux console=3Dtty'
PALO initrd 0-0
model   00003130 00000481 00000000 00000000 7825e314 ffffffff 00000004 =
0000000a 0000000a
vers    00000008
CPUID   vers 0 rev 0
model   9000/715
led_init: CPU_HVERSION 313
Searching for devices in PDC firmware... processor hpa 0xfffbe000
 an older box...
Using Alex's odd 715/old exception, onboard graphics won't be =
inventoried!
Found devices:
1. Strider-33 Core BA (11) at 0xf082f000, versions 0xd, 0x0, 0x70, 0x0, =
0x0
2. Strider-33 Core SCSI (10) at 0xf0825000, versions 0xd, 0x0, 0x71, =
0x0, 0x0
3. Strider-33 Core LAN (802.3) (10) at 0xf0826000, versions 0xd, 0x0, =
0x72, 0x0, 0x0
4. Strider-33 Core HIL (10) at 0xf0821000, versions 0xd, 0x0, 0x73, 0x0, =
0x0
5. Strider-33 Core RS-232 (10) at 0xf0823000, versions 0xd, 0x0, 0x75, =
0x0, 0x0
6. Strider-33 Core RS-232 (10) at 0xf0822000, versions 0xd, 0x0, 0x75, =
0x0, 0x0
7. Strider-33 Core Centronics (10) at 0xf0824000, versions 0xd, 0x0, =
0x74, 0x0, 0x0
8. Strider-33 Audio (10) at 0xf1000000, versions 0xd, 0x0, 0x7b, 0x0, =
0x0
9. Strider-33 Core EISA (11) at 0xfc000000, versions 0xd, 0x0, 0x76, =
0x0, 0x0
10. Strider-33 (715S/33) (0) at 0xfffbe000, versions 0x313, 0x0, 0x4, =
0x0, 0x81
11. Strider-33 (707T) (1) at 0xfffbf000, versions 0x1d, 0x0, 0x9, 0x0, =
0x0
That's a total of 11 devices.
CPU(s): 1 x PA7100 (PCX-T) at 33.333500 MHz
Linux version 2.4.0-test10 (grundler@hpisp747) (gcc version 2.96 =
20000925 (experimental)) #39 Mon Jan 15 10:34:48 PST 2001
free_bootmem(0x2d8800, 0x3d27800)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 16384
zone(0): 8192 pages.
zone(1): 8192 pages.
zone(2): 0 pages.
Kernel command line: HOME=3D/ TERM=3Dlinux console=3Dtty
trap_init
Error reading tod clock
Calibrating delay loop... 33.18 BogoMIPS
Memory: 61460k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
LED (ASP-style) display at 00000000 registered
parport_init_chip: initialize bidirectional-mode.
=FF


Dumping Stack from c3fc8000 to c3fc8980:
8000 00000000 00000040 00000000 00000000 c027346c 00000000 00000000 =
ffffffff
8020 00000002 00000000 00000000 00000000 00000000 00000000 ffffffff =
c0273384
8040 c0273384 00000000 c02ac000 c02ac000 c027860c 00000000 00000000 =
00000000
8060 00000000 00000000 00000000 00000001 00000000 00000000 00000000 =
00000000
8080 00000000 c02ac000 c02ac000 00000000 00000000 00000000 c02ac098 =
c02ac098
80a0 00000000 c02c7978 00000000 c3fc80ac c3fc80ac 00000000 00000000 =
00000000
80c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
80e0 c3fc8000 c011c0fc 00000000 00000003 00000000 00000000 00000031 =
00000000
8100 00000034 00000000 00000000 00000000 00000000 00000000 00000000 =
80000000
8120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
8140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
8160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
8180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
81a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
81c0 00000000 fffffeff 00000000 ffffffff 00000000 c027401c ffffffff =
ffffffff
81e0 ffffffff ffffffff ffffffff ffffffff 00800000 05000000 00000000 =
ffffffff
8200 ffffffff ffffffff 00000400 00000400 00000400 00000400 ffffffff =
ffffffff
8220 ffffffff ffffffff ffffffff ffffffff 00007377 61707065 72000000 =
00000000
8240 00000000 00000000 00000000 00000000 00000000 00000000 00004000 =
01984208
8260 01984208 c013e478 00008000 c3ffeba0 c0225e0c c0235e48 fc4ff000 =
00064d58
8280 00000000 c011a85c c02c6000 00004000 01984208 c02c6000 00000000 =
0004000a
82a0 c02734a0 0000000b 00000024 0000003c 0000003e c0273000 00000001 =
00000000
82c0 c01002a0 c02b2b4b 00000000 c02b2b6f 0000000b c02734a0 c0273000 =
08000058
82e0 00000004 000000ff 0000038c 00000000 f0823800 f0823800 f0823800 =
00000008
8300 002b2540 c025e000 00000000 009896b2 c02ac8c0 000068b8 00008000 =
fed7fdff
8320 fecf7e9e 193a4439 00400000 dc31c339 0004c010 480e9bd8 02005612 =
1945f5bf
8340 401088a0 06c09809 0730e552 42568065 817a0fc4 4c005111 80b84802 =
c17c726b
8360 1806b589 9700c1e7 9e10a080 d0905c5d 4110b902 421e2491 6882ac0f =
5b7c003f
8380 2902b518 50746140 2657e10c a1bda747 80140100 14c00111 9a091d40 =
8c404c45
83a0 0a166819 8094d301 02ca0801 94095019 c00c21b2 700210e9 23381802 =
c42003e6
83c0 20109003 18228004 634a0244 462444d0 2a92b201 8500c158 5d54041d =
5f9aa6d4
83e0 5100c200 d0140400 dc9c1908 0b016c94 00080174 b018052a 43666054 =
045d1205
8400 20c40029 03001010 08926810 d02038c1 32694520 bb585e7e 00000000 =
00000000
8420 c3fc8500 c0105c38 00000000 00000000 00000000 00000000 00000000 =
00000000
8440 c011a84c c011a850 634a0244 462444d0 00279000 00000000 c0278040 =
c0278064
8460 00000000 c0278204 00000000 00000000 00000000 c3fc8470 00000000 =
00000000
8480 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
84a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
84c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
84e0 00000000 00000000 00000000 c0105c48 00000000 00000000 00000000 =
00000000
8500 c02ac000 00000000 c02ac640 00000000 00000000 00000000 00000000 =
00000000
8520 00000000 00000000 00000000 c01002b4 00000000 00000000 00000000 =
00000000
8540 00000000 00000000 00000000 00000000 c3fc8000 c027860c c02ac000 =
00000000
8560 c02ac640 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
8580 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
85a0 00000000 00000000 00000000 c028d0d8 00000000 00000000 00000000 =
00000000
85c0 c02ac640 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
85e0 00000000 00000000 00000000 c029ed20 00000000 00000000 00000000 =
00000000
8600 fc4ff000 c02c7800 c02ca000 c025e000 c02c6000 00000000 c02ac640 =
00000000
8620 00000000 00000000 00000000 c029f560 00000000 00000000 00000000 =
00000000
8640 c02ca000 c025e000 c02c6000 00000000 c02ac640 c3ffec20 00000000 =
00000000
8660 00000000 00000000 00000000 c02a29fc 00000000 00000000 00000000 =
00000000
8680 c02ca000 c025e000 c02c6000 00000000 c02ac640 c02736b0 c3fc30a0 =
00000000
86a0 00000000 00000000 00000000 c0109b90 00000000 00000000 00000000 =
00000000
86c0 00000000 00000000 fffbe000 00000003 00000023 c3fc47e0 00000000 =
c02a8698
86e0 c02c6b30 00000000 00000000 c0109b90 00000000 00000000 00000000 =
00000000
8700 00000006 c02a8930 c02c6bf0 c3fcf1a0 f0800000 00000001 c0251804 =
c0251808
8720 00000000 00000000 00000000 c029f930 00000000 00000000 00000000 =
00000000
8740 c02c6b30 00000000 c3fcf1a0 00000000 c3fcf1a0 f0824804 c025c424 =
c025c400
8760 001a5a59 001a5a59 c028d8e0 c02a297c c02c7800 c02c6800 c0265000 =
c02c6b30
8780 c02a8930 c02c6bf0 f0824800 00000000 00000000 00000000 00000041 =
00000058
87a0 ffffffff 001a5a59 c028d8e0 c3fc8788 c02c7800 c02c6800 c0265000 =
00000058
87c0 f0824800 f0824804 c3fc8764 c3fcf1a0 f0824800 c3fcf1a0 c025c423 =
c0273000
87e0 00000001 c02b2b71 00000004 c011a85c 00000022 c02b2b71 0000000b =
c02734a0
8800 00000000 0004000a c02734a0 0000000b 00000032 0000003c 0000003e =
c0273000
8820 00000001 c02b2b7d 00000004 c02b2b4b 00000031 c02b2b7d 0000000b =
c02734a0
8840 c0273000 08000058 00000004 000000ff 0000038c 00000000 f0823800 =
f0823800
8860 f0823800 00000008 c3fc3120 c3fce220 00000000 009896b2 c3fc8a40 =
000068b8
8880 00008000 fed7fdff fc4ff000 c02c7800 c02c6800 c0265000 00000058 =
f0824800
88a0 f0824804 1945f5bf 401088a0 06c09809 0730e552 42568065 817a0fc4 =
4c005111
88c0 80b84802 c17c726b 1806b589 9700c1e7 9e10a080 d0905c5d 4110b902 =
421e2491
88e0 6882ac0f 5b7c003f 2902b518 c02a2620 2657e10c a1bda747 80140100 =
14c00111
8900 00000058 f0824800 c3fc3120 c3fce220 c3fc8788 94095019 c00c21b2 =
700210e9
8920 23381802 c42003e6 20109003 c02a2380 634a0244 462444d0 2a92b201 =
8500c158
8940 0000000c c3fc8788 5100c200 d0140400 dc9c1908 0b016c94 00080174 =
b018052a
8960 43666054 045d1205 20c40029 c02a2478 08926810 d02038c1 32694520 =
bb585e7e

High Priority Machine Check (HPMC): Code=3D1 regs=3Dc0266080 =
(Addr=3D00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001011
r0-3     00000000 c01dd800 c02a24b8 c3fc8788
r4-7     0000002c c3fce220 f0824800 ffffffdf
r8-11    ffffffff 00000000 c028d8e0 001a5a59
r12-15   001a5a59 000ff000 f000015c 00000000
r16-19   00000000 08000058 00000004 0000000b
r20-23   000000ff 00000041 c3fc3000 0000000b
r24-27   ffffffff f0824800 f0824800 c025e000
r28-31   000000ff 00000080 c3fc8980 c012c984
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c01dd94c c01dd950
 IIR: e840c000    ISR: 00000000  IOR: c02a24b8
ORIG_R28: 00000000



(c) Copyright.  Hewlett-Packard Company.  1992.
All rights reserved.
Portions of this code are (c) Copyright Samsung Electronics Co., Ltd, =
91, 92

PDC ROM rev. 1.0
IODC ROM rev. 1.0
64 MB of memory have been configured.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.


(c) Copyright.  Hewlett-Packard Company.  1992.
All rights reserved.
Portions of this code are (c) Copyright Samsung Electronics Co., Ltd, =
91, 92

PDC ROM rev. 1.0
IODC ROM rev. 1.0
64 MB of memory have been configured.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.....

Booting from:     scsi.2.0     MAXTOR  7213-SCSI

Hard booted.
palo ipl root@jygx mer mar 28 15:57:54 CEST 2001
0/vmlinux 2134906 bytes @ 0x44000
0/palo-cmdline '2/vmlinux HOME=3D/ TERM=3Dlinux console=3Dtty'
/dev/ida1  f0         32      16352
/dev/ida2  83     102400     311296
/dev/ida3  82      16384      86016
Kernel: partition 2 file /vmlinux
ext2 block size 1024
ext2_mount(partition 2) returns 0
ext2_open(/vmlinux) =3D 3
ELF32 executable
Entry 00100160 first 00100000 n 5
Segment 0 load 00100000 size 1426732 mediaptr 0x1000
Segment 1 load 0025e000 size 173080 mediaptr 0x15e000
Segment 2 load 0028c000 size 117508 mediaptr 0x189000
Segment 3 load 002ac000 size 8192 mediaptr 0x1a6000
Segment 4 load 002d7144 size 496 mediaptr 0x1a8144
branching to kernel entry point 0x00100160
PDC Console Initialized
The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02d8000
start_parisc(0x64d58,0x64d58,0x0,0x0)
PALO command line: 'HOME=3D/ TERM=3Dlinux console=3Dtty'
PALO initrd 0-0
model   00003130 00000481 00000000 00000000 7825e314 ffffffff 00000004 =
0000000a 0000000a
vers    00000008
CPUID   vers 0 rev 0
model   9000/715
led_init: CPU_HVERSION 313
Searching for devices in PDC firmware... processor hpa 0xfffbe000
 an older box...
Using Alex's odd 715/old exception, onboard graphics won't be =
inventoried!
Found devices:
1. Strider-33 Core BA (11) at 0xf082f000, versions 0xd, 0x0, 0x70, 0x0, =
0x0
2. Strider-33 Core SCSI (10) at 0xf0825000, versions 0xd, 0x0, 0x71, =
0x0, 0x0
3. Strider-33 Core LAN (802.3) (10) at 0xf0826000, versions 0xd, 0x0, =
0x72, 0x0, 0x0
4. Strider-33 Core HIL (10) at 0xf0821000, versions 0xd, 0x0, 0x73, 0x0, =
0x0
5. Strider-33 Core RS-232 (10) at 0xf0823000, versions 0xd, 0x0, 0x75, =
0x0, 0x0
6. Strider-33 Core RS-232 (10) at 0xf0822000, versions 0xd, 0x0, 0x75, =
0x0, 0x0
7. Strider-33 Core Centronics (10) at 0xf0824000, versions 0xd, 0x0, =
0x74, 0x0, 0x0
8. Strider-33 Audio (10) at 0xf1000000, versions 0xd, 0x0, 0x7b, 0x0, =
0x0
9. Strider-33 Core EISA (11) at 0xfc000000, versions 0xd, 0x0, 0x76, =
0x0, 0x0
10. Strider-33 (715S/33) (0) at 0xfffbe000, versions 0x313, 0x0, 0x4, =
0x0, 0x81
11. Strider-33 (707T) (1) at 0xfffbf000, versions 0x1d, 0x0, 0x9, 0x0, =
0x0
That's a total of 11 devices.
CPU(s): 1 x PA7100 (PCX-T) at 33.333500 MHz
Linux version 2.4.0-test10 (grundler@hpisp747) (gcc version 2.96 =
20000925 (experimental)) #39 Mon Jan 15 10:34:48 PST 2001
free_bootmem(0x2d8800, 0x3d27800)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 16384
zone(0): 8192 pages.
zone(1): 8192 pages.
zone(2): 0 pages.
Kernel command line: HOME=3D/ TERM=3Dlinux console=3Dtty
trap_init
Error reading tod clock
Calibrating delay loop... 33.18 BogoMIPS
Memory: 61460k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
LED (ASP-style) display at 00000000 registered
parport_init_chip: initialize bidirectional-mode.



Dumping Stack from c3fc8000 to c3fc8980:
8000 00000000 00000040 00000000 00000000 c027346c 00000000 00000000 =
ffffffff
8020 00000002 00000000 00000000 00000000 00000000 00000000 ffffffff =
c0273384
8040 c0273384 00000000 c02ac000 c02ac000 c027860c 00000000 00000000 =
00000000
8060 00000000 00000000 00000000 00000001 00000000 00000000 00000000 =
00000000
8080 00000000 c02ac000 c02ac000 00000000 00000000 00000000 c02ac098 =
c02ac098
80a0 00000000 c02c7978 00000000 c3fc80ac c3fc80ac 00000000 00000000 =
00000000
80c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
80e0 c3fc8000 c011c0fc 00000000 00000003 00000000 00000000 00000031 =
00000000
8100 00000034 00000000 00000000 00000000 00000000 00000000 00000000 =
80000000
8120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
8140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
8160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
8180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
81a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
81c0 00000000 fffffeff 00000000 ffffffff 00000000 c027401c ffffffff =
ffffffff
81e0 ffffffff ffffffff ffffffff ffffffff 00800000 05000000 00000000 =
ffffffff
8200 ffffffff ffffffff 00000400 00000400 00000400 00000400 ffffffff =
ffffffff
8220 ffffffff ffffffff ffffffff ffffffff 00007377 61707065 72000000 =
00000000
8240 00000000 00000000 00000000 00000000 00000000 00000000 00004000 =
01984208
8260 01984208 c013e478 00008000 c3ffeba0 c0225e0c c0235e48 fc4ff000 =
00064d58
8280 00000000 c011a85c c02c6000 00004000 01984208 c02c6000 00000000 =
0004000a
82a0 c02734a0 0000000b 00000024 0000003c 0000003e c0273000 00000001 =
00000000
82c0 c01002a0 c02b2b4b 00000000 c02b2b6f 0000000b c02734a0 c0273000 =
08000058
82e0 f000069c 000000ff 0000038c 00000000 f0823800 f0823800 f0823800 =
00000008
8300 002b2540 c025e000 00000000 009896b2 c02ac8c0 000068b8 80018820 =
fe5759ff
8320 fedf7e9e 191a4439 00400000 8c21c139 00004010 480809c0 02001400 =
18019539
8340 40100000 02c08008 0330e140 40520065 81520504 04005011 80b84802 =
c13c726a
8360 18063001 930041a3 9c108000 d0005c5d 01103100 000e0401 6880ac0f =
481c0013
8380 2002a400 10746000 0014210c 21a42505 00140100 10800111 82091500 =
08400045
83a0 0a000809 8084d301 020a0801 84090009 c00c0032 60021009 03300802 =
44000024
83c0 00001000 18028004 20420200 42244490 2080a200 8400c050 5514040d =
5e92a4c4
83e0 41004200 c0140400 d4801800 01014884 00080024 0018050a 42462014 =
04140204
8400 20440001 02001010 00000810 90003801 02694100 bb58560c 00000000 =
00000000
8420 c3fc8500 c0105c38 00000000 00000000 00000000 00000000 00000000 =
00000000
8440 c011a84c c011a850 20420200 42244490 00279000 00000000 c0278040 =
c0278064
8460 00000000 c0278204 00000000 00000000 00000000 c3fc8470 00000000 =
00000000
8480 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
84a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
84c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
84e0 00000000 00000000 00000000 c0105c48 00000000 00000000 00000000 =
00000000
8500 c02ac000 00000000 c02ac640 00000000 00000000 00000000 00000000 =
00000000
8520 00000000 00000000 00000000 c01002b4 00000000 00000000 00000000 =
00000000
8540 00000000 00000000 00000000 00000000 c3fc8000 c027860c c02ac000 =
00000000
8560 c02ac640 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
8580 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
85a0 00000000 00000000 00000000 c028d0d8 00000000 00000000 00000000 =
00000000
85c0 c02ac640 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
85e0 00000000 00000000 00000000 c029ed20 00000000 00000000 00000000 =
00000000
8600 fc4ff000 c02c7800 c02ca000 c025e000 c02c6000 00000000 c02ac640 =
00000000
8620 00000000 00000000 00000000 c029f560 00000000 00000000 00000000 =
00000000
8640 c02ca000 c025e000 c02c6000 00000000 c02ac640 c3ffec20 00000000 =
00000000
8660 00000000 00000000 00000000 c02a29fc 00000000 00000000 00000000 =
00000000
8680 c02ca000 c025e000 c02c6000 00000000 c02ac640 c02736b0 c3fc30a0 =
00000000
86a0 00000000 00000000 00000000 c0109b90 00000000 00000000 00000000 =
00000000
86c0 00000000 00000000 fffbe000 00000003 00000023 c3fc47e0 00000000 =
c02a8698
86e0 c02c6b30 00000000 00000000 c0109b90 00000000 00000000 00000000 =
00000000
8700 00000006 c02a8930 c02c6bf0 c3fcf1a0 f0800000 00000001 c0251804 =
c0251808
8720 00000000 00000000 00000000 c029f930 00000000 00000000 00000000 =
00000000
8740 c02c6b30 00000000 c3fcf1a0 00000000 c3fcf1a0 f0824804 c025c424 =
c025c400
8760 001a5a59 001a5a59 c028d8e0 c02a297c c02c7800 c02c6800 c0265000 =
c02c6b30
8780 c02a8930 c02c6bf0 f0824800 00000000 00000001 00000000 00000041 =
00000058
87a0 ffffffff 001a5a59 c028d8e0 c3fc8788 c02c7800 c02c6800 c0265000 =
00000058
87c0 f0824800 f0824804 c3fc8764 c3fcf1a0 f0824800 c3fcf1a0 c025c423 =
c0273000
87e0 00000001 c02b2b71 00000004 c011a85c 00000022 c02b2b71 0000000b =
c02734a0
8800 00000000 0004000a c02734a0 0000000b 00000032 0000003c 0000003e =
c0273000
8820 00000001 c02b2b7d 00000004 c02b2b4b 00000031 c02b2b7d 0000000b =
c02734a0
8840 c0273000 08000058 f000069c 000000ff 0000038c 00000000 f0823800 =
f0823800
8860 f0823800 00000008 c3fc3120 c3fce220 00000000 009896b2 c3fc8a40 =
000068b8
8880 80018820 fe5759ff fc4ff000 c02c7800 c02c6800 c0265000 00000058 =
f0824800
88a0 f0824804 18019539 40100000 02c08008 0330e140 40520065 81520504 =
04005011
88c0 80b84802 c13c726a 18063001 930041a3 9c108000 d0005c5d 01103100 =
000e0401
88e0 6880ac0f 481c0013 2002a400 c02a2620 0014210c 21a42505 00140100 =
10800111
8900 00000058 f0824800 c3fc3120 c3fce220 c3fc8788 84090009 c00c0032 =
60021009
8920 03300802 44000024 00001000 c02a2380 20420200 42244490 2080a200 =
8400c050
8940 0000000c c3fc8788 41004200 c0140400 d4801800 01014884 00080024 =
0018050a
8960 42462014 04140204 20440001 c02a2478 00000810 90003801 02694100 =
bb58560c

High Priority Machine Check (HPMC): Code=3D1 regs=3Dc0266080 =
(Addr=3D00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001011
r0-3     00000000 c01dd800 c02a24b8 c3fc8788
r4-7     0000002c c3fce220 f0824800 ffffffdf
r8-11    ffffffff 00000000 c028d8e0 001a5a59
r12-15   001a5a59 000ff000 f000015c 00000000
r16-19   00000001 08000058 f000069c 0000000b
r20-23   000000ff 00000041 c3fc3000 0000000b
r24-27   ffffffff f0824800 f0824800 c025e000
r28-31   000000ff 00000080 c3fc8980 c012c984
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c01dd94c c01dd950
 IIR: e840c000    ISR: 00000000  IOR: c02a24b8
ORIG_R28: 00000000

------=_NextPart_000_0090_01C0B972.C1511260--
