Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA08637
	for <parisc-linux@puffin.external.hp.com>; Thu, 19 Oct 2000 05:05:29 -0600
Received: from pc5158b (pc5158b.esiee.fr [147.215.50.168])
	by mail.esiee.fr (Postfix) with SMTP id 392CE57329
	for <parisc-linux@thepuffingroup.com>; Thu, 19 Oct 2000 13:06:39 +0200 (CEST)
Message-ID: <004a01c05221$772fe5c0$a832d793@esiee.fr>
From: "Thomas Marteau" <marteaut@esiee.fr>
To: <parisc-linux@thepuffingroup.com>
Date: Sun, 19 Nov 2000 13:08:45 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0047_01C05229.D8DA5D20"
Subject: [parisc-linux] Booting 712 STI and nfs
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0047_01C05229.D8DA5D20
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

We managed to boot on the STI-console with a 712/80 in changing the =
parameters in inittab and in securetty (if you want to login as root).=20

> cat inittab (! just the interesting thing!)
# /sbin/getty invocations for the runlevels.
#
# The "id" field MUST be the same as the last
# characters of the device (after "tty").
#
# Format:
#  <id>:<runlevels>:<action>:<process>
1:2345:respawn:/sbin/getty 38400 tty1
#2:23:respawn:/sbin/getty 38400 tty2
#3:23:respawn:/sbin/getty 38400 tty3
#4:23:respawn:/sbin/getty 38400 tty4
#5:23:respawn:/sbin/getty 38400 tty5
#6:23:respawn:/sbin/getty 38400 tty6

=20

> cat securetty
# /etc/securetty: list of terminals on which root is allowed to login.
# See securetty(5) and login(1).
ttyS0
tty1

Also, in order to boot with the STI console, you need to have the module =
for STI-console and not for serial console support...

But, we have troubles with the rpc that print somestimes
nfs: server X.X.X.165 not responding, still trying
nfs: server X.X.X.165 OK
nfs: server X.X.X.165 not responding, still trying
nfs: server X.X.X.165 OK
nfs: server X.X.X.165 not responding, still trying
nfs: server X.X.X.165 OK
We don't understand where comes from the problem!!

Bye,
ESIEE Port Team

------=_NextPart_000_0047_01C05229.D8DA5D20
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
<DIV><FONT face=3DArial size=3D2>Hi all,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>We managed to boot on the STI-console =
with a 712/80=20
in changing the parameters in inittab and in securetty (if you want to =
login as=20
root). </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&gt; cat inittab (! just the =
interesting=20
thing!)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># /sbin/getty invocations for the=20
runlevels.<BR>#<BR># The "id" field MUST be the same as the last<BR># =
characters=20
of the device (after "tty").<BR>#<BR># Format:<BR>#&nbsp;=20
&lt;id&gt;:&lt;runlevels&gt;:&lt;action&gt;:&lt;process&gt;<BR>1:2345:res=
pawn:/sbin/getty=20
38400 tty1<BR>#2:23:respawn:/sbin/getty 38400 =
tty2<BR>#3:23:respawn:/sbin/getty=20
38400 tty3<BR>#4:23:respawn:/sbin/getty 38400 =
tty4<BR>#5:23:respawn:/sbin/getty=20
38400 tty5<BR>#6:23:respawn:/sbin/getty 38400 tty6</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&gt; cat securetty</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># /etc/securetty: list of terminals on =
which root=20
is allowed to login.<BR># See securetty(5) and=20
login(1).<BR>ttyS0<BR>tty1</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Also, in order to boot with the STI =
console, you=20
need to have the module for STI-console and not for serial console=20
support...</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>But, we have troubles with the rpc that =
print=20
somestimes</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>nfs: server X.X.X.165 not responding, =
still=20
trying</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>nfs: server X.X.X.165 OK</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>nfs: server X.X.X.165 not responding, =
still=20
trying</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>nfs: server X.X.X.165 OK</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>nfs: server X.X.X.165 not responding, =
still=20
trying</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>nfs: server X.X.X.165 OK</FONT></DIV>
<DIV>We don't understand where comes from the problem!!</DIV>
<DIV>&nbsp;</DIV>
<DIV>Bye,</DIV>
<DIV>ESIEE Port Team</DIV></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0047_01C05229.D8DA5D20--
