Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (unknown [203.47.56.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EFA8482D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Jun 2001 13:23:40 -0600 (MDT)
Received: from DATA (scorpion.wias.net.au [203.47.56.235])
	by localhost.localdomain (8.9.3/8.9.3) with SMTP id FAA04072
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Jun 2001 05:25:09 +1000
Message-ID: <004e01c0f762$58ac0ca0$c901a8c0@wias.net.au>
From: "Chris Christie" <info@wias.net.au>
To: <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Booting up C200 Visualize same output as C110
Date: Mon, 18 Jun 2001 05:18:53 +1000
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_004B_01C0F7B6.2A2EE9C0"
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_004B_01C0F7B6.2A2EE9C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Almost there! :)

C200 Visualize appears to halt with the following output..........

NET4: Unix Domain sockets 1.0/SMP for Linux Net4.0.
VFS Mounted root (ext2 file system).
Warning: unable to open initial console.
loop: enabling 8 loop devices

The device appears to halt at this point.

I am using IPL to configure the Console setting to remove the console =
setting all together as I get stack dumps if I keep the statement:

Console=3DttyXXX

I remove this statement and the boot process happens without dumping =
however the system is hanging for some reason.
Maybe Grant could shed some light on this except Grant requires:

"Need console output and PIM "Tombstone".
PIM "tombstone" can be aquired by interrupting autoboot
at the PDC prompt and typing "ser pim".

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253"

Greater problems exist amongst the k-250 and k-260 cluster , however
I have no print solutions currently in the network for posting the =
problems to the list.

Hopefully Bryan can help by post his results to the list or at least for =
Grant to have a look at it?


Make a WIASA decision today !

Wholesale Internet Access Services Australasia P/L ACN 096 011 511 =
BN17400545
148 Ipswich Road - Woolloongabba - Brisbane - 4102
GPO Box 949 Brisbane 4001
Tel: 07 3217 4103
Fax: 07 3217 3541 =20
Email: info@wias.net.au=20
Mob: 0417 375 196

Visit our web site at http://www.wias.net.au

------=_NextPart_000_004B_01C0F7B6.2A2EE9C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2919.6307" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>Almost there! :)</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>C200 Visualize appears to halt with the following=20
output.</FONT><FONT size=3D2>.........</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>NET4: Unix Domain sockets 1.0/SMP for Linux=20
Net4.0.</FONT></DIV>
<DIV><FONT size=3D2>VFS Mounted root (ext2 file system).</FONT></DIV>
<DIV><FONT size=3D2>Warning: unable to open initial =
console.</FONT></DIV>
<DIV><FONT size=3D2>loop: enabling 8 loop devices</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>The device appears to halt at this =
point.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>I am using IPL to configure the Console setting to =
remove the=20
console setting all together as I get stack dumps if I keep the=20
statement:</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Console=3DttyXXX</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>I remove this statement and the boot process happens =
without=20
dumping however the system is hanging for some reason.</FONT></DIV>
<DIV><FONT size=3D2>Maybe Grant could shed some light on this except =
Grant=20
requires:</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>"Need console output and PIM "Tombstone".<BR>PIM =
"tombstone"=20
can be aquired by interrupting autoboot<BR>at the PDC prompt and typing =
"ser=20
pim".<BR><BR>grant<BR><BR>Grant Grundler<BR>parisc-linux {PCI|IOMMU|SMP} =

hacker<BR>+1.408.447.7253"</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Greater problems exist amongst the k-250 and k-260 =
cluster ,=20
however</FONT></DIV>
<DIV><FONT size=3D2>I have no print solutions currently in the network =
for posting=20
the problems to the list.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Hopefully Bryan can help by post his results to the =
list or at=20
least for Grant to have a look at it?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Make a WIASA decision today !</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Wholesale Internet Access Services Australasia P/L =
ACN 096 011=20
511 BN17400545<BR>148 Ipswich Road - Woolloongabba - Brisbane - =
4102<BR>GPO Box=20
949 Brisbane 4001<BR>Tel: 07 3217 4103<BR>Fax: 07 3217 3541&nbsp; =
<BR>Email: <A=20
href=3D"mailto:info@wias.net.au">info@wias.net.au</A> <BR>Mob: 0417 375=20
196</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Visit our web site at <A=20
href=3D"http://www.wias.net.au">http://www.wias.net.au</A></FONT></DIV></=
BODY></HTML>

------=_NextPart_000_004B_01C0F7B6.2A2EE9C0--
