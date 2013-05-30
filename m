From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: fix race conditions flushing user cache pages
Date: Thu, 30 May 2013 07:55:11 -0700
Message-ID: <1369925711.1972.11.camel@dabdike.int.hansenpartnership.com>
References: <BLU0-SMTP84F3DE8CE6D8B9F60C5C2597970@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP84F3DE8CE6D8B9F60C5C2597970@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2013-05-28 at 08:09 -0400, John David Anglin wrote:
> There are two issues addressed by this patch:
> 
> 1) When we flush user instruction and data pages using the kernel  
> tmpalias region, we need to
> ensure that the local TLB entry for the tmpalias page is never  
> replaced with a different mapping.
> Previously, we purged the entry before and after the cache flush  
> loop.  Although preemption was
> disabled, it seemed possible that the value might change during  
> interrupt processing.  The patch
> removes the purge and disables interrupts during the initial TLB entry  
> purge and cache flush.
> 
> 2) In a number of places, we flush the TLB for the page and then flush  
> the page.  We disabled
> preemption around the flush.  This change disables preemption around  
> both the TLB and cache
> flushes as it seemed the effect of the purge might be lost.
> 
> Without this change, I saw four random segmentation faults in about  
> 1.5 days of intensive package
> building last weekend.  With the change, I haven't seen a single  
> random segmentation fault in about
> one week of building Debian packages on 4-way rp3440.  So, there is a  
> significant improvement
> in system stability.

an rp3440 is PA2.0, so you weren't really testing any of the tlb purge
locking changes.

Also, I don't know what happened, but the actual tmpalias theory
requires a TLB purge before and after and I though we used to have them.
The reason is twofold:

     1. You don't want the caches to speculate in the tmpalias region
     2. A flush after makes the routines interrupt safe (because you can
        interrupt in a tmpalias operation, do another tmpalias
        operation, purge the cache and restart within the non interrupt
        tmpalias and expect everything to work).

Trying to disable interrupts sounds like problem 2.  Can we return to
the proper tmpalias operations rather than trying to hack around them?

James




