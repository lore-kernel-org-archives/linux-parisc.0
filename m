From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Mon, 13 Jun 2005 00:29:38 -0600
Message-ID: <20050613062938.GD21766@colo.lackof.org>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<20050606060512.GB30857@colo.lackof.org>
	<20050606073627.GA10387@elte.hu>
	<20050606175029.GC24437@colo.lackof.org>
	<20050612064922.GA5257@elte.hu>
	<20050612072507.GB25059@colo.lackof.org>
	<20050612073453.GA7718@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Ingo Molnar <mingo@elte.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050612073453.GA7718@elte.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 12, 2005 at 09:34:53AM +0200, Ingo Molnar wrote:
> 
> * Grant Grundler <grundler@parisc-linux.org> wrote:
> 
> > > thanks. I'm still wondering about the fundamental question though: why 
> > > doesnt the box boot without your patch?
> > 
> > Did you mean to ask: Why doesn't the kernel build w/o my patch?
> 
> ah, ok. If that's the case, then the main problem is that i've added 
> #include <asm/atomic.h> to linux/spinlock.h? 

Hrmm...I'm not sure I'd call that a "problem".
linux/spinlock.h uses atomic_t and following current rules,
it should include some version of atomic.h to get a definition
of atomic_t.

> If you remove that
> include from linux/spinlock.h and if you hack atomic_dec_and_lock to not 
> use atomic_t but void *, does it build fine?

I remove the include but continued to use "atomic_t" anyway.
That built too. :^)

Oh, sorry. I just realized that's still with my patch in place.
Tomorrow I'll back out my patch and see if it still builds.

BTW, I do not like "void *" if we can (and should) use a special typedef.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
