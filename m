Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe44.law14.hotmail.com [64.4.20.16])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0DD6482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Apr 2001 18:04:25 -0600 (MDT)
From: "Brian Stewart" <pdksh@hotmail.com>
To: "Matt London" <matt@knm.yi.org>,
	<parisc-linux@lists.parisc-linux.org>
References: <Pine.LNX.4.20.0104062329290.4811-200000@coffeepot.matt>
Subject: Re: [parisc-linux] Problems booting
Date: Fri, 6 Apr 2001 20:04:10 -0400
MIME-Version: 1.0
Content-Type: text/plain;	charset="iso-8859-1"
Message-ID: <OE449YDqSkcJse1fTvO00000b31@hotmail.com>
List-ID: <linux-parisc.vger.kernel.org>

You have a model 710 50Mhz Bushmaster. I wish you luck, the 710 has some
problems with interrupts with the SCSI controller and Lan Controller. I have
been unable to boot my 710 for a couple of weeks. It will run mkLinux but
with some problems. I wish you luck. I have been trying to address the
interrupt issues with the lan controller but I am afraid it is beyond my
ability.

Let me know how you make out. Try disabling your Parallel port in the
kernel.

----- Original Message -----
From: "Matt London" <matt@knm.yi.org>
To: <parisc-linux@lists.parisc-linux.org>
Sent: Friday, April 06, 2001 6:39 PM
Subject: [parisc-linux] Problems booting


> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I've recently been given an HP apollo Series 700 box. I'm not sure exactly
> what it is, other than that it says A1991XR on the base.
>
> Anyway, I ran across palinux (via the route of NetBSD->OpenBSD->palinux)
> (I run slackware on my x86 boxen), downloaded the iso and burnt it to
> CD. I then dropped in an NEC SCSI cdrom, and a Seagate ST3655N 500M
> drive. I have 4 sticks of RAM, in slots J12, J13, J14 and J15 (alternate
> rows starting toward the back of the machine). I'm using a serial console.
>
> When the system boots, it gets about as far as calibrating the delay loop
> and drops out with a stack dump (see attached file).
>
> I was just wondering if there's any incite into what's up with this :&)
>
> - -- Matt
>
> - ---
> Web Page:
>   http://knm.yi.org/
>   http://pkl.net/~matt/
>
> PGP Key fingerprint = 00BF 19FE D5F5 8EAD 2FD5  D102 260E 8BA7 EEE4 8D7F
> PGP Key http://knm.yi.org/matt-pgp.html
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.0.4 (GNU/Linux)
> Comment: For info see http://www.gnupg.org
>
> iD8DBQE6zkWkJg6Lp+7kjX8RAhzVAJ4zbUhgH+ob+G3Yh+bjnSP4tkMGJwCeNDfK
> d9JX4Uk4TOfJloJ6YenIUB0=
> =QXmq
> -----END PGP SIGNATURE-----
>
