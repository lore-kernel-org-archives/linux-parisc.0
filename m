Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id F14F1482E
	for <parisc-linux@parisc-linux.org>; Mon,  4 Aug 2003 04:43:22 -0600 (MDT)
Date: Mon, 4 Aug 2003 12:43:10 +0200
Message-ID: <3F29178A00000A99@ocpmta7.freegates.net>
In-Reply-To: <20030801171426.GA18508@security.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] backport bitops.h stuff
To: lamont@hp.com
Cc: "James Bottomley" <James.Bottomley@steeleye.com>,
	parisc-linux@parisc-linux.org, lamont@hp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi pa,

Here is a combine test case:

#include <stdio.h>

/**
 * __ffs - find first bit in word.
 * @word: The word to search
 *
 * Undefined if no bit exists, so code should check against 0 first.
 */
/* static __inline__ unsigned long ffs26(unsigned long word) */
unsigned long ffs_hppa26(unsigned long word)
{
        unsigned long result = 0;

        if (word)
/* I add this exception condition */
            while (!(word & 1UL)) {
                    result++;
                    word >>= 1;
            }
        return result;
}
/*
 * ffs: find first bit set. This is defined the same way as
 * the libc and compiler builtin ffs routines, therefore
 * differs in spirit from the above ffz (man ffs).
 */

static inline int generic_ffs(int x)
{
        int r = 1;

        if (!x)
                return 0;
        if (!(x & 0xffff)) {
                x >>= 16;
                r += 16;
        }
        if (!(x & 0xff)) {
                x >>= 8;
                r += 8;
        }
        if (!(x & 0xf)) {
                x >>= 4;
                r += 4;
        }
        if (!(x & 3)) {
                x >>= 2;
                r += 2;
        }
        if (!(x & 1)) {
                x >>= 1;
                r += 1;
        }
        return r;
}

int fastffs(int x)
{
  int ret=0;
  __asm__(" ldi    31,%1\n"
    " extru,<>  %0,31,16,%%r0\n"
    " extru,TR  %0,15,16,%0\n"
    " addi    -16,%1,%1\n"
    " extru,<>  %0,31,8,%%r0\n"
    " extru,TR  %0,23,8,%0\n"
    " addi    -8,%1,%1\n"
    " extru,<>  %0,31,4,%%r0\n"
    " extru,TR  %0,27,4,%0\n"
    " addi    -4,%1,%1\n"
    " extru,<>  %0,31,2,%%r0\n"
    " extru,TR  %0,29,2,%0\n"
    " addi    -2,%1,%1\n"
    " extru,=  %0,31,1,%%r0\n"
    " addi    -1,%1,%1\n"
    : "=r" (x), "=r" (ret)
    : "0" (x), "1" (ret));

  return ret;
}

doffs(x)
{
  printf("fastffs(%d)==%d\n",x,fastffs(x));
  printf("ffs_hppa26(%d)==%d\n",x,ffs_hppa26(x));
  printf("generic_ffs(%d)==%d\n",x,generic_ffs(x));
  printf("\n");
}

main()
{
  int i;
  for (i=0;i<5;i++)
    doffs(i);
  for (;i;i<<=1)
    doffs(i);
}

And I am confused by results:

fastffs(0)==31
ffs_hppa26(0)==0
generic_ffs(0)==0

I presume that we also have to consider an exception for 0?

[...]
fastffs(1)==0
ffs_hppa26(1)==0
generic_ffs(1)==1

fastffs(2)==1
ffs_hppa26(2)==1
generic_ffs(2)==2

fastffs(3)==0
ffs_hppa26(3)==0
generic_ffs(3)==1

fastffs(4)==2
ffs_hppa26(4)==2
generic_ffs(4)==3

[...]

So in all other case fastffs or ffs_hppa26 == generic_ffs - 1.
What is right?

Thanks for additional attention,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
