From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: ldcw inline assembler patch
Date: Mon, 16 Jun 2008 18:03:43 -0400
Message-ID: <20080616220343.GE18358@phobos.i.cabal.ca>
References: <4853E587.9020802@gmx.de> <119aab440806161350w4d15c14ex735377b78f697fd8@mail.gmail.com> <4856D5E4.7090206@gmx.de> <119aab440806161454v49c15f47k75dbf27215d4a978@mail.gmail.com> <20080616215726.GD18358@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@nrc.ca>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080616215726.GD18358@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 16, 2008 at 05:57:26PM -0400, Kyle McMartin wrote:
> On Mon, Jun 16, 2008 at 05:54:24PM -0400, Carlos O'Donell wrote:
> > On Mon, Jun 16, 2008 at 5:06 PM, Helge Deller <deller@gmx.de> wrote:
> > > So, your proposal is (copy-and-pasted in here) the following ?
> > >
> > > diff --git a/include/asm-parisc/system.h b/include/asm-parisc/system.h
> > > index ee80c92..daeae39 100644
> > > --- a/include/asm-parisc/system.h
> > > +++ b/include/asm-parisc/system.h
> > > @@ -169,7 +169,7 @@ static inline void set_eiem(unsigned long val)
> > >  #define __ldcw(a) ({                                           \
> > >        unsigned __ret;                                         \
> > >        __asm__ __volatile__(__LDCW " 0(%1),%0"                 \
> > > -               : "=r" (__ret) : "r" (a));                      \
> > > +               : "=r" (__ret) : "r" (a) : "memory" );          \
> > >        __ret;                                                  \
> > >  })
> > 
> > Yes. The asm should clobber memory thus forcing the compiler to avoid
> > memory temporaries.
> > 
> 
> It shouldn't need to, since we're only ever accessing one word (the one
> specified in the operand.)
> 
> Otherwise basically every inline asm everywhere ever is going to need a
> memory clobber, and that's just BROKEN.
>

Willy points out the caching of the locked data across the lock, but we
surround the inline in a memory barrier, so we're fine.

r, Kyle
