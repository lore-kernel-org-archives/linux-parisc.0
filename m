Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D9774829
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 03:48:19 -0600 (MDT)
Message-Id: <02Oct11.120046cest.119067@ns.hiscom.nl>
From: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: =?iso-8859-1?Q?=27Martin-=C9ric_Racine=27?= <q-funk@pp.fishpool.fi>
Cc: parisc-linux <parisc-linux@parisc-linux.org>
Subject: RE: [parisc-linux] hardware features of 712-60 ?
Date: Fri, 11 Oct 2002 11:47:40 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2710B.3D2D40B0"
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

------_=_NextPart_001_01C2710B.3D2D40B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Martin-=C9ric Racine [mailto:q-funk@pp.fishpool.fi]
> On Fri, 11 Oct 2002, "Beerse, Corn=E9" wrote:
>=20
> > > At this point, I apt-got kernel-source-2.4.19-hppa and=20
> > > unpacked it, and already
> > > selected the 7100LC/7300LC CPU option.  What else?  Has=20
> > > anybody compiled a FAQ
> > > on parisc-linux that provides .config files optimized for=20
> > > each PA-RISC hardware
> > > or, alternately, a checklist of hardware one finds in product=20
> > > xxx, referenced by
> > > Linux kernel feature or module name?=20
> >=20
> > Have you checked the hardware database on the website?
> > (http://www.parisc-linux.org/) That gives an overview on=20
> what whas in the
> > origional box.
>=20
> http://hwdb.parisc-linux.org/view.php3?type=3Dmachine&name=3D712%2F60
>=20
> That page could have been written in Chinese, it would have=20
> been equally clear. =20
>=20
> I guess I'm just used to PC hardware, where kernel compiling=20
> simply means "if
> you have graphics card XXX select the driver with the same=20
> name". I've yet to

Which most times results in a lot of variants for the same card (since
manufacturers update hardware without updating the type info) and lots =
of
names for stuf using the same chipset. I think it is just what you are =
used
ot. both have their pro-s and con-s.=20

> find that simplicity in HP hardware, probably because=20
> everything is done via
> custom chips that combine several functions, and it is not=20
> clear to me which
> chip does what, as every line in that page starts with Gecko.

I think this Gecko is the name of the development of the machine. I =
think
(never looked) the terms can be found in the source too (if required). =
Its
just a little more pronouncable than 9000/712/60... You're working on
workstations. If you look at servers (9000/800 range) then it is an =
even
stranger view at first sight.




CBee

------_=_NextPart_001_01C2710B.3D2D40B0
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
<TITLE>RE: [parisc-linux] hardware features of 712-60 ?</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: Martin-=C9ric Racine [<A =
HREF=3D"mailto:q-funk@pp.fishpool.fi">mailto:q-funk@pp.fishpool.fi</A>]<=
/FONT>
<BR><FONT SIZE=3D2>&gt; On Fri, 11 Oct 2002, &quot;Beerse, =
Corn=E9&quot; wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; At this point, I apt-got =
kernel-source-2.4.19-hppa and </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; unpacked it, and already</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; selected the 7100LC/7300LC CPU =
option.&nbsp; What else?&nbsp; Has </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; anybody compiled a FAQ</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; on parisc-linux that provides .config =
files optimized for </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; each PA-RISC hardware</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; or, alternately, a checklist of =
hardware one finds in product </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; xxx, referenced by</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; Linux kernel feature or module name? =
</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; Have you checked the hardware database on =
the website?</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; (<A HREF=3D"http://www.parisc-linux.org/" =
TARGET=3D"_blank">http://www.parisc-linux.org/</A>) That gives an =
overview on </FONT>
<BR><FONT SIZE=3D2>&gt; what whas in the</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; origional box.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; <A =
HREF=3D"http://hwdb.parisc-linux.org/view.php3?type=3Dmachine&name=3D712=
%2F60" =
TARGET=3D"_blank">http://hwdb.parisc-linux.org/view.php3?type=3Dmachine&=
name=3D712%2F60</A></FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; That page could have been written in Chinese, =
it would have </FONT>
<BR><FONT SIZE=3D2>&gt; been equally clear.&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; I guess I'm just used to PC hardware, where =
kernel compiling </FONT>
<BR><FONT SIZE=3D2>&gt; simply means &quot;if</FONT>
<BR><FONT SIZE=3D2>&gt; you have graphics card XXX select the driver =
with the same </FONT>
<BR><FONT SIZE=3D2>&gt; name&quot;. I've yet to</FONT>
</P>

<P><FONT SIZE=3D2>Which most times results in a lot of variants for the =
same card (since manufacturers update hardware without updating the =
type info) and lots of names for stuf using the same chipset. I think =
it is just what you are used ot. both have their pro-s and con-s. =
</FONT></P>

<P><FONT SIZE=3D2>&gt; find that simplicity in HP hardware, probably =
because </FONT>
<BR><FONT SIZE=3D2>&gt; everything is done via</FONT>
<BR><FONT SIZE=3D2>&gt; custom chips that combine several functions, =
and it is not </FONT>
<BR><FONT SIZE=3D2>&gt; clear to me which</FONT>
<BR><FONT SIZE=3D2>&gt; chip does what, as every line in that page =
starts with Gecko.</FONT>
</P>

<P><FONT SIZE=3D2>I think this Gecko is the name of the development of =
the machine. I think (never looked) the terms can be found in the =
source too (if required). Its just a little more pronouncable than =
9000/712/60... You're working on workstations. If you look at servers =
(9000/800 range) then it is an even stranger view at first =
sight.</FONT></P>
<BR>
<BR>
<BR>

<P><FONT SIZE=3D2>CBee</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2710B.3D2D40B0--
