From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] PRINTK_TIME make panicing very early b2k?
Date: Mon, 27 Jun 2005 16:30:21 +0200
Message-ID: <42BAE7C300000EB4@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
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

I hope to get help from CONFIG_PRINTK_TIME to debug my d380 64bit slownes=
s
pb but tested first on a b2k it panics (waht siad lcd display at leat) ve=
ry
early in the boot and unfortunately pim lakes of relievant info:

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp =3D
  Mon Jun  27 12:41:39 GMT 2005    (20:05:06:27:12:41:39)

HPMC Chassis Codes =3D 2cbf0  2500b  2cbf4  2cbfc

General Registers 0 - 31
00-03   0000000000000000  0000000000000000  000000001012799c  00000000008=
00327
04-07   0000000000000035  00000000104cf5a0  00000000104cf5a3  00000000000=
00006
08-11   000000000000000f  000000000ffffe40  000000000000000e  00000000000=
0003c
12-15   00000000103c9f30  000000000000002f  0000000000000037  00000000000=
0003e
16-19   0000000000000000  00000000f000017c  00000000f0000174  00000000103=
540d0
20-23   0000000000000000  00000000fee003f8  00000000fee003fd  00000000104=
780dc
24-27   0000000000000000  0000000000000000  000000000000000f  00000000103=
b2010
28-31   00000000fffb6c20  000000000ffffe40  0000000020000080  00000000000=
00060

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  00000000000=
00000
04-07   0000000000000000  0000000000000000  0000000000000000  00000000000=
00000
08-11   0000000000000000  0000000000000000  0000000000000000  00000000000=
00020
12-15   0000000000000000  0000000000000000  000000000010b000  00000000000=
00000
16-19   00000007e80371fa  0000000000000000  000000001010c65c  000000000fa=
11288
20-23   0000000000000000  000000001ffffc04  000000ff0000ff00  00000000000=
00000
24-27   000000000046e000  000000000046e000  0000000000044021  00000000f04=
12000
28-31   0000000055555555  0000000055555555  0000000010478000  00000000104=
7c000

Space Registers 0 - 7
00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    =3D 0x0000000000000000
IIA Offset                   =3D 0x0000000000000000
Check Type                   =3D 0x20000000
CPU State                    =3D 0x9e000004
Cache Check                  =3D 0x00000000
TLB Check                    =3D 0x00000000
Bus Check                    =3D 0x003010bb
Assists Check                =3D 0x00000000
Assist State                 =3D 0x00000000
Path Info                    =3D 0x00031800
System Responder Address     =3D 0xfffffffffed10200
System Requestor Address     =3D 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000001f00000000  0000001f00000000  0000001f000=
00000
04-07   0000000000000000  5555555555555555  5555555555555555  55555555555=
55555
08-11   5555555555555555  5555555555555555  5555555555555555  55555555555=
55555
12-15   5555555555555555  5555555555555555  5555555555555555  55555555555=
55555
16-19   5555555555555555  5555555555555555  5555555555555555  55555555555=
55555
20-23   5555555555555555  5555555555555555  5555555555555555  55555555555=
55555
24-27   5555555555555555  5555555555555555  5555555555555555  55555555555=
55555
28-31   5555555555555555  5555555555555555  5555555555555555  55555555555=
55555


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                =3D 0xcb81041000000000
Available Memory             =3D 0x0000000010000000
CPU Diagnose Register 2      =3D 0x0301000000000204
CPU Status Register 0        =3D 0x2420c20000000000
CPU Status Register 1        =3D 0x8080000000000000
SADD LOG                     =3D 0x5913927569568df8
Read Short LOG               =3D 0xc18040fffee003fd
ERROR_STATUS                 =3D 0x0000000000000010
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
  Mon Jun  27 12:41:39 GMT 2005    (20:05:06:27:12:41:39)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 byt=
es:

A Data Miss Timeout occurred while CPU 0 was
requesting information.
[...]

Any idea?

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
