Received: from opus.allegro.com (opus.allegro.com [209.10.39.50])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA26698
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 11:46:31 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200011201847.KAA12667@opus.allegro.com>
Subject: Re: Single-stepping
To: alan@linuxcare.com.au (Alan Modra)
Date: Mon, 20 Nov 2000 10:47:38 -0800 (PST)
Cc: jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@puffin.external.hp.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0011201912260.15391-100000@front.linuxcare.com.au> from "Alan Modra" at Nov 20, 2000 08:05:58 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

> Because you would then need to save and restore cr0 on task switches (or
> only allow one task to be single-stepped at a time).  That's four
> instructions and two extra memory accesses per task switch.  Which might
> not seem very much, but at some point somebody will no doubt start caring
> about pa-linux performance. 

And it still won't seem like much, then!

Non-memory-access instructions are cheap.  An extra memory reference (from
something probably already in cache) and two extra instructions
would probably cost less than an hour per CPU over the next 10 *years*,
assuming 10 years of 1000 task switches per second on a slow 100 MHz CPU.

Of course, at the cost of an extra non-memory-referencing instruction or so,
you could say "at switch-to-task time: if PSW R-bit set, then load the saved
CR0 from memory and move it to CR0", saving one memory reference 99.99999%
of the time, resuling in an average of only one memory reference
per task switch normally.

I haven't look at interrupt handling / system calls closely, but I
hope there aren't other false savings.  (E.g., failure to save/restore
the PID check flag ... sure, user processes *now* probably never have
pid checking disabled, but that's a very useful feature to have
available (with proper security controls, of course).)
(Yes, I'm one of the very few who use that feature on MPE/iX ... carefully,
of course :)

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com        
