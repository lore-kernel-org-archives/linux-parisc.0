From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Thu, 18 Aug 2005 18:01:43 +0200
Message-ID: <ILFDUV$F78A20A99DD29674BBE529F42F203D92@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
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

Hello all,

The good stuff first.

I rebuild glibc 2.3.5-3 with latest gcc-4.0-4.0.1-5 (as debian named? act=
ualy
4.0.2 20050816) and all seems to work fine: i.e. the dump of the
libpthread-0.10.so shows that the pb point out by Randoplh was well fixed=
 by
Dave's patch :-).

I so install it on a chroot disk to rebuild first the latest 2.6.13-rc6-p=
a2
cvs 20050817:
    no more segv :-).

I also install this kernel of this chroot disk and reboot it quiet nicely=
 my
b180 :-).

I run first Randolph test which end well now by a segv :-)

And finaly launch my stress test (do you remember the 2 loops) which stil=
l
runing (now for about 5h without pb ;^).)

The bad news now.

I also install the latest gcc-4.0-4.0.1-5 on my unstable b2k install to
rebuild the same 32bit kernel (2.6.13-rc6-pa2 cvs 20050817) but saving li=
bc6
2.3.2.ds1-22 (excepted this the 2 systems are debian unstable update at t=
he
same level this morning).
Well the system reboot fine but the same test as describe above make agai=
n the
system hang after only 45min of test ;_(

Anyway this time I could grab a piminfo with a TOC:
[I discard the HPMC because IIA Offset =3D 0x00000000000172b8 which is no=
t usable]
-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03   0000000000000000  00000000104eb810  00000000101319b4  000000001dd=
45890
04-07   00000000104ec17c  00000000104ebda4  000000000000000a  00000000104=
ebda4
08-11   00000000104ebdac  00000000103c6010  0000000000200200  00000000104=
90698
12-15   0000000000000000  00000000ffffffff  0000000000000000  00000000f04=
00004
16-19   0000000010484140  00000000f000017c  00000000f0000174  00000000104=
ec17c
20-23   000000000042884a  00000000006a884a  0000000000280000  00000000000=
00262
24-27   000000000000000a  000000001dd454d0  00000000104ebda4  00000000103=
bd010
28-31   000000001dd45110  0000000000280000  0000000010484500  00000000101=
2d958

<Press any key to continue (q to quit)>

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  00000000000=
00000
04-07   0000000000000000  0000000000000000  0000000000000000  00000000000=
00000
08-11   000000000000142e  0000000000000000  00000000000000c0  00000000000=
0003e
12-15   0000000000000000  0000000000000000  000000000010b000  00000000ff8=
00000
16-19   00000243adf4f356  0000000000000000  00000000101318f4  000000000f9=
91280
20-23   0000000010240037  0000000051545110  000000ff0004ff0e  00000000da0=
00000
24-27   0000000000479000  000000000d19a000  0000000000044021  00000000f04=
12000
28-31   0000000055555555  0000000055555555  0000000010484000  00000000104=
88000
Space Registers 0 - 7

00-03   00000000          00000a17          00000000          00000a17
04-07   00000000          00000000          00000000          00000000

IIA Space                    =3D 0x0000000000000000
IIA Offset                   =3D 0x00000000101318f8
CPU State                    =3D 0x9e000001


<Press any key to continue (q to quit)>

Memory Error Log Information:

Timestamp =3D
  Thu Aug  18 14:43:55 GMT 2005    (20:05:08:18:14:43:55)


'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

   No memory errors logged


I/O Module Error Log Information:

Timestamp =3D
  Thu Aug  18 14:43:55 GMT 2005    (20:05:08:18:14:43:55)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    ----------   0x0e0cc249   ------------------
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc009   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    ----------   0x4e0cc009   ------------------
   5    ----------   0x5e0cc009   ------------------
   6    ----------   0x6e0cc009   ------------------
   7    ----------   0x7e0cc009   ------------------
=3D=3D=3D=3D<>=3D=3D=3D=3D

The analysis of this TOC give:
-----------------  Processor 0 TOC Information -------------------

GR of CPU[0]
00-03   0000000000000000  00000000104eb810  00000000101319b4  000000001dd=
45890
04-07   00000000104ec17c  00000000104ebda4  000000000000000a  00000000104=
ebda4
08-11   00000000104ebdac  00000000103c6010  0000000000200200  00000000104=
90698
12-15   0000000000000000  00000000ffffffff  0000000000000000  00000000f04=
00004
16-19   0000000010484140  00000000f000017c  00000000f0000174  00000000104=
ec17c
20-23   000000000042884a  00000000006a884a  0000000000280000  00000000000=
00262
24-27   000000000000000a  000000001dd454d0  00000000104ebda4  00000000103=
bd010
28-31   000000001dd45110  0000000000280000  0000000010484500  00000000101=
2d958

GR[02] =3D=3D rp =3D 00000000101319b4

Func: cascade, Off: 0x44, Addr: 0x101319b4

        ...
10131994:       80 83 20 40     cmpb,=3D r3,r4,101319bc <cascade+0x4c>

        ...
101319b0:       08 05 02 5a     copy r5,r26
101319b4:       88 83 3f cf     cmpb,<>,n r3,r4,101319a0 <cascade+0x30>
101319b8:       48 7c 00 30     ldw 18(,r3),ret0
101319bc:       0c 63 12 88     stw r3,4(,r3)

GR[22] =3D=3D t1(32bits) =3D=3D arg4(64bits) =3D 0000000000280000

GR[21] =3D=3D t2(32bits) =3D=3D arg5(64bits) =3D 00000000006a884a

GR[20] =3D=3D t3(32bits) =3D=3D arg6(64bits) =3D 000000000042884a

GR[19] =3D=3D t4(32bits) =3D=3D arg7(64bits) =3D 00000000104ec17c

GR[26] =3D=3D arg0 =3D 00000000104ebda4

GR[25] =3D=3D arg1 =3D 000000001dd454d0

GR[24] =3D=3D arg2 =3D 000000000000000a

GR[23] =3D=3D arg3 =3D 0000000000000262

GR[27] =3D=3D dp =3D 00000000103bd010

Func: $global$, Off: 0x0, Addr: 0x103bd010


GR[28] =3D=3D ret0 =3D 000000001dd45110

GR[29] =3D=3D ret1 or sl =3D 0000000000280000

GR[30] =3D=3D sp =3D 0000000010484500

GR[31] =3D=3D ble rp =3D 000000001012d958

Func: __do_softirq, Off: 0xe0, Addr: 0x1012d958

1012d950:       e6 c0 20 00     be,l 0(sr4,r22),%sr0,%r31
1012d954:       08 1f 02 42     copy r31,rp
1012d958:       e8 1f 1f 05     b,l 1012d8e0 <__do_softirq+0x68>,r0
1012d95c:       0d 06 12 88     stw r6,4(,r8)

CR of CPU[0]
00-03   0000000000000000  0000000000000000  0000000000000000  00000000000=
00000
04-07   0000000000000000  0000000000000000  0000000000000000  00000000000=
00000
08-11   000000000000142e  0000000000000000  00000000000000c0  00000000000=
0003e
12-15   0000000000000000  0000000000000000  000000000010b000  00000000ff8=
00000
16-19   00000243adf4f356  0000000000000000  00000000101318f4  000000000f9=
91280
20-23   0000000010240037  0000000051545110  000000ff0004ff0e  00000000da0=
00000
24-27   0000000000479000  000000000d19a000  0000000000044021  00000000f04=
12000
28-31   0000000055555555  0000000055555555  0000000010484000  00000000104=
88000

CR[00] =3D=3D rctr =3D 0000000000000000

CR[08] =3D=3D (Protection ID) pidr1 =3D 000000000000142e

CR[10] =3D=3D ccr =3D 00000000000000c0

CR[11] =3D=3D sar =3D 000000000000003e

CR[14] =3D=3D iva =3D 000000000010b000

CR[15] =3D=3D eiem =3D 00000000ff800000

CR[16] =3D=3D itmr =3D 00000243adf4f356

CR[17] =3D=3D pcsq =3D 0000000000000000

CR[18] =3D=3D pcoq =3D 00000000101318f4

CR[19] =3D=3D iir =3D 000000000f991280

CR[20] =3D=3D isr =3D 0000000010240037

CR[21] =3D=3D ior =3D 0000000051545110

CR[22] =3D=3D ipsw =3D 000000ff0004ff0e

CR[23] =3D=3D eirw =3D 00000000da000000

CR[24] =3D=3D tr0 (ptov) =3D 0000000000479000

CR[25] =3D=3D tr1 (vtop) =3D 000000000d19a000

CR[26] =3D=3D tr2 =3D 0000000000044021

CR[27] =3D=3D tr3 =3D 00000000f0412000

CR[28] =3D=3D tr4 =3D 0000000055555555

CR[29] =3D=3D tr5 =3D 0000000055555555

CR[30] =3D=3D tr6 =3D 0000000010484000

CR[31] =3D=3D tr7 =3D 0000000010488000

SR of CPU[0]
00-03   00000000          00000a17          00000000          00000a17
04-07   00000000          00000000          00000000          00000000
SR[0] =3D 00000000
SR[1] =3D 00000a17
SR[2] =3D 00000000
SR[3] =3D 00000a17
SR[4] =3D 00000000
SR[5] =3D 00000000
SR[6] =3D 00000000
SR[7] =3D 00000000
Need much more work !!!

SR[00] =3D=3D ts0 =3D 00000000

SR[01] =3D=3D ts1 =3D 00000a17

SR[03] =3D=3D cpp =3D 00000a17
        Not parsable address!
...
IIA Offset                   =3D 0x00000000101318f8
...

e.g. IAOQ =3D 0x00000000101318f8

Parse IAOQ =3D 0x00000000101318f8 for CPU[0]

Func: internal_add_timer, Off: 0xdc, Addr: 0x101318f8

101318f0:       0e 79 12 88     stw r25,4(,r19)
101318f4:       0f 99 12 80     stw r25,0(,ret0)
101318f8:       e8 40 d0 00     bve (rp)
101318fc:       0f 3c 12 88     stw ret0,4(,r25)

Any idea on this new hang?

Thanks,
    Joel=0A=0A-------------------------------------------------------=0AN=
OTE! My email address is changing to ... @scarlet.be=0APlease make the ne=
cessary changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
