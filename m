Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id C09804829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 09:05:26 -0600 (MDT)
Message-Id: <03Apr16.172458cest.119069@ns.hiscom.nl>
From: =?iso-8859-15?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: "'M. Grabert'" <xam@cs.ucc.ie>,
	=?iso-8859-15?Q?=22Beerse=2C_Corn=E9?= =?iso-8859-15?Q?=22?= <c.beerse@torex-hiscom.nl>
Cc: Matthew Wilcox <willy@debian.org>,
	Gavin Hubbard <ghub005@xtra.co.nz>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Re: Presicionbook success
Date: Wed, 16 Apr 2003 17:05:21 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C30429.99F052E0"
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

------_=_NextPart_001_01C30429.99F052E0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: M. Grabert [mailto:xam@cs.ucc.ie]
> Sent: woensdag 16 april 2003 16:18
>=20
> On Wed, 16 Apr 2003, [iso-8859-1] "Beerse, Corn=E9" wrote:
>=20
> > This gives me more and more the impression it is definitly=20
> some predecessor
> > of http://www6.tomshardware.com/storage/20030130/index.html
> >
>>>>>>>>>>>>>>>>>. snip snip <<<<<<<<<<<<<
>=20
> As stated in my earlier mails, it
>=20
> - hangs (I waited for quite a while!)
> - or continues (if ide=3Dnodma is used)

Then I think the next happens: The ide interface-chip is somehow =
detected
and the system pauses while nothing can continue. I think the cpu steps
aside to have some dma passing by. It either waits for some dma to =
happen or
for a note it can continue. Which never happen and never will happen =
since
the ide interface-chip does this dma to the scsi controler, not to the
cpu-memory.

In this special case, the cpu should not ask the chip if it does dma, =
the
chip sure does dma but it does it not against core memory but against =
the
scsi controler. This will be verry hard to detect from the cpu side. I =
think
the nicest implementation is to use the ide=3Dnodma, either manually or
carefully if a precisionbook is detected.


CBee

------_=_NextPart_001_01C30429.99F052E0
Content-Type: text/html;
	charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-15">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2654.45">
<TITLE>RE: [parisc-linux] Re: Presicionbook success</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: M. Grabert [<A =
HREF=3D"mailto:xam@cs.ucc.ie">mailto:xam@cs.ucc.ie</A>]</FONT>
<BR><FONT SIZE=3D2>&gt; Sent: woensdag 16 april 2003 16:18</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; On Wed, 16 Apr 2003, [iso-8859-1] &quot;Beerse, =
Corn=E9&quot; wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; This gives me more and more the impression =
it is definitly </FONT>
<BR><FONT SIZE=3D2>&gt; some predecessor</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; of <A =
HREF=3D"http://www6.tomshardware.com/storage/20030130/index.html" =
TARGET=3D"_blank">http://www6.tomshardware.com/storage/20030130/index.ht=
ml</A></FONT>
<BR><FONT SIZE=3D2>&gt; &gt;</FONT>
<BR><FONT =
SIZE=3D2>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt=
;&gt;. snip snip =
&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; As stated in my earlier mails, it</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; - hangs (I waited for quite a while!)</FONT>
<BR><FONT SIZE=3D2>&gt; - or continues (if ide=3Dnodma is used)</FONT>
</P>

<P><FONT SIZE=3D2>Then I think the next happens: The ide interface-chip =
is somehow detected and the system pauses while nothing can continue. I =
think the cpu steps aside to have some dma passing by. It either waits =
for some dma to happen or for a note it can continue. Which never =
happen and never will happen since the ide interface-chip does this dma =
to the scsi controler, not to the cpu-memory.</FONT></P>

<P><FONT SIZE=3D2>In this special case, the cpu should not ask the chip =
if it does dma, the chip sure does dma but it does it not against core =
memory but against the scsi controler. This will be verry hard to =
detect from the cpu side. I think the nicest implementation is to use =
the ide=3Dnodma, either manually or carefully if a precisionbook is =
detected.</FONT></P>
<BR>

<P><FONT SIZE=3D2>CBee</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C30429.99F052E0--
