Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mlbmx2.corp.harris.com (mlbmx2.corp.harris.com [137.237.90.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15AE4482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Sep 2001 11:26:56 -0600 (MDT)
Message-ID: <8D4C69676E66D511A1CB00508BBBB192162768@ranmx1.ran.harris.com>
From: "Pedot, Wolfgang" <wpedot@harris.com>
To: 'Matthew Wilcox' <willy@debian.org>
Cc: 'Parisc Linux Mailinglist' <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Kernel 2.4.9-pa10 now works on 715/75! Sound?
Date: Mon, 17 Sep 2001 13:26:36 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi,=20

I just upgraded to 2.4.9-pa18 and the soundchip is detected by =
Harmony-Driver
and i can work with aumix and mpg123 but the sound-output is kind of =
stuttering.
According to top mpg123 takes ~30% cpu-power and the machine is =
~65%idle (5%
System). Since converting the mp3 to wav (mpg123), converting the wav =
to raw
(sox) and piping the file to /dev/dsp works flawlessly I think this =
might be a
mpg123-problem.....

greetings
Wolfgang

> -----Original Message-----
> From:	Matthew Wilcox [SMTP:willy@debian.org]
> Sent:	Thursday, August 30, 2001 6:58 PM
> To:	Pedot, Wolfgang
> Cc:	'Matthew Wilcox'
> Subject:	Re: [parisc-linux] Kernel 2.4.9-pa10 now works on 715/75! =
Sound?
>=20
> On Thu, Aug 30, 2001 at 11:19:23AM -0400, Pedot, Wolfgang wrote:
> > Yes, I read this but after I saw "supporting all 712/715 machines =
now" in
> the
> > CVS-log I thought it could work now....
> > So I=B4ll be patient and wait a little longer :)
>=20
> Shortly after I wrote that, I thought `Hey, you know, we could hack =
this
> to work really easily'.  Try it now; I've verified it boots on my =
715/75,
> but I don't have an IP address for that machine so I don't have =
userspace.
>=20
> --=20
> Revolutions do not require corporate support.
