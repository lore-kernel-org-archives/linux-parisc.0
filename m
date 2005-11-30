From: Thomas Klinger <th.klinger@gmail.com>
Subject: [parisc-linux] FLT CBFB on B1000 when accessing second graphics card
Date: Wed, 30 Nov 2005 15:21:17 +0100
Message-ID: <a4743ac50511300621i1f7ed34eq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

I'm trying to setup Debian 3.1r0a (sarge) on a B1000 with two graphics
card. The first one is the original A4977A Visualize EG rev. 03, as
more powerful display card for the graphical desktop we installed a
Matrox Millenium II with 2MB RAM. We inserted the card at slot number
5, the first 32-bit slot for PCI devices and marked as secondary
graphic card slot.

Now, the setup and everything else went through smoothly, even the
first setup of the X server using the original display card went
pretty fine, but only with 8-bit colors. That's why we built in the
Matrox card. It is recognized by the system and displayed using lspci.

What comes now is that if we try to start the X server using the
second card the system switches the card and immediatly fails with the
error code FLT CBFB (shown in the front LCD display).

I posted the symptom to debian-hppa and was then forwared by Grant
Grundler to this mailing list to post my concern.

The goal of the system is to boot the system with the original card
(as is does already), but use the secondary card (Matrox in that case)
as display for the desktop environment in 16-bit colors, at least.

Here are the required informations like kernel version, used hardware
and hex dump of HPMC:

Kernel version: 2.6.8-2-32-smp #1 SMP parisc GNU/Linux (Debian 3.1r0a)
Hardware: HP Visualize 9000/785/B1000
Remote card: no
Graphical console in use
Palo command line: 2/vmlinux root=3D/dev/sda7 initrd=3D2/initrd.img HOME=3D=
/
Kernel is 32-bit (according the versioning, not modified or self-compiled)

Register dumps:
PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information -----------------

Timestamp =3D
  Mon Nov  28 16:24:09 GMT 2005    (20: 05: 11: 28: 16: 24: 09)

HPMC Chassis Codes =3D 2cbd0  2500b  2cbfb

General Registers 0 - 31
00-03   0000000000000000  0000000000822218  000000000027da2b  000000000085e=
9a8
04-07   0000000000000ff1  0000000040158ff1  0000000000000001  000000000085e=
9a8
08-11   00000000006ed000  000000000085e9a8  0000000000000000  0000000000000=
002
12-15   00000000007c2a18  00000000006e4800  00000000008485f0  00000000bff00=
168
16-19   00000000007c7218  0000000000000005  0000000000000002  0000000049814=
a58
20-23   0000000040158000  0000000000000001  0000000000000005  0000000000000=
001
24-27   0000000000000001  0000000040158ff1  000000000085e9a8  00000000007af=
a18
28-31   000000000085e9a8  0000000000000151  00000000bff10800  000000004079d=
dbf

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000=
000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000=
000
08-11   0000000000001f4c  0000000000000000  00000000000000c0  0000000000000=
01b
12-15   0000000000000000  0000000000000000  0000000000110000  00000000fe000=
000
16-19   0000004a72fabf1c  0000000000000fa6  000000004073fba3  000000000ca01=
014
20-23   00000000a607ffe4  4000000005d58ff1  000000000006000f  0000000080000=
000
24-27   00000000003eb000  000000001c82c000  00000000ffffffff  00000000fffff=
fff
28-31   00000000ffffffff  00000000ffffffff  000000002c5dc000  0000000010468=
000
Space Registers 0 - 7

00-03   00000000          00000fa6          00000000          00000fa6
04-07   00000fa6          00000fa6          00000fa6          00000fa6

IIA Space                    =3D 0x0000000000000fa6
IIA Offset                   =3D 0x000000004073fba7
Check Type                   =3D 0x20000000
CPU State                    =3D 0x9e000004
Cache Check                  =3D 0x00000000
TLB Check                    =3D 0x00000000
Bus Check                    =3D 0x0030103b
Assist Check                 =3D 0x00000000
Assist State                 =3D 0x00000000
Path Info                    =3D 0x00000000
System Responder Address     =3D 0x000000fff9017ff1
System Requestor Address     =3D 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000000000000000  0000000000000000  0000000000000=
000
04-07   4084d00000000000  101313a4101ad880  2fad014b00000001  0000000000000=
000
08-11   2faede4000000002  2faea00000000002  00000000103f11d0  10934058103f1=
000
12-15   2faeeab800000002  2faea00000000002  0000000010468000  0000000010109=
448
16-19   0000000f103f22e0  0000000f103f22e0  0000000000000000  0000000100000=
01f
20-23   f0000174f000017c  1046f8101018d340  0000000000000013  0000001300000=
000
24-27   0000000100000000  3fe0000000000000  412e848000000000  000000002edd3=
57c
28-31   2f4eea202fae9bc0  00000000101a8ccc  000000001048b810  109340673b9ac=
a00


=B49000/785 B,C,J Workstation Unarchitected (per-CPU)=B4, rev 1, 140 bytes:

Check Summary                =3D 0xcb81041008000000
Available Memory             =3D 0x0000000020000000
CPU Diagnose Register 2      =3D 0x0201000000000004
CPU Status Register 0        =3D 0x2420c20000000000
CPU Status Register 1        =3D 0x8002000000000000
SADD LOG                     =3D 0x00c0000000000000
Read Short LOG               =3D 0xc18400fff9017ff1
ERROR_STATUS                 =3D 0x0000000000100010
MEM_ADDR                     =3D 0x000001ff3fffffff
MEM_SYND                     =3D 0x0000000000000000
MEM_ADDR_CORR                =3D 0x000001ff3fffffff
MEM_SYND_CORR                =3D 0x0000000000000000
RUN_DATA_HIGH                =3D 0xc1bff0fffed08040
RUN_DATA_LOW                 =3D 0xc1bff0fffed08040
RUN_CTRL                     =3D 0x0000021c00001418
RUN_ADDR                     =3D 0xc1bff0fffed08040
System Responder Path        =3D 0x00ffffffffffffff


HPMC PIM Analysis Information:

Timestamp =3D
  Mon Nov  28 16:24:09 GMT 2005    (20:05:11:28:16:24:09)


=B49000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)=B4, rev 0, 1304 b=
ytes:

A Data I/O Fetch Timeout occured while CPU 0 was
requesting information from a device with the address 0xfff9017ff1.


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observerd the Broadcast Error.  It did not lo=
g
any additional information about the HPMC.

(LPMC Information: everything's 0)

Memory Error Log Information:

No memory errors logged

I/O Module Error Log Information:


Timestamp =3D
  Mon Nov  28 16:24:09 GMT 2005    (20:05:11:28:16:24:09)


=B49000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)=B4, rev 0, 228 by=
tes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    0x0003e000   0x1e0cc009   0x00000000f9017ff0
   2    ----------   0x2e0cc009   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    0x00000000   0x3e0cc009   0x00000000fed38048
   5    ----------   0x5e0cc009   ------------------
   6    0x00000000   0x6e0cc009   0x00000000fed3c048
   7    ----------   0x7e0cc009   ------------------

System.map: http://www.badongo.com/file.php?file=3DSystem.map+B1000__2005-1=
1-30_System.map.bz2

I hope the information I provided is quite near what you expected to
get reported.

Regards, Thomas
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
