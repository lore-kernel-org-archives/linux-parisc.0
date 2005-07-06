From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Wed, 6 Jul 2005 18:40:32 +0200
Message-ID: <42BAB5E10000403E@mail-2-bnl.tiscali.it>
References: <200507051816.j65IGuIY028621@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507051816.j65IGuIY028621@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Dave,

> 
> > >  I managed to hang my c3k with a gcc-4.0.0 built kernel
> > Sorry but which kernel did you use?
> 
> 2.6.10-pa11.
> 
Ok I boot the same and grab recent gcc-4.1 src (about 6h gmt) and build i=
t
with build-tls-tools with following options:
--enable-shared --with-system-zlib --disable-nls --enable-debug --host=3D=
hppa-linux
--tar
get=3Dhppa-linux --disable-libmudflap --enable-languages=3Dc,c++

and it hang also in a g++ test:
[...]
PASS: g++.dg/opt/inline3.C (test for excess errors)
Executing on host: /CAD/parisc-linux/build/gcc/gcc/testsuite/../g++ -B/CA=
D/parisc-linux/build/gcc/gcc/testsuite/../
/CAD/parisc-linux/sources/gcc/gcc/testsuite/g++.dg/opt/inline4.C  -nostdi=
nc++
-I/CAD/parisc-linux/build/gcc/hppa-linux/libstdc++-v3/include/hppa-linux
-I/CAD/parisc-linux/build/gcc/hppa-linux/libstdc++-v3/include -I/CAD/pari=
sc-linux/sources/gcc/libstdc++-v3/libsupc++
-I/CAD/parisc-linux/sources/gcc/libstdc++-v3/include/backward -I/CAD/pari=
sc-linux/sources/gcc/libstdc++-v3/testsuite
-fmessage-length=3D0  -O2 -ftemplate-depth-20000  -S  -o inline4.s    (ti=
meout
=3D 300)

My very bad error was to forget to save the System.map, so it's hard to s=
ay
if the pim analyse is relevant:
-----------------  Processor 0 TOC Information -------------------

GR of CPU[0]
00-03   0000000000000000  0000000000000000  000000001010fc68  00000000fb7=
00100
04-07   00000000ffffffff  00000000fb700040  0000000000000000  00000000122=
ab2c8
08-11   0000000000000000  00000000fb700064  00000000fffffff2  00000000000=
0000b
12-15   0000000000000000  00000000122ab4c4  00000000119900a0  00000000119=
90090
16-19   00000000122ab2c8  0000000000590000  00000000faf0231c  00000000122=
ab0f8
20-23   0000000000000000  00000000fffffff2  00000000fb700064  00000000000=
00000
24-27   00000000119900a0  00000000119900a0  00000000fb700064  00000000103=
c1010
28-31   00000000fb7000f0  0000000001990240  0000000011990480  00000000119=
900a0

GR[02] =3D=3D rp =3D 000000001010fc68

Func: do_signal, Off: 0xfc, Addr: 0x1010fc68

1010fc60:       e8 10 b1 04     b,l 101314e8 <copy_siginfo_to_user>,%r2
1010fc64:       34 08 00 00     ldi 0,r8
1010fc68:       08 1c 02 55     copy ret0,r21
1010fc6c:       03 c0 08 bc     mfctl tr6,ret0

GR[22] =3D=3D t1(32bits) =3D=3D arg4(64bits) =3D 00000000fb700064

GR[21] =3D=3D t2(32bits) =3D=3D arg5(64bits) =3D 00000000fffffff2

GR[20] =3D=3D t3(32bits) =3D=3D arg6(64bits) =3D 0000000000000000

GR[19] =3D=3D t4(32bits) =3D=3D arg7(64bits) =3D 00000000122ab0f8

GR[26] =3D=3D arg0 =3D 00000000fb700064

GR[25] =3D=3D arg1 =3D 00000000119900a0

GR[24] =3D=3D arg2 =3D 00000000119900a0

GR[23] =3D=3D arg3 =3D 0000000000000000

GR[27] =3D=3D dp =3D 00000000103c1010

Func: $global$, Off: 0x0, Addr: 0x103c1010


GR[28] =3D=3D ret0 =3D 00000000fb7000f0

GR[29] =3D=3D ret1 or sl =3D 0000000001990240

GR[30] =3D=3D sp =3D 0000000011990480

GR[31] =3D=3D ble rp =3D 00000000119900a0

Func: _end, Off: 0x14972dc, Addr: 0x119900a0


CR of CPU[0]
00-03   0000000000000000  0000000000000000  0000000000000000  00000000000=
00000
04-07   0000000000000000  0000000000000000  0000000000000000  00000000000=
00000
08-11   000000000000836e  0000000000000000  00000000000000c0  00000000000=
00015
12-15   0000000000000000  0000000000000000  000000000010a000  00000000ff8=
00000
16-19   00000c893eed18c2  0000000000000000  000000001010b64c  000000000f9=
4d280
20-23   00000000000041b7  c0000000fb7000f0  000000ff0004ff00  00000000800=
00000
24-27   0000000000474000  0000000008262000  0000000000044021  00000000405=
dab80
28-31   0000000055555555  0000000055555555  0000000011990000  00000000104=
80000



SR of CPU[0]
00-03   00000000          00000000          000041b7          000041b7
04-07   00000000          00000000          00000000          00000000

SR[00] =3D=3D ts0 =3D 00000000

SR[01] =3D=3D ts1 =3D 00000000

SR[03] =3D=3D cpp =3D 000041b7
...
IIA Offset                   =3D 0x000000001010b650
...

e.g. IAOQ =3D 0x000000001010b650

Parse IAOQ =3D 0x000000001010b650 for CPU[0]

Func: L42, Off: 0x4, Addr: 0x1010b650

1010b650:       0f a2 12 90     stw rp,8(,ret1)
1010b654:       0f a3 12 98     stw r3,c(,ret1)
1010b658:       6b a4 00 20     stw r4,10(,ret1)
1010b65c:       6b a5 00 28     stw r5,14(,ret1)

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
