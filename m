Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 837E3482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 May 2001 05:26:41 -0600 (MDT)
Sender: delahaym@esiee.fr
Message-ID: <3AFBCE2C.3961BC48@esiee.fr>
Date: Fri, 11 May 2001 13:34:04 +0200
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: Andi <andi@fischlustig.de>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Cc: puffin@esiee.net
Subject: Re: [parisc-linux] framebuffer drivers, sound
References: <3AF878EA.3F043FD7@fischlustig.de> <3AF8FF5E.B9442562@esiee.fr> <3AF9B4F9.17956B05@fischlustig.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Andi wrote:

Hum, I tried the driver on a 712/60. Seems ok for me.
I found neither madplay nor saydate packaged. Could you
tell me the exact location (or package name) where
you found them?

About mpg123, how did you compile it? When I did it 3 months ago
I had to do some modifications on. I'll be very interested to know how
you did.
 
About saytime, let say it's logical, harmony_audio_poll isn't yet
implemented.
Upgrade of harmony is on the whishlist, and I hope I'll have time to
complete it.

Btw, what are the frequencies of you mp3?
More over, could you test .au files with `cat`?

Thank for your feedback,
Matthieu
> 
> hi,
> 
> my machine is an hp 712/60 with 128MB RAM and 2MB Video RAM
> 
> Programs I tested were:
> 
> madplay (from debian package) with any mp3 - strange sound and pauses as I
> described
> mpg123 (self compliled) with any mp3            - same problem
> saydate - same problem
> saytime -  "harmony_audio_poll : Invalid Poll" printed multiple times on the
> console, no sound output at all
> 
> > Hi andi,
> > Thank you for giving feedbacks about harmony, even bad.
> > Could you please tell me what is your computer model,
> > type of player and type of sound file you use.
> > If you have a 715/old, never mind, it doesn't work.
> > If not, i'll tried to find what happend...
> >
> > regards,
> > Matthieu
> >
> > --
> > Matthieu Delahaye
> > ESIEE Team
> > http://mkhppa1.esiee.fr/

-- 
Matthieu Delahaye
ESIEE Team
http://mkhppa1.esiee.fr/
