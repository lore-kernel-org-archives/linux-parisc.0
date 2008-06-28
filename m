From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: in ccio_io_pdir_entry(),BUG_ON() seems to break gcc-4.2
	optimization?
Date: Sat, 28 Jun 2008 14:23:47 -0600
Message-ID: <20080628202347.GA23898@colo.lackof.org>
References: <K324MR$1963B6E59C4D4D716463AB17911CD186@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <K324MR$1963B6E59C4D4D716463AB17911CD186@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jun 26, 2008 at 07:28:03AM +0100, Joel Soete wrote:
> Just for remind:
> 
> Joel Soete wrote:
>  >
>  >
> [snip]
>  >>> But this time, it seems not consider assembly:
>  >>>         asm volatile ("lci %%r0(%%sr1, %1), %0" : "=r" (ci) : "r"
>  >>> (vba));
>  >>>         asm volatile ("extru %1,19,12,%0" : "+r" (ci) : "r" (ci));
>  >>>         asm volatile ("depw  %1,15,12,%0" : "+r" (pa) : "r" (ci));
>  >>>
>  >>> as a 'volatile' block and insert line 1c:
> 
> This seems to make better what I want:
>         __asm__ __volatile__ (
>         "lci    %%r0(%%sr1, %2), %0\n"
>         "\textru        %0,19,12,%0\n"
>         "\tdepw         %0,15,12,%1\n"
>         : "+r" (ci), "+r" (pa)
>         : "r" (vba)
>         : "memory"

Why the "memory"? This asm code isn't modifying memory at all.

>         );
> 
> 
> in <ccio_map_sg>
>   200:	06 80 53 13 	lci r0(sr1,r20),r19		      |	 200:	08 1a 02 54 	copy r26,r20
>   204:	d2 73 1a 74 	extrw,u r19,19,12,r19		      |	 204:	06 a0 53 14 	lci
> r0(sr1,r21),r20
>   208:	08 1a 02 5c 	copy r26,ret0			      |	 208:	d2 94 1a 74 	extrw,u
> r20,19,12,r20
>   20c:	d7 93 0e 14 	depw r19,15,12,ret0		      |	 20c:	d7 94 0e 14 	depw
> r20,15,12,ret0
>   210:	0e dc 12 80 	stw ret0,0(r22)				 210:	0e dc 12 80 	stw ret0,0(r22)
>   214:	06 c0 12 80 	fdc r0(r22)				 214:	06 c0 12 80 	fdc r0(r22)
>   218:	00 00 04 00 	sync					 218:	00 00 04 00 	sync
> 
> J.
> 
> PS: I don't yet understand why kernel panicing when I try to get rid to
> reserve 'ci' variable and use in place a gr as r19 (even if clobbered), the
> produced object seems ok but resulting kernel panicing (even after a full
> rebuild after a make distclean???)

What's wrong with "ci" variable? It's just another register.
C compiler will allocate it and then we pass it to the asm().

And are you sure it's ok to use r19?

hth,
grant

> 
