Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA32170
	for <parisc-linux@puffin.external.hp.com>; Fri, 19 May 2000 12:43:20 -0600
Received: from hpdst41.cup.hp.com (hpdst41.cup.hp.com [15.16.128.62])
	by palrel3.hp.com (Postfix) with ESMTP id 241FC5AE
	for <parisc-linux@thepuffingroup.com>; Fri, 19 May 2000 11:43:29 -0700 (PDT)
Received: from jc356611 (jc356611.cup.hp.com [15.16.128.28]) by hpdst41.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id LAA06721 for <parisc-linux@thepuffingroup.com>; Fri, 19 May 2000 11:43:28 -0700 (PDT)
Message-ID: <019701bfc1c2$1ef4f750$1c80100f@jc356611.cup.hp.com>
From: "John Curry" <jcurry@cup.hp.com>
To: <parisc-linux@thepuffingroup.com>
Date: Fri, 19 May 2000 11:43:27 -0700
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0194_01BFC187.72715940"
Subject: [parisc-linux] Simple Linux question
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0194_01BFC187.72715940
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Can anyone answer this simple LINUX question:

Assume all processes are type SCHED_RR. If they all have the same =
priority, when the running process' time slice expires and it enters the =
scheduler, how can any of the other processes ever be chosen? From what =
I see in the scheduler, all processes in the run queue are going to have =
their goodness compared against that of the running process. Only if =
there priority is higher, will they be chosen.

                                                                         =
                                   Thanks

------=_NextPart_000_0194_01BFC187.72715940
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD W3 HTML//EN">
<HTML>
<HEAD>

<META content=3Dtext/html;charset=3Diso-8859-1 =
http-equiv=3DContent-Type>
<META content=3D'"MSHTML 4.72.3612.1706"' name=3DGENERATOR>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT color=3D#000000 size=3D2>Can anyone answer this simple LINUX=20
question:</FONT></DIV>
<DIV><FONT color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#000000 size=3D2>Assume all processes are type =
SCHED_RR. If they=20
all have the same priority, when the running process' time slice expires =
and it=20
enters the scheduler, how can any of the other processes ever be chosen? =
From=20
what I see in the scheduler, all processes in the run queue are going to =
have=20
their goodness compared against that of the running process. Only if =
there=20
priority is higher, will they be chosen.</FONT></DIV>
<DIV><FONT color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#000000=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Thanks</FONT></DIV></BODY></HTML>

------=_NextPart_000_0194_01BFC187.72715940--
