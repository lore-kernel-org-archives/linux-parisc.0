From: Joel Soete <soete.joel@tiscali.be>
Subject: copy_user_page_asm suggested 64bit improvment [Was: [parisc-linux]
	clear user page test]
Date: Sun, 19 Dec 2004 20:27:26 +0000
Message-ID: <41C5E42E.9020602@tiscali.be>
References: <20041210190333.GC6653@colo.lackof.org>
	<418A811700010466@mail-8-bnl.mail.tiscali.sys>
	<20041213180758.GA8705@colo.lackof.org>
	<41C34C56.4080508@tiscali.be>
	<20041218073036.GA29003@colo.lackof.org>
	<41C440A3.6060708@tiscali.be> <41C4872D.6010705@tiscali.be>
	<41C4A35A.7010003@tiscali.be>
	<20041219042528.GB15282@colo.lackof.org>
	<41C5D761.4030004@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41C5D761.4030004@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello pa*,

Here is the last exchange I had with ggg:

Joel Soete wrote:
> 
> 
> Grant Grundler wrote:
> 
>> On Sat, Dec 18, 2004 at 09:38:34PM +0000, Joel Soete wrote:
>>
>>> interesting results:
>>> on b2k 64bit kernel:
>>> user    18m52.169s
>>> # including all those patch
>>> user    18m46.224s
>>> much better then clear_user_page_asm :-)
>>
>>
>>
>> "much better" is slightly overstated for a 0.62 % improvement.
>> That's a 7 second improvement over a 1132 second time frame.
>>
> Ok with the previous changes of clear_user_page_asm() the test case let 
> us expected some overall improvement (less ticks consumption :))
> but the final time results were absolutly desapointing istr:
> I test it on my b2k and here are the results:
> time make V=1 vmlinux (under 2.6.10-rc3-pa3-cvs)
> real 23m23.239s
> user 18m50.141s
> sys 4m21.203s
> 
> time make V=1 vmlinux (under 2.6.10-rc3-pa4-patch clear_user_...)
> real 23m18.552s
> user 18m50.534s
> sys 4m16.903s
> 
> :_(
> 
>> Sorry - I can't see what changed to bring about this improvement.
>> Can you point that out to me?
> 
> that make sense as you rejected previous patche, I will re-write it as 
> #ifdef __LP64__ so; NP
> 
>> I suspect there might be something else involved - perhaps this
>> difference is just within the noise of the test.
>>
> Ok I will make much more run ;-)
> 
>> BTW, I'll be on the road for the rest of the week...I won't be
>> able to pursue this until after I get back. If there are more
>> changes you want to the file, please post them to the list.
>>
> NP ;-) (have a nice travel and be carefull)
> 
> Thanks again for all,
>     Joel
> 
regarding this subject:
Joel Soete wrote:
 > Grant,
 >
 > still some more thought (and btw additional questions)
 >
 > As we choose to keep the same number of insn in this loop, I was looking
 > for something like:
 > #ifdef __LP64__
 > #define STR    std
 > #else
 > #define STR    stw
 > #endif
 >
 > but figure out that already exist and so why not using addtional
 > displacement #define and re-write loop like:
 > --- arch/parisc/kernel/pacache.S.New    2004-12-18 15:39:11.000000000 +0100
 > +++ arch/parisc/kernel/pacache.S    2004-12-18 19:19:53.862854692 +0100
 > @@ -288,6 +288,49 @@
 >
 >      .procend
 >
 > +#ifdef __LP64__
 > +    /* PREFETCH (Write) has not (yet) been proven to help here */
 > +/* #    define    PREFETCHW_OP    ldd        256(%0), %r0 */
 > +
 > +#define INCR    128    /* Loop's INCRement */
 > +#define LN    32    /* Loop's Number i.e. /* PAGE_SIZE/INCR == 32 */
 > +#define D0    0    /* 1st insn displacement */
 > +#define D1    8    /* 2d insn displacement */
 > +#define D2    16
 > +#define D3    24
 > +#define D4    32
 > +#define D5    40
 > +#define D6    48
 > +#define D7    56
 > +#define D8    64
 > +#define D9    72
 > +#define D10    80
 > +#define D11    88
 > +#define D12    96
 > +#define D13    104
 > +#define D14    112
 > +#define D15    120    /* last insn displacement */
 > +#else    /* !__LP64__ */
 > +#define INCR    64    /* Loop's INCRement */
 > +#define LN    64    /* Loop's Number i.e. /* PAGE_SIZE/INCR == 64 */
 > +#define D0    0    /* 1st insn displacement */
 > +#define D1    4    /* 2d insn displacement */
 > +#define D2    8
 > +#define D3    12
 > +#define D4    16
 > +#define D5    20
 > +#define D6    24
 > +#define D7    28
 > +#define D8    32
 > +#define D9    36
 > +#define D10    40
 > +#define D11    44
 > +#define D12    48
 > +#define D13    52
 > +#define D14    56
 > +#define D15    60    /* last insn displacement */
 > +#endif    /* __LP64__ */
 > +
 >      .export copy_user_page_asm,code
 >
 >  copy_user_page_asm:
 > @@ -502,55 +545,26 @@
 >
 >      pdtlb        0(%r28)
 >
 > -#ifdef __LP64__
 > -    ldi        32, %r1            /* PAGE_SIZE/128 == 32 */
 > -
 > -    /* PREFETCH (Write) has not (yet) been proven to help here */
 > -/* #define    PREFETCHW_OP    ldd        256(%0), %r0 */
 > +    ldi        LN, %r1            /* PAGE_SIZE/INCR == LN */
 >
 > -1:    std        %r0, 0(%r28)
 > -    std        %r0, 8(%r28)
 > -    std        %r0, 16(%r28)
 > -    std        %r0, 24(%r28)
 > -    std        %r0, 32(%r28)
 > -    std        %r0, 40(%r28)
 > -    std        %r0, 48(%r28)
 > -    std        %r0, 56(%r28)
 > -    std        %r0, 64(%r28)
 > -    std        %r0, 72(%r28)
 > -    std        %r0, 80(%r28)
 > -    std        %r0, 88(%r28)
 > -    std        %r0, 96(%r28)
 > -    std        %r0, 104(%r28)
 > -    std        %r0, 112(%r28)
 > -    std        %r0, 120(%r28)
 > +1:    STREG        %r0, D0(%r28)
 > +    STREG        %r0, D1(%r28)
 > +    STREG        %r0, D2(%r28)
 > +    STREG        %r0, D3(%r28)
 > +    STREG        %r0, D4(%r28)
 > +    STREG        %r0, D5(%r28)
 > +    STREG        %r0, D6(%r28)
 > +    STREG        %r0, D7(%r28)
 > +    STREG        %r0, D8(%r28)
 > +    STREG        %r0, D9(%r28)
 > +    STREG        %r0, D10(%r28)
 > +    STREG        %r0, D11(%r28)
 > +    STREG        %r0, D12(%r28)
 > +    STREG        %r0, D13(%r28)
 > +    STREG        %r0, D14(%r28)
 > +    STREG        %r0, D15(%r28)
 >      ADDIB>        -1, %r1, 1b
 > -    ldo        128(%r28), %r28
 > -
 > -#else    /* ! __LP64 */
 > -
 > -    ldi        64, %r1            /* PAGE_SIZE/64 == 64 */
 > -
 > -1:
 > -    stw        %r0, 0(%r28)
 > -    stw        %r0, 4(%r28)
 > -    stw        %r0, 8(%r28)
 > -    stw        %r0, 12(%r28)
 > -    stw        %r0, 16(%r28)
 > -    stw        %r0, 20(%r28)
 > -    stw        %r0, 24(%r28)
 > -    stw        %r0, 28(%r28)
 > -    stw        %r0, 32(%r28)
 > -    stw        %r0, 36(%r28)
 > -    stw        %r0, 40(%r28)
 > -    stw        %r0, 44(%r28)
 > -    stw        %r0, 48(%r28)
 > -    stw        %r0, 52(%r28)
 > -    stw        %r0, 56(%r28)
 > -    stw        %r0, 60(%r28)
 > -    ADDIB>        -1, %r1, 1b
 > -    ldo        64(%r28), %r28
 > -#endif    /* __LP64 */
 > +    ldo        INCR(%r28), %r28
 >
 >      bv        %r0(%r2)
 >      nop
 > =========> arch_parisc_kernel_pacache.S.diff4 <=========
this was definitely rejected:

Grant Grundler wrote:
 > On Sat, Dec 18, 2004 at 07:38:21PM +0000, Joel Soete wrote:
 >
 >>Grant,
 >>
 >>still some more thought (and btw additional questions)
 >>
 >>As we choose to keep the same number of insn in this loop, I was looking
 >>for something like:
 >>#ifdef __LP64__
 >>#define STR	std
 >>#else
 >>#define STR	stw
 >>#endif
 >>
 >>but figure out that already exist and so why not using addtional
 >>displacement #define and re-write loop like:
 >>--- arch/parisc/kernel/pacache.S.New	2004-12-18 15:39:11.000000000 +0100
 >>+++ arch/parisc/kernel/pacache.S	2004-12-18 19:19:53.862854692 +0100
 >>@@ -288,6 +288,49 @@
 >>
 >> 	.procend
 >>
 >>+#ifdef __LP64__
 >>+	/* PREFETCH (Write) has not (yet) been proven to help here */
 >>+/* #	define	PREFETCHW_OP	ldd		256(%0), %r0 */
 >>+
 >>+#define INCR	128	/* Loop's INCRement */
 >>+#define LN	32	/* Loop's Number i.e. /* PAGE_SIZE/INCR == 32 */
 >>+#define D0	0	/* 1st insn displacement */
 >>+#define D1	8	/* 2d insn displacement */
 >
 > ...
 >
 >
 > Sorry - definitely not. That just obscures whats going on.
 >
 > grant
 >

So will have to rewrite this one too
 >
 > mmm but copy_user_page_asm has the same structure and so why not using
 > the same schema:
 > --- arch/parisc/kernel/pacache.S.New1    2004-12-18 19:21:25.503229430
 > +0100
 > +++ arch/parisc/kernel/pacache.S    2004-12-18 19:43:33.184799992 +0100
 > @@ -338,7 +338,7 @@
 >      .callinfo NO_CALLS
 >      .entry
 >
 > -    ldi        64, %r1
 > +    ldi        LN, %r1
 >
 >      /*
 >       * This loop is optimized for PCXL/PCXL2 ldw/ldw and stw/stw
 > @@ -349,43 +349,41 @@
 >       * use ldd/std on a 32 bit kernel.
 >       */
 >
 > -
 > -1:
 > -    ldw        0(%r25), %r19
 > -    ldw        4(%r25), %r20
 > -    ldw        8(%r25), %r21
 > -    ldw        12(%r25), %r22
 > -    stw        %r19, 0(%r26)
 > -    stw        %r20, 4(%r26)
 > -    stw        %r21, 8(%r26)
 > -    stw        %r22, 12(%r26)
 > -    ldw        16(%r25), %r19
 > -    ldw        20(%r25), %r20
 > -    ldw        24(%r25), %r21
 > -    ldw        28(%r25), %r22
 > -    stw        %r19, 16(%r26)
 > -    stw        %r20, 20(%r26)
 > -    stw        %r21, 24(%r26)
 > -    stw        %r22, 28(%r26)
 > -    ldw        32(%r25), %r19
 > -    ldw        36(%r25), %r20
 > -    ldw        40(%r25), %r21
 > -    ldw        44(%r25), %r22
 > -    stw        %r19, 32(%r26)
 > -    stw        %r20, 36(%r26)
 > -    stw        %r21, 40(%r26)
 > -    stw        %r22, 44(%r26)
 > -    ldw        48(%r25), %r19
 > -    ldw        52(%r25), %r20
 > -    ldw        56(%r25), %r21
 > -    ldw        60(%r25), %r22
 > -    stw        %r19, 48(%r26)
 > -    stw        %r20, 52(%r26)
 > -    stw        %r21, 56(%r26)
 > -    stw        %r22, 60(%r26)
 > -    ldo        64(%r26), %r26
 > +1:    LDREG        D0(%r25), %r19
 > +    LDREG        D1(%r25), %r20
 > +    LDREG        D2(%r25), %r21
 > +    LDREG        D3(%r25), %r22
 > +    STREG        %r19, D0(%r26)
 > +    STREG        %r20, D1(%r26)
 > +    STREG        %r21, D2(%r26)
 > +    STREG        %r22, D3(%r26)
 > +    LDREG        D4(%r25), %r19
 > +    LDREG        D5(%r25), %r20
 > +    LDREG        D6(%r25), %r21
 > +    LDREG        D7(%r25), %r22
 > +    STREG        %r19, D4(%r26)
 > +    STREG        %r20, D5(%r26)
 > +    STREG        %r21, D6(%r26)
 > +    STREG        %r22, D7(%r26)
 > +    LDREG        D8(%r25), %r19
 > +    LDREG        D9(%r25), %r20
 > +    LDREG        D10(%r25), %r21
 > +    LDREG        D11(%r25), %r22
 > +    STREG        %r19, D8(%r26)
 > +    STREG        %r20, D9(%r26)
 > +    STREG        %r21, D10(%r26)
 > +    STREG        %r22, D11(%r26)
 > +    LDREG        D12(%r25), %r19
 > +    LDREG        D13(%r25), %r20
 > +    LDREG        D14(%r25), %r21
 > +    LDREG        D15(%r25), %r22
 > +    STREG        %r19, D12(%r26)
 > +    STREG        %r20, D13(%r26)
 > +    STREG        %r21, D14(%r26)
 > +    STREG        %r22, D15(%r26)
 > +    ldo        INCR(%r26), %r26
 >      ADDIB>        -1, %r1, 1b
 > -    ldo        64(%r25), %r25
 > +    ldo        INCR(%r25), %r25
 >
 >      bv        %r0(%r2)
 >      nop
 > =========> arch_parisc_kernel_pacache.S.diff5 <=========
 >
 > And finaly why didn't we have to purge related dtlb entries as we did
 > (see #if 0 below) and we do in clear_user_page_asm:
 > --- arch/parisc/kernel/pacache.S.New2    2004-12-18 19:44:46.684937345
 > +0100
 > +++ arch/parisc/kernel/pacache.S    2004-12-18 20:19:51.113544409 +0100
 > @@ -338,6 +338,11 @@
 >      .callinfo NO_CALLS
 >      .entry
 >
 > +    /* Purge any old translations */
 > +
 > +    pdtlb        0(%r25)
 > +    pdtlb        0(%r26)
 > +
 >      ldi        LN, %r1
 >
 >      /*
 > =========> arch_parisc_kernel_pacache.S.diff6 <=========
 >
But what's about this one?

What you opinion?

Thanks,
	Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
