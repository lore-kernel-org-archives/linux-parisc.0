Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA15805
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 07:37:51 -0700
To: Philippe Benard <phi@hpfrcu03.france.hp.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, LaMont Jones <lamont@hp.com>,
        Stan Sieler <sieler@allegro.com>, Matthew Wilcox <matthew@wil.cx>,
        Jes Sorensen <jes@linuxcare.com>, Alan Modra <alan@linuxcare.com.au>,
        John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@thepuffingroup.com,
        lamont@hp.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire 
In-reply-to: Your message of "Mon, 18 Dec 2000 13:27:43 +0100."
             <3A3E02BF.DC1D0EB5@hpfrcu03.france.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 18 Dec 2000 07:40:33 -0700
From: LaMont Jones <lamont@hp.com>
Message-Id: <20001218144036.5BE0B1872C@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> I think LaMont Jones meant that the spinlock loop (in user space AND in kerne
> space) must implement a load word loop, and issue a load-and-clear word only
> when the lock word looks 'free', this is because the 'write' part of the
> load-and-clear word issue a cache broadcast transaction on the bus, so the
> loop should be on load-word followed by load-clear-word when it looks free,

That was one of the first solutions tried in HP-UX, and it resulted in
processor 4 not getting any time (3 wasn't much better), due to the way
that bus arbitration works (it favors one end of the bus.)

The current semaphore operations in the HP-UX kernel do not use ldcw: they
use stb and ldw in some interesting orders (which break when we get weak
ordering with IA64, but then we'll have a low-cost test-and-set.)

lamont
