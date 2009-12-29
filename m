From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Tue, 29 Dec 2009 10:00:26 -0500 (EST)
Message-ID: <20091229150027.317D74FEF@hiauly1.hia.nrc.ca>
References: <4B3A0889.7030701@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B3A0889.7030701@gmx.de> from "Helge Deller" at Dec 29, 2009 02:47:53 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The patch looks good.
> 
> > 1) I changed the unconditional branch at the entry point to a gate.
> > Didn't think it was a good idea to execute code at user priveledge.
> 
> Can you explain that?

Not really, except that we gate immediately in the other code paths.
The gateway page is special in that processes are not supposed to get
scheduled off the page.

> The branch might get interrupted, before the process get privileged?

That was the concern.  At worst, an unnecessary branch is eliminated.
It's clear that this doesn't fix the futex deadlock, but the timing of
the lws lock code has changed resulting in slightly different symptoms.

> > This seems to have improved things (got through a complete testsuite
> > run on gsyprf11 without a deadlock).
> 
> Good. I'll test too.
> 
> >However, I hit a slightly different lockup on c3750.
> 
> Any info?

No, I restarted a new GCC build on this machine.  As with the previous
case on gsyprf11, thread 2 in expect seemed confused about its holding
the lock.  I've got a new hang on gsyprf11 to look at.

In my build last night on the c3750, expect dropped core in the GCC
testsuite.  Otherwise, it completed the GCC build and check.  I'll
look a bit at the core dump today.

On my rp3440 (UP kernel), I had several segmentation faults in /bin/sh
building GCC with 2.6.32.2.  For some reason, 2.6.31.9 is better.  I
haven't tried expect 5.44.1.14-5 on it.  It currently using expect-tcl8.3
which avoids the pthread issue.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
