Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76BB54829
	for <parisc-linux@parisc-linux.org>; Mon, 30 Sep 2002 09:03:19 -0600 (MDT)
Message-Id: <02Sep30.171511cest.119078@ns.hiscom.nl>
From: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: "'parisc-linux maillist'" <parisc-linux@parisc-linux.org>
Subject: RE: [parisc-linux] Serial MUX
Date: Mon, 30 Sep 2002 17:03:09 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C26892.7D7308C0"
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

------_=_NextPart_001_01C26892.7D7308C0
Content-Type: text/plain;
	charset="iso-8859-1"

> -----Original Message-----
> From: Christoph Plattner [mailto:christoph.plattner@gmx.at]
> 
> this driver is under development !
> This driver can be used on machines having a non-supported
> multi-serial interface like a E35/45/55 or some K-series
> machines. 

Does this indicate someone is trying to make linux on a E45 usefull? I've
one next to my desk (terrible noise from the disks or fan).

Unfortunately I cannot help developping, but I can do some testing.

> 
> The first and already tested driver is the PDC console
> driver, to use only port-0 of the multi serial board
> as console. Now an alternative native MUX driver 
> is under development, but this driver can currently 
> ONLY access port-0 (first port). The multi-line support
> is not coded yet, and some short tests by me show
> problems (machine hangs up !).
> 
> So you cannot access the multiple serial ports, so sorry.
> 
I only need it for console.


CBee

------_=_NextPart_001_01C26892.7D7308C0
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
<TITLE>RE: [parisc-linux] Serial MUX</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: Christoph Plattner [<A =
HREF=3D"mailto:christoph.plattner@gmx.at">mailto:christoph.plattner@gmx.=
at</A>]</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; this driver is under development !</FONT>
<BR><FONT SIZE=3D2>&gt; This driver can be used on machines having a =
non-supported</FONT>
<BR><FONT SIZE=3D2>&gt; multi-serial interface like a E35/45/55 or some =
K-series</FONT>
<BR><FONT SIZE=3D2>&gt; machines. </FONT>
</P>

<P><FONT SIZE=3D2>Does this indicate someone is trying to make linux on =
a E45 usefull? I've one next to my desk (terrible noise from the disks =
or fan).</FONT></P>

<P><FONT SIZE=3D2>Unfortunately I cannot help developping, but I can do =
some testing.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; The first and already tested driver is the PDC =
console</FONT>
<BR><FONT SIZE=3D2>&gt; driver, to use only port-0 of the multi serial =
board</FONT>
<BR><FONT SIZE=3D2>&gt; as console. Now an alternative native MUX =
driver </FONT>
<BR><FONT SIZE=3D2>&gt; is under development, but this driver can =
currently </FONT>
<BR><FONT SIZE=3D2>&gt; ONLY access port-0 (first port). The multi-line =
support</FONT>
<BR><FONT SIZE=3D2>&gt; is not coded yet, and some short tests by me =
show</FONT>
<BR><FONT SIZE=3D2>&gt; problems (machine hangs up !).</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; So you cannot access the multiple serial ports, =
so sorry.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>I only need it for console.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>CBee</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C26892.7D7308C0--
