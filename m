Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A51C4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Apr 2003 01:36:16 -0700 (MST)
Message-Id: <03Apr2.105446cest.119062@ns.hiscom.nl>
From: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: "'Joel Soete'" <jsoe0708@tiscali.be>,
	Derek Ellis <Derek.Ellis@us.fortis.com>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] soft power and power light on 712/60
Date: Wed, 2 Apr 2003 10:35:56 +0200 
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2F8F2.E11ACFC0"
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

------_=_NextPart_001_01C2F8F2.E11ACFC0
Content-Type: text/plain;
	charset="iso-8859-1"

> -----Original Message-----
> From: Joel Soete [mailto:jsoe0708@tiscali.be]
> 
> >
> >The only thing unusual about the setup is that I replaced the old 500mb
HP
> >hard drive with a 4.5gig IBM drive with a 68pin-50pin converter.
> >
> Hmm it is highly probable.
> 
> Four years ago, for a project of upgrade 712 workstation, we asked to HP
> if it was possible to put internal (SE) 4Gb disk. HP said that it was only
> supported on 712/100.

The only reason I can imagine it should not work is addressing the
boot-image from the boot-prom.

Or else, it should not be called scsi...

> 
> Later, I had the opportunity to test Linux on a old 4Gb (SE) external disk
> with an old 712/60. (Even thought it was the very begining, it still works
> fine and help me a lot). Then I remember that 'not supported' didn' t
means
> that it would not works. So I removed this disk from its enclosure and put
> it into the workstation. Well it works but not for a long time: apparently
> it warmed too much  but fortunately not too long time (so I can put it
back
> in its original enclosure and continu to work). So there are an actual
problem
> of heat exchange in this small box?

When you look inside a 712, you should expect heat problems with the drive.
Its mounted in polysterene foam, also known for its perfect heat
insulation...

Hence, if you expect or experience heat problems in a 712, you can remove
the insulation and create real mounting brackets.


btw: all my ideas, not physically tested.

CBee

------_=_NextPart_001_01C2F8F2.E11ACFC0
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
<TITLE>RE: [parisc-linux] soft power and power light on 712/60</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: Joel Soete [<A =
HREF=3D"mailto:jsoe0708@tiscali.be">mailto:jsoe0708@tiscali.be</A>]</FON=
T>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt;</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;The only thing unusual about the setup is =
that I replaced the old 500mb HP</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;hard drive with a 4.5gig IBM drive with a =
68pin-50pin converter.</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;</FONT>
<BR><FONT SIZE=3D2>&gt; Hmm it is highly probable.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Four years ago, for a project of upgrade 712 =
workstation, we asked to HP</FONT>
<BR><FONT SIZE=3D2>&gt; if it was possible to put internal (SE) 4Gb =
disk. HP said that it was only</FONT>
<BR><FONT SIZE=3D2>&gt; supported on 712/100.</FONT>
</P>

<P><FONT SIZE=3D2>The only reason I can imagine it should not work is =
addressing the boot-image from the boot-prom.</FONT>
</P>

<P><FONT SIZE=3D2>Or else, it should not be called scsi...</FONT>
</P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Later, I had the opportunity to test Linux on a =
old 4Gb (SE) external disk</FONT>
<BR><FONT SIZE=3D2>&gt; with an old 712/60. (Even thought it was the =
very begining, it still works</FONT>
<BR><FONT SIZE=3D2>&gt; fine and help me a lot). Then I remember that =
'not supported' didn' t means</FONT>
<BR><FONT SIZE=3D2>&gt; that it would not works. So I removed this disk =
from its enclosure and put</FONT>
<BR><FONT SIZE=3D2>&gt; it into the workstation. Well it works but not =
for a long time: apparently</FONT>
<BR><FONT SIZE=3D2>&gt; it warmed too much&nbsp; but fortunately not =
too long time (so I can put it back</FONT>
<BR><FONT SIZE=3D2>&gt; in its original enclosure and continu to work). =
So there are an actual problem</FONT>
<BR><FONT SIZE=3D2>&gt; of heat exchange in this small box?</FONT>
</P>

<P><FONT SIZE=3D2>When you look inside a 712, you should expect heat =
problems with the drive. Its mounted in polysterene foam, also known =
for its perfect heat insulation...</FONT></P>

<P><FONT SIZE=3D2>Hence, if you expect or experience heat problems in a =
712, you can remove the insulation and create real mounting =
brackets.</FONT></P>
<BR>

<P><FONT SIZE=3D2>btw: all my ideas, not physically tested.</FONT>
</P>

<P><FONT SIZE=3D2>CBee</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2F8F2.E11ACFC0--
