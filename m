Return-Path: <nitephyre@iinet.net.au>
Received: from mail.iinet.net.au (mail-10.iinet.net.au [203.59.3.42])
	by dsl2.external.hp.com (Postfix) with SMTP id 494B3484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  3 Jan 2004 23:26:01 -0700 (MST)
Message-ID: <000a01c3d28b$91046fa0$0101a8c0@nitephyre>
From: "Matt Lewis" <nitephyre@iinet.net.au>
To: <parisc-linux@lists.parisc-linux.org>
References: <000801c3d1de$08e053d0$0101a8c0@nitephyre>
	<3FF6A74F.3000108@tiscali.be>
	<001f01c3d24b$5e810600$0101a8c0@nitephyre>
	<20040104045551.GA16904@colo.lackof.org>
Subject: Re: [parisc-linux] Probem Installing: slang(version).deb corrupt
Date: Sun, 4 Jan 2004 16:25:36 +1000
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01C3D2DF.62179B00"
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0007_01C3D2DF.62179B00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

no, i burnt the 70mb netinstall iso to a cd and booted off that.. i =
don't actually have another linux box i can use as a nfs server, and i =
dont have a serial cable..

with the full 650mb cd, when i boot it hangs when i get to the colour =
"welcome to debian... <continue>" screen

I'm using graphics console for all of this...

cheers, matt
  ----- Original Message -----=20
  From: Grant Grundler=20
  To: Matt Lewis=20
  Cc: parisc-linux@lists.parisc-linux.org=20
  Sent: Sunday, January 04, 2004 2:55 PM
  Subject: Re: [parisc-linux] Probem Installing: slang(version).deb =
corrupt


  On Sun, Jan 04, 2004 at 08:46:03AM +1000, Matt Lewis wrote:
  > ok, i went and got the latest testing iso, but now it's saying
  > that libc6_2.2.5-6_hppa.deb was corrupt and cannot download...
  > thats cd no.2 coastered and another 70mb down... any tips?

  Full net install? (net boot with NFS root to run the installer?)

  current lifimages are also available that match the net install ISOs.
  lifimage needs to be served from a bootp server.

  > the orginal problem was from both a cd i got with the computer
  > (an earlier 70mb d/l it seems) and the latest full 650mb iso i =
downloaded...
  > though if i try and boot from the big iso, the installer starts then =
the
  > keyboard wont work... getting frustrated :|

  Is the keyboard hanging using a serial or graphics console?

  In general, the serial console is more stable and I suggest installing
  via the serial console. Disconnect the USB keyboard and connect a DB9
  serial cable to another linux box (9600, 8N1).  Once installed, =
upgrade
  to a 2.4.23 kernel (available from ftp.p-l.o/kernels/c3000) and then
  reconnect the keyboard before rebooting.

  grant


------=_NextPart_000_0007_01C3D2DF.62179B00
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3810.1700" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>no, i burnt the&nbsp;70mb netinstall =
iso to a cd=20
and booted off that.. i don't actually have another linux box i can use =
as a nfs=20
server, and i dont have a serial cable..</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>with the full 650mb cd, when i boot it =
hangs when i=20
get to the colour "welcome to debian... &lt;continue&gt;" =
screen</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm&nbsp;using graphics console for all =
of=20
this...</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>cheers, matt</FONT></DIV>
<BLOCKQUOTE=20
style=3D"BORDER-LEFT: #000000 2px solid; MARGIN-LEFT: 5px; MARGIN-RIGHT: =
0px; PADDING-LEFT: 5px; PADDING-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A href=3D"mailto:grundler@parisc-linux.org"=20
  title=3Dgrundler@parisc-linux.org>Grant Grundler</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  href=3D"mailto:nitephyre@iinet.net.au" =
title=3Dnitephyre@iinet.net.au>Matt=20
  Lewis</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Cc:</B> <A=20
  href=3D"mailto:parisc-linux@lists.parisc-linux.org"=20
  =
title=3Dparisc-linux@lists.parisc-linux.org>parisc-linux@lists.parisc-lin=
ux.org</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Sunday, January 04, 2004 =
2:55=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Re: [parisc-linux] =
Probem=20
  Installing: slang(version).deb corrupt</DIV>
  <DIV><BR></DIV>On Sun, Jan 04, 2004 at 08:46:03AM +1000, Matt Lewis=20
  wrote:<BR>&gt; ok, i went and got the latest testing iso, but now it's =

  saying<BR>&gt; that libc6_2.2.5-6_hppa.deb was corrupt and cannot=20
  download...<BR>&gt; thats cd no.2 coastered and another 70mb down... =
any=20
  tips?<BR><BR>Full net install? (net boot with NFS root to run the=20
  installer?)<BR><BR>current lifimages are also available that match the =
net=20
  install ISOs.<BR>lifimage needs to be served from a bootp =
server.<BR><BR>&gt;=20
  the orginal problem was from both a cd i got with the computer<BR>&gt; =
(an=20
  earlier 70mb d/l it seems) and the latest full 650mb iso i=20
  downloaded...<BR>&gt; though if i try and boot from the big iso, the =
installer=20
  starts then the<BR>&gt; keyboard wont work... getting frustrated =
:|<BR><BR>Is=20
  the keyboard hanging using a serial or graphics console?<BR><BR>In =
general,=20
  the serial console is more stable and I suggest installing<BR>via the =
serial=20
  console. Disconnect the USB keyboard and connect a DB9<BR>serial cable =
to=20
  another linux box (9600, 8N1).&nbsp; Once installed, upgrade<BR>to a =
2.4.23=20
  kernel (available from <A=20
  href=3D"ftp://ftp.p-l.o/kernels/c3000">ftp.p-l.o/kernels/c3000</A>) =
and=20
  then<BR>reconnect the keyboard before=20
rebooting.<BR><BR>grant<BR></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0007_01C3D2DF.62179B00--
