From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Mon, 6 Jun 2005 09:12:32 -0600
Message-ID: <20050606151232.GA24437@colo.lackof.org>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<20050606060512.GB30857@colo.lackof.org>
	<20050606073627.GA10387@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Ingo Molnar <mingo@elte.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050606073627.GA10387@elte.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 06, 2005 at 09:36:27AM +0200, Ingo Molnar wrote:
> > I've adapted parisc-linux to this patch and put my changes into
> > a patch that goes on top of Ingo's.
> 
> i'm wondering, is the conversion to raw_spinlock_t absolutely necessary 
> to get a working PARISC kernel?

No. They were regular spinlocks before too. But there was a pretty
ugly set of interdependencies between asm/system.h, spinlock.h,
atomic.h, and bitops.h.

The cleanup necessary might be alot more baggage than you want
to carry around for this patch.

>  I feel a bit uneasy about using the raw 
> spinlocks directly - they were not intended to be used like that, for 
> the time being. Right now they are internal types.

They are arch specific types (asm/spinlock_types.h) and
I'm only using raw_spinlock_t in arch specific code.

>  You should be able to 
> use spinlock_types.h just as much to simplify your include file 
> dependencies. (as long as you use the spinlock APIs only in .c files)

I'll take another quick look
and see where the circular dependencies are now.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
