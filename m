Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA07732
	for <parisc-linux@puffin.external.hp.com>; Sat, 1 Apr 2000 11:22:43 -0700
Received: from localhost (funnyguy@localhost)
	by morph.net (8.9.3/8.9.3) with ESMTP id NAA31156
	for <parisc-linux@thepuffingroup.com>; Sat, 1 Apr 2000 13:22:36 -0500
Date: Sat, 1 Apr 2000 13:22:36 -0500 (EST)
From: Mike Brancato <funnyguy@digitalsmackdown.net>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 735/125 boot problem? 
In-Reply-To: <200004011755.JAA28068@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.10.10004011321470.31150-100000@morph.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

this is booting hpux., it should show up on the graphics card.

mike

On Sat, 1 Apr 2000, Grant Grundler wrote:

> 
> Mike Brancato wrote:
> > we have another 735 here, and like, if i leave th HD connected, it shows
> > HPUX trying to start, but just sits at the screen with the yellow displays
> > at teh bottom.
> 
> Mike,
> Have you tried connecting to the serial port? (9600, 8, N, 1)
> 
> The console might be directed to the serial port and nothing
> will show up on the monitor until X11 is started. I think the
> yellow boxes at the bottom are an artifact from the graphics
> firmware support for function keys.
> 
> grant
> 
> Grant Grundler
> Unix Development Lab
> +1.408.447.7253
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
