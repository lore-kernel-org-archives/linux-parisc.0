Return-Path: <dave@hiauly1.hia.nrc.ca>
Message-Id: <200401260013.i0Q0Dltk013819@hiauly1.hia.nrc.ca>
Subject: Re: Re: [parisc-linux] missing barrier in _raw_spin_lock?
To: arndb@onlinehome.de
Date: Sun, 25 Jan 2004 19:13:47 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <26879984$10750505064013f80a9ea842.79929993@config4.schlund.de>
	from "arndb@onlinehome.de" at Jan 25, 2004 06:10:01 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, arnd@arndb.de, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> > #define __ldcw(a) ({ \
> >   unsigned int __ret;                                                   \
> >   __asm__ __volatile__("ldcw 0(%2),%0"                                  \
> > 		      : "=r" (__ret), "=m" (*(a)) : "r" (a));           \
> >   __ret;                                                                \
> > })

> I suppose the memory operand specification is required here. Newer 
> compilers (especially gcc-3.4) can optimize away local variables if you 
> only access the address but not the contents. I think even your 
> pthreads version is not really correct, because it specifies (*(a)) as
> output only instead of inout.

I agree.

> No, putting the barrier into __ldcw is wrong because it would impact all
> other uses of __ldcw that don't need the barrier. AFAICS, the 

The only other uses for __ldcw are the SPIN_LOCK macro in atomic.h
and the _raw_spin_trylock in spinlock.h (i.e., it is only used
acquire locks).  If all these need barriers, then it might as well
be in __ldcw.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
