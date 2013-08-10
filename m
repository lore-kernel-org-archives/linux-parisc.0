From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Fwd: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Sat, 10 Aug 2013 23:56:47 +0400
Message-ID: <E820CE4C-248F-49CF-84F3-1E0A219133C9@p0n4ik.tk>
References: <A7728478-8754-4B8E-81DD-CDB70165FFAB@p0n4ik.tk>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Type: text/plain; charset=koi8-r
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> =EF=D4: Alex Ivanov <gnidorah@p0n4ik.tk>
> =F4=C5=CD=C1: =EF=D4=D7=C5=D4: [PATCH] parisc: fix LMMIO mismatch bet=
ween PAT length and MASK register
> =E4=C1=D4=C1: 10 =C1=D7=C7=D5=D3=D4=C1 2013 =C7., 23:55:35 GMT+04:00
> =EB=CF=CD=D5: John David Anglin <dave.anglin@bell.net>
>=20
>=20
> 10.08.2013, =D7 23:41, John David Anglin <dave.anglin@bell.net> =CE=C1=
=D0=C9=D3=C1=CC(=C1):
>>=20
>> Have you tried agpmode=3D-1 to force PCI mode.  It seems like this w=
as a problem at one time on ubuntu:
>> http://phoronix.com/forums/showthread.php?17615-Testing-radeon-KMS-o=
n-Ubuntu
>>=20
>> Dave
>> --
>> John David Anglin	dave.anglin@bell.net
>=20
>=20
> John,
>=20
> I've tried this one and many other things (except the messing with en=
dianness) so far. The error is=20
> still there.
>=20
> Thanks.
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
