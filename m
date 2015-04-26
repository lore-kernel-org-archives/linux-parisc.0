From: Meelis Roos <mroos@linux.ee>
Subject: Re: 4.0 parisc regression: memory leak?
Date: Sun, 26 Apr 2015 10:01:46 +0300 (EEST)
Message-ID: <alpine.LRH.2.11.1504261001001.1468@math.ut.ee>
References: <alpine.LRH.2.11.1504242317450.14818@math.ut.ee> <BLU436-SMTP4216889F17566B576C67B197EB0@phx.gbl>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP4216889F17566B576C67B197EB0@phx.gbl>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > I noticed that with 4.0 I'm running out of memory on HP A500 (1G RAM) 
> > and HP RP3410 (2G RAM) parisc machines during gentoo "revdep-rebuild 
> > -ip". Each time free shows less free memory until OOM killer visits us 
> > (and first revdep-rebuild after nontrivial emerge compilation loop kills 
> > the smaller box).
> 
> I've also had problems with 4.0.  I had HPMC after a few hours on rp3440.

My rp3440 worked fine for emerge world - maybe an hour or some hours. 
Because of 12G RAM, it did not run out of memory.

-- 
Meelis Roos (mroos@linux.ee)
