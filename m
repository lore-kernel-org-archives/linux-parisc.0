Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2FB7E4843
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Sep 2003 16:33:29 -0600 (MDT)
Message-ID: <3F5A60B9.3050103@tiscali.be>
Date: Sat, 06 Sep 2003 22:33:29 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
References: <3F5A4023.9070909@tiscali.be>
In-Reply-To: <3F5A4023.9070909@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Re: [parisc-linux-cvs] Re: 2.6.0-test4-pa12 __fls()
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

Hi Willy And Grant,

> On Fri, Sep 05, 2003 at 11:59:14PM -0600, Grant Grundler wrote:
> >/ > kudos to Joel Soete for mangling lamont's __ffs() to produce __fls().
/> >/ > Again, I added 64-bit support.  Booted on a500.
/> >/ > Didn't test 32-bit but fls_test.c included in above URL works in user space.
/> >/ > (162 cycles per loop iteration, 00:29:01 to complete on 400Mhz PA8500).
/>
> Sorry, but it's clearly broken.
> 
> >/ -#define fls(x) generic_fls(x)
/> >/ +static __inline__ unsigned long __fls(unsigned long x)
/> >/ +{
/> >/ +	unsigned long ret;
/> >/ +
/> >/ +	__asm__( " ldi    1,%1\n"
/> >/ +#if BITS_PER_LONG > 32
/> >/ +		" extrd,u,*<>  %0,63,32,%%r0\n"
/> 
> if any of the bottom 32 bits are set ...
> 
> >/ +		" depd,*TR  %0,31,32,%0\n"
/> 
> move the bottom 32 bits up into the top 32 bits
> 
> >/ +		" addi    32,%1,%1\n"
/> 
> otherwise add 32
> 
> >/ +#endif
/> 
> ... and then do things that can't see the top 32 bits.

hmm either I had to re-think the algo as you mentioned below
(so that to minimise the difference between 32 and 64 bits kernel)
or writing two distinct routine. (the 64 bits using depd,Z,*TR [...]
in place of 32 bits zdep

btw: is somebody knows how to compile with _hppa64-gcc_ shuch trivial loop
#include <stdio.h>

main()
{
	unsigned long long i;

	for (i=0; i<0xffffffffffffffffUL; i++) {
		printf ("i = %#010x (%ll)\n", i);
	}
}

(afair the problem if the call to printf() )

> 
> >/ +		" extru,<>  %0,15,16,%%r0\n"
/> >/ +		" zdep,TR  %0,15,16,%0\n"
/> >/ +		" addi     16,%1,%1\n"
/> 
> think you could put in comments similar to the endian swapping?  it makes
> the intent clearer to see.

My bad (in fact i was waiting some accept/reject comments before adding comment as pseudo_fls() was written)

> as far as i can tell, the basic principle
> here is..
> 
> if (top N bits clear)
> 	shift N bits right
> else
> 	add N 
> 
> right?

Sorry, I trusted that pseudo_fls() in the mentionned message:
(http://lists.parisc-linux.org/pipermail/parisc-linux/2003-August/020628.html)
was enough ;)

> 
> seems to me this whole thing should be done as
> 
> if (any top N bits set)
> 	shift N bits left
> else
> 	subtract N
> 
> >/ +		" extru,<>  %0,7,8,%%r19\n"
/> 
> r19?  That's not mentioned as being clobbered.  I think you mean r0.

Yes a typo of mine (my bad sorry)

As i am in holidays, the pb is that I have no palinux box at my disposal to experiment another solution :(

Joel

PS: may i submit you an additional thought without any interest (may be):
the suggested code is "
+	return x ? (__ffs((unsigned long)x) + 1) : 0;

and if I refer to k&r book long is of 32bits lenght? (otc int is arch dependent)
But may be outdated by C99?

Thanks for additonal advise (and sorry for so much questions against so poor answers ;)
