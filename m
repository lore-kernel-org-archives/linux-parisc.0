Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D299482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Jan 2002 09:00:30 -0700 (MST)
Received: from npyu.esiee.fr (npyu.esiee.fr [147.215.80.150])
	by mail.esiee.fr (Postfix) with ESMTP id E803C49BF3
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Jan 2002 17:00:27 +0100 (CET)
Date: Sun, 13 Jan 2002 17:00:28 +0100
Mime-Version: 1.0 (Apple Message framework v480)
Content-Type: multipart/alternative; boundary=Apple-Mail-3-418173568
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <A9BCC5DC-083E-11D6-8D7B-0030656F07A2@esiee.fr>
Subject: [parisc-linux] XC HowTo Mistakes
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

--Apple-Mail-3-418173568
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed

Hello

I have noticed what seems to be a mistake in the XC HowTo on=20
parisc-linux.org:

here: http://www.parisc-linux.org/toolchain/PA-Linux-XC-HOWTO-04.html

you have in section "4.4 Building Glibc" those lines:

Symlink the appropriate headers:

cd=A0$ST/parisc/hppa-linx/include
ln=A0-s=A0$ST/src/linux/include/linux=A0.
ln=A0-s=A0$ST/src/linux/include/asm=A0.

But it should be:

"cd $DEST/hppa-linux/include"

then linking as explained.


Otherwise, there's a in the same section for the configure options:
$ST/src/glibc/configure=A0--host=3Dhppa-linux=A0--build=3D$MACH\
=A0-prefix=3D$DEST/hppa-linux=A0--with-headers=3D$ST/src/linux/include\
=A0--disable-profile=A0--without-cvs=A0--enable-add-ons

It should be:
$ST/src/glibc/configure=A0--host=3Dhppa-linux=A0--build=3D$MACH\
=A0--prefix=3D$DEST/hppa-linux=A0--with-headers=3D$ST/src/linux/include\
=A0--disable-profile=A0--without-cvs=A0--enable-add-ons

it's the "--prefix=3D" which must be typed with 2 "-".


Thibaut VARENE
PA/Linux ESIEE Team
http://www.esiee.fr/puffin

--Apple-Mail-3-418173568
Content-Transfer-Encoding: quoted-printable
Content-Type: text/enriched;
	charset=ISO-8859-1

Hello


I have noticed what seems to be a mistake in the XC HowTo on
parisc-linux.org:


here:
=
<underline><color><param>1A1A,1A1A,FFFF</param>http://www.parisc-linux.org=
/toolchain/PA-Linux-XC-HOWTO-04.html</color></underline>


you have in section "4.4 Building Glibc" those lines:


<fontfamily><param>Times New Roman</param><bigger><bigger>Symlink the
appropriate headers:=20


</bigger></bigger></fontfamily><fixed><fontfamily><param>Courier =
New</param><smaller>cd=A0$ST/parisc/hppa-linx/include

ln=A0-s=A0$ST/src/linux/include/linux=A0.

ln=A0-s=A0$ST/src/linux/include/asm=A0.

</smaller></fontfamily></fixed><fontfamily><param>Times New =
Roman</param><bigger><bigger>

</bigger></bigger></fontfamily>But it should be:


"cd $DEST/hppa-linux/include"


then linking as explained.



Otherwise, there's a in the same section for the configure options:

<fixed><fontfamily><param>Courier =
New</param><smaller>$ST/src/glibc/configure=A0--host=3Dhppa-linux=A0--buil=
d=3D$MACH\

=A0-prefix=3D$DEST/hppa-linux=A0--with-headers=3D$ST/src/linux/include\

=A0--disable-profile=A0--without-cvs=A0--enable-add-ons

</smaller></fontfamily></fixed>

It should be:

<fixed><fontfamily><param>Courier =
New</param><smaller>$ST/src/glibc/configure=A0--host=3Dhppa-linux=A0--buil=
d=3D$MACH\

=A0--prefix=3D$DEST/hppa-linux=A0--with-headers=3D$ST/src/linux/include\

=A0--disable-profile=A0--without-cvs=A0--enable-add-ons

</smaller></fontfamily></fixed>

it's the "--prefix=3D" which must be typed with 2 "-".



Thibaut VARENE

PA/Linux ESIEE Team

=
<underline><color><param>1A1A,1A1A,FFFF</param>http://www.esiee.fr/puffin<=
/color></underline>=

--Apple-Mail-3-418173568--
