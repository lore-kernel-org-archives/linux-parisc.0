Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA18841
	for <parisc-linux@puffin.external.hp.com>; Thu, 3 Aug 2000 07:03:42 -0600
From: Marc Dijkstra <Marc.Dijkstra@intrinsitech.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <002701bffd86$155c51c0$da0d60c0@dijkstram.intrinsitech.com>
Date: Thu, 3 Aug 2000 15:04:51 -0500
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0024_01BFFD5C.2C7D2200"
Subject: [parisc-linux] SPUID.
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0024_01BFFD5C.2C7D2200
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all
=20
Strange request I guess, but having a rather nary problem. Changed a
motherboard in a HPs700 B-class workstation and could not read the
LanAddress off the EEPROM (label or otherwise). Need to process a
lanaddress from the SPUID (dec or hex) to use the HP ss_config utility
to change lanaddress.
=20
Anyone in the ether out there working on HP's know the algorithm HP's
use to work out the mac from the SPUID (Software ID) of the Processor?
My current setup (which is wrong) SPUID dec =3D 2002372255
                                                  SPUID hex =3D =
0x7759c69f
                                                  LanAddress =3D
0060b0-f92342
=20
Should be SPUID dec =3D 2002392735
                SPUID hex =3D 0x775a169f
                lanaddress =3D Thats what I need!!!!!
=20
Ta
=20
=20
Marc Dijkstra


------=_NextPart_000_0024_01BFFD5C.2C7D2200
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD W3 HTML//EN">
<HTML>
<HEAD>


<META content=3D'"MSHTML 4.72.3110.7"' name=3DGENERATOR>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT color=3D#000000 size=3D2>Hi all</FONT></DIV>
<DIV><FONT color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Strange request I guess, but having a rather nary =
problem.=20
Changed a motherboard in a HPs700 B-class workstation and could not =
read the=20
LanAddress off the EEPROM (label or otherwise). Need to process a =
lanaddress=20
from the SPUID (dec or hex) to use the HP ss_config utility to change=20
lanaddress.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Anyone in the ether out there working on HP's know =
the=20
algorithm HP's use to work out the mac from the SPUID (Software ID) of =
the=20
Processor?</FONT></DIV>
<DIV><FONT size=3D2>My current setup (which is wrong) SPUID dec =3D=20
2002372255</FONT></DIV>
<DIV><FONT size=3D2></FONT><FONT color=3D#000000=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
SPUID hex =3D 0x7759c69f</FONT></DIV>
<DIV><FONT color=3D#000000=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
LanAddress =3D 0060b0-f92342</FONT></DIV>
<DIV><FONT color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Should be SPUID dec =3D 2002392735</FONT></DIV>
<DIV><FONT size=3D2></FONT><FONT color=3D#000000=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
SPUID hex =3D 0x775a169f</FONT></DIV>
<DIV><FONT color=3D#000000=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
lanaddress =3D Thats what I need!!!!!</FONT></DIV>
<DIV><FONT color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Ta</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#000000 size=3D2>Marc =
Dijkstra<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_0024_01BFFD5C.2C7D2200--
