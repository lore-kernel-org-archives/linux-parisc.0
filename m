Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9FAED4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 08:13:48 -0600 (MDT)
Message-Id: <03Apr16.163312cest.119050@ns.hiscom.nl>
From: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: "'M. Grabert'" <xam@cs.ucc.ie>, Matthew Wilcox <willy@debian.org>
Cc: Gavin Hubbard <ghub005@xtra.co.nz>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Re: Presicionbook success
Date: Wed, 16 Apr 2003 16:13:32 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C30422.5CC0E350"
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

------_=_NextPart_001_01C30422.5CC0E350
Content-Type: text/plain;
	charset="iso-8859-1"

> -----Original Message-----
> From: M. Grabert [mailto:xam@cs.ucc.ie]
> 
> On Wed, 16 Apr 2003, Matthew Wilcox wrote:
> 
> > Date: Wed, 16 Apr 2003 14:44:33 +0100
> >
> > On Wed, Apr 16, 2003 at 02:36:25PM +0100, M. Grabert wrote:
> 
> [...]
> 
> > > The initialization of the CMD PCI0643 IDE controller 
> fails when using
> > > the ESIEE kernel (which has support built-in for this chip).
> > > Something like "failed to get IRQ, will probe later".
> >
> > Oh, I thought you said the kernel hung when probing with 
> this driver.
> > If it just whines about being unable to do anything, that's 
> no problem.
> 
> Maybe I was a little bit confusing to you:
> 
> 1. Using a kernel with CMD IDE support, it will hang with the message
>    "will probe IRQs later" ...
> 2. it will not hang if you pass a ide=nodma, but then it will show
>    no devices
> 3. It will just boot fine without any CMD IDE support in the kernel
> 
> > > So no devices were found on the IDE bus, just on the LASI SCSI.
> > > Probably it's the best just to use SCSI and not to use IDE support at
all ...
> >
> > *nod*.  It might be fun for someone to play with fixing the IDE driver,
> > but I don't think that's necessary.

This gives me more and more the impression it is definitly some predecessor
of http://www6.tomshardware.com/storage/20030130/index.html

I think the ide interface is not perfectly hidden behind the scsi interface,
the cpu can still somehow recognize the ide interface. The ide interface
cannot do dma and irq since that is hooked to the scsi interface, not to the
cpu/memory. Hence, I think the best the ide driver can do is not to try
later but to be disabled at all. Btw, what happens if the ide says to try
later, is there a total system pause (resulting in a halt)? or does the
remainder of the system continue (and is it save to ignore)?


CBee

------_=_NextPart_001_01C30422.5CC0E350
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
<TITLE>RE: [parisc-linux] Re: Presicionbook success</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: M. Grabert [<A =
HREF=3D"mailto:xam@cs.ucc.ie">mailto:xam@cs.ucc.ie</A>]</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; On Wed, 16 Apr 2003, Matthew Wilcox =
wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; Date: Wed, 16 Apr 2003 14:44:33 =
+0100</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; On Wed, Apr 16, 2003 at 02:36:25PM +0100, =
M. Grabert wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; [...]</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; The initialization of the CMD PCI0643 =
IDE controller </FONT>
<BR><FONT SIZE=3D2>&gt; fails when using</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; the ESIEE kernel (which has support =
built-in for this chip).</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; Something like &quot;failed to get =
IRQ, will probe later&quot;.</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; Oh, I thought you said the kernel hung =
when probing with </FONT>
<BR><FONT SIZE=3D2>&gt; this driver.</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; If it just whines about being unable to do =
anything, that's </FONT>
<BR><FONT SIZE=3D2>&gt; no problem.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Maybe I was a little bit confusing to =
you:</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; 1. Using a kernel with CMD IDE support, it will =
hang with the message</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp;&nbsp; &quot;will probe IRQs =
later&quot; ...</FONT>
<BR><FONT SIZE=3D2>&gt; 2. it will not hang if you pass a ide=3Dnodma, =
but then it will show</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp;&nbsp; no devices</FONT>
<BR><FONT SIZE=3D2>&gt; 3. It will just boot fine without any CMD IDE =
support in the kernel</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; So no devices were found on the IDE =
bus, just on the LASI SCSI.</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; Probably it's the best just to use =
SCSI and not to use IDE support at all ...</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; *nod*.&nbsp; It might be fun for someone =
to play with fixing the IDE driver,</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; but I don't think that's necessary.</FONT>
</P>

<P><FONT SIZE=3D2>This gives me more and more the impression it is =
definitly some predecessor of <A =
HREF=3D"http://www6.tomshardware.com/storage/20030130/index.html" =
TARGET=3D"_blank">http://www6.tomshardware.com/storage/20030130/index.ht=
ml</A></FONT></P>

<P><FONT SIZE=3D2>I think the ide interface is not perfectly hidden =
behind the scsi interface, the cpu can still somehow recognize the ide =
interface. The ide interface cannot do dma and irq since that is hooked =
to the scsi interface, not to the cpu/memory. Hence, I think the best =
the ide driver can do is not to try later but to be disabled at all. =
Btw, what happens if the ide says to try later, is there a total system =
pause (resulting in a halt)? or does the remainder of the system =
continue (and is it save to ignore)?</FONT></P>
<BR>

<P><FONT SIZE=3D2>CBee</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C30422.5CC0E350--
