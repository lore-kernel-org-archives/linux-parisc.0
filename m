Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92A7648ED
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 Oct 2003 09:42:34 -0600 (MDT)
Message-ID: <3F9A99F5.7030007@tiscali.be>
Date: Sat, 25 Oct 2003 15:42:45 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: teaching the kernel to do division
References: <20031023072157.GX24406@tausq.org> <20031023233935.GZ24406@tausq.org> <3F9A5ACA.1010403@tiscali.be>
In-Reply-To: <3F9A5ACA.1010403@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi all,

this test case would explaining better (i hope at least) than long 
sentences what i mean:
#include <linux/types.h>
#include <stdio.h>
#include <limits.h>

/*
/* Algo 1: the goal */
uint32_t div64(uint64_t *n, uint32_t base)
{
         uint32_t rem;

         rem = *n % base;
         *n = *n / base;

         return rem;
}

/* Algo 2: original 2.6 */
uint32_t div64(uint64_t *n, uint32_t base)
{
         uint32_t low, low2, high, rem;

         low   = *n   & 0xffffffff;
         high  = *n  >> 32;
         rem   = high % (uint32_t)base;
         high  = high / (uint32_t)base;
         low2  = low >> 16;
         low2 += rem << 16;
         rem   = low2 % (uint32_t)base;
         low2  = low2 / (uint32_t)base;
         low   = low  & 0xffff;
         low  += rem << 16;
         rem   = low  % (uint32_t)base;
         low   = low  / (uint32_t)base;

         *n = low +
                 ((uint64_t)low2 << 16) +
                 ((uint64_t)high << 32);

         return rem;
}

/* Algo 3: 2.4 method  */
#define div64(n,base)                                                  \
({                                                                     \
         unsigned long __low, __low2, __high, __rem;                    \
         __low  = (n) & 0xffffffff;                                     \
         __high = (n) >> 32;                                            \
         if (__high) {                                                  \
                 __rem   = __high % (unsigned long)base;                \
                 __high  = __high / (unsigned long)base;                \
                 __low2  = __low >> 16;                                 \
                 __low2 += __rem << 16;                                 \
                 __rem   = __low2 % (unsigned long)base;                \
                 __low2  = __low2 / (unsigned long)base;                \
                 __low   = __low & 0xffff;                              \
                 __low  += __rem << 16;                                 \
                 __rem   = __low  % (unsigned long)base;                \
                 __low   = __low  / (unsigned long)base;                \
                 n = __low  + ((long long)__low2 << 16) +               \
                         ((long long) __high << 32);                    \
         } else {                                                       \
                 __rem = __low % (unsigned long)base;                   \
                 n = (__low / (unsigned long)base);                     \
         }                                                              \
         __rem;                                                         \
})
  */

  /* Algo 4: the Randolph patch OK*/
uint32_t div64(uint64_t *n, uint32_t base)
{
         uint64_t rem = *n;
         uint64_t b = base;
         uint64_t res = 0, d = 1;

         if (b > 0) {
                 while (b < rem) {
                         b <<= 1;
                         d <<= 1;
                 }
         }

         do {
                 if (rem >= b) {
                         rem -= b;
                         res += d;
                 }
                 b >>= 1;
                 d >>= 1;
         } while (d);

         *n = res;
         return rem;
}

main()
{
         uint32_t Rem;
         uint64_t Num;

         Num=(uint64_t) 28999591392ULL;

/*
         printf("Length of Rem: %d\n", sizeof(Rem));
         printf("Length of Num: %d\n", sizeof(Num));
  */
         printf ("Num = %#018Lx (%#lld)\n", Num, Num);
         Rem = div64(&Num, 1000000000UL);

         printf ("Rem = %#012x (%#ld)\n", Rem, Rem);
}

With corresponding results:
         Algo 1 (Ok)
Num = 0x00000006c082a5e0 (28999591392)
Rem = 0x003b948de0 (999591392)

         Algo 2 (Ko)
Num = 0x00000006c082a5e0 (28999591392)
Rem = 0x000db247e0 (229787616)

         Algo 3 (Ko)
Num = 0x00000006c082a5e0 (28999591392)
Rem = 0x000db247e0 (229787616)

         Algo 4 (Ok)
Num = 0x00000006c082a5e0 (28999591392)
Rem = 0x003b948de0 (999591392)

hth,
	Joel

PS: All seems well presented in my mozilla window and hope that will stay ;)

Joel Soete wrote:
> Hi Rnadolph and all,
> 
> I reach to figure out what your pb is.
> This new algo is Ok and the previous formula was definitely wrong (even 
> in 2.4 :( ). So it could be interesting to fix it also.
> 
> For this I start from basic math:
>     Dividend = divisor * quotient + reminder
> ie    D = d * q + r (D, d, q, r: being integers)
> 
> I can also split D in two 32bits words and write
>     D = D1 * 2^32 + D0
> 
> But I always have only one equation with two unknown var (q and r).
> 
> Is somebody knows where can I find the right solution?
> (or should I find it back in objdump from :
> uint32_t div64(uint64_t *n, uint32_t base)
> {
>         uint32_t rem;
> 
>         rem = *n % base;
>         *n = *n / base;
> 
>         return rem;
> })
> 
> Thanks in advance,
>     Joel
> 
> 
> Randolph Chung wrote:
> 
>>> does anyone want to look into fixing it, and/or writing an optimized
>>> version of that function for pa? :-) it needs to do basically this (but
>>> be standalone)
>>
>>
>>
>> Here's one way to do it, but maybe it can be optimized a bit. Any
>> suggestions before i send it upstream?
>>
>> randolph
>>
>> Index: lib/div64.c
>> ===================================================================
>> RCS file: /var/cvs/linux-2.6/lib/div64.c,v
>> retrieving revision 1.1
>> diff -u -p -r1.1 div64.c
>> --- lib/div64.c    29 Jul 2003 17:02:19 -0000    1.1
>> +++ lib/div64.c    23 Oct 2003 23:36:08 -0000
>> @@ -25,26 +25,28 @@
>>  
>>  uint32_t __div64_32(uint64_t *n, uint32_t base)
>>  {
>> -    uint32_t low, low2, high, rem;
>> +        uint64_t rem = *n;
>> +        uint64_t b = base;
>> +        uint64_t res = 0, d = 1;
>>  
>> -    low   = *n   & 0xffffffff;
>> -    high  = *n  >> 32;
>> -    rem   = high % (uint32_t)base;
>> -    high  = high / (uint32_t)base;
>> -    low2  = low >> 16;
>> -    low2 += rem << 16;
>> -    rem   = low2 % (uint32_t)base;
>> -    low2  = low2 / (uint32_t)base;
>> -    low   = low  & 0xffff;
>> -    low  += rem << 16;
>> -    rem   = low  % (uint32_t)base;
>> -    low   = low  / (uint32_t)base;
>> +        if (b > 0) {
>> +                while (b < rem) {
>> +                        b <<= 1;
>> +                        d <<= 1;
>> +                }
>> +        }
>> +        +        do {
>> +                if (rem >= b) {
>> +                        rem -= b;
>> +                        res += d;
>> +                }
>> +                b >>= 1;
>> +                d >>= 1;
>> +        } while (d);
>>  
>> -    *n = low +
>> -        ((uint64_t)low2 << 16) +
>> -        ((uint64_t)high << 32);
>> -
>> -    return rem;
>> +        *n = res;
>> +        return rem;
>>  }
>>  
>>  EXPORT_SYMBOL(__div64_32);
>>
> 
> 
