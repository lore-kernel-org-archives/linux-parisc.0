Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA06888
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 15:30:03 -0700
Message-ID: <5956ED8F0362D111B32F0000F881B6EB0600438E@nrtpde0c.us.nortel.com>
From: "Robert Duncan" <rlduncan@nortelnetworks.com>
To: parisc-linux@thepuffingroup.com
Date: Wed, 15 Nov 2000 17:28:13 -0500
MIME-Version: 1.0
Content-Type: multipart/alternative;
              boundary="----_=_NextPart_001_01C04F53.576F0F70"
Subject: [parisc-linux] CD-ROM 715/50 boot dies after serial driver...
List-ID: <linux-parisc.vger.kernel.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C04F53.576F0F70
Content-Type: text/plain;
	charset="iso-8859-1"

Greetings,
I have downloaded the .5 Beta CDROM image, burned it and get a "fault in
kernel" after the "Serial driver ... enabled" message when booting on my
715/50.  This happens with either graphics or serial console configured in
NVRAM.

Has anyone else seen this error?

----------------begin console output
              (c) Copyright Hewlett-Packard Company, 1991, 1992
Portions of this code are (c) Copyright Samsung Electronics Co., Ltd, 91, 92


PDC ROM rev. 1.2
IODC ROM rev. 1.1
64 MB of memory have been configured.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.....

Booting from:     scsi.6.0     TOSHIBA CD-ROM XM-3501TA

Soft booted.
palo ipl bame@noam Tue Oct 31 14:18:02 MST 2000
0/vmlinux 2140145 bytes @ 0x6f9800
0/palo-cmdline '0/vmlinux ROOT=/ TERM=LINUX root=/dev/scd0'
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100150 first 00100000 n 4
Segment 0 load 00100000 size 1460344 mediaptr 0x1000
Segment 1 load 00266000 size 179048 mediaptr 0x166000
Segment 2 load 00294000 size 109876 mediaptr 0x192000
Segment 3 load 002b0000 size 8192 mediaptr 0x1ad000
branching to kernel entry point 0x00100150
PDC Console Initialized
The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02da000
(0x504d6c,0x504d6c,0x0,0x0)
PALO command line: 'ROOT=/ TERM=LINUX root=/dev/scd0'
PALO initrd 0-0
model   00003100 00000481 00000000 00000000 77a94524 ffffffff 00000004
0000000a 0000000a
vers    00000009
CPUID vers 0 rev 0
Searching for devices in PDC firmware... processor hpa 0xfffbe000
 an older box...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0, 0x77,
0x0, 0x0
2. Scorpio Core BA (11) at 0xf082f000, versions 0x7, 0x0, 0x70, 0x0, 0x0
3. Scorpio Core SCSI (10) at 0xf0825000, versions 0x7, 0x0, 0x71, 0x0, 0x0
4. Scorpio Core LAN (802.3) (10) at 0xf0826000, versions 0x7, 0x0, 0x72,
0x0, 0x0
5. Scorpio Core HIL (10) at 0xf0821000, versions 0x7, 0x0, 0x73, 0x0, 0x0
6. Scorpio Core RS-232 (10) at 0xf0823000, versions 0x7, 0x0, 0x75, 0x0, 0x0
7. Scorpio Core RS-232 (10) at 0xf0822000, versions 0x7, 0x0, 0x75, 0x0, 0x0
8. Scorpio Core Centronics (10) at 0xf0824000, versions 0x7, 0x0, 0x74, 0x0,
0x0
9. Scorpio Audio (10) at 0xf1000000, versions 0x7, 0x0, 0x7b, 0x0, 0x0
10. Scorpio EISA BA (11) at 0xfc000000, versions 0x7, 0x0, 0x76, 0x0, 0x0
11. Scorpio (715/50) (0) at 0xfffbe000, versions 0x310, 0x0, 0x4, 0x0, 0x81
12. Scorpio (1) at 0xfffbf000, versions 0x17, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
CPU(s): 1 x PA7100 (PCX-T) at 50.000000 MHz
Linux version 2.4.0-test6 (pjlahaie@elenuial.thepuffingroup.com) (gcc
version 2.96 20000925 (experimental)) #32 Mon Nov 6 10:20:58 EST 2000
free_bootmem(0x2da800, 0x3d25800)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 16384
zone(0): 8192 pages.
zone(1): 8192 pages.
zone(2): 0 pages.
Kernel command line: ROOT=/ TERM=LINUX root=/dev/scd0
trap_init
Calibrating delay loop... 49.77 BogoMIPS
Memory: 61388k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
Found i82596 at 0xf0826000, IRQ 87
early initialization of device eth0 is deferred
Found HIL at 0xf0821000, IRQ 94
HIL: no keyboard present.
Warning : device (10, 0x7, 0x0, 0x73, 0x0) NOT claimed by HIL 712, 715 or
similiar
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
Starting kswapd v1.7
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
sim700: Couldn't get consistent shared memory
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86
scsi0: Revision 0x0
Post test1, istat 05, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: WARNING: target data areas are not dma coherent!
scsi0: test 1 completed ok.
scsi0: sim700_intr_handle() called with no interrupt
scsi0 : LASI/Simple 53c7xx
scsi : 1 host.
  Vendor: TOSHIBA   Model: CD-ROM XM-3501TA  Rev: 3054
  Type:   CD-ROM                             ANSI SCSI revision: 02
Detected scsi CD-ROM sr0 at scsi0, channel 0, id 6, lun 0
scsi : detected 1 SCSI cdrom total.
Uniform CD-ROM driver Revision: 3.11
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 42 1B 37 IRQ 87.
82596.c $Revision: 1.14 $
Serial driver version 5.01 (2000-05-29) with MANY_PORTS SHARE_IRQ SERIAL_PCI
enabled

Dumping Stack from c3fc4000 to c3fc4bc0:
4000 00000000 00000140 00000000 00000000 c027a46c 00000001 00000000 ffffffff
4020 00000000 00000000 00000000 00000000 00000000 00000000 ffffffff c027a384
 [...]
4ba0 ffffffff bffff5ff ffffff7f c01046e0 ffffbeff f7b7eddf 5fffffdf feefffff

Data access rights fault in kernel: Code=26 regs=c3fc4980 (Addr=00000003)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001010
r0-3     00000000 c0221800 c011e9f8 c3fce420
r4-7     c3fce200 c0244f10 00000008 f0823800
r8-11    00000003 00000007 c0191568 c02c60a4
r12-15   fffffffc c0245000 c0245000 c02d72b8
r16-19   c0245000 c0245000 c02c6028 00000000
r20-23   c3fce234 f0823807 f0823800 0000000a
r24-27   ffffffff c3fce420 c3fce200 c0266000
r28-31   ffffffff 00000240 c3fc4bc0 c012dfc0
sr0-4    00000000 00000000 00000000 00000000
sr4-8    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c011e710 c011e714
 IIR: 0f881093    ISR: 00000000  IOR: 00000003
ORIG_R28: 00000058

----------------end console output

thanks,
Robert Duncan
Nortelnetworks

------_=_NextPart_001_01C04F53.576F0F70
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2652.35">
<TITLE>CD-ROM 715/50 boot dies after serial driver...</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Greetings,</FONT>
<BR><FONT SIZE=3D2>I have downloaded the .5 Beta CDROM image, burned it =
and get a &quot;fault in kernel&quot; after the &quot;Serial driver ... =
enabled&quot; message when booting on my 715/50.&nbsp; This happens =
with either graphics or serial console configured in NVRAM.</FONT></P>

<P><FONT SIZE=3D2>Has anyone else seen this error?</FONT>
</P>

<P><FONT SIZE=3D2>----------------begin console output</FONT>
<BR><FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; (c) Copyright Hewlett-Packard Company, 1991, =
1992</FONT>
<BR><FONT SIZE=3D2>Portions of this code are (c) Copyright Samsung =
Electronics Co., Ltd, 91, 92 </FONT>
</P>

<P><FONT SIZE=3D2>PDC ROM rev. 1.2</FONT>
<BR><FONT SIZE=3D2>IODC ROM rev. 1.1</FONT>
<BR><FONT SIZE=3D2>64 MB of memory have been configured.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Selecting a system to boot.</FONT>
<BR><FONT SIZE=3D2>To stop selection process, press and hold the ESCAPE =
key.....</FONT>
</P>

<P><FONT SIZE=3D2>Booting from:&nbsp;&nbsp;&nbsp;&nbsp; =
scsi.6.0&nbsp;&nbsp;&nbsp;&nbsp; TOSHIBA CD-ROM XM-3501TA</FONT>
</P>

<P><FONT SIZE=3D2>Soft booted.</FONT>
<BR><FONT SIZE=3D2>palo ipl bame@noam Tue Oct 31 14:18:02 MST =
2000</FONT>
<BR><FONT SIZE=3D2>0/vmlinux 2140145 bytes @ 0x6f9800</FONT>
<BR><FONT SIZE=3D2>0/palo-cmdline '0/vmlinux ROOT=3D/ TERM=3DLINUX =
root=3D/dev/scd0'</FONT>
<BR><FONT SIZE=3D2>Kernel: partition 0 file /vmlinux</FONT>
<BR><FONT SIZE=3D2>ELF32 executable</FONT>
</P>

<P><FONT SIZE=3D2>Entry 00100150 first 00100000 n 4</FONT>
<BR><FONT SIZE=3D2>Segment 0 load 00100000 size 1460344 mediaptr =
0x1000</FONT>
<BR><FONT SIZE=3D2>Segment 1 load 00266000 size 179048 mediaptr =
0x166000</FONT>
<BR><FONT SIZE=3D2>Segment 2 load 00294000 size 109876 mediaptr =
0x192000</FONT>
<BR><FONT SIZE=3D2>Segment 3 load 002b0000 size 8192 mediaptr =
0x1ad000</FONT>
<BR><FONT SIZE=3D2>branching to kernel entry point 0x00100150</FONT>
<BR><FONT SIZE=3D2>PDC Console Initialized</FONT>
<BR><FONT SIZE=3D2>The 32-bit Kernel has started...</FONT>
<BR><FONT SIZE=3D2>Enabled FP coprocessor</FONT>
<BR><FONT SIZE=3D2>Free memory starts at: 0xc02da000</FONT>
<BR><FONT SIZE=3D2>(0x504d6c,0x504d6c,0x0,0x0)</FONT>
<BR><FONT SIZE=3D2>PALO command line: 'ROOT=3D/ TERM=3DLINUX =
root=3D/dev/scd0'</FONT>
<BR><FONT SIZE=3D2>PALO initrd 0-0</FONT>
<BR><FONT SIZE=3D2>model&nbsp;&nbsp; 00003100 00000481 00000000 =
00000000 77a94524 ffffffff 00000004 0000000a 0000000a</FONT>
<BR><FONT SIZE=3D2>vers&nbsp;&nbsp;&nbsp; 00000009</FONT>
<BR><FONT SIZE=3D2>CPUID vers 0 rev 0</FONT>
<BR><FONT SIZE=3D2>Searching for devices in PDC firmware... processor =
hpa 0xfffbe000</FONT>
<BR><FONT SIZE=3D2>&nbsp;an older box...</FONT>
<BR><FONT SIZE=3D2>Found devices:</FONT>
<BR><FONT SIZE=3D2>1. Stinger Optional Graphics (10) at 0xf4000000, =
versions 0x6, 0x0, 0x77, 0x0, 0x0</FONT>
<BR><FONT SIZE=3D2>2. Scorpio Core BA (11) at 0xf082f000, versions 0x7, =
0x0, 0x70, 0x0, 0x0</FONT>
<BR><FONT SIZE=3D2>3. Scorpio Core SCSI (10) at 0xf0825000, versions =
0x7, 0x0, 0x71, 0x0, 0x0</FONT>
<BR><FONT SIZE=3D2>4. Scorpio Core LAN (802.3) (10) at 0xf0826000, =
versions 0x7, 0x0, 0x72, 0x0, 0x0</FONT>
<BR><FONT SIZE=3D2>5. Scorpio Core HIL (10) at 0xf0821000, versions =
0x7, 0x0, 0x73, 0x0, 0x0</FONT>
<BR><FONT SIZE=3D2>6. Scorpio Core RS-232 (10) at 0xf0823000, versions =
0x7, 0x0, 0x75, 0x0, 0x0</FONT>
<BR><FONT SIZE=3D2>7. Scorpio Core RS-232 (10) at 0xf0822000, versions =
0x7, 0x0, 0x75, 0x0, 0x0</FONT>
<BR><FONT SIZE=3D2>8. Scorpio Core Centronics (10) at 0xf0824000, =
versions 0x7, 0x0, 0x74, 0x0, 0x0</FONT>
<BR><FONT SIZE=3D2>9. Scorpio Audio (10) at 0xf1000000, versions 0x7, =
0x0, 0x7b, 0x0, 0x0</FONT>
<BR><FONT SIZE=3D2>10. Scorpio EISA BA (11) at 0xfc000000, versions =
0x7, 0x0, 0x76, 0x0, 0x0</FONT>
<BR><FONT SIZE=3D2>11. Scorpio (715/50) (0) at 0xfffbe000, versions =
0x310, 0x0, 0x4, 0x0, 0x81</FONT>
<BR><FONT SIZE=3D2>12. Scorpio (1) at 0xfffbf000, versions 0x17, 0x0, =
0x9, 0x0, 0x0</FONT>
<BR><FONT SIZE=3D2>That's a total of 12 devices.</FONT>
<BR><FONT SIZE=3D2>CPU(s): 1 x PA7100 (PCX-T) at 50.000000 MHz</FONT>
<BR><FONT SIZE=3D2>Linux version 2.4.0-test6 =
(pjlahaie@elenuial.thepuffingroup.com) (gcc version 2.96 20000925 =
(experimental)) #32 Mon Nov 6 10:20:58 EST 2000</FONT></P>

<P><FONT SIZE=3D2>free_bootmem(0x2da800, 0x3d25800)</FONT>
<BR><FONT SIZE=3D2>initrd: 00000000-00000000</FONT>
<BR><FONT SIZE=3D2>pagetable_init</FONT>
<BR><FONT SIZE=3D2>On node 0 totalpages: 16384</FONT>
<BR><FONT SIZE=3D2>zone(0): 8192 pages.</FONT>
<BR><FONT SIZE=3D2>zone(1): 8192 pages.</FONT>
<BR><FONT SIZE=3D2>zone(2): 0 pages.</FONT>
<BR><FONT SIZE=3D2>Kernel command line: ROOT=3D/ TERM=3DLINUX =
root=3D/dev/scd0</FONT>
<BR><FONT SIZE=3D2>trap_init</FONT>
<BR><FONT SIZE=3D2>Calibrating delay loop... 49.77 BogoMIPS</FONT>
<BR><FONT SIZE=3D2>Memory: 61388k available</FONT>
<BR><FONT SIZE=3D2>Dentry-cache hash table entries: 8192 (order: 4, =
65536 bytes)</FONT>
<BR><FONT SIZE=3D2>Buffer-cache hash table entries: 4096 (order: 2, =
16384 bytes)</FONT>
<BR><FONT SIZE=3D2>Page-cache hash table entries: 16384 (order: 4, =
65536 bytes)</FONT>
<BR><FONT SIZE=3D2>Inode-cache hash table entries: 4096 (order: 3, =
32768 bytes)</FONT>
<BR><FONT SIZE=3D2>POSIX conformance testing by UNIFIX</FONT>
<BR><FONT SIZE=3D2>ASP version 1 at 0xf0800000 found.</FONT>
<BR><FONT SIZE=3D2>Found i82596 at 0xf0826000, IRQ 87</FONT>
<BR><FONT SIZE=3D2>early initialization of device eth0 is =
deferred</FONT>
<BR><FONT SIZE=3D2>Found HIL at 0xf0821000, IRQ 94</FONT>
<BR><FONT SIZE=3D2>HIL: no keyboard present.</FONT>
<BR><FONT SIZE=3D2>Warning : device (10, 0x7, 0x0, 0x73, 0x0) NOT =
claimed by HIL 712, 715 or similiar</FONT>
<BR><FONT SIZE=3D2>Linux NET4.0 for Linux 2.4</FONT>
<BR><FONT SIZE=3D2>Based upon Swansea University Computer Society =
NET3.039</FONT>
<BR><FONT SIZE=3D2>NET4: Unix domain sockets 1.0/SMP for Linux =
NET4.0.</FONT>
<BR><FONT SIZE=3D2>NET4: Linux TCP/IP 1.0 for NET4.0</FONT>
<BR><FONT SIZE=3D2>IP Protocols: ICMP, UDP, TCP</FONT>
<BR><FONT SIZE=3D2>IP: routing cache hash table of 512 buckets, =
4Kbytes</FONT>
<BR><FONT SIZE=3D2>TCP: Hash tables configured (established 4096 bind =
4096)</FONT>
<BR><FONT SIZE=3D2>Starting kswapd v1.7</FONT>
<BR><FONT SIZE=3D2>pty: 256 Unix98 ptys configured</FONT>
<BR><FONT SIZE=3D2>lp: driver loaded but no devices found</FONT>
<BR><FONT SIZE=3D2>RAMDISK driver initialized: 16 RAM disks of 4096K =
size 1024 blocksize</FONT>
<BR><FONT SIZE=3D2>sim700: Couldn't get consistent shared memory</FONT>
<BR><FONT SIZE=3D2>sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, =
IRQ 86</FONT>
<BR><FONT SIZE=3D2>scsi0: Revision 0x0</FONT>
<BR><FONT SIZE=3D2>Post test1, istat 05, sstat0 00, dstat 84</FONT>
<BR><FONT SIZE=3D2>sim700: WARNING IRQ probe failed, (returned =
0)</FONT>
<BR><FONT SIZE=3D2>scsi0: WARNING: target data areas are not dma =
coherent!</FONT>
<BR><FONT SIZE=3D2>scsi0: test 1 completed ok.</FONT>
<BR><FONT SIZE=3D2>scsi0: sim700_intr_handle() called with no =
interrupt</FONT>
<BR><FONT SIZE=3D2>scsi0 : LASI/Simple 53c7xx</FONT>
<BR><FONT SIZE=3D2>scsi : 1 host.</FONT>
<BR><FONT SIZE=3D2>&nbsp; Vendor: TOSHIBA&nbsp;&nbsp; Model: CD-ROM =
XM-3501TA&nbsp; Rev: 3054</FONT>
<BR><FONT SIZE=3D2>&nbsp; Type:&nbsp;&nbsp; =
CD-ROM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ANSI SCSI revision: 02</FONT>
<BR><FONT SIZE=3D2>Detected scsi CD-ROM sr0 at scsi0, channel 0, id 6, =
lun 0</FONT>
<BR><FONT SIZE=3D2>scsi : detected 1 SCSI cdrom total.</FONT>
<BR><FONT SIZE=3D2>Uniform CD-ROM driver Revision: 3.11</FONT>
<BR><FONT SIZE=3D2>82596.c: MAC of HP700 LAN blindely read from the =
prom!</FONT>
<BR><FONT SIZE=3D2>eth0: Couldn't get consistent shared memory</FONT>
<BR><FONT SIZE=3D2>eth0: 82596 at 0xf0826000, 08 00 09 42 1B 37 IRQ =
87.</FONT>
<BR><FONT SIZE=3D2>82596.c $Revision: 1.14 $</FONT>
<BR><FONT SIZE=3D2>Serial driver version 5.01 (2000-05-29) with =
MANY_PORTS SHARE_IRQ SERIAL_PCI enabled</FONT>
</P>

<P><FONT SIZE=3D2>Dumping Stack from c3fc4000 to c3fc4bc0:</FONT>
<BR><FONT SIZE=3D2>4000 00000000 00000140 00000000 00000000 c027a46c =
00000001 00000000 ffffffff</FONT>
<BR><FONT SIZE=3D2>4020 00000000 00000000 00000000 00000000 00000000 =
00000000 ffffffff c027a384</FONT>
<BR><FONT SIZE=3D2>&nbsp;[...]</FONT>
<BR><FONT SIZE=3D2>4ba0 ffffffff bffff5ff ffffff7f c01046e0 ffffbeff =
f7b7eddf 5fffffdf feefffff</FONT>
</P>

<P><FONT SIZE=3D2>Data access rights fault in kernel: Code=3D26 =
regs=3Dc3fc4980 (Addr=3D00000003)</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp; =
YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI</FONT>
<BR><FONT SIZE=3D2>PSW: 00000000000001000000000000001010</FONT>
<BR><FONT SIZE=3D2>r0-3&nbsp;&nbsp;&nbsp;&nbsp; 00000000 c0221800 =
c011e9f8 c3fce420</FONT>
<BR><FONT SIZE=3D2>r4-7&nbsp;&nbsp;&nbsp;&nbsp; c3fce200 c0244f10 =
00000008 f0823800</FONT>
<BR><FONT SIZE=3D2>r8-11&nbsp;&nbsp;&nbsp; 00000003 00000007 c0191568 =
c02c60a4</FONT>
<BR><FONT SIZE=3D2>r12-15&nbsp;&nbsp; fffffffc c0245000 c0245000 =
c02d72b8</FONT>
<BR><FONT SIZE=3D2>r16-19&nbsp;&nbsp; c0245000 c0245000 c02c6028 =
00000000</FONT>
<BR><FONT SIZE=3D2>r20-23&nbsp;&nbsp; c3fce234 f0823807 f0823800 =
0000000a</FONT>
<BR><FONT SIZE=3D2>r24-27&nbsp;&nbsp; ffffffff c3fce420 c3fce200 =
c0266000</FONT>
<BR><FONT SIZE=3D2>r28-31&nbsp;&nbsp; ffffffff 00000240 c3fc4bc0 =
c012dfc0</FONT>
<BR><FONT SIZE=3D2>sr0-4&nbsp;&nbsp;&nbsp; 00000000 00000000 00000000 =
00000000</FONT>
<BR><FONT SIZE=3D2>sr4-8&nbsp;&nbsp;&nbsp; 00000000 00000000 00000000 =
00000000</FONT>
</P>

<P><FONT SIZE=3D2>IASQ: 00000000 00000000 IAOQ: c011e710 =
c011e714</FONT>
<BR><FONT SIZE=3D2>&nbsp;IIR: 0f881093&nbsp;&nbsp;&nbsp; ISR: =
00000000&nbsp; IOR: 00000003</FONT>
<BR><FONT SIZE=3D2>ORIG_R28: 00000058</FONT>
</P>

<P><FONT SIZE=3D2>----------------end console output</FONT>
</P>

<P><FONT SIZE=3D2>thanks,</FONT>
<BR><FONT SIZE=3D2>Robert Duncan</FONT>
<BR><FONT SIZE=3D2>Nortelnetworks</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C04F53.576F0F70--
