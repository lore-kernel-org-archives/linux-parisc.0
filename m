Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id D883B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Apr 2003 04:44:41 -0600 (MDT)
Message-Id: <03Apr8.130336cest.119063@ns.hiscom.nl>
From: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] New dump driver patche.
Date: Tue, 8 Apr 2003 12:44:32 +0200 
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2FDBB.D69F7000"
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

------_=_NextPart_001_01C2FDBB.D69F7000
Content-Type: text/plain;
	charset="iso-8859-1"

> -----Original Message-----
> From: bruno_vidal@hp.com [mailto:bruno_vidal@hp.com]
> 
> Joel Soete wrote:
> 
> > I had another question: this system has 2Gb of RAM and my 
> boot disk is of
> > 9Gb , so my question is: may I use any swap as dump device 
> over the famous
> > 2 first Gb of the disk
> 
> Yes, you can use any swap device, the limitation of the 2Gb 
> is coming from
> the capabilities of the scsi card itself, and on any "last" 
> system the PDC is
> able to acces over 2Gb. This limitation is only on old 
> workstation and server,
> like 712/K (not all scsi card)....I need to add this checking 
> when configuring
> the crash area. I've already start to add this, but it is not 
> yet fully tested, mainly
> because it is only for old system, A/N/L don't have this limitation.
> 
> > (or is it possible to pass a parameter to the kernel
> > to put this swap-dump on another disk).
> 
> Sorry, not yet, I didn't look yet how to retrieve option
> from the command line. But it is in my todo list to add
> "early dump" feature.


Is there a need for swap/dump-space, like on HP-UX? or can PA-Linux run
without any swap and hence without any dump area like intel-linux? Or does
PA-Linux need swapspace like VAX/VMS needs it?


CBee, just a list follower that hopes to find time to put live in his
9000/712/80.

------_=_NextPart_001_01C2FDBB.D69F7000
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
<TITLE>RE: [parisc-linux] New dump driver patche.</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: bruno_vidal@hp.com [<A =
HREF=3D"mailto:bruno_vidal@hp.com">mailto:bruno_vidal@hp.com</A>]</FONT>=

<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Joel Soete wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; I had another question: this system has =
2Gb of RAM and my </FONT>
<BR><FONT SIZE=3D2>&gt; boot disk is of</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; 9Gb , so my question is: may I use any =
swap as dump device </FONT>
<BR><FONT SIZE=3D2>&gt; over the famous</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; 2 first Gb of the disk</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Yes, you can use any swap device, the =
limitation of the 2Gb </FONT>
<BR><FONT SIZE=3D2>&gt; is coming from</FONT>
<BR><FONT SIZE=3D2>&gt; the capabilities of the scsi card itself, and =
on any &quot;last&quot; </FONT>
<BR><FONT SIZE=3D2>&gt; system the PDC is</FONT>
<BR><FONT SIZE=3D2>&gt; able to acces over 2Gb. This limitation is only =
on old </FONT>
<BR><FONT SIZE=3D2>&gt; workstation and server,</FONT>
<BR><FONT SIZE=3D2>&gt; like 712/K (not all scsi card)....I need to add =
this checking </FONT>
<BR><FONT SIZE=3D2>&gt; when configuring</FONT>
<BR><FONT SIZE=3D2>&gt; the crash area. I've already start to add this, =
but it is not </FONT>
<BR><FONT SIZE=3D2>&gt; yet fully tested, mainly</FONT>
<BR><FONT SIZE=3D2>&gt; because it is only for old system, A/N/L don't =
have this limitation.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; (or is it possible to pass a parameter to =
the kernel</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; to put this swap-dump on another =
disk).</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Sorry, not yet, I didn't look yet how to =
retrieve option</FONT>
<BR><FONT SIZE=3D2>&gt; from the command line. But it is in my todo =
list to add</FONT>
<BR><FONT SIZE=3D2>&gt; &quot;early dump&quot; feature.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Is there a need for swap/dump-space, like on HP-UX? =
or can PA-Linux run without any swap and hence without any dump area =
like intel-linux? Or does PA-Linux need swapspace like VAX/VMS needs =
it?</FONT></P>
<BR>

<P><FONT SIZE=3D2>CBee, just a list follower that hopes to find time to =
put live in his 9000/712/80.</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2FDBB.D69F7000--
