Return-Path: <epotter@eep.burdell.org>
Received: from keymaster (dsl027-162-176.atl1.dsl.speakeasy.net
	[216.27.162.176])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68D554855
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 14 Feb 2004 22:58:55 -0700 (MST)
Received: from keymaster (localhost [127.0.0.1])
	by keymaster (8.12.9/8.12.9) with ESMTP id i1F5sSiD013002
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 15 Feb 2004 00:54:28 -0500 (EST)
Received: from localhost (epotter@localhost)
	by keymaster (8.12.9/8.12.9/Submit) with ESMTP id i1F5sSZi012999
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 15 Feb 2004 00:54:28 -0500 (EST)
Date: Sun, 15 Feb 2004 00:54:28 -0500 (EST)
From: Elliott Potter <epotter@eep.burdell.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.GSO.4.44.0402150044380.12979-100000@keymaster>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] kernel dies: [Was: C3000 video options]
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Well ... I'm working on this PCI graphics card problem, and needed to
recompile the kernel.  I got the 2.4.24-pa0 kernel and built it, but
when I boot I get:

[...]
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000 [10], versions 0x582, 0x0,
0xb
2. Elroy PCI Bridge (13) at 0xfed30000 [10/0], versions 0x782, 0x0, 0xa
3. Elroy PCI Bridge (13) at 0xfed32000 [10/1], versions 0x782, 0x0, 0xa
4. Elroy PCI Bridge (13) at 0xfed38000 [10/4], versions 0x782, 0x0, 0xa
5. Elroy PCI Bridge (13) at 0xfed3c000 [10/6], versions 0x782, 0x0, 0xa
6. AllegroHigh W (0) at 0xfffa0000 [32], versions 0x5bb, 0x0, 0x4
7. Memory (1) at 0xfed10200 [49], versions 0x86, 0x0, 0x9
CPU(s): 1 x PA8500 (PCX-W) at 400.000000 MHz
SBA found Astro 2.1 at 0xfed00000
lba version TR2.1 (0x2) found at 0xfed30000
PCI: Ignoring BAR0-3 of IDE controller 00:0e.0
lba version TR2.1 (0x2) found at 0xfed32000
lba version TR2.1 (0x2) found at 0xfed38000
lba version TR2.1 (0x2) found at 0xfed3c000
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch enabled, polling @ 0xf0400804.
Starting kswapd
Journalled Block Device driver loaded
matroxfb: Matrox Millennium (PCI) detected

Stack Dump:
 11b38880:  0004ff0f 1039d778 00000000 10398010
 11b38870:  00000000 10232234 1035af00 00000000
 11b38860:  11b3e400 00000000 11b38000 102dcc0c
 11b38850:  10305810 00800000 0000000f 1035ae34
 11b38840:  1035b0b8 00000000 00000000 00000000
 11b38830:  00000000 1021d660 00000000 00000007

Kernel addresses on the stack:
 [<10232234>]  [<1021d660>]  [<1022c010>]  [<1022cc78>]
 [<10139068>]  [<1021d054>]  [<1021d11c>]  [<101001a8>]
 [<10107c4c>]  [<10107cf4>]  [<10165bc4>]  [<10165bc4>]
 [<10166188>]  [<10166188>]  [<1010019c>]  [<10166418>]
 [<1011f8f0>]

Kernel Fault: Code=15 regs=11b38880 (Addr=f2001fde)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 1035b010 1022c098 00800000
r04-07  1035b0b8 1035ae34 1035b0b8 f2800000
r08-11  f2000000 1035a810 fffffffa 1035b010
r12-15  10309010 103d3ac8 00000000 f0400004
r16-19  f00008c4 f000017c f0000174 00000003
r20-23  f2000000 1035b0b8 00000001 11b38810
r24-27  f2800000 1035b7f0 00800000 102ee010
r28-31  00000000 fed32000 11b38880 1022c010
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1022bb44 1022bb48
 IIR: 62933fbc    ISR: 00000000  IOR: f2001fde
 CPU:        0   CR30: 11b38000 CR31: 103a8000
 ORIG_R28: 00000000

... and then it dies.  Searching on the internet for "Kernel Fault:
Code=15" I see a few e-mails that went around 3 or 4 years ago but
nothing current.  Does that mean this is a solved problem?



As far as making the Matrox Millennium go, the firmware doesn't appear
know what to do with the card, so it sticks to serial console.  From
there we can see:

information -> sysconfig says:
[...]
        I/O Slot  Card Type
        --------  -------------------------------
            1     empty
            2     empty
            3     empty
            4     empty
            5     empty
            6     VGA         Vendor ID = 0x102b  Device ID = 0x0519


information -> io says:
                                                                     IODC
IODC
Path         Decimal     Type                  Location   HVER SVER
Vers Dep
------------ ----------- --------------------- ---------- ---- ----
---- ----
LAN          10/0/12/0   Ethernet              built-in   0060 a200
0x02 0x00
AUDIO        10/0/13/0   Audio                 built-in
IDE          10/0/14/0   IDE                   built-in   0060 a300
0x00 0x00
SUPERIO MISC 10/0/14/1   Bridge Device         built-in
FLOPPY       10/0/14/1/0 Floppy Disk           built-in
SERIAL_1     10/0/14/1/1 RS232 Port            built-in   0060 8c00
0x01 0x00
SERIAL_2     10/0/14/1/2 RS232 Port            built-in   0060 8c00
0x01 0x00
PARALLEL     10/0/14/1/3 Parallel Port         built-in
USB          10/0/14/2   USB                   built-in   0060 a900
0x98 0x00
SCSI         10/0/15/0   SCSI                  built-in   0060 a300
0x00 0x00
FWSCSI       10/0/15/1   SCSI                  built-in   0060 a300
0x00 0x00
PCI6         10/1/6/0    VGA                   slot 6     (no firmware
driver)


(sorry about the wrapping; basically it sees the card, knows it's a VGA
card, but has no firmware driver for it).

And now it's 1am so I'm going to stop.  But my goal is to make this go
:)
--
Elliott
