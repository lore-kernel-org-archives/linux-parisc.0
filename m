Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA17084
	for <parisc-linux@puffin.external.hp.com>; Wed, 26 Jul 2000 08:37:45 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel2.hp.com (Postfix) with ESMTP id 1C52C141
	for <parisc-linux@thepuffingroup.com>; Wed, 26 Jul 2000 08:39:34 -0600 (MDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id IAA14255 for parisc-linux@thepuffingroup.com; Wed, 26 Jul 2000 08:39:38 -0600 (MDT)
Date: Wed, 26 Jul 2000 08:39:38 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200007261439.IAA14255@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: signal handling
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


> I was quite shocked to discover that we appear to have no signal
> handling code in the Linux/parisc kernel whatsoever.
>
> Is anyone planning to do this anytime soon?  It's unbelievably
> annoying to debug userspace when you have to push TOC every single
> time your program segfaults.
>
> Never mind the fact that we can't really claim to have a working
> kernel if it lacks basic things like signals.
>
> I am formally threatening to do it wrong (since I don't know what I am
> doing) if nobody steps forward to do it correctly within the next
> hour.

I had hoped to work on this this week, along with moving the syscall
gateway page out of user space (for native linux apps).  However, I have
not been able to get my C3000 to boot.  Every time I fix a problem, I find
another (right now it starts sash, but I don't get a shell prompt).
Perhaps if I can find an A180 today I can use that for a while.  At this
point I'm not hopeful that I will get it done before Friday, when I leave
for a week of vacation.  So, go ahead and do it "wrong" and I'll check
it over when I get back.

John Marvin
jsm@fc.hp.com
