Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id B714A482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jul 2003 10:33:10 -0600 (MDT)
Date: Tue, 1 Jul 2003 18:33:07 +0200
Message-ID: <3ED71F6D0000C19D@ocpmta7.freegates.net>
In-Reply-To: <20030630163601.GC14971@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] byte swapping redux
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
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

Hi Grant,

> > I don't understand why the 32bits kernel crashed with this patche:
> > (gcc-3.3 and binutils-2.13.90)
> 
> uhm...perhaps the 64-bit swap is buggy for 32-bit mode?
> I didn't test that. It's a different code path.

I hope I am not going to anoying you.

I just found related interesting stuff: <http://lwn.net/Articles/38384/>

And may be also the source of pb.

I also write this small testcase to try to point out the pb in 32bits mode:

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <asm/types.h>

typedef unsigned long long u64;
typedef u_int8_t  BOOLEAN;

typedef struct
{
    unsigned char b7, b6, b5, b4, b3, b2, b1, b0;
}
EightBytes;

static __inline__ __const__ __u32 ___arch__swab32(__u32 x)
{
        unsigned int temp;
        __asm__("shd %0, %0, 16, %1\n\t"        /* shift abcdabcd -> cdab
*/
                "dep %1, 15, 8, %1\n\t"         /* deposit cdab -> cbab */
                "shd %0, %1, 8, %0"             /* shift abcdcbab -> dcba
*/
                : "=r" (x), "=&r" (temp)
                : "0" (x));
        return x;
}

#define __arch__swab32(x) ___arch__swab32(x)

static __inline__ __const__ __u64 ___arch__swab64(__u64 x)
{
        __u32 t1 = (__u32) x;
        __u32 t2 = (__u32) ((x) >> 32);
        ___arch__swab32(t1);
        ___arch__swab32(t2);
        return (((__u64) t1 << 32) + ((__u64) t2));
}

static __inline__ __const__ __u32 __fswab32(__u32 x)
{
        return __arch__swab32(x);
}

#  define __swab32(x) __fswab32(x)

static __inline__ __const__ __u64 __fswab64(__u64 x)
{
        __u32 h = x >> 32;
        __u32 l = x & ((1ULL<<32)-1);
        return (((__u64)__swab32(l)) << 32) | ((__u64)(__swab32(h)));
}

int main(int argc, char * * argv, char * * env) {

    unsigned long long TU64;
    int err;

    TU64=0xfedcba9876543210LL;

    printf("Val of TU64: %0Lx\n", TU64);
    printf("Val of ___arch__swab64(TU64): %0Lx\n", ___arch__swab64(TU64));
    printf("Val of __fswab64(TU64): %0Lx\n", __fswab64(TU64));

}

And here is the results:
Val of TU64: fedcba9876543210
Val of ___arch__swab64(TU64): 76543210fedcba98
Val of __fswab64(TU64): 1032547698badcfe

What is right (I could not rebuild with hppa64-linux-gcc :( )?

Thanks,
    Joel


---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be
