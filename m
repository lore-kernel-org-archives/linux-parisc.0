Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D6894829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 08:00:58 -0600 (MDT)
Message-Id: <03Apr16.162029cest.119065@ns.hiscom.nl>
From: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: "'M. Grabert'" <xam@cs.ucc.ie>, Matthew Wilcox <willy@debian.org>
Cc: Gavin Hubbard <ghub005@xtra.co.nz>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Re: Presicionbook success
Date: Wed, 16 Apr 2003 16:00:52 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C30420.9780EFA0"
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

------_=_NextPart_001_01C30420.9780EFA0
Content-Type: text/plain;
	charset="iso-8859-1"

> -----Original Message-----
> From: M. Grabert [mailto:xam@cs.ucc.ie]
> Sent: woensdag 16 april 2003 15:36
> To: Matthew Wilcox
> Cc: Gavin Hubbard; parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] Re: Presicionbook success
> 
> 
> On Wed, 16 Apr 2003, Matthew Wilcox wrote:
> 
> > On Thu, Apr 17, 2003 at 01:15:31AM +1200, Gavin Hubbard wrote:
> > > Before anyone loses too much sleep over this, the 
> Precisionbook has
> > > internal SCSI-IDE bridges that sit between the HBA and 
> the drives. I
> > > believe a similar system was used in some of the earlier 
> Apple Powerbooks.
> >
> > Yep, someone pointed that out in an earlier email.  I'm 
> just trying to
> > figure out how to handle this for the best.
> >
> > 1) Provide a pci quirk that deletes the IDE device from the bus
> > 2) Hack the IDE driver to not claim that device if it's on 
> a PrecisionBook
> > 3) Ignore the scsi device and let the IDE driver drive the chips
> > 4) Er.. something else.
> 
> The initialization of the CMD PCI0643 IDE controller fails when using
> the ESIEE kernel (which has support built-in for this chip).
> Something like "failed to get IRQ, will probe later".
> 
> So no devices were found on the IDE bus, just on the LASI SCSI.
> Probably it's the best just to use SCSI and not to use IDE 
> support at all ...


Is this something like
http://www6.tomshardware.com/storage/20030130/index.html ? Then you
(electronically) cannot find any ide at all, its hidden behind the scsi
interface. If you see part of it, then best to try to handle it as good as
possible (try 'not at all' for a start). I think the 'will probe later' can
be canceled, triggered by a found scsi interface.

For what its worth, I think the IRQ is hooked to the scsi interface, not to
the processor.

btw, what does an `ioscan` from HP-UX report? I guess it only sees scsi.


CBee



------_=_NextPart_001_01C30420.9780EFA0
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
<BR><FONT SIZE=3D2>&gt; Sent: woensdag 16 april 2003 15:36</FONT>
<BR><FONT SIZE=3D2>&gt; To: Matthew Wilcox</FONT>
<BR><FONT SIZE=3D2>&gt; Cc: Gavin Hubbard; =
parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>&gt; Subject: Re: [parisc-linux] Re: Presicionbook =
success</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; On Wed, 16 Apr 2003, Matthew Wilcox =
wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; On Thu, Apr 17, 2003 at 01:15:31AM +1200, =
Gavin Hubbard wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; Before anyone loses too much sleep =
over this, the </FONT>
<BR><FONT SIZE=3D2>&gt; Precisionbook has</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; internal SCSI-IDE bridges that sit =
between the HBA and </FONT>
<BR><FONT SIZE=3D2>&gt; the drives. I</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; believe a similar system was used in =
some of the earlier </FONT>
<BR><FONT SIZE=3D2>&gt; Apple Powerbooks.</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; Yep, someone pointed that out in an =
earlier email.&nbsp; I'm </FONT>
<BR><FONT SIZE=3D2>&gt; just trying to</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; figure out how to handle this for the =
best.</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; 1) Provide a pci quirk that deletes the =
IDE device from the bus</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; 2) Hack the IDE driver to not claim that =
device if it's on </FONT>
<BR><FONT SIZE=3D2>&gt; a PrecisionBook</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; 3) Ignore the scsi device and let the IDE =
driver drive the chips</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; 4) Er.. something else.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; The initialization of the CMD PCI0643 IDE =
controller fails when using</FONT>
<BR><FONT SIZE=3D2>&gt; the ESIEE kernel (which has support built-in =
for this chip).</FONT>
<BR><FONT SIZE=3D2>&gt; Something like &quot;failed to get IRQ, will =
probe later&quot;.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; So no devices were found on the IDE bus, just =
on the LASI SCSI.</FONT>
<BR><FONT SIZE=3D2>&gt; Probably it's the best just to use SCSI and not =
to use IDE </FONT>
<BR><FONT SIZE=3D2>&gt; support at all ...</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Is this something like <A =
HREF=3D"http://www6.tomshardware.com/storage/20030130/index.html" =
TARGET=3D"_blank">http://www6.tomshardware.com/storage/20030130/index.ht=
ml</A> ? Then you (electronically) cannot find any ide at all, its =
hidden behind the scsi interface. If you see part of it, then best to =
try to handle it as good as possible (try 'not at all' for a start). I =
think the 'will probe later' can be canceled, triggered by a found scsi =
interface.</FONT></P>

<P><FONT SIZE=3D2>For what its worth, I think the IRQ is hooked to the =
scsi interface, not to the processor.</FONT>
</P>

<P><FONT SIZE=3D2>btw, what does an `ioscan` from HP-UX report? I guess =
it only sees scsi.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>CBee</FONT>
</P>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C30420.9780EFA0--
