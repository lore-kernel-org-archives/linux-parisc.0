Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE059482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jan 2002 09:57:58 -0700 (MST)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] sched-O1-2.4.17-I3.patch, need help
Message-ID: <1011373071.3c48540f830f2@webmail.tiscalinet.be>
Date: Fri, 18 Jan 2002 17:57:51 +0100 (CET)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
References: <1011338378.3c47cc8a895dd@webmail.tiscalinet.be> <20020118080634.A7462@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020118080634.A7462@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Matt,

Thanks a lot.

Anyway it is far much more difficult then I innocently believe.
Struct changes ask also changes on other parts as offset.c, traps.c,...
Also I would need much more works and help...

Hmm... about traps.c I always forgot to ask you:
at line 174 it was writen "... cr30 do not correspond..."
would it not be read  "... cr31 ..."?

Thanks again for help,
        Joel

Quoting Matthew Wilcox <willy@debian.org>:

> On Fri, Jan 18, 2002 at 08:19:38AM +0100, joel.soete@freebel.net wrote:
> > +
> > +static __inline__ void __clear_bit(int nr, volatile void * addr)
> > +{
> > +       __asm__ __volatile__(
> > +               "btrl %1,%0"
> > +               :"=m" (ADDR)
> > +               :"Ir" (nr));
> > +}
> 
> __clear_bit is simply a lockless clear_bit.  it's the same difference
> between __set_bit and set_bit.
> 
> >  /*
> > + * Every architecture must define this function. It's the fastest
> > + * way of searching a 168-bit bitmap where the first 128 bits are
> > + * unlikely to be set. It's guaranteed that at least one of the 168
> > + * bits is cleared.
> > + */
> > +#if MAX_RT_PRIO != 128 || MAX_PRIO != 168
> > +# error update this function.
> > +#endif
> > +
> > +static inline int sched_find_first_zero_bit(unsigned long *b)
> > +{
> > +       unsigned int rt;
> > +
> > +       rt = b[0] & b[1] & b[2] & b[3];
> > +       if (unlikely(rt != 0xffffffff))
> > +               return find_first_zero_bit(b, MAX_RT_PRIO);
> > +
> > +       if (b[4] != ~0)
> > +               return ffz(b[4]) + MAX_RT_PRIO;
> > +       return ffz(b[5]) + 32 + MAX_RT_PRIO;
> > +}
> > +/*
> 
> hrm -- actually a little tricky.  Yes, this function for 32-bit
> compiles,
> but not for 64-bit compiles (long changes size, and of course that
> means
> it can be done more quickly on 64-bit quantities instead of 32-bit).
> 
> > And what do you about this one (how to implement it on hppa?):
> > 
> > --- linux/arch/i386/kernel/process.c.orig       Sun Jan  6 13:55:47
> 2002
> > +++ linux/arch/i386/kernel/process.c    Wed Jan 16 00:52:28 2002
> > @@ -123,15 +123,12 @@
> >  void cpu_idle (void)
> >  {
> >         /* endless idle loop with no priority at all */
> > -       init_idle();
> > -       current->nice = 20;
> > -       current->counter = -100;
> 
> yup, delete these.
> 
> >         while (1) {
> >                 void (*idle)(void) = pm_idle;
> >                 if (!idle)
> >                         idle = default_idle;
> > -               while (!current->need_resched)
> > +               if (!current->need_resched)
> >                         idle();
> >                 schedule();
> >                 check_pgt_cache();
> 
> Dunno.
> 
> -- 
> Revolutions do not require corporate support.
> 
> 


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
