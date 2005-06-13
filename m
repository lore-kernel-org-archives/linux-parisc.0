From: Ingo Molnar <mingo@elte.hu>
Subject: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Mon, 13 Jun 2005 09:44:07 +0200
Message-ID: <20050613074407.GA13878@elte.hu>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<20050606060512.GB30857@colo.lackof.org>
	<20050606073627.GA10387@elte.hu>
	<20050606175029.GC24437@colo.lackof.org>
	<20050612064922.GA5257@elte.hu>
	<20050612072507.GB25059@colo.lackof.org>
	<20050612073453.GA7718@elte.hu>
	<20050613062938.GD21766@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050613062938.GD21766@colo.lackof.org>
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

> > If you remove that
> > include from linux/spinlock.h and if you hack atomic_dec_and_lock to not 
> > use atomic_t but void *, does it build fine?
> 
> I remove the include but continued to use "atomic_t" anyway.
> That built too. :^)
> 
> Oh, sorry. I just realized that's still with my patch in place. 
> Tomorrow I'll back out my patch and see if it still builds.
> 
> BTW, I do not like "void *" if we can (and should) use a special 
> typedef.

yeah, agreed - that was just a quick hack, to see whether the dependency 
problem is sorted out via it. (i'm not sure it will be resolved) I'd 
like to address these dependency problems without having to change any 
spinlock to raw_spinlock.

	Ingo
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
