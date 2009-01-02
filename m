From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: resource_size_t printk woes...
Date: Fri, 2 Jan 2009 11:32:54 -0500 (EST)
Message-ID: <20090102163255.42E0A4EF0@hiauly1.hia.nrc.ca>
References: <495DDB0E.9010203@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, kyle@infradead.org,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <495DDB0E.9010203@gmx.de> from "Helge Deller" at Jan 2, 2009 10:14:54 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Hi Dave,
> 
> telling you to try vanilla 2.6.28 was a stupid idea.
> I forgot that I had exactly the same problem (slab corruption):
> http://bugzilla.kernel.org/show_bug.cgi?id=11913
> when I started the thread 
> "2.6.28-rcX in pretty bad shape on parisc"
> here on the list as well.
> 
> The solution for me was to use another default config.
> James posted this one, which started to get everything working for me:
> http://parisc-linux.org/~jejb/config-2.6.28-rc5-ion
> Try this one instead (e.g. with Kyle's tree).
> 
> I assume something in your .config is different than what is in
> James' .config. It would be interesting to know what it
> is. I didn't checked further at that time.

The config that I have been using is based on James' ion config, plus
the defaults from running make oldconfig.

I actually was running 2.6.28 before I started experimenting yesterday.
It had run about three days building gcc without major problems.  As
noted by Grant, there is usually one unexplained segv (usually in make
or bash), then the system seems to run reasonably well for an extended
period.

If bash segvs, the system goes into an infinite loop of segvs due to the
way it handles signals, and the fact that the kernel restarts the faulting
instruction.  This fills the root file system with log messages...

I'm running a hacked version of bash which exits immediately to avoid this
problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
