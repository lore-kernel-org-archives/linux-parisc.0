Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA15215
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Oct 2000 06:28:00 -0600
Message-ID: <010401c03dbe$7954b910$0bcea8c0@psb>
From: "Stoyan Zoubev" <s_zoubev@prosyst.bg>
To: <parisc-linux@thepuffingroup.com>
Date: Tue, 24 Oct 2000 15:29:45 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0101_01C03DCF.3CCB1280"
Subject: [parisc-linux] Error building binutils
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0101_01C03DCF.3CCB1280
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=20

I am trying to build the linux kernel for HP PA-RISC target on an =
Intel-based Linux machine, following the instructions in "Getting =
started with Linux/PARISC: How to Build the Toolchain":
I am using binutils-2.10, gcc-2.95.2, glibc-2.1.3. And when I run

<path to binutils sources>/configure --host=3Di386-linux =
--prefix=3D/opt/parisc -- \         target=3Dhppa-linux =
--enable-targets=3Dhppa64-linux --disable-nls

I get the following error:=20
...
*** BFD does not support target hppa64-linux.
*** Look in bfd/config.bfd for supported targets.
Configure in /home/zoubev/build/binutils/opcodes failed, exiting.

Can someone explain me what the problem is? Do I have to download =
binutils-latest.tar.gz, gcc-latest.tar.gz, glibc-latest.tar.gz from =
ftp://puffin.external.hp.com?

Best regards,
St.Zoubev

------=_NextPart_000_0101_01C03DCF.3CCB1280
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2314.1000" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi, </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am trying to build the linux kernel =
for&nbsp;HP=20
PA-RISC target on an&nbsp;Intel-based Linux machine, following the =
instructions=20
in "Getting started with Linux/PARISC: How to Build the =
Toolchain":</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I am using binutils-2.10, gcc-2.95.2, =
glibc-2.1.3.=20
And when I run</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&lt;path to binutils =
sources&gt;/configure=20
--host=3Di386-linux --prefix=3D/opt/parisc -- \ &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; target=3Dhppa-linux --enable-targets=3Dhppa64-linux=20
--disable-nls</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I get the following error: =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>*** BFD does not support target=20
hppa64-linux.<BR>*** Look in bfd/config.bfd for supported =
targets.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Configure in =
/home/zoubev/build/binutils/opcodes=20
failed, exiting.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Can someone explain me what the problem =
is?&nbsp;Do=20
I have to&nbsp;download binutils-latest.tar.gz, gcc-latest.tar.gz,=20
glibc-latest.tar.gz from&nbsp;<A=20
href=3D"ftp://puffin.external.hp.com">ftp://puffin.external.hp.com</A>?</=
FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Best regards,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>St.Zoubev</FONT></DIV></BODY></HTML>

------=_NextPart_000_0101_01C03DCF.3CCB1280--
