Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.mts.net (smtp1.mts.net [205.200.16.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 28CA64840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Nov 2003 22:31:56 -0700 (MST)
Received: from herrerasaurus (wnpgmb11dc1-167-132.dynamic.mts.net [142.161.167.132])
	by smtp1.mts.net (8.12.8-20030918/8.11.3) with SMTP id hAH5Vr4X011748
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Nov 2003 23:31:54 -0600 (CST)
Reply-To: <sgbrodie@mts.net>
From: "Shane G. Brodie" <sgbrodie@mts.net>
To: <parisc-linux@lists.parisc-linux.org>
Date: Sun, 16 Nov 2003 23:34:27 -0600
Message-ID: <LPENLKGPOOFMNIPKLBNDGEFGCAAA.sgbrodie@mts.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0000_01C3AC9A.2D0FFF30"
Subject: [parisc-linux] HIL Mouse problem
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

------=_NextPart_000_0000_01C3AC9A.2D0FFF30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Okay ... I've given up trying to get networking working for the time being.
I satisfied myself with getting x installed and running, recompiling the
kernel several times.  But, I cannot get the HIL mouse to work at all.

I have followed the instructions in the HOWTO: Using HIL keyboard and HIL
mouse on PARISC to the letter, to no avail.

Machine details:

715/80, 64MB RAM, single 2GB SCSI HD
    EISA 10/100 VG Card in EISA slot
    Boot messages find HIL and PS/2 ports (devices attached)
    HIL mouse works fine under HP-UX 10.01
    HIL keyboard has always worked.

Linux details:

Debian 3.0 r1 Woody
Kernel - 2.4.22-pa17.

I'd gladly provide the dmesg output, but without working network interface,
and no floppy support ...

Any ideas ... I finished going through 1.3 million lines of the mail-list
archive,  before my Windows text editor blew a gasket and GPF'd, without
coming up with anything conclusive.

Noted gpm.conf lines are required in the HOWTO, but the Woody release
doesn't load gpm by default.  I checked on my system and noted that gpm was
not installed.  So, after failing to get the mouse working after following
the HOWTO, I installed gpm to see if that made a difference ... no joy there
either.

Any ideas would be greatly appreciated.

Regards

Shane Brodie

------=_NextPart_000_0000_01C3AC9A.2D0FFF30
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial size=3D2>Okay =
... I've given=20
up trying to get networking working for the time being.&nbsp; I =
satisfied myself=20
with getting x installed and running, recompiling the kernel several=20
times.&nbsp; But, I cannot get the HIL mouse to work at =
all.</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial size=3D2>I have =
followed the=20
instructions in the HOWTO: Using HIL keyboard and HIL mouse on PARISC to =
the=20
letter, to no avail.</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial =
size=3D2>Machine=20
details:</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial =
size=3D2>715/80, 64MB RAM,=20
single 2GB SCSI HD</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003>&nbsp;&nbsp;&nbsp; <FONT =
face=3DArial=20
size=3D2>EISA 10/100 VG Card in EISA slot</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003>&nbsp;&nbsp;&nbsp; <FONT =
face=3DArial=20
size=3D2>Boot messages find HIL and PS/2 ports (devices=20
attached)&nbsp;</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003>&nbsp;&nbsp;&nbsp; <FONT =
face=3DArial=20
size=3D2>HIL mouse works fine under HP-UX 10.01</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003>&nbsp;&nbsp;&nbsp; <FONT =
face=3DArial=20
size=3D2>HIL keyboard has always worked.</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial size=3D2>Linux=20
details:</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial size=3D2>Debian =
3.0 r1=20
Woody</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial size=3D2>Kernel =
-=20
2.4.22-pa17.</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial size=3D2>I'd =
gladly provide=20
the dmesg output, but without working network interface, and no floppy =
support=20
...</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial size=3D2>Any =
ideas ... I=20
finished going through 1.3 million lines of the mail-list archive, =
&nbsp;before=20
my Windows text editor blew a gasket and GPF'd, without coming up with =
anything=20
conclusive.</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial size=3D2>Noted =
gpm.conf lines=20
are required in the HOWTO, but the Woody release doesn't load gpm by=20
default.&nbsp; I checked on my system and noted that gpm was not=20
installed.&nbsp; So, after failing to get the mouse working after =
following the=20
HOWTO, I installed gpm to see if that made a difference ... no joy there =

either.</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial size=3D2>Any =
ideas would be=20
greatly appreciated.</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2>Regards</FONT></SPAN></DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586182005-17112003><FONT face=3DArial size=3D2>Shane=20
Brodie</FONT></SPAN></DIV></BODY></HTML>

------=_NextPart_000_0000_01C3AC9A.2D0FFF30--
