From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] uninline in bitops.c as ia64 or sparc64?
Date: Wed, 11 Aug 2004 13:58:01 +0200
Message-ID: <40FB89640000B461@ocpmta2.freegates.net>
References: <200408101145.20933.mszick@goquest.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
To: "Michael S. Zick" <mszick@goquest.com>,
 parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408101145.20933.mszick@goquest.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hello *,

> Subject: Re: [parisc-linux] uninline in bitops.c as ia64 or sparc64?
> 
> 
> On Tue August 10 2004 09:51, John David Anglin wrote:
> > > On Mon, Aug 09, 2004 at 09:54:08AM -0500, Michael S. Zick wrote:
> > > > generic_ffz is defined as integer - is 'integer' the same size
> > > > cpu32 and cpu64?  If not, that routine needs a size-conditional
> > > > test for the other 32 bits on cpu64.
> > > 
> > > Integers are the same size. The 64-bit boxes are LP64.
> > 
> > To be more specific, the 'int' types are the same size.  The 'long'
> > types are different.
> > 
> > Dave
> Thanks -
> I was able to get my other questions answered with
> a little bit of work with the x-compiler and code snippets.
> 
> I am beginning to think I will learn more than I ever wanted
> to know about a hand-full of hp-instructions before I am done.
> 
> Still, it is an interesting problem and Joel has volunteered
> to test.
> 
Here is the smal test case I tested:
#ifndef __LP64__
#include <stdio.h>
#include <limits.h>
#else
#include "64bit/lib/headers.h"

#define print1(str, num) \
	print(str); \
	hex((unsigned long)num, buf); \
	print(buf); \
	print("\n")
#endif


/*
 * ffs: find first bit set. This is defined the same way as
 * the libc and compiler builtin ffs routines, therefore
 * differs in spirit from the above ffz (man ffs).
 */

/* Extended version for ulong param x */

static __inline__ unsigned long generic_ffs(unsigned long x)
{
        unsigned long r =3D 1;

        if (!x)
                return 0;
#ifdef __LP64__
        if (!(x & 0xffffffffUL)) {
                x >>=3D 32;
                r +=3D 32;
        }
#endif
        if (!(x & 0xffffUL)) {
                x >>=3D 16;
                r +=3D 16;
        }
        if (!(x & 0xffUL)) {
                x >>=3D 8;
                r +=3D 8;
        }
        if (!(x & 0xfUL)) {
                x >>=3D 4;
                r +=3D 4;
        }
        if (!(x & 3UL)) {
                x >>=3D 2;
                r +=3D 2;
        }
        if (!(x & 1UL)) {
                x >>=3D 1;
                r +=3D 1;
        }
        return r;
}

static __inline__ unsigned long __ffs(unsigned long x)
{
	unsigned long ret;

	__asm__(
#ifdef __LP64__
		" ldi       63,%1\n"
		" extrd,u,*<>  %0,63,32,%%r0\n"
		" extrd,u,*TR  %0,31,32,%0\n"	/* move top 32-bits down */
		" addi    -32,%1,%1\n"
		" extrd,u,*<>  %0,63,16,%%r0\n"
		" extrd,u,*TR  %0,47,16,%0\n"   /* xxxx0000 -> 0000xxxx */
		" addi    -16,%1,%1\n"
		" extrd,u,*<>  %0,63,8,%%r0\n"
		" extrd,u,*TR  %0,55,8,%0\n"    /* 0000xx00 -> 000000xx */
		" addi    -8,%1,%1\n"
		" extrd,u,*<>  %0,63,4,%%r0\n"
		" extrd,u,*TR  %0,59,4,%0\n"    /* 000000x0 -> 0000000x */
		" addi    -4,%1,%1\n"
		" extrd,u,*<>  %0,63,2,%%r0\n"
		" extrd,u,*TR  %0,61,2,%0\n"    /* 0000000y, 1100b -> 0011b */
		" addi    -2,%1,%1\n"
		" extrd,u,*=3D  %0,63,1,%%r0\n"   /* check last bit */
		" addi    -1,%1,%1\n"
#else
		" ldi       31,%1\n"
		" extru,<>  %0,31,16,%%r0\n"
		" extru,TR  %0,15,16,%0\n"	/* xxxx0000 -> 0000xxxx */
		" addi    -16,%1,%1\n"
		" extru,<>  %0,31,8,%%r0\n"
		" extru,TR  %0,23,8,%0\n"	/* 0000xx00 -> 000000xx */
		" addi    -8,%1,%1\n"
		" extru,<>  %0,31,4,%%r0\n"
		" extru,TR  %0,27,4,%0\n"	/* 000000x0 -> 0000000x */
		" addi    -4,%1,%1\n"
		" extru,<>  %0,31,2,%%r0\n"
		" extru,TR  %0,29,2,%0\n"	/* 0000000y, 1100b -> 0011b */
		" addi    -2,%1,%1\n"
		" extru,=3D  %0,31,1,%%r0\n"	/* check last bit */
		" addi    -1,%1,%1\n"
#endif
			: "+r" (x), "=3Dr" (ret) );
	return ret;
}

static unsigned long ULffs(unsigned long x)
{
	return x ? (__ffs((unsigned long)x) + 1) : 0;
}

main()
{
	char buf[512];
	unsigned long i, Extrd;

#ifndef __LP64__
	printf("Computing ffs() for i =3D %u to %u...\n", 0, 0xffffffffU);
	for (i=3D0x0UL; i<0xffffffffUL; i++) {
		if ( generic_ffs(i) !=3D ULffs(i) ) {
			printf("i =3D %#010x (%u)\n", i, i);
			printf("generic_ffs() =3D %u\n", generic_ffs(i));
			printf("ffs() =3D %u\n", ULffs(i));
		}
	}
	printf("i=3D %#010x (%u), finished.\n", i, i);
#else
	for (i=3D0xfffffffUL; i<0xf00000000UL; i++) {
		if ( generic_ffs(i) !=3D ULffs(i) ) {
			print1("i =3D ", i);
			print1("generic_ffs() =3D ", generic_ffs(i));
			print1("ffs() =3D ", ULffs(i));
		}
	}
#endif
}

I compile it with James 64bit lib with hppa64-linux-gcc (3.0.4) and run
it on a b2k (64bit cpu) with 2.6.8-rc2-pa7 64bit.
That's a long test (reason of delay) but it works fine.

I also test the 32bit binaries (compile with gcc-3.3.4) runing on the b2k=

with same kernel and it also works fine.

Please note that I have to abuse the original ffs() code with ULffs() and=

an unsigned long (64bit long for hppa64-gcc) as parameter (the original
was an integer of 32bit long for 64bit and 32bit gcc).

hth,
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL LIGHT, 19,95 EUR/mois pendant 6 mois, c'est le moment de fai=
re
le pas!
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
