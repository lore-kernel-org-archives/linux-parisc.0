Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beldar.com (ns.beldar.com [65.163.106.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08BDA482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Dec 2001 07:25:28 -0700 (MST)
Received: from pogo (dhcp-113.beldar.com [65.163.106.113])
	by beldar.com (8.9.3/8.9.3) with SMTP id JAA85870
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Dec 2001 09:45:39 -0500 (EST)
	(envelope-from lansing@beldar.com)
Message-ID: <001c01c1913d$ee1b8ca0$0101a8c0@pogo>
From: "Craig D. Lansing" <lansing@beldar.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Sun, 30 Dec 2001 09:25:54 -0500
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0019_01C19113.FAC364C0"
Subject: [parisc-linux] Kernel ?
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

This is a multi-part message in MIME format.

------=_NextPart_000_0019_01C19113.FAC364C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

In an attempt to solve my J2240 STI and Eth0/1 problems I am trying to =
upgrade the kernel from the 2.4.9-32 on the 0.9.3 ISO to something more =
recent.  Specifically, I've tried 32-2.4.16-pa24 and pa29.  I ftp'd the =
tar files from the 32-bit directory, untarred / unzipped the contents, =
copied them into /boot, changed the link for vmlinux, and modified =
/etc/palo.conf.  However, in both cases when I boot, everything =
initially looks like it will boot OK, but I eventually get a stack =
pointer error, a long hex dump, and finally "Kernel Fault: Code=3D15 =
regs=3D102af4c0 (Addr=3D00368004)" ....  This all appears on the STI =
head, even though I changed console to ttyS0, and scrolls by too fast to =
get much meaningful info prior to the hex dump. =20

Do I have to upgrade from source (which I'll try next) or am I doing =
something wrong or both?



------=_NextPart_000_0019_01C19113.FAC364C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2614.3500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>In an attempt to solve my J2240 STI =
and&nbsp;Eth0/1=20
problems I am trying to upgrade the kernel from the 2.4.9-32 on the =
0.9.3 ISO to=20
something more recent.&nbsp; Specifically, I've tried 32-2.4.16-pa24 and =

pa29.&nbsp; I ftp'd the tar files from the 32-bit directory, untarred / =
unzipped=20
the contents, copied them into /boot, changed the link for vmlinux, and =
modified=20
/etc/palo.conf.&nbsp; However, in both cases when I boot, everything =
initially=20
looks like it will boot OK, but I eventually get a stack pointer error, =
a long=20
hex dump, and finally "Kernel Fault: Code=3D15 regs=3D102af4c0 =
(Addr=3D00368004)"=20
....&nbsp; This all appears on the STI head, even though I changed =
console to=20
ttyS0, and scrolls by too fast to get much meaningful info prior to the =
hex=20
dump.&nbsp; </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Do I have to upgrade from source (which =
I'll try=20
next) or am I doing something wrong or both?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0019_01C19113.FAC364C0--
