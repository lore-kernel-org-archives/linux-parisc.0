From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Request for backport of [PARISC] futex: special case cmpxchg
	NULL in kernel space
Date: Tue, 15 Apr 2008 12:09:03 -0400
Message-ID: <20080415160903.GD22873@phobos.i.cabal.ca>
References: <1208274312.3131.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: stable@kernel.org, Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1208274312.3131.11.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Apr 15, 2008 at 10:45:11AM -0500, James Bottomley wrote:
> This is a fix for a bug introduced by tglx into 2.6.25 which we fixed
> upstream.  However, he also got it backported to stable, so now 2.6.24.4
> panics on boot on parisc.  The attached is the fix.
> 

The fix is fine, but it was misdiagnosed. The problem is actually that
swapper's *mm is unset. I switched it to if (!current->mm) in git,
but as usual I'm a slacker and haven't pushed it anywhere.

+1 for stable from me.
