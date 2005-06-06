From: Ingo Molnar <mingo@elte.hu>
Subject: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Mon, 6 Jun 2005 09:36:27 +0200
Message-ID: <20050606073627.GA10387@elte.hu>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<20050606060512.GB30857@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050606060512.GB30857@colo.lackof.org>
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

> > the latest version of the spinlock consolidation patch can be found at:
> > 
> >   http://redhat.com/~mingo/spinlock-patches/consolidate-spinlocks.patch
> 
> I've adapted parisc-linux to this patch and put my changes into
> a patch that goes on top of Ingo's.

i'm wondering, is the conversion to raw_spinlock_t absolutely necessary 
to get a working PARISC kernel? I feel a bit uneasy about using the raw 
spinlocks directly - they were not intended to be used like that, for 
the time being. Right now they are internal types. You should be able to 
use spinlock_types.h just as much to simplify your include file 
dependencies. (as long as you use the spinlock APIs only in .c files)

	Ingo
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
