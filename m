Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ati6.ati.stlawrencec.on.ca (unknown [142.155.128.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F080482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 08:17:14 -0600 (MDT)
Message-ID: <000d01c10626$ac7139f0$0f809b8e@ati.stlawrencec.on.ca>
From: "rpengelly" <rpengelly@ati.stlawrencec.on.ca>
To: <parisc-linux@lists.parisc-linux.org>
Date: Fri, 6 Jul 2001 10:19:31 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000A_01C10605.2548B690"
Subject: [parisc-linux] opening initial console
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_000A_01C10605.2548B690
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Well good news and bad news. We've gotten a linux kernal to boot over a =
network using rbootd and bootp. However just after the root is mounted =
we get the following message:

NFS: Mounted root (nfs filesystem) readonly.
Warning: unable to open an initial console.
Kernel panic: no int found. Try passing init=3D option to kernel.

Anyone run into this problem or know how to fix it.

------=_NextPart_000_000A_01C10605.2548B690
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
<DIV><FONT face=3DArial size=3D2>Well good news and bad news. We've =
gotten a linux=20
kernal to boot over a network using rbootd and bootp. However just after =
the=20
root is mounted we get the following message:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>NFS: Mounted root (nfs filesystem)=20
readonly.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Warning: unable to open an initial=20
console.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Kernel panic: no int found. Try passing =
init=3D=20
option to kernel.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Anyone run into this problem or know =
how to fix=20
it.</FONT></DIV></BODY></HTML>

------=_NextPart_000_000A_01C10605.2548B690--
