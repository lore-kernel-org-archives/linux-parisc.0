Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pony.its.uwo.ca (pony.its.uwo.ca [129.100.2.63])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7C6A482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 13:30:08 -0600 (MDT)
Received: from HCI009 (gl-209.gaul.csd.uwo.ca [129.100.12.209])
	by pony.its.uwo.ca (8.10.2/8.10.2) with SMTP id f6GJTwV26379
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 15:29:58 -0400 (EDT)
Message-ID: <001401c10e2c$eab820d0$d10c6481@HCI009>
From: "Yan Han" <yhan@uwo.ca>
To: <parisc-linux@lists.parisc-linux.org>
Date: Mon, 16 Jul 2001 15:24:22 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0011_01C10E0B.638B0990"
Subject: [parisc-linux] complier -- regarding to "palo"
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0011_01C10E0B.638B0990
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!

Continue with the same question of "palo" compile.

After the hp box boot up, we try to do step 8 Step 8  "Initialize the =
boot loader (roughly equivalent to lilo): *** NOTE
*** change both '3's in the following command to use your partition =
number
$ palo -k /boot/vmlinux -b /boot/iplboot \
-c '3/boot/vmlinux TERM=3Dlinux HOME=3D/ root=3D/dev/sda3' \
-I /dev/sda


We cannot get palo complied.=20
1. We later try to use gcc to compile a simple c file. but gcc doesn't =
work. (the screen is blank, nothing shows up).
2. We think there are something wrong with gcc.
3. is this a problem with nfsroot files?
4. where to get the right nfsroot file to make gcc work?

any idea,

------=_NextPart_000_0011_01C10E0B.638B0990
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3103.1000" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi!</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Continue with the same question of =
"palo"=20
compile.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>After the hp box boot up, we try to do =
step 8 Step=20
8&nbsp; "Initialize the boot loader (roughly equivalent to lilo): ***=20
NOTE<BR>*** change both '3's in the following command to use your =
partition=20
number<BR>$ palo -k /boot/vmlinux -b /boot/iplboot \<BR>-c =
'3/boot/vmlinux=20
TERM=3Dlinux HOME=3D/ root=3D/dev/sda3' \<BR>-I =
/dev/sda<BR><BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>We cannot get palo =
complied.&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>1. We later try to use gcc to compile a =
simple c=20
file. but gcc doesn't work. (the screen is blank, nothing shows=20
up).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>2. We think there are something wrong =
with=20
gcc.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>3. is this a problem with nfsroot=20
files?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>4. where to get the right nfsroot file =
to make gcc=20
work?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>any =
idea,</FONT></DIV></FONT></BODY></HTML>

------=_NextPart_000_0011_01C10E0B.638B0990--
