Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA11252
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 May 2000 20:43:23 -0600
Date: Wed, 17 May 2000 22:38:47 -0400 (EDT)
From: Chris Snow <csnow@julian.uwo.ca>
To: Bob Pflederer <krp@rsn.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/50 hang - more info
In-Reply-To: <20000517202635.E855@atl6narkp02a.atl.hp.com>
Message-ID: <Pine.LNX.4.21.0005172134010.1861-100000@boy.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> When I was trying out a C180, I ran into problems in about the same point
> in boot.  In my case it turned out to be a problem in the lasi_82596
> driver.  It was executing the interrupt handler before the driver was finished
> being initialized.  You might try editing lasi_82596.c to make i596_debug
> 10:
> 
> #define I82596_DEBUG 10
> 
> #ifdef I82596_DEBUG
> int i596_debug = I82596_DEBUG;
> #else
> int i596_debug = 1;
> #endif
> 
> This will get you lots more debug messages from the driver so you can see
> if it's doing something funny.  I have a hacked version of lasi_82596.c
> that may have worked around this problem and some others that I was finding,
> but I'm not really sure what state it's in (it may not even compile) as I 
> haven't had time to play with it in over a month.  I'll email it to you so 
> you can see if it takes you any further.

I reached the same conclusion you do.   Actually, I got your reply just as
I was about to delve into all the nice output of I82596_DEBUG 10 :)

Unfortunately, your modified driver doesn't seem to help... still crashes
at the same point :(

I'm going to investigate this further.  I'll let you know what turns up.


     Chris
