From: Meelis Roos <mroos@linux.ee>
Subject: Re: 4.12-rc5+: segfault while compiling, on rp3410
Date: Thu, 22 Jun 2017 10:32:37 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1706221030590.13275@math.ut.ee>
References: <alpine.LRH.2.20.1706201714280.12869@math.ut.ee> <d2f4c409-16db-7dbb-533f-c7e56515bceb@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <d2f4c409-16db-7dbb-533f-c7e56515bceb@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > I am using gentoo on my hppa machines and just tried
> > 4.12.0-rc5-00187-gab2789b at the end of last week. This time there
> > was new gcc release so a lot of work. rp3440 and A500 had no problems,
> > rp3410 errored out with SIGSEGV, twice.
> Helge and I have had a long discussion about these SEGVs.  They are
> essentially random.
> The are very rare on UP machines.  I don't think we have seen one yet on the
> panama buildd
> machine which is also a rp3410.  They are much more common on phantom which is
> four way
> c8000 at 1 GHz.

My RP3410 is UP only, with UP kernel. When it happened, it was frequent 
- I got multiple segfaults in different compilations after that. Reboot 
into the same kernel cured it and after reboot I could build the same 
gcc successfully, and have been happily building gunch of gentoo 
updates since (more than a day).

-- 
Meelis Roos (mroos@linux.ee)
