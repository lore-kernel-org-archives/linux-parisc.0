Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beldar.com (ns.beldar.com [65.163.106.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE8CB482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 08:22:05 -0700 (MST)
Received: from pogo (dhcp-109.beldar.com [65.163.106.109])
	by beldar.com (8.9.3/8.9.3) with SMTP id KAA65114
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 10:42:14 -0500 (EST)
	(envelope-from lansing@beldar.com)
Message-ID: <00f601c1907c$ad5d4580$0101a8c0@pogo>
From: "Craig D. Lansing" <lansing@beldar.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Sat, 29 Dec 2001 10:22:48 -0500
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00F3_01C19052.C3CE9BE0"
Subject: [parisc-linux] J2240 / NIC
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

------=_NextPart_000_00F3_01C19052.C3CE9BE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I just got around to bringing in the J2240 from the garage to connect it =
to the LAN.  Unfortunately, the upgrade to 0.9.3 via iso image seems to =
have rendered the NIC unusable (or did I render the NIC unusable when =
moving the box w/o help?).  Below is the output from boot:

Linux Tulip driver version 0.9.15-pre6 (July 2, 2001)

tulip0: EEPROM default media type Autosense.

tulip0: Index #0 - Media MII (#11) described by a 21142 MII PHY (3) =
block.

tulip0: ***WARNING***: No MII transceiver found!

eth0: Digital DS21143 Tulip rev 33 at 0xfe00, 00:60:B0:B2:FC:F5, IRQ 99.

tulip1: no phy info, aborting mtable build

tulip1: MII transceiver #1 config 1000 status 7809 advertising 01e1.

eth1: Digital DS21143 Tulip rev 48 at 0x1ff00, 00:60:B0:A4:F3:F1, IRQ =
160.

SCSI subsystem driver Revision: 1.00








------=_NextPart_000_00F3_01C19052.C3CE9BE0
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
<DIV><FONT face=3DArial size=3D2>I just got around to bringing in the =
J2240 from the=20
garage to connect it to the LAN.&nbsp; Unfortunately, the upgrade to =
0.9.3 via=20
iso image seems to have rendered the NIC unusable (or did I render the =
NIC=20
unusable when moving the box w/o help?).&nbsp; Below is the output from=20
boot:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3Dr_ansi size=3D2>
<P>Linux Tulip driver version 0.9.15-pre6 (July 2, 2001)</P>
<P>tulip0: EEPROM default media type Autosense.</P>
<P>tulip0: Index #0 - Media MII (#11) described by a 21142 MII PHY (3)=20
block.</P>
<P>tulip0: ***WARNING***: No MII transceiver found!</P>
<P>eth0: Digital DS21143 Tulip rev 33 at 0xfe00, 00:60:B0:B2:FC:F5, IRQ =
99.</P>
<P>tulip1: no phy info, aborting mtable build</P>
<P>tulip1: MII transceiver #1 config 1000 status 7809 advertising =
01e1.</P>
<P>eth1: Digital DS21143 Tulip rev 48 at 0x1ff00, 00:60:B0:A4:F3:F1, IRQ =

160.</P>
<P>SCSI subsystem driver Revision: 1.00</P></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_00F3_01C19052.C3CE9BE0--
