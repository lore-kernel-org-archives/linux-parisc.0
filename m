From: Thibaut VARENE <varenet@esiee.fr>
Subject: Re: [parisc-linux] Machine hanging during high-traffic NFS
Date: Wed, 20 Jul 2005 05:57:19 +0300
Message-ID: <20050720035719.D16AD365915@mail.esiee.fr>
References: <200507200331.j6K3VD3v001086@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507200331.j6K3VD3v001086@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

JDA wrote:
> It might help to have a "stable" branch that is maintained longer
> than is current practice.  At a minimum, the current tree needs to
> be slushed until the main problems are resolved.

I definitely concur on that. That's something I already suggested on
IRC a while ago, and I believe that we probably all agree that there's
such a need. The questions being how to do it properly (maitaining a
separate "stable" branch is not absolutely trivial), and also *who* is
going to maintain it.

In any case, we really want to take time to fix our bugs. I don't know
if we need to somehow "freeze" our tree to do that. I believe we sort
of need that, since we keep injecting new bugs on top of mostly
unknown existing ones involving and/or impacting many different
subsystems.

Maybe some sort of "puffinfest" would help cleaning up our kernel
before the situation gets out of control.

I'd really wish we talk about that while at OLS, with the guys that
are attending it ;)

my 2c

T-Bone




=20


>=20
>=20
>=20
> 	  -----------------  Processor 1 LPMC Information
------------------
>=20
> 	  Check Type                   =3D 0x00000000
> 	  IC Parity Info               =3D 0x00000000
> 	  Cache Check                  =3D 0x00000000
> 	  TLB Check                    =3D 0x00000000
> 	  Bus Check                    =3D 0x00000000
> 	  Assists Check                =3D 0x00000000
> 	  Assist State                 =3D 0x00000000
> 	  Path Info                    =3D 0x00000000
> 	  System Responder Address     =3D 0x0000000000000000
> 	  System Requestor Address     =3D 0x0000000000000000
>=20
>=20
>=20
> 	  -----------------  Processor 1 TOC Information
-------------------
>=20
> 	  General Registers 0 - 31
> 	  00-03  0000000000000000  00000000103c5ca0  000000001014c628=20
00000000fe38c620
> 	  04-07  0000000010552cc0  00000000046db5d4  00000000105cc360=20
00000000105ccfb0
> 	  08-11  0000000000000018  0000000010424050  0000000000000001=20
00000000bd893300
> 	  12-15  0000000000000000  00000000ff85fc00  0000000000000008=20
00000000fe38c288
> 	  16-19  00000000fe38c620  00000000ff85b400  0000000000000000=20
0000000000024089
> 	  20-23  0002b96357cd9ae6  000000000009eb10  000000000000ff00=20
fffffff0f0430ed8
> 	  24-27  0000000000000520  0000000000000000  00000000046db5d4=20
0000000010552cc0
> 	  28-31  0000000000000000  00000000fe38cc20  00000000fe38cc50=20
0203010200802004
>=20
>=20
> 	  Control Registers 0 - 31
> 	  00-03  0000000000000000  0000000000000000  0000000000000000=20
0000000000000000
> 	  04-07  0000000000000000  0000000000000000  0000000000000000=20
0000000000000000
> 	  08-11  000000000000e486  0000000000000000  00000000000000c0=20
0000000000000038
> 	  12-15  0000000000000000  0000000000000000  0000000000106000=20
0000000000000000
> 	  16-19  0002b96357d799de  0000000000000000  000000001014c67c=20
00000000020008b3
> 	  20-23  00000000103403b8  00000000e338cba8  000000ff0804fd0f=20
8140000000000000
> 	  24-27  00000000004cc000  00000000d153a000  0000000000041020=20
000000f0f0165650
> 	  28-31  000000f0f0165650  5555555555555555  00000000fe38c000=20
0000000000008020
>=20
> 	  Space Registers 0 - 7
> 	  00-03  03921800          00000000          00000000        =20
03921800
> 	  04-07  00000000          00000000          00000000        =20
00000000
>=20
> 	  IIA Space (back entry)       =3D 0x0000000000000000
> 	  IIA Offset (back entry)      =3D 0x000000001014c680
> 	  CPU State                    =3D 0x9e000001
>=20
>=20
> 	  --------------  Memory Error Log Information  --------------
>=20
> 	  Bus 0 Log Information
>=20
>=20
> 	     No errors logged for this bus
>=20
>=20
> 	     ------------  I/O Module Error Log Information  ------------
>=20
>=20
> 		No I/O module errors logged
>=20
>=20
> 		Service Menu: Enter command >
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>=20
--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
