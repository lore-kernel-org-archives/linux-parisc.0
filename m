Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from Messiah.FlatlineSystems.net (Messiah.FlatlineSystems.net [206.130.238.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id 939F4482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Jul 2002 18:21:39 -0600 (MDT)
Received: from speedygonzo (Marina@CPE0f1029959776.cpe.net.cable.rogers.com [24.42.83.162] (may be forged))
	by Messiah.FlatlineSystems.net (8.11.6/8.9.3) with SMTP id g6T0K8Z31798
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Jul 2002 20:20:08 -0400
Message-ID: <005901c23695$f9c9e3a0$0500a8c0@speedygonzo>
From: "D. Clarke" <dclarke@FlatlineSystems.net>
To: <parisc-linux@lists.parisc-linux.org>
References: <003101c23687$f1ace540$0500a8c0@speedygonzo>
Subject: Re: [parisc-linux] gzip segmentation fault(s)
Date: Sun, 28 Jul 2002 20:22:07 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0056_01C23674.7217BDE0"
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

------=_NextPart_000_0056_01C23674.7217BDE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Interesting enough, gzip doesn't segfault when i installed from the =
full-install ISO...

~ Darryl
~ http://pileofcrap.org/
  ----- Original Message -----=20
  From: D. Clarke=20
  To: parisc-linux@lists.parisc-linux.org=20
  Sent: Sunday, July 28, 2002 6:41 PM
  Subject: [parisc-linux] gzip segmentation fault(s)


  Hi!

  I just installed 0.9.3 from the base/netinst image fetched from =
/http://ftp.parisc-linux.org/cd-images/palinux-0.9.3-base.iso but I've =
got a small problem.

  Everything installed fine, up until apt was about to do it's thing.  =
After adding an apt source it tried to test and every instance where =
gzip was used it seg faulted.

  Therefore, I only have a base system installed and can't apt-get =
anything :)

  The system is an HP 9000 Server Model D250

  Any and all assistance will be appreciated.  Thanks.

  Here's what dmesg said (numerous times):

  do_page_fault() pid=3D548 command=3D'gzip' type=3D6 =
address=3D0x00000003

       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
  PSW: 00000000000001000000000000001111
  r0-3     00000000 0002fe38 0001dc63 faf00340
  r4-7     0002f638 faf00120 000301d2 00000002
  r8-11    0003025a 00028c34 faf004b8 00000000
  r12-15   00000046 00000014 faf00468 00000000
  r16-19   00000000 00025370 00017800 00000000
  r20-23   00000000 0003005c 00000000 40182310
  r24-27   00000000 00000000 0003005c 0002f638
  r28-31   00000000 00000000 faf003c0 0001dc63
  sr0-3    00000000 00000133 00000000 00000133
  sr4-7    00000133 00000133 00000133 00000133

  IASQ: 00000133 00000133 IAOQ: 00000003 00000007
   IIR: 4bc23ed9    ISR: 00000133  IOR: 40184d84
   CPU:        0   CR30: 1e20c000 CR31: 10338000
   ORIG_R28: 4002a29c



  ~ Darryl
  ~ http://pileofcrap.org/

------=_NextPart_000_0056_01C23674.7217BDE0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Interesting enough, gzip doesn't =
segfault&nbsp;when=20
i installed from the full-install ISO...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>~ Darryl</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>~ http://pileofcrap.org/</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Ddclarke@flatlinesystems.net=20
  href=3D"mailto:dclarke@flatlinesystems.net">D. Clarke</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dparisc-linux@lists.parisc-linux.org=20
  =
href=3D"mailto:parisc-linux@lists.parisc-linux.org">parisc-linux@lists.pa=
risc-linux.org</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Sunday, July 28, 2002 =
6:41 PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> [parisc-linux] gzip =
segmentation=20
  fault(s)</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>Hi!</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I just installed 0.9.3 from the =
base/netinst=20
  image fetched from=20
  /http://ftp.parisc-linux.org/cd-images/palinux-0.9.3-base.iso but I've =
got a=20
  small problem.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Everything installed fine, up until =
apt was about=20
  to do it's thing.&nbsp; After adding an apt source it tried to test =
and every=20
  instance where gzip was used it seg faulted.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Therefore, I only have a base system =
installed=20
  and can't apt-get anything :)</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>The system is an HP 9000 Server Model =

  D250</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Any and all assistance will be =
appreciated.&nbsp;=20
  Thanks.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Here's what dmesg said (numerous=20
  times):</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV><FONT face=3DArial =
size=3D2>
  <DIV>do_page_fault() pid=3D548 command=3D'gzip' type=3D6 =
address=3D0x00000003</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>&nbsp;&nbsp;&nbsp;&nbsp; YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI<BR>PSW: =

  00000000000001000000000000001111<BR>r0-3&nbsp;&nbsp;&nbsp;&nbsp; =
00000000=20
  0002fe38 0001dc63 faf00340<BR>r4-7&nbsp;&nbsp;&nbsp;&nbsp; 0002f638 =
faf00120=20
  000301d2 00000002<BR>r8-11&nbsp;&nbsp;&nbsp; 0003025a 00028c34 =
faf004b8=20
  00000000<BR>r12-15&nbsp;&nbsp; 00000046 00000014 faf00468=20
  00000000<BR>r16-19&nbsp;&nbsp; 00000000 00025370 00017800=20
  00000000<BR>r20-23&nbsp;&nbsp; 00000000 0003005c 00000000=20
  40182310<BR>r24-27&nbsp;&nbsp; 00000000 00000000 0003005c=20
  0002f638<BR>r28-31&nbsp;&nbsp; 00000000 00000000 faf003c0=20
  0001dc63<BR>sr0-3&nbsp;&nbsp;&nbsp; 00000000 00000133 00000000=20
  00000133<BR>sr4-7&nbsp;&nbsp;&nbsp; 00000133 00000133 00000133 =
00000133</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>IASQ: 00000133 00000133 IAOQ: 00000003 00000007<BR>&nbsp;IIR:=20
  4bc23ed9&nbsp;&nbsp;&nbsp; ISR: 00000133&nbsp; IOR:=20
  40184d84<BR>&nbsp;CPU:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;=20
  CR30: 1e20c000 CR31: 10338000<BR>&nbsp;ORIG_R28: 4002a29c</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>~ Darryl</DIV>
  <DIV>~ <A=20
href=3D"http://pileofcrap.org/">http://pileofcrap.org/</A></FONT></DIV></=
BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0056_01C23674.7217BDE0--
