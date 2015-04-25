From: John David Anglin <dave.anglin@bell.net>
Subject: Re: 4.0 parisc regression: memory leak?
Date: Sat, 25 Apr 2015 16:24:54 -0400
Message-ID: <BLU436-SMTP4216889F17566B576C67B197EB0@phx.gbl>
References: <alpine.LRH.2.11.1504242317450.14818@math.ut.ee>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset="us-ascii"
Cc: linux-parisc@vger.kernel.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.11.1504242317450.14818@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-04-25, at 3:19 PM, Meelis Roos wrote:

> I noticed that with 4.0 I'm running out of memory on HP A500 (1G RAM) 
> and HP RP3410 (2G RAM) parisc machines during gentoo "revdep-rebuild 
> -ip". Each time free shows less free memory until OOM killer visits us 
> (and first revdep-rebuild after nontrivial emerge compilation loop kills 
> the smaller box).

I've also had problems with 4.0.  I had HPMC after a few hours on rp3440.

> 
> 3.19 did not seem to have this problem.

--
John David Anglin	dave.anglin@bell.net



