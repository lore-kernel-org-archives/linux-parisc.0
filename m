Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2770C4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 13 Jan 2003 11:36:17 -0700 (MST)
Date: Mon, 13 Jan 2003 19:36:03 +0100
Message-ID: <3E1AA7C1000010F1@ocpmta7.freegates.net>
In-Reply-To: <20030110170905.GG26261@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] new gcc-default for hppa
To: "Randolph Chung" <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>> I do notice that unstable debian for i386 switch (or will very soon)
gcc-default
>> to gcc-3.2. Is it also true for hppa? (am I anxious about compiling ne=
w
>> kernel with this because of pb encounter with network connection)
>
>yes:
>
>tausq@auric:~$ madison gcc|grep unstable
>       gcc |    2:3.1-1 |      unstable | hurd-i386
>       gcc |  3:3.2.2-0 |      unstable | alpha, arm, hppa, i386, ia64,
m68k,
>mips, mipsel, powerpc, s390, sparc
>

Well as mentionned in another mail, I just compile the 2.4.20-pa21 with
this new release and it always compile well, always boot well but also as=

soon as a network connection is tempted the system still crash.

And ? it just printout Stack Dump: (thousand time) but nothing more??
Do I do again something wrong?

never the less, Here I got the pim info:
PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp =3D 
  Mon Jan  13 17:32:31 GMT 2003    (20:03:01:13:17:32:31)

HPMC Chassis Codes =3D 2cbf0  2500b  2cbfb  

General Registers 0 - 31
00-03   0000000000000000  0000000010340010  0000000010110850  00000000000=
000ff
04-07   0000000000000004  00000000000f4023  00000000103f7244  00000000103=
fa5c3
08-11   0000000000000060  0000000000000010  000000000000000e  00000000000=
00001
12-15   0000000010408010  000000000000000c  0000000000000005  00000000000=
69e0c
16-19   000000001ffb5cc0  0000000000069e0c  0000000000000004  fffffffffee=
00000
20-23   000000000000000e  00000000000003fd  0000000010111b84  00000000103=
43810
24-27   00000000000003fd  fffffffffee003fd  00000000100ba160  00000000103=
30010
28-31   0000000000000000  000000000001338a  000000001ffb6440  00000000101=
10850

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  00000000000=
00000
04-07   0000000000000000  0000000000000000  0000000000000000  00000000000=
00000
08-11   00000000000005be  0000000000000000  00000000000000c0  00000000000=
0001a
12-15   0000000000000000  0000000000000000  0000000000108000  00000000000=
00000
16-19   000000311b8e25f8  0000000000000000  0000000010111b94  000000000f2=
0001c
20-23   00000000a607fffb  c0000000802003fd  000000ff0004fe0c  00000000c20=
00000
24-27   000000000034c000  000000000dfbc000  0000000000044021  00000000f04=
12000
28-31   0000000055555555  0000000055555555  000000001f93c000  00000000103=
e8000
Space Registers 0 - 7

00-03   00000000          000002df          00000000          000002df
04-07   00000000          00000000          00000000          00000000

IIA Space                    =3D 0x0000000000000000
IIA Offset                   =3D 0x0000000010111b98
Check Type                   =3D 0x20000000
CPU State                    =3D 0x9e000004
Cache Check                  =3D 0x00000000
TLB Check                    =3D 0x00000000
Bus Check                    =3D 0x0030103b
Assists Check                =3D 0x00000000
Assist State                 =3D 0x00000000
Path Info                    =3D 0x00000000
System Responder Address     =3D 0x000000fffee003fd
System Requestor Address     =3D 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000000000000000  0000000000000000  00000000000=
00000
04-07   00000001103e2000  f00000001014ec28  1032100000000000  00000000000=
00000
08-11   1034b02000000002  0000000200000002  0000000010343810  103e3810103=
40810
12-15   103e40001fffb000  0000000200000002  00000000100b0000  1034b5c0103=
e1e5c
16-19   103438100000000b  103f6e4b10343b48  0000000f103f6810  f0000000000=
0000f
20-23   00000001103e1000  f00000001013e3e4  cccccccda3d70c6e  00000000ccc=
ccccd
24-27   000007b11ff580a0  000099990000000a  0000000000000004  10330010102=
f5d54
28-31   1fffb000102f5800  000080011013ff24  102f580000008001  1fffb005000=
00005


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                =3D 0xcb81041008000000
Available Memory             =3D 0x0000000010000000
CPU Diagnose Register 2      =3D 0x0301000000000004
CPU Status Register 0        =3D 0x2420c20000000000
CPU Status Register 1        =3D 0x8002000000000000
SADD LOG                     =3D 0x10d8bb0180311000
Read Short LOG               =3D 0xc18040fffee003fd
ERROR_STATUS                 =3D 0x0000000000100010
MEM_ADDR                     =3D 0x000001ff3fffffff
MEM_SYND                     =3D 0x0000000000000000
MEM_ADDR_CORR                =3D 0x000001ff3fffffff
MEM_SYND_CORR                =3D 0x0000000000000000
RUN_DATA_HIGH                =3D 0xc1bff0fffed08040
RUN_DATA_LOW                 =3D 0xc1bff0fffed08040
RUN_CTRL                     =3D 0x0000021c00001418
RUN_ADDR                     =3D 0xc1bff0fffed08040
System Responder Path        =3D 0x00ffff0a000e0101


HPMC PIM Analysis Information:

Timestamp =3D 
  Mon Jan  13 17:32:31 GMT 2003    (20:03:01:13:17:32:31)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 byt=
es:

A Data I/O Fetch Timeout occurred while CPU 0 was
requesting information from a device at the path 10/0/14/1/1 (built-in PC=
I
device).


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observed the Broadcast Error.  It did not
log
any additional information about the HPMC.

<Press any key to continue (q to quit)> 

-----------------  Processor 0 LPMC Information ------------------

Check Type                   =3D 0x00000000
I/D Cache Parity Info        =3D 0x00000000
Cache Check                  =3D 0x00000000
TLB Check                    =3D 0x00000000
Bus Check                    =3D 0x00000000
Assists Check                =3D 0x00000000
Assist State                 =3D 0x00000000
Path Info                    =3D 0x00000000
System Responder Address     =3D 0x0000000000000000
System Requestor Address     =3D 0x0000000000000000


 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc2a9   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc009   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    ----------   0x4e0cc009   ------------------
   5    ----------   0x5e0cc009   ------------------
   6    ----------   0x6e0cc009   ------------------
   7    ----------   0x7e0cc009   ------------------

And then dump_analyser.sh got me:

IAOQ =3D 

Func: , Off: fffdf5ee, Addr: 0x0
objdump: --start-address: bad number: 0x

GR0 =3D 0000000000000000
0000000000000000
00000000
0000001f00000000

GR1 =3D 0000000010340010
0000000000000000
000002df
0000000000000000
Func: processor_tbl, Off: c, Addr: 0x10340010

GR2 =3D 0000000010110850
0000000000000000
00000000
0000000000000000
Func: inb, Off: 7c, Addr: 0x10110850
101107f4:	87 20 20 b8 	cmpib,=3D 0,r25,10110858 <inb+0x84>
10110850:	c8 7c 9f a5 	movb,tr ret0,r3,10110828 <inb+0x54>
10110854:	08 03 02 5c 	copy r3,ret0
10110858:	e8 57 0f 45 	b,l 10100000 <_text>,rp
1011085c:	34 42 3f 91 	ldo -38(rp),rp

GR3 =3D 00000000000000ff
0000000000000000
000002df
0000000000000000

GR4 =3D 0000000000000004
0000000000000000
00000000
00000001103e2000

GR5 =3D 00000000000f4023
0000000000000000
00000000
f00000001014ec28

GR6 =3D 00000000103f7244
0000000000000000
00000000
1032100000000000
Func: log_buf, Off: 0, Addr: 0x103f7244

GR7 =3D 00000000103fa5c3
0000000000000000
00000000
0000000000000000
Func: log_buf, Off: 337f, Addr: 0x103fa5c3

GR8 =3D 0000000000000060
00000000000005be
1034b02000000002

GR9 =3D 0000000000000010
0000000000000000
0000000200000002

GR10 =3D 000000000000000e
00000000000000c0
0000000010343810

GR11 =3D 0000000000000001
000000000000001a
103e381010340810

GR12 =3D 0000000010408010
0000000000000000
103e40001fffb000
Func: IRQ_timeout, Off: 2f4, Addr: 0x10408010

GR13 =3D 000000000000000c
0000000000000000
0000000200000002

GR14 =3D 0000000000000005
0000000000108000
00000000100b0000

GR15 =3D 0000000000069e0c
0000000000000000
1034b5c0103e1e5c

GR16 =3D 000000001ffb5cc0
000000311b8e25f8
103438100000000b

GR17 =3D 0000000000069e0c
0000000000000000
103f6e4b10343b48

GR18 =3D 0000000000000004
0000000010111b94
0000000f103f6810

GR19 =3D fffffffffee00000
000000000f20001c
f00000000000000f

GR20 =3D 000000000000000e
00000000a607fffb
00000001103e1000

GR21 =3D 00000000000003fd
c0000000802003fd
f00000001013e3e4

GR22 =3D 0000000010111b84
000000ff0004fe0c
cccccccda3d70c6e
Func: lba_astro_in8, Off: 0, Addr: 0x10111b84
10111b80:	0e 80 12 90 	stw r0,8(sr0,r20)
10111b84 <lba_astro_in8>:
10111b84:	22 60 0f dd 	ldil -1200000,r19
10111b88:	d3 39 1b f0 	extrw,u r25,31,16,r25
10111b8c:	0a 79 0a 19 	add,l r25,r19,r25

GR23 =3D 0000000010343810
00000000c2000000
00000000cccccccd
Func: pidhash, Off: f60, Addr: 0x10343810

GR24 =3D 00000000000003fd
000000000034c000
000007b11ff580a0

GR25 =3D fffffffffee003fd
000000000dfbc000
000099990000000a

GR26 =3D 00000000100ba160
0000000000044021
0000000000000004

GR27 =3D 0000000010330010
00000000f0412000
10330010102f5d54
Func: $global$, Off: 0, Addr: 0x10330010

GR28 =3D 0000000000000000
0000000055555555
1fffb000102f5800

GR29 =3D 000000000001338a
0000000055555555
000080011013ff24

GR30 =3D 000000001ffb6440
000000001f93c000
102f580000008001

GR31 =3D 0000000010110850
00000000103e8000
1fffb00500000005
Func: inb, Off: 7c, Addr: 0x10110850
101107f4:	87 20 20 b8 	cmpib,=3D 0,r25,10110858 <inb+0x84>
10110850:	c8 7c 9f a5 	movb,tr ret0,r3,10110828 <inb+0x54>
10110854:	08 03 02 5c 	copy r3,ret0
10110858:	e8 57 0f 45 	b,l 10100000 <_text>,rp
1011085c:	34 42 3f 91 	ldo -38(rp),rp

Done.


I do not know if it is relevant but HTH (me no :( )

Joel

PS: Tommorrow I will try either snapshot or gcc-3.0?

*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
