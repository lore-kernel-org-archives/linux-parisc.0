From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Fwd: [PATCH] fix mapping_writably_mapped()
Date: Thu, 11 Dec 2008 16:03:08 -0600
Message-ID: <1229032988.3266.119.camel@localhost.localdomain>
References: <20081210214638.GA28696@bombadil.infradead.org>
	 <49418699.8070900@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Kyle McMartin <kyle@infradead.org>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49418699.8070900@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2008-12-11 at 22:31 +0100, Helge Deller wrote:
> Kyle McMartin wrote:
> > This may explain some of the userspace issues we've been seeing.
> 
> It sadly does not fix the kernel panic I reported in
> http://marc.info/?l=linux-parisc&m=122877889304862&w=2
> ("2.6.28: BUG: soft lockup - CPU#0 stuck for 61s!")

It's not really likely to ... what you have is too much work going on in
the locking functions.  Either because of contention or debugging.

Can you reproduce it without spinlock debugging?  If yes, then we may
have some nasty accidental contention in the flushing spinlocks.

James


