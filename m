Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9193A4832
	for <parisc-linux@parisc-linux.org>; Thu, 10 Oct 2002 01:27:52 -0600 (MDT)
Message-Id: <02Oct10.094018cest.119058@ns.hiscom.nl>
From: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: "'Jeffo'" <jeffo@pop.hsbc.com.br>
Cc: "'parisc-linux maillist'" <parisc-linux@parisc-linux.org>
Subject: RE: [parisc-linux] Burning CD Images difficulties: revisited
Date: Thu, 10 Oct 2002 09:27:37 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2702E.8229A8D0"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2702E.8229A8D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Jeffo [mailto:jeffo@pop.hsbc.com.br]
> Hello all!
> I hope this is the right place for posting such a question:
>=20
> - I=B4ve tried MANY times  (5) burning an PA-RISC image to a=20
> bootable CD.
> Couldn=B4t make my system
> boot from the CD though...the image I=B4m talking about is this one:
> http://pateam.esiee.fr/cd-images/palinux-0.9.3.iso

Other replies indicate how to test the image.

>=20
> I have a 712/60 HP station, with an external SCSI CD-rom=20
> drive. The drive is
> at ID "scsi.3.0".
> I do the boot search after the POST routine, it finds my SCSI=20
> drive, its
> brand and everything else.

What brand is it? Run-time, there are no special requirements.

>=20
> When I try to boot from the CD the station simply does=20
> nothing. It tryes to boot and returns
> to the BOOT_ADMIN screen. ONCE I could get a message like "loading =
the
> stuff, etc....OPS, KERNEL something".
> And only ONCE...in one of the first CDs.

Boot time, the HP bootloader requires 2KByte block size. Most (if not =
all)
CDRom players use 512Byte blocksize by default. Try to figure out if =
your
CDRom can do a 2KByte blocksize.

>=20
> I did an extensive search on the Internet regarding this=20
> subject, and used all hints found for
> the burning software (yes, I=B4m burning on XP, unfortunately=20
> all linuxes I=B4ve found doens=B4t
> have CD writers)...used Nero 5.5, CDRWin 4.0B and Blindwrite.=20
> None of them seem to burn this image
> correctly. And I say that with the knowledge after burning many, many
> applications, games, etc
> onto CD-R. Protected or not. For AIX, for Windows, for Solaris.
> Weird...

As above, most likely, the image is not the problem, it's the blocksize =
the
drive provides to the system.

>=20
> The simptoms are:
>=20
> - If I load the CD on a windows machine, everything seems to be fine,
> DESPITE all filenames being in CAPS... (bad sign?)

iso9660 is a single-case (that's the all-caps) and versioned (that's =
the ;1)
filesystem.

> - On the 712/60 it won=B4t boot.
> - After booting into HP-UX, if I try to mount the CD it takes=20
> a looong time and then the OS finally mounts it, but all filenames =
are=20
> capitalised AND SOMETIMES, the ";1" suffix is appended to every =
filename.
I=B4ve seen
> something about that on Nero, but on tabs that you simply  cannot =
change.
> (something like "doesn=B4t append ;1 on...")
> - I contacted a friend and co-worker which is a "Linux" guy,=20
> but he wasn=B4t willing to help much..
> - Things that I=B4ve read on the net like "Search the iso or=20
> the CD for the #8000 sector and see if the MAGIC word is on there =
(CD001)=20
> and IT IS in all Cds I=B4ve searched.
>=20
> I am REALLY interested in putting this thing to run up on my HP
> station....but I=B4m having a hard time...

If you have no success on the CDRom player, try a netboot if you have =
an
other machine around. Check the website for more info. A search key can =
be
"bootp" since that's the network boot protocol.




Success
CBee

------_=_NextPart_001_01C2702E.8229A8D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2654.45">
<TITLE>RE: [parisc-linux] Burning CD Images difficulties: =
revisited</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: Jeffo [<A =
HREF=3D"mailto:jeffo@pop.hsbc.com.br">mailto:jeffo@pop.hsbc.com.br</A>]<=
/FONT>
<BR><FONT SIZE=3D2>&gt; Hello all!</FONT>
<BR><FONT SIZE=3D2>&gt; I hope this is the right place for posting such =
a question:</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; - I=B4ve tried MANY times&nbsp; (5) burning an =
PA-RISC image to a </FONT>
<BR><FONT SIZE=3D2>&gt; bootable CD.</FONT>
<BR><FONT SIZE=3D2>&gt; Couldn=B4t make my system</FONT>
<BR><FONT SIZE=3D2>&gt; boot from the CD though...the image I=B4m =
talking about is this one:</FONT>
<BR><FONT SIZE=3D2>&gt; <A =
HREF=3D"http://pateam.esiee.fr/cd-images/palinux-0.9.3.iso" =
TARGET=3D"_blank">http://pateam.esiee.fr/cd-images/palinux-0.9.3.iso</A>=
</FONT>
</P>

<P><FONT SIZE=3D2>Other replies indicate how to test the image.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; I have a 712/60 HP station, with an external =
SCSI CD-rom </FONT>
<BR><FONT SIZE=3D2>&gt; drive. The drive is</FONT>
<BR><FONT SIZE=3D2>&gt; at ID &quot;scsi.3.0&quot;.</FONT>
<BR><FONT SIZE=3D2>&gt; I do the boot search after the POST routine, it =
finds my SCSI </FONT>
<BR><FONT SIZE=3D2>&gt; drive, its</FONT>
<BR><FONT SIZE=3D2>&gt; brand and everything else.</FONT>
</P>

<P><FONT SIZE=3D2>What brand is it? Run-time, there are no special =
requirements.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; When I try to boot from the CD the station =
simply does </FONT>
<BR><FONT SIZE=3D2>&gt; nothing. It tryes to boot and returns</FONT>
<BR><FONT SIZE=3D2>&gt; to the BOOT_ADMIN screen. ONCE I could get a =
message like &quot;loading the</FONT>
<BR><FONT SIZE=3D2>&gt; stuff, etc....OPS, KERNEL =
something&quot;.</FONT>
<BR><FONT SIZE=3D2>&gt; And only ONCE...in one of the first CDs.</FONT>
</P>

<P><FONT SIZE=3D2>Boot time, the HP bootloader requires 2KByte block =
size. Most (if not all) CDRom players use 512Byte blocksize by default. =
Try to figure out if your CDRom can do a 2KByte blocksize.</FONT></P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; I did an extensive search on the Internet =
regarding this </FONT>
<BR><FONT SIZE=3D2>&gt; subject, and used all hints found for</FONT>
<BR><FONT SIZE=3D2>&gt; the burning software (yes, I=B4m burning on XP, =
unfortunately </FONT>
<BR><FONT SIZE=3D2>&gt; all linuxes I=B4ve found doens=B4t</FONT>
<BR><FONT SIZE=3D2>&gt; have CD writers)...used Nero 5.5, CDRWin 4.0B =
and Blindwrite. </FONT>
<BR><FONT SIZE=3D2>&gt; None of them seem to burn this image</FONT>
<BR><FONT SIZE=3D2>&gt; correctly. And I say that with the knowledge =
after burning many, many</FONT>
<BR><FONT SIZE=3D2>&gt; applications, games, etc</FONT>
<BR><FONT SIZE=3D2>&gt; onto CD-R. Protected or not. For AIX, for =
Windows, for Solaris.</FONT>
<BR><FONT SIZE=3D2>&gt; Weird...</FONT>
</P>

<P><FONT SIZE=3D2>As above, most likely, the image is not the problem, =
it's the blocksize the drive provides to the system.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; The simptoms are:</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; - If I load the CD on a windows machine, =
everything seems to be fine,</FONT>
<BR><FONT SIZE=3D2>&gt; DESPITE all filenames being in CAPS... (bad =
sign?)</FONT>
</P>

<P><FONT SIZE=3D2>iso9660 is a single-case (that's the all-caps) and =
versioned (that's the ;1) filesystem.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; - On the 712/60 it won=B4t boot.</FONT>
<BR><FONT SIZE=3D2>&gt; - After booting into HP-UX, if I try to mount =
the CD it takes </FONT>
<BR><FONT SIZE=3D2>&gt; a looong time and then the OS finally mounts =
it, but all filenames are </FONT>
<BR><FONT SIZE=3D2>&gt; capitalised AND SOMETIMES, the &quot;;1&quot; =
suffix is appended to every filename. I=B4ve seen</FONT>
<BR><FONT SIZE=3D2>&gt; something about that on Nero, but on tabs that =
you simply&nbsp; cannot change.</FONT>
<BR><FONT SIZE=3D2>&gt; (something like &quot;doesn=B4t append ;1 =
on...&quot;)</FONT>
<BR><FONT SIZE=3D2>&gt; - I contacted a friend and co-worker which is a =
&quot;Linux&quot; guy, </FONT>
<BR><FONT SIZE=3D2>&gt; but he wasn=B4t willing to help much..</FONT>
<BR><FONT SIZE=3D2>&gt; - Things that I=B4ve read on the net like =
&quot;Search the iso or </FONT>
<BR><FONT SIZE=3D2>&gt; the CD for the #8000 sector and see if the =
MAGIC word is on there (CD001) </FONT>
<BR><FONT SIZE=3D2>&gt; and IT IS in all Cds I=B4ve searched.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; I am REALLY interested in putting this thing to =
run up on my HP</FONT>
<BR><FONT SIZE=3D2>&gt; station....but I=B4m having a hard =
time...</FONT>
</P>

<P><FONT SIZE=3D2>If you have no success on the CDRom player, try a =
netboot if you have an other machine around. Check the website for more =
info. A search key can be &quot;bootp&quot; since that's the network =
boot protocol.</FONT></P>
<BR>
<BR>
<BR>

<P><FONT SIZE=3D2>Success</FONT>
<BR><FONT SIZE=3D2>CBee</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2702E.8229A8D0--
