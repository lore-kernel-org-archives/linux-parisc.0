Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD900164F.dip.t-dialin.net [217.0.22.79])
	by dsl2.external.hp.com (Postfix) with SMTP id 221E8482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 May 2001 13:35:44 -0600 (MDT)
Sender: andi@dsl2.external.hp.com
Message-ID: <3AFEE1FB.1805289E@fischlustig.de>
Date: Sun, 13 May 2001 21:35:23 +0200
From: Andi <andi@fischlustig.de>
MIME-Version: 1.0
To: Matthieu Delahaye <delahaym@esiee.fr>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
	puffin@esiee.net
Subject: Re: [parisc-linux] framebuffer drivers, sound
References: <3AF878EA.3F043FD7@fischlustig.de> <3AF8FF5E.B9442562@esiee.fr> <3AF9B4F9.17956B05@fischlustig.de> <3AFBCE2C.3961BC48@esiee.fr>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthieu Delahaye wrote:

> Andi wrote:
>
> Hum, I tried the driver on a 712/60. Seems ok for me.
> I found neither madplay nor saydate packaged. Could you
> tell me the exact location (or package name) where
> you found them?

they are in the official debian distribution... you can grab them from:

ftp://ftp.debian.org/debian/pool/main/m/mad/
ftp://ftp.de.debian.org/debian/pool/main/s/saydate/
ftp://ftp.de.debian.org/debian/pool/main/s/saytime/

> About mpg123, how did you compile it? When I did it 3 months ago
> I had to do some modifications on. I'll be very interested to know how
> you did.

I made no modifications to the program itself, I just tweaked the makefiles
a bit.

> Btw, what are the frequencies of you mp3?

I dont know, what frequencies does harmony support?

> More over, could you test .au files with `cat`?

I had the same problem here.
