From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] some other small bitops.h suggestion?
Date: Wed, 13 Apr 2005 08:58:41 +0200
Message-ID: <42075CE80001A18D@mail-6-bnl.tiscali.it>
References: <20050413061430.GB9519@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050413061430.GB9519@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> -- Original Message --
> Date: Wed, 13 Apr 2005 00:14:30 -0600
> From: Grant Grundler <grundler@parisc-linux.org>
> To: Joel Soete <soete.joel@tiscali.be>
> Cc: Randolph Chung <randolph@tausq.org>,
> 	parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] some other small bitops.h suggestion?
> 
> 
> On Tue, Apr 05, 2005 at 11:28:26AM +0200, Joel Soete wrote:
> ...
> > -#define hweight32(x) generic_hweight32(x)
> > -#define hweight16(x) generic_hweight16(x)
> > -#define hweight8(x) generic_hweight8(x)
> > +#define hweight64(x)   generic_hweight64(x)
> > +#define hweight32(x)   generic_hweight32(x)
> > +#define hweight16(x)   generic_hweight16(x)
> > +#define hweight8(x)    generic_hweight8(x)
> 
> This bit is fine.
> 
> >   * Every architecture must define this function. It's the fastest
> > @@ -337,10 +330,8 @@
> >  #else
> >         if (unlikely(b[0]))
> >                 return __ffs(b[0]);
> > -       if (unlikely(((unsigned int)b[1])))
> > +       if (unlikely(b[1]))
> >                 return __ffs(b[1]) + 64;
> > -       if (b[1] >> 32)
> > -               return __ffs(b[1] >> 32) + 96;
> >         return __ffs(b[2]) + 128;
> >  #endif
> ...
> > The second hunk just because I didn't understand why this form (looks=

like
> > sparc64) and not another (e.g. ppc64).
> 
> I think it's just for performance.
> Sparc implementation of __ffs isn't very fast and it's quicker
> to test the high/low parts of the word seperately because of which
> bits are most likely to be set.
> 
That's what I thought too but not sure.

> I'm pretty sure on parisc it will only cost two more cycles to check
> the extra 32-bits. The test for top/bottom seperately would likely
> cost us more if we don't predict the branches correctly.
> 
> But becuase of how sparc64 does it, I'm wondering if we should
> use "likely(b[1])". Any comments?
> 
> 
> sched_find_first_bit(), __clear_bit() and find_next_bit() just
> all need to agree how bits are numbered in am in-memory bitmap.
> 
> Code like this in kernel/sched.c:
> 
> skip_bitmap:
>         if (!idx)
>                 idx =3D sched_find_first_bit(array->bitmap);
>         else
>                 idx =3D find_next_bit(array->bitmap, MAX_PRIO, idx);
> 
> requires we number the bits the same way in both.
> And __clear_bit() has to agree as well:
> 
> static void dequeue_task(struct task_struct *p, prio_array_t *array)
> {
>         array->nr_active--;
>         list_del(&p->run_list);
>         if (list_empty(array->queue + p->prio))
>                 __clear_bit(p->prio, array->bitmap);
> }
> 
> 
> parisc __clear_bit also uses unsigned long to access the array:
> 
> static __inline__ void __clear_bit(unsigned long nr, volatile unsigned
long
> * address)
> {
>         unsigned long mask;
>         unsigned long *addr =3D (unsigned long *) address;
> 
>         addr +=3D (nr >> SHIFT_PER_LONG);
>         mask =3D 1UL << CHOP_SHIFTCOUNT(nr);
>         *addr &=3D ~mask;
> }
> 
> ugh...I think I'm just going to use the sparc64 version here.
> I'm not comfortable with the "volatile" attribute getting dropped.
> 
Good for me ;-)

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
