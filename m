Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 764DF4829
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 01:52:38 -0600 (MDT)
Message-Id: <02Oct11.100511cest.119048@ns.hiscom.nl>
From: =?iso-8859-15?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: "'Harri Haataja'" <harri.haataja@smilehouse.com>
Cc: "'parisc-linux maillist'" <parisc-linux@parisc-linux.org>
Subject: RE: [parisc-linux] Which Memory to use on a 715/80?
Date: Fri, 11 Oct 2002 09:52:28 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C270FB.257B1240"
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

------_=_NextPart_001_01C270FB.257B1240
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Harri Haataja [mailto:harri.haataja@smilehouse.com]
>=20
> On Thu, Oct 10, 2002 at 05:34:47PM +0200, "Beerse, Corn=E9" wrote:
> > > -----Original Message-----
> > > From: Grant Grundler [mailto:grundler@dsl2.external.hp.com]
> > > Derek Engelhaupt wrote:
> > > > Well, don't think any other manufacturer made memory for the =
715
> > > > series.  I have looked at Dataram and others, but they only =
seem
> > > > to have memory for the D,K,N,L, and A class servers.
> > > I thought Kingston *did* (maybe no more).
> > I recal by head (and might be wrong) to have used pc-based memory
> > modules in a 712/80. There was something with parity (it needs it =
or
> > it hates it, don't know).
>=20
> You usually hear that HP uses similiar form but completely different
> ram. But that's mostly on 715/735/800, maybe 712 was different. That
> would be a pleasant surprise.
> Mostly you always want parity. I would doubt anything explicitly
> demanding no parity.

Harri is right here, I was mixing SunSparc and HP-PARisk architectures. =
The
712 memory does NOT fit (without a hamer).

>=20
> > Try what the bootloader says if you fit it with pc-based memory
> > modules, that have the same physical lay-out. (edo-ram is a=20
> term that
> > comes to mind, try it or it's predecessor).
>=20
> EDO AFAIK never occurs together with ECC so that's the word to avoid
> when looking for ram for older workstations ad servers.
> 36-bit FPM True-parity ECC SIMMs are what work in, for example, DEC
> Alpha AXPpci, Multia, SGI Indy, Indigo=B2, matching Challenges,=20
> IBM RS6000
> 7006 and other machines of the era and most(?) pc's. No kind=20
> of EDO ram
> works.
>=20
> > I might be totaly wrong here, in those days (a former job)=20
> I was using
> > both SunSparc stations and HP 712 machines.
>=20
> Sparcstations mostly use weird rams like JEDEC DIMM's apart from the
> very old ones that use 36-pin simm's that seem regular.

Sun Sparc ELC and SunSparcClassic (and similar Sparc 4C architecture?) =
can
use the same memory modules as 486-PC's. Those are NOT edo ram as in
pentium-pc's, however they do fit... It might not be what Sun tells, it =
is
wat is currently running at home...

>=20
>=20
> This is what I remember. No guarantees either.

I've tried EDO ram in a SParc Classic but it does not show up. After a =
short
test (15 minutes power on and try to use it) I experienced no damage on =
both
processorboard or memory. Then, again: no guarantees...

>=20
> --=20
> I used to herd dairy cows. Now I herd lusers. Apart from the=20
> isolation,
> I think I preferred the cows. They were better conversation, easier =
to
> milk, and if they annoyed me enough, I could shoot them and eat them.
> 		-- Rodger Donaldson=20

Now I know where the name "tucows" comes from ;-)



CBee

------_=_NextPart_001_01C270FB.257B1240
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
<TITLE>RE: [parisc-linux] Which Memory to use on a 715/80?</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: Harri Haataja [<A =
HREF=3D"mailto:harri.haataja@smilehouse.com">mailto:harri.haataja@smileh=
ouse.com</A>]</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; On Thu, Oct 10, 2002 at 05:34:47PM +0200, =
&quot;Beerse, Corn=E9&quot; wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; From: Grant Grundler [<A =
HREF=3D"mailto:grundler@dsl2.external.hp.com">mailto:grundler@dsl2.exter=
nal.hp.com</A>]</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; Derek Engelhaupt wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; &gt; Well, don't think any other =
manufacturer made memory for the 715</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; &gt; series.&nbsp; I have looked at =
Dataram and others, but they only seem</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; &gt; to have memory for the D,K,N,L, =
and A class servers.</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; &gt; I thought Kingston *did* (maybe no =
more).</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; I recal by head (and might be wrong) to =
have used pc-based memory</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; modules in a 712/80. There was something =
with parity (it needs it or</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; it hates it, don't know).</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; You usually hear that HP uses similiar form but =
completely different</FONT>
<BR><FONT SIZE=3D2>&gt; ram. But that's mostly on 715/735/800, maybe =
712 was different. That</FONT>
<BR><FONT SIZE=3D2>&gt; would be a pleasant surprise.</FONT>
<BR><FONT SIZE=3D2>&gt; Mostly you always want parity. I would doubt =
anything explicitly</FONT>
<BR><FONT SIZE=3D2>&gt; demanding no parity.</FONT>
</P>

<P><FONT SIZE=3D2>Harri is right here, I was mixing SunSparc and =
HP-PARisk architectures. The 712 memory does NOT fit (without a =
hamer).</FONT>
</P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; Try what the bootloader says if you fit it =
with pc-based memory</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; modules, that have the same physical =
lay-out. (edo-ram is a </FONT>
<BR><FONT SIZE=3D2>&gt; term that</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; comes to mind, try it or it's =
predecessor).</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; EDO AFAIK never occurs together with ECC so =
that's the word to avoid</FONT>
<BR><FONT SIZE=3D2>&gt; when looking for ram for older workstations ad =
servers.</FONT>
<BR><FONT SIZE=3D2>&gt; 36-bit FPM True-parity ECC SIMMs are what work =
in, for example, DEC</FONT>
<BR><FONT SIZE=3D2>&gt; Alpha AXPpci, Multia, SGI Indy, Indigo=B2, =
matching Challenges, </FONT>
<BR><FONT SIZE=3D2>&gt; IBM RS6000</FONT>
<BR><FONT SIZE=3D2>&gt; 7006 and other machines of the era and most(?) =
pc's. No kind </FONT>
<BR><FONT SIZE=3D2>&gt; of EDO ram</FONT>
<BR><FONT SIZE=3D2>&gt; works.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; I might be totaly wrong here, in those =
days (a former job) </FONT>
<BR><FONT SIZE=3D2>&gt; I was using</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; both SunSparc stations and HP 712 =
machines.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Sparcstations mostly use weird rams like JEDEC =
DIMM's apart from the</FONT>
<BR><FONT SIZE=3D2>&gt; very old ones that use 36-pin simm's that seem =
regular.</FONT>
</P>

<P><FONT SIZE=3D2>Sun Sparc ELC and SunSparcClassic (and similar Sparc =
4C architecture?) can use the same memory modules as 486-PC's. Those =
are NOT edo ram as in pentium-pc's, however they do fit... It might not =
be what Sun tells, it is wat is currently running at home...</FONT></P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; This is what I remember. No guarantees =
either.</FONT>
</P>

<P><FONT SIZE=3D2>I've tried EDO ram in a SParc Classic but it does not =
show up. After a short test (15 minutes power on and try to use it) I =
experienced no damage on both processorboard or memory. Then, again: no =
guarantees...</FONT></P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; -- </FONT>
<BR><FONT SIZE=3D2>&gt; I used to herd dairy cows. Now I herd lusers. =
Apart from the </FONT>
<BR><FONT SIZE=3D2>&gt; isolation,</FONT>
<BR><FONT SIZE=3D2>&gt; I think I preferred the cows. They were better =
conversation, easier to</FONT>
<BR><FONT SIZE=3D2>&gt; milk, and if they annoyed me enough, I could =
shoot them and eat them.</FONT>
<BR><FONT SIZE=3D2>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Rodger Donaldson </FONT>
</P>

<P><FONT SIZE=3D2>Now I know where the name &quot;tucows&quot; comes =
from ;-)</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2>CBee</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C270FB.257B1240--
