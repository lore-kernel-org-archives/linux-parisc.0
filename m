Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gnu.uclv.net (gnu.uclv.net [193.170.2.126])
	by dsl2.external.hp.com (Postfix) with ESMTP id F17D74830
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Jun 2003 11:00:44 -0600 (MDT)
Reply-To: <zlatan.jukic@fh-vorarlberg.ac.at>
From: "Zlatan Jukic" <zlatan.jukic@fh-vorarlberg.ac.at>
To: "'Derek Engelhaupt'" <derekengelhaupt@rocketmail.com>,
	"'Grant Grundler'" <grundler@parisc-linux.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Re: Visualize EG card on HP PARISC C360
Date: Wed, 18 Jun 2003 18:56:38 +0200
Message-ID: <1EB1A4E066D0D411BD330008C79F06AE022EC550@yang.tvlbg.ac.at>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000C_01C335CB.5970E530"
In-Reply-To: <1EB1A4E066D0D411BD330008C79F06AE0251B7BF@yang.tvlbg.ac.at>
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

This is a multi-part message in MIME format.

------=_NextPart_000_000C_01C335CB.5970E530
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Derek and all,

=20

Thank you for your assistance.  Thank you Grant, too!

=20

You already tested this card (Vis EG HSC) on your HP-Visualize C360 =
machine.
The X-Windows system should be started in this case. =20

Can you say me please, where can I find/order and buy this card?

=20

Thank you very much,

Kind regards, Zlatan

=20

-----Original Message-----
From: Derek Engelhaupt [mailto:derekengelhaupt@rocketmail.com]=20
Sent: Mittwoch, 18. Juni 2003 18:00
To: Grant Grundler; Jukic Zlatan
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Visualize EG card on HP PARISC C360

=20

Yes, there is an HSC EG card.  Used it in my C360 before I sold it.  The =
PCI
version of the card has more memory on it though.

=20

derek

Grant Grundler <grundler@parisc-linux.org> wrote:

On Tue, Jun 17, 2003 at 04:17:02PM +0200, Zlatan Jukic wrote:
> I could not start unfortunately the X-Windows system, because it is =
not
> supported by Fx-4 video card.?!

correct

> My question is here: Must I insert another card (and which??), in =
order to
> start X-Windows-system?

> According to Debian HPPA, the Visualize EG should correct to function. =


yes. *PCI* version of the card.
Vis-EG HSC card might also work.

> This card is a 24-bit-video-card, which is recognized in the best way
under
> Linux as "Coral" with HP 715-64,=20

Is that really a Vis-EG HSC card?
Can you post "dmesg" output where STI describes the card?

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

  _____ =20

Do you Yahoo!?
SBC
<http://pa.yahoo.com/*http:/rd.yahoo.com/evt=3D1207/*http:/promo.yahoo.co=
m/sbc
/>  Yahoo! DSL - Now only $29.95 per month!


------=_NextPart_000_000C_01C335CB.5970E530
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:blue;
	text-decoration:underline;}
p
	{margin-right:0cm;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle18
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dblue>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Hello Derek and =
all,</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Thank you for your =
assistance.&nbsp; Thank
you Grant, too!</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>You already tested this card (Vis =
EG HSC)
on your HP-Visualize C360 machine. The X-Windows system should be =
started in
this case.&nbsp; </span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Can you say me please, where can I =
find/order
and buy this card?</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Thank you very =
much,</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Kind regards, =
Zlatan</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original =
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> Derek Engelhaupt =
[mailto:derekengelhaupt@rocketmail.com]
<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Mittwoch, 18. Juni =
2003
18:00<br>
<b><span style=3D'font-weight:bold'>To:</span></b> Grant Grundler; Jukic =
Zlatan<br>
<b><span style=3D'font-weight:bold'>Cc:</span></b>
parisc-linux@lists.parisc-linux.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Re: =
[parisc-linux] Re:
Visualize EG card on HP PARISC C360</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<div>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>Yes, there is =
an HSC EG
card.&nbsp; Used it in my C360 before I sold it.&nbsp; The PCI version =
of the
card has more memory on it though.</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>derek<br>
<br>
<b><i><span style=3D'font-weight:bold;font-style:italic'>Grant Grundler
&lt;grundler@parisc-linux.org&gt;</span></i></b> =
wrote:</span></font></p>

</div>

<blockquote style=3D'border:none;border-left:solid #1010FF =
1.5pt;padding:0cm 0cm 0cm 4.0pt;
margin-left:3.75pt;margin-top:5.0pt;margin-bottom:5.0pt'>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>On =
</span></font>Tue, Jun 17, 2003 at 04:17:02PM +0200, Zlatan Jukic =
wrote:<br>
&gt; I could not start unfortunately the X-Windows system, because it is =
not<br>
&gt; supported by Fx-4 video card.?!<br>
<br>
correct<br>
<br>
&gt; My question is here: Must I insert another card (and which??), in =
order to<br>
&gt; start X-Windows-system?<br>
<br>
&gt; According to Debian HPPA, the Visualize EG should correct to =
function. <br>
<br>
yes. *PCI* version of the card.<br>
Vis-EG HSC card might also work.<br>
<br>
&gt; This card is a 24-bit-video-card, which is recognized in the best =
way
under<br>
&gt; Linux as &quot;Coral&quot; with HP 715-64, <br>
<br>
Is that really a Vis-EG HSC card?<br>
Can you post &quot;dmesg&quot; output where STI describes the card?<br>
<br>
grant<br>
_______________________________________________<br>
parisc-linux mailing list<br>
parisc-linux@lists.parisc-linux.org<br>
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</p>

</blockquote>

<div class=3DMsoNormal align=3Dcenter =
style=3D'margin-left:36.0pt;text-align:center'><font
size=3D3 face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D1 width=3D"100%" align=3Dcenter>

</span></font></div>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>Do you =
Yahoo!?<br>
<a
href=3D"http://pa.yahoo.com/*http:/rd.yahoo.com/evt=3D1207/*http:/promo.y=
ahoo.com/sbc/">SBC
Yahoo! DSL</a> - Now only $29.95 per month!</span></font></p>

</div>

</body>

</html>

------=_NextPart_000_000C_01C335CB.5970E530--
