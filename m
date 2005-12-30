From: "Craig D. Lansing" <clansing@charter.net>
Subject: [parisc-linux] J2240 - Almost there....
Date: Fri, 30 Dec 2005 10:51:22 -0500
Message-ID: <000101c60d58$e249ac40$3401a8c0@POGO>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1665340200=="
To: <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.

--===============1665340200==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0002_01C60D2E.F973A440"

This is a multi-part message in MIME format.

------=_NextPart_000_0002_01C60D2E.F973A440
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I have an old J2240 w/ p1120 console that I was going to throw away, but
decided to load the most recent PA-RISC Linux instead.  I had loaded and
gotten it running from the PA-RISC project several years ago.  Using the
ISO's from 12/19/05 I was able to successfully install on one of the hdd's
(FWSCSI.5.0), but cannot boot to a prompt. When booting from path FWSCSI.5.0
I get the 2 Tux images, a long list of console output, and get the point
below and it freezes.  I have tried booting using a serial console, but
cannot get connected to the serial port.  Any ideas on how to proceed from
here?

 

End of console output:

----------------------------------------------------------------------------
--------------------------------------------------------

Starting hotplug subsystem:

            pci

                        tulip: already loaded

defxx.c:v1.06 2003/08/04 Lawrence V. Stephani and others

fddi%d: DEFPA at I/O addr = 0x100, IRQ = 96, Hardware addr =
58-B0-60-00-00-00

----------------------------------------------------------------------------
---------------------------------------------------------

 

Other info.:

SESCSI.3.0 = HP C1537A Tape

SESCSI.2.0 = Toshiba CD-ROM (used for install)

FWSCSI.6.0 = IBM HDD (HP-UX 10.0)

FWSCSI.5.0 = IBM HDD (Linux)

 

 

 

 

 


------=_NextPart_000_0002_01C60D2E.F973A440
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I have an old J2240 w/ p1120 console that I was going =
to
throw away, but decided to load the most recent PA-RISC Linux =
instead.&nbsp; I
had loaded and gotten it running from the PA-RISC project several years
ago.&nbsp; Using the ISO&#8217;s from 12/19/05 I was able to =
successfully
install on one of the hdd&#8217;s (FWSCSI.5.0), but cannot boot to a =
prompt.
When booting from path FWSCSI.5.0 I get the 2 Tux images, a long list of
console output, and get the point below and it freezes.&nbsp; I have =
tried
booting using a serial console, but cannot get connected to the serial
port.&nbsp; Any ideas on how to proceed from =
here?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>End of console output:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>------------------------------------------------------=
-------------------------------------------------------------------------=
-----<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Starting hotplug =
subsystem:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; pci<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tulip:
already loaded<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>defxx.c:v1.06 2003/08/04 Lawrence V. Stephani and =
others<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>fddi%d: DEFPA at I/O addr =3D 0x100, IRQ =3D 96, =
Hardware addr =3D
58-B0-60-00-00-00<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>------------------------------------------------------=
-------------------------------------------------------------------------=
------<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Other info.:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>SESCSI.3.0 =3D HP C1537A =
Tape<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>SESCSI.2.0 =3D Toshiba CD-ROM (used for =
install)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>FWSCSI.6.0 =3D IBM HDD (HP-UX =
10.0)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>FWSCSI.5.0 =3D IBM HDD =
(Linux)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0002_01C60D2E.F973A440--


--===============1665340200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1665340200==--
