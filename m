From: Ingo Molnar <mingo@elte.hu>
Subject: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Sun, 12 Jun 2005 08:49:22 +0200
Message-ID: <20050612064922.GA5257@elte.hu>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<20050606060512.GB30857@colo.lackof.org>
	<20050606073627.GA10387@elte.hu>
	<20050606175029.GC24437@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050606175029.GC24437@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


* Grant Grundler <grundler@parisc-linux.org> wrote:

> IPI and TLB locks can be normal locks.
> I've dropped the parts that changed those.
> 
> New (smaller) patch parked at:
>     ftp://ftp.parisc-linux.org/patches/consolidate-spinlocks-parisc.patch-02

thanks. I'm still wondering about the fundamental question though: why 
doesnt the box boot without your patch? Why does the __atomic_hash and 
the pending_lock have to be converted to a raw_spinlock? This patch does 
not change anything fundamental - you are still getting the same 
spinlock primitives from spinlock_t. The only thing that changes is with 
spinlock debugging: there another (generic) piece of code kicks in. The 
only problem could be with assembly code that 'knows' the layout of the 
spinlocks but doesnt take debugging into account - but is this possible 
in the PARISC case? (Yet another possibility would be if i messed up the 
raw type completely, but then your box wouldnt boot at all.)

so this is still quite much of a mystery to me!

	Ingo
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
