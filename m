Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beldar.com (ns.beldar.com [65.163.106.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id F3C22492D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Nov 2001 18:47:31 -0700 (MST)
Received: from pogo (dhcp-134.beldar.com [65.163.106.134])
	by beldar.com (8.9.3/8.9.3) with SMTP id VAA86090
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Nov 2001 21:01:08 -0500 (EST)
	(envelope-from lansing@beldar.com)
Message-ID: <00fe01c1761c$5bf18000$0101a8c0@pogo>
From: "Craig D. Lansing" <lansing@beldar.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Sun, 25 Nov 2001 20:47:49 -0500
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00FB_01C175F2.71C42560"
Subject: [parisc-linux] J2240 - It Runs!
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

------=_NextPart_000_00FB_01C175F2.71C42560
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

In case anyone cares, I finally got back to my J2240 (the one that was =
rescued from the trash) this weekend and have gotten it successfully =
running with a dual-boot HP-UX 10.20 / Linux 2.4.0-32 configuration.  =
The Debian install was a bit choppy, i.e. many "hangs" from which only =
pulling out power from underneath the box solved, but I eventually got =
there.  Even from a cold boot, the install would hang in different =
places.  I'm having major problems with the package installer hanging =
which causes me to have to power cycle the box and run fsck to recover, =
but the basic system is up and running.  Maybe I'll go to the latest =
kernel to see what that does to / for me.  So far, I've only been able =
to connect to the serial port via a Reflection session to login to the =
system after getting through the boot path & IPL on the attached =
graphics terminal.  Does anyone know how to use the graphics terminal =
exclusively?  I assume that I need to change some of the IPL parms, e.g. =
sti=3D or console=3D, but I do not know what values to use.  Any help =
would be appreciated.

TIA,
Craig


------=_NextPart_000_00FB_01C175F2.71C42560
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
<DIV><FONT face=3DArial size=3D2>In case anyone cares, I finally got =
back to my=20
J2240 (the one that was rescued from the trash) this weekend and have =
gotten it=20
successfully running with a dual-boot HP-UX 10.20 / Linux 2.4.0-32=20
configuration.&nbsp; The Debian install was a bit choppy, i.e. many =
"hangs" from=20
which only pulling out power from underneath the box solved, but I =
eventually=20
got there.&nbsp; Even from a cold boot, the install would hang in =
different=20
places.&nbsp; I'm having major problems with the package installer =
hanging which=20
causes me to have to power cycle the box and run fsck to recover, but =
the basic=20
system is up and running.&nbsp; Maybe I'll go to the latest kernel to =
see what=20
that does to / for me.&nbsp; So far, I've only been able to connect to =
the=20
serial port via a Reflection session to login to the system after =
getting=20
through the boot path &amp; IPL on the attached graphics terminal.&nbsp; =
Does=20
anyone know how to use the graphics terminal exclusively?&nbsp; I assume =
that I=20
need to change some of the IPL parms, e.g. sti=3D or console=3D, but I =
do not know=20
what values to use.&nbsp; Any help would be appreciated.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>TIA,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Craig</FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_00FB_01C175F2.71C42560--
