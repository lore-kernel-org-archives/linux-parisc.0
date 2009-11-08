From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 10/16] parisc: Replace old style lock init
Date: Sun, 8 Nov 2009 17:11:52 +0100 (CET)
Message-ID: <alpine.LFD.2.00.0911081710560.2725@localhost.localdomain>
References: <20091106223547.784916750@linutronix.de> <20091106223806.803538964@linutronix.de> <20091108050614.GB28962@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091108050614.GB28962@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 8 Nov 2009, Kyle McMartin wrote:

> On Fri, Nov 06, 2009 at 10:41:51PM -0000, Thomas Gleixner wrote:
> > SPIN_LOCK_UNLOCKED is deprecated. Init the per cpu locks at runtime
> > instead.
> > 
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Kyle McMartin <kyle@mcmartin.ca>
> > Cc: linux-parisc@vger.kernel.org
> 
> applied with one nit.
> 
> >  
> > -DEFINE_SPINLOCK(smp_lock);
> > -
> 
> You forgot to mention this was unused. :) Confused me for a while.

Gah. Wanted to add it to the changelog, but slipped from my mind.

Sorry for the confusion,

	tglx
