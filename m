From: "Daniel Buenestado" <danielbuenestado@escador.es>
Subject: [parisc-linux] problem with Digital-21440-AF(J3516A) network cards
Date: Fri, 7 Jan 2005 17:47:06 +0100
Message-ID: <AGRMAIL11W0nzlk81ZX00001209@agrmail11.agresso.es>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1351788597=="
Cc: djbuenes@gmail.com
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

--===============1351788597==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0034_01C4F4E0.E774F530"

This is a multi-part message in MIME format.

------=_NextPart_000_0034_01C4F4E0.E774F530
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

I am having some issues to get  a J3516A network card (Digital-21440-AF
chipset) working under Linux on an A180C / 256MB ram / 9GB SCSI box.

 

I have tried with both kernel 2.4.17-32 and 2.6.8.1-1-32, including latest
apt-get upgrade to unstable, but still having the same issue.

 

Problem is as follows:

-network card has 2 ports which are assigned to eth1 and eth2 (internal
motherboard nic gets eth0)

-when cold booting the machine, if eth1 or eth2 have a network cable plugged
in, the moment linux tries to bring up the interface, complete system
freezes

-this also happens when issuing "ifup eth1" from the shell prompt: system
stops responding and I have to power cycle it

-problem doesn't happen if you bring up the interface without network cable,
then plug cable in

-once the nic has been enabled and cable plugged once, a software reboot
(ie: not pushing the button) doesn't get stuck when enabling interface again

 

I have been searching in the mailing list and the internet, looking for
related issues but couldn't find anything. Also thought it could be a broken
hardware issue, but I have reproduced this on three different machines (same
configuration)

 

Some extra information (from dmesg):

(..)

5. HP HSC-PCI Cards (4) at 0xfff84000 [8/4], versions 0x4, 0x0, 0x9d

(.)

Linux NET4.0 for Linux 2.4

(.)

Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)

tulip0: no phy info, aborting mtable build

tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.

eth0: Digital DS21143 Tulip rev 48 at 0xff00, 00:10:83:03:3A:92, IRQ 96.

tulip1:  MII transceiver #1 config 3100 status 7849 advertising 01e1.

eth1: Digital DS21140 Tulip rev 34 at 0x10000, 10:00:36:83:62:E4, IRQ 129.

tulip2:  MII transceiver #1 config 3100 status 7849 advertising 01e1.

eth2: Digital DS21140 Tulip rev 34 at 0x10080, 10:00:36:83:63:E4, IRQ 130.

(.)

 

Has anyone experienced similar issues? any clue how to make this card work
under Linux?, any help would be greatly appreciated!

 

Thanks

Dani


------=_NextPart_000_0034_01C4F4E0.E774F530
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
	{margin:0cm;
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
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I am having some issues to get &nbsp;a J3516A network =
card (Digital-21440-AF
chipset) working under Linux on an A180C / 256MB ram / 9GB SCSI =
box.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I have tried with both kernel 2.4.17-32 and =
2.6.8.1-1-32,
including latest apt-get upgrade to unstable, but still having the same =
issue.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Problem is as follows:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>-network card has 2 ports which are assigned to eth1 =
and
eth2 (internal motherboard nic gets eth0)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>-when cold booting the machine, if eth1 or eth2 have =
a
network cable plugged in, the moment linux tries to bring up the =
interface,
complete system freezes<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>-this also happens when issuing &#8220;ifup =
eth1&#8221; from
the shell prompt: system stops responding and I have to power cycle =
it<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>-problem doesn&#8217;t happen if you bring up the =
interface
without network cable, then plug cable in<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>-once the nic has been enabled and cable plugged =
once, a
software reboot (ie: not pushing the button) doesn&#8217;t get stuck =
when
enabling interface again<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I have been searching in the mailing list and the =
internet, looking
for related issues but couldn&#8217;t find anything. Also thought it =
could be a
broken hardware issue, but I have reproduced this on three different =
machines
(same configuration)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Some extra information (from =
dmesg):<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>(&#8230;.)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>5. HP HSC-PCI Cards (4) at 0xfff84000 [8/4], versions =
0x4,
0x0, 0x9d<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>(&#8230;)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Linux NET4.0 for Linux =
2.4<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>(&#8230;)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Linux Tulip driver version 0.9.15-pre9 (Nov 6, =
2001)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>tulip0: no phy info, aborting mtable =
build<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>tulip0:&nbsp; MII transceiver #1 config 1000 status =
782d
advertising 01e1.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>eth0: Digital DS21143 Tulip rev 48 at 0xff00,
00:10:83:03:3A:92, IRQ 96.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>tulip1:&nbsp; MII transceiver #1 config 3100 status =
7849
advertising 01e1.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>eth1: Digital DS21140 Tulip rev 34 at 0x10000,
10:00:36:83:62:E4, IRQ 129.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>tulip2:&nbsp; MII transceiver #1 config 3100 status =
7849
advertising 01e1.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>eth2: Digital DS21140 Tulip rev 34 at 0x10080,
10:00:36:83:63:E4, IRQ 130.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>(&#8230;)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Has anyone experienced similar issues? any clue how =
to make
this card work under Linux?, any help would be greatly =
appreciated!<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Dani<o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0034_01C4F4E0.E774F530--


--===============1351788597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1351788597==--
