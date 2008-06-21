From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: ldcw inline assembler patch
Date: Sat, 21 Jun 2008 14:34:32 -0400 (EDT)
Message-ID: <20080621183433.9F92C431A@hiauly1.hia.nrc.ca>
References: <119aab440806161350w4d15c14ex735377b78f697fd8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org, dave.anglin@nrc.ca
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440806161350w4d15c14ex735377b78f697fd8@mail.gmail.com> from "Carlos O'Donell" at Jun 16, 2008 04:50:23 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > diff --git a/include/asm-parisc/system.h b/include/asm-parisc/system.h
> > index ee80c92..4752684 100644
> > --- a/include/asm-parisc/system.h
> > +++ b/include/asm-parisc/system.h
> > @@ -168,8 +168,9 @@ static inline void set_eiem(unsigned long val)
> >  /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
> >  #define __ldcw(a) ({                                           \
> >        unsigned __ret;                                         \
> > -       __asm__ __volatile__(__LDCW " 0(%1),%0"                 \
> > -               : "=r" (__ret) : "r" (a));                      \
> > +       __asm__ __volatile__(__LDCW " 0(%2),%0"                 \
> > +                       : "=r" (__ret), "=m" (*(a))             \
> > +                       : "r" (a), "m" (*(a))   );              \
> >        __ret;                                                  \
> >  })
> 
> You don't want to do that, the compiler might hold "=m" (*(a)) in a
> temporary memory location.
> 
> e.g.
> temp_mem = *a;
> reg2 = &temp_mem;
> ... operation ...
> *a = temp_mem;

The operation uses "a" not "reg2".  Listing *a as written in the
asm should stop the compiler from caching *a in temp_mem.

I don't believe the compiler ever caches values in "memory".  However,
it does cache memory values in registers.  So, we need to tell GCC not
to cache *a in a register.  This can be done either by explicitly
listing the affected locations or by clobbering all memory.

I believe using the volatile keyword and a memory clobber is ok but
overkill.  Explicitly listing the affected memory as suggested by
Helge appears to be the way to go.  There is an example of this in
the GCC manual.

I also believe we can use the "+m" constraint so that *a doesn't need
to be listed twice.

It might be possible to remove the volatile keyword when the affected
memory is explicitly listed.  However, I doubt there are any situations
where the asm can be optimized away.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
