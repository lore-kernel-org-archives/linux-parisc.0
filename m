Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep01-mail.bloor.is.net.cable.rogers.com (fep01-mail.bloor.is.net.cable.rogers.com [66.185.86.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id E3A5A482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 May 2003 09:07:55 -0600 (MDT)
Date: Thu, 22 May 2003 11:09:02 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ulrich Drepper <drepper@redhat.com>
Cc: libc-alpha@sources.redhat.com,
	parisc-linux@lists.parisc-linux.org,
	Randolph Chung <tausq@debian.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Message-ID: <20030522150902.GM21858@systemhalted>
References: <20030521172929.GB21858@systemhalted> <3ECBBE25.8090302@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ECBBE25.8090302@redhat.com>
Subject: [parisc-linux] Re: [PATCH] HPPA Linuxthreads.
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Ulrich,

> The indentation and general style is wrong in many places.

I'll clean this up today and break it into three chunks for even easier
digestion.
 
> >  __pthread_spin_lock (pthread_spinlock_t *lock)
> >  {
> > -  unsigned int val;
> > +	unsigned int *addr = __ldcw_align (lock);
> > +	
> > +	while (__ldcw (addr) == 0)
> > +		while (*addr == 0) ;
> 
> This is plain wrong.  addr at least must be volatile.

__ldcw is volatile.

Are you suggesting that it is prehaps fragile based on gcc's 
choice of optimization?

> And I don't understand why you removed the asm code.  These pieces of
> code are prime candidates for hand-coding.

__ldcw is still assembly only. __ldcw_align is a macro. In truth I
wanted a functioning implementation first, optimization is a close
second. Though a full assembly version would fix gcc from reordering
anything.
 
> > +static inline struct _pthread_descr_struct * __get_cr27(void)
> > +{
> > +	long cr27;
> > +	asm("mfctl %%cr27, %0" : "=r" (cr27) : );
> > +	return (struct _pthread_descr_struct *) cr27;
> > +}
> 
> Not a real problem, but you should get gcc to recognize this reqister
> and perform the loading.

This should get addressed as TLS is implemented for HPPA. I will be
attending gcc-summit in hopes to discuss this with my colleagues.

c.
