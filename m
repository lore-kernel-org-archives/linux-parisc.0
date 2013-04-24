From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: increase kernel stack size to 32k
Date: Wed, 24 Apr 2013 13:41:15 -0700
Message-ID: <1366836075.1971.22.camel@dabdike>
References: <20130423202203.GA7287@p100.box> <51778ADE.4010906@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51778ADE.4010906@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2013-04-24 at 09:33 +0200, Helge Deller wrote:
> On 04/23/2013 10:22 PM, Helge Deller wrote:
> > commit e4e1e78facf7565cada909a69c7fb6415b6e7b83
> > Author: Helge Deller <deller@gmx.de>
> > Date:   Tue Apr 23 17:19:37 2013 +0200
> > 
> > parisc: increase kernel stack size to 32k
> > 
> > --- a/arch/parisc/include/asm/thread_info.h
> > +++ b/arch/parisc/include/asm/thread_info.h
> > -#define THREAD_SIZE_ORDER            2
> > +#define THREAD_SIZE_ORDER            3	/* 32k stack */
> 
> I tested again, and it actually needs to be 64k stacks to not crash any longer.
> So, the right temporary fix is:
> 
> > +#define THREAD_SIZE_ORDER            4	/* 64k stack */
> 
> Will send updated patch soon.

This is an indicator of something seriously wrong somewhere.  We've
always had the 16k stack just because of our large frames.  In theory,
the IRQ stack should only be the same size as the kernel stack, so if we
have both in the same place, we should only need at max 32k ... if we're
still seeing problems related to stack overrun, then it might be we have
an IRQ recursion where we shouldn't have.  To be honest, I have a hard
time explaining why our stacks should be over 8k.

James


