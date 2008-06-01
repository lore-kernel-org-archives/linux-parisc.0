From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [bug] gcc-4.3 miscompiling causing networking to bugger up
Date: Sat, 31 May 2008 19:37:12 -0600
Message-ID: <20080601013712.GB7909@colo.lackof.org>
References: <20080528234110.GD30501@phobos.i.cabal.ca> <20080529000059.9C6434E77@hiauly1.hia.nrc.ca> <20080529000219.GE30501@phobos.i.cabal.ca> <119aab440805281707o78b19a65ke45692f67b6f542@mail.gmail.com> <20080531041010.GA27970@phobos.i.cabal.ca> <20080531105858.GD28074@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080531105858.GD28074@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 31, 2008 at 04:58:58AM -0600, Matthew Wilcox wrote:
...
> So if GCC has something in a register, it might not bother to write it
> back to ram before this asm if we don't have the memory clobber.

Willy, thanks for explaining...I had to reread this a few times to
"get it". This would also explain why we saw it on ip_output where
the ipv4 header was being written.

> Fantastic work, Kyle.  Thanks for spending so much time on this.

Agreed. I owe you a bar of chocolate.

> > diff --git a/include/asm-parisc/checksum.h b/include/asm-parisc/checksum.h
> > index cc3ec1b..1916ebe 100644
> > --- a/include/asm-parisc/checksum.h
> > +++ b/include/asm-parisc/checksum.h
> > @@ -65,7 +65,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
> >  "2:\n"
> >  	: "=r" (sum), "=r" (iph), "=r" (ihl)
> >  	: "1" (iph), "2" (ihl)
> > -	: "r19", "r20", "r21" );
> > +	: "r19", "r20", "r21", "memory" );
> >  
> >  	return (__force __sum16)sum;
> >  }

Does csum_ipv6_magic() also need the same treatment?

Kyle suspects csum_ipv6_magic() might be ok because it's passing
in a "struct ipv6_addr *".  If that's correct, maybe we should ask
davem/et al to change ip_fast_csum() to take "struct iphdr *" as well?

thanks,
grant
