Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id F351F482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Jan 2003 03:59:12 -0700 (MST)
Message-Id: <03Jan30.121351cet.119060@ns.hiscom.nl>
From: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: "'jsoe0708@tiscali.be'" <jsoe0708@tiscali.be>,
	grundler@dsl2.external.hp.com
Cc: Ed Schaller <schallee@darkmist.net>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] quad tulip now not functional in 2.4.20
Date: Thu, 30 Jan 2003 11:59:01 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2C84E.98DA1AB0"
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

------_=_NextPart_001_01C2C84E.98DA1AB0
Content-Type: text/plain;
	charset="iso-8859-1"

Why did nobody point to the hardware database: http://hwdb.parisc-linux.org/

There are some users of a D210 reported there:
http://hwdb.parisc-linux.org/view.php3?type=machine&name=D210

They will know some ins and outs.

CBee


--
C. Beerse
mailto:c.beerse@torex-hiscom.nl
talkto:+31(71)5256660


> -----Original Message-----
> From: jsoe0708@tiscali.be [mailto:jsoe0708@tiscali.be]
> Sent: donderdag 19 december 2002 18:38
> To: grundler@dsl2.external.hp.com
> Cc: Ed Schaller; parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] quad tulip now not functional in 2.4.20
> 
> 
> Hi Grant,
> 
> >
> >On Tue, Dec 17, 2002 at 08:12:03AM +0100, jsoe0708@tiscali.be wrote:
> >> Just to avoid you loose time here is a diff:
> >...
> >> -	if (ee_data[27] == 0) {		/* No valid media table. */
> >> +	if (ee_data[27] == 0 || ee_data[ee_data[27]] == 0) {  
> /* No valid media
> >> table. */
> >
> >Like I suspected, backing out this change made add-on boards 
> work again.
> >I've reverted that change in 2.4.20-pa15 along with a traps.c change.
> >Please apply by hand and try the 4-port again.
> >
> Sorry, I was too tired yesterday evening and have not time today :-(.
> 
> But I see that Ed successfully tested. Great (I will also 
> test it, ... next
> year :))
> 
> Thanks for all and let me wish you and your families a Merry 
> Christmas and
> a Happy New Year,
>     Joel
> 
> 
> 
> **************************************************************
> ******************
> Controlez mieux votre consommation Internet...surfez Tiscali 
> Complete...http://tiscali.complete.be
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

------_=_NextPart_001_01C2C84E.98DA1AB0
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
<TITLE>RE: [parisc-linux] quad tulip now not functional in =
2.4.20</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Why did nobody point to the hardware database: <A =
HREF=3D"http://hwdb.parisc-linux.org/" =
TARGET=3D"_blank">http://hwdb.parisc-linux.org/</A></FONT>
</P>

<P><FONT SIZE=3D2>There are some users of a D210 reported there: <A =
HREF=3D"http://hwdb.parisc-linux.org/view.php3?type=3Dmachine&name=3DD21=
0" =
TARGET=3D"_blank">http://hwdb.parisc-linux.org/view.php3?type=3Dmachine&=
name=3DD210</A></FONT>
</P>

<P><FONT SIZE=3D2>They will know some ins and outs.</FONT>
</P>

<P><FONT SIZE=3D2>CBee</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>--</FONT>
<BR><FONT SIZE=3D2>C. Beerse</FONT>
<BR><FONT SIZE=3D2><A =
HREF=3D"mailto:c.beerse@torex-hiscom.nl">mailto:c.beerse@torex-hiscom.nl=
</A></FONT>
<BR><FONT SIZE=3D2>talkto:+31(71)5256660</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: jsoe0708@tiscali.be [<A =
HREF=3D"mailto:jsoe0708@tiscali.be">mailto:jsoe0708@tiscali.be</A>]</FON=
T>
<BR><FONT SIZE=3D2>&gt; Sent: donderdag 19 december 2002 18:38</FONT>
<BR><FONT SIZE=3D2>&gt; To: grundler@dsl2.external.hp.com</FONT>
<BR><FONT SIZE=3D2>&gt; Cc: Ed Schaller; =
parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>&gt; Subject: Re: [parisc-linux] quad tulip now not =
functional in 2.4.20</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Hi Grant,</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt;</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;On Tue, Dec 17, 2002 at 08:12:03AM +0100, =
jsoe0708@tiscali.be wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;&gt; Just to avoid you loose time here is a =
diff:</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;...</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;&gt; -&nbsp; if (ee_data[27] =3D=3D 0) { =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* No valid media table. =
*/</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;&gt; +&nbsp; if (ee_data[27] =3D=3D 0 || =
ee_data[ee_data[27]] =3D=3D 0) {&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt; /* No valid media</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;&gt; table. */</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;Like I suspected, backing out this change =
made add-on boards </FONT>
<BR><FONT SIZE=3D2>&gt; work again.</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;I've reverted that change in 2.4.20-pa15 =
along with a traps.c change.</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;Please apply by hand and try the 4-port =
again.</FONT>
<BR><FONT SIZE=3D2>&gt; &gt;</FONT>
<BR><FONT SIZE=3D2>&gt; Sorry, I was too tired yesterday evening and =
have not time today :-(.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; But I see that Ed successfully tested. Great (I =
will also </FONT>
<BR><FONT SIZE=3D2>&gt; test it, ... next</FONT>
<BR><FONT SIZE=3D2>&gt; year :))</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Thanks for all and let me wish you and your =
families a Merry </FONT>
<BR><FONT SIZE=3D2>&gt; Christmas and</FONT>
<BR><FONT SIZE=3D2>&gt; a Happy New Year,</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp;&nbsp;&nbsp;&nbsp; Joel</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; =
**************************************************************</FONT>
<BR><FONT SIZE=3D2>&gt; ******************</FONT>
<BR><FONT SIZE=3D2>&gt; Controlez mieux votre consommation =
Internet...surfez Tiscali </FONT>
<BR><FONT SIZE=3D2>&gt; Complete...<A =
HREF=3D"http://tiscali.complete.be" =
TARGET=3D"_blank">http://tiscali.complete.be</A></FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; _______________________________________________<=
/FONT>
<BR><FONT SIZE=3D2>&gt; parisc-linux mailing list</FONT>
<BR><FONT SIZE=3D2>&gt; parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>&gt; <A =
HREF=3D"http://lists.parisc-linux.org/mailman/listinfo/parisc-linux" =
TARGET=3D"_blank">http://lists.parisc-linux.org/mailman/listinfo/parisc-=
linux</A></FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2C84E.98DA1AB0--
