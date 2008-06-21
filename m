From: rubisher <rubisher@scarlet.be>
Subject: Re: Yet another inline asm worry: mtsp() macro (and may be other)?
Date: Sat, 21 Jun 2008 19:17:07 +0000
Message-ID: <485D53B3.1070806@scarlet.be>
References: <K2RLMV$5D6B8CC1910705073A720C99B9A05EBA@scarlet.be> <20080620171151.GU4392@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Joel Soete <soete.joel@scarlet.be>,
	grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	deller <deller@gmx.de>, kyle <kyle@mcmartin.ca>
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080620171151.GU4392@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Matthew Wilcox wrote:
> On Fri, Jun 20, 2008 at 03:01:43PM +0100, Joel Soete wrote:
>> Well I tried something:
>> @@ -103,10 +108,23 @@
>>  	cr;				\
>>  })
>>  
>> -#define mtsp(gr, cr) \
>> -	__asm__ __volatile__("mtsp %0,%1" \
>> -		: /* no outputs */ \
>> -		: "r" (gr), "i" (cr) : "memory")
>> +#define mtsp(lval, i_sr)					\
>> +{								\
>> +	if (lval) {						\
>> +		unsigned long reg = (unsigned long)(lval);	\
>> +		__asm__ __volatile__(				\
>> +			"mtsp %0, %%sr%1"			\
>> +			: /* no outputs */			\
>> +			: "r" (reg), "i" (i_sr)			\
>> +			: "memory");				\
>> +	} else {						\
>> +		__asm__ __volatile__(				\
>> +			"mtsp %%r0, %%sr%0"			\
>> +			: /* no outputs */			\
>> +			: "i" (i_sr)				\
>> +			: "memory");				\
>> +	};							\
>> +}
>>  
>> that does well the drill for ccio-dma driver but else where (memcpy or cache)
>> it looks worse then the original, so get rid of this idea.
> 
> Try this instead:
> 
> #define mtsp(space, cr)	{						\
> 	if (__builtin_constant_p(space) && (space == 0)) {		\
> 		__asm__ __volatile__("mtsp %%r0, %0" :			\
> 			/* no outputs */ : "i" (cr) : "memory");	\
> 	} else {							\
> 		__asm__ __volatile__("mtsp %0, %1" :			\
> 			/* no outputs */ : "r" (space), "i" (cr) :	\
> 				"memory");				\
> 	}								\
> }
> 
This does the same job for ccio-dma driver, no change for cache but for memory it's a bit mixed, I let you appreciate:
[snip]
00000000 <copy_to_user>:                                        00000000 <copy_to_user>:
    0:   6b c2 3f d9     stw rp,-14(sp)                             0:   6b c2 3f d9     stw rp,-14(sp)
    4:   34 1c 00 00     ldi 0,ret0                            |    4:   00 00 58 20     mtsp r0,sr1
    8:   00 1c 58 20     mtsp ret0,sr1                         |    8:   03 c0 08 bc     mfctl tr6,ret0
    c:   03 c0 08 b3     mfctl tr6,r19                         |    c:   0f 98 10 93     ldw c(ret0),r19
   10:   0e 78 10 9c     ldw c(r19),ret0                       |   10:   86 60 20 28     cmpib,= 0,r19,2c <copy_to_user+0x2c>
   14:   93 80 20 00     cmpiclr,= 0,ret0,r0                   |   14:   34 1c 00 00     ldi 0,ret0
   18:   00 00 c4 bc     mfsp sr3,ret0                             18:   00 00 c4 bc     mfsp sr3,ret0
   1c:   00 1c 98 20     mtsp ret0,sr2                             1c:   00 1c 98 20     mtsp ret0,sr2
   20:   4b c2 3f d9     ldw -14(sp),rp                            20:   4b c2 3f d9     ldw -14(sp),rp
   24:   e8 00 00 00     b,l 2c <copy_to_user+0x2c>,r0             24:   e8 00 00 00     b,l 2c <copy_to_user+0x2c>,r0
   28:   08 00 02 40     nop                                       28:   08 00 02 40     nop
   2c:   08 00 02 40     nop                                   |   2c:   00 1c 98 20     mtsp ret0,sr2
                                                               >   30:   4b c2 3f d9     ldw -14(sp),rp
                                                               >   34:   e8 00 00 00     b,l 3c <copy_to_user+0x3c>,r0
                                                               >   38:   08 00 02 40     nop
                                                               >   3c:   08 00 02 40     nop
[snip]
00000000 <copy_from_user>:                                      00000000 <copy_from_user>:
    0:   6b c2 3f d9     stw rp,-14(sp)                             0:   6b c2 3f d9     stw rp,-14(sp)
    4:   03 c0 08 bc     mfctl tr6,ret0                             4:   03 c0 08 bc     mfctl tr6,ret0
    8:   0f 98 10 93     ldw c(ret0),r19                            8:   0f 98 10 93     ldw c(ret0),r19
    c:   86 60 20 38     cmpib,= 0,r19,30 <copy_from_user+0x30 |    c:   86 60 20 30     cmpib,= 0,r19,2c <copy_from_user+0x2c
   10:   34 1c 00 00     ldi 0,ret0                                10:   34 1c 00 00     ldi 0,ret0
   14:   00 00 c4 bc     mfsp sr3,ret0                             14:   00 00 c4 bc     mfsp sr3,ret0
   18:   00 1c 58 20     mtsp ret0,sr1                             18:   00 1c 58 20     mtsp ret0,sr1
   1c:   34 1c 00 00     ldi 0,ret0                            |   1c:   00 00 98 20     mtsp r0,sr2
   20:   00 1c 98 20     mtsp ret0,sr2                         |   20:   4b c2 3f d9     ldw -14(sp),rp
   24:   4b c2 3f d9     ldw -14(sp),rp                        |   24:   e8 00 00 00     b,l 2c <copy_from_user+0x2c>,r0
   28:   e8 00 00 00     b,l 30 <copy_from_user+0x30>,r0       |   28:   08 00 02 40     nop
   2c:   08 00 02 40     nop                                   |   2c:   00 1c 58 20     mtsp ret0,sr1
   30:   00 1c 58 20     mtsp ret0,sr1                         |   30:   00 00 98 20     mtsp r0,sr2
   34:   34 1c 00 00     ldi 0,ret0                            |   34:   4b c2 3f d9     ldw -14(sp),rp
   38:   00 1c 98 20     mtsp ret0,sr2                         |   38:   e8 00 00 00     b,l 40 <copy_from_user+0x40>,r0
   3c:   4b c2 3f d9     ldw -14(sp),rp                        |   3c:   08 00 02 40     nop
   40:   e8 00 00 00     b,l 48 <copy_from_user+0x48>,r0       |   40:   08 00 02 40     nop
   44:   08 00 02 40     nop                                   <
   48:   08 00 02 40     nop                                   <
Disassembly of section .text.copy_in_user:                      Disassembly of section .text.copy_in_user:
[snip]

00000000 <memcpy>:                                              00000000 <memcpy>:
    0:   6b c2 3f d9     stw rp,-14(sp)                             0:   6b c2 3f d9     stw rp,-14(sp)
    4:   34 1c 00 00     ldi 0,ret0                            |    4:   6f c4 00 80     stw,ma r4,40(sp)
    8:   6f c4 00 80     stw,ma r4,40(sp)                      |    8:   08 1a 02 44     copy r26,r4
    c:   08 1a 02 44     copy r26,r4                           |    c:   00 00 58 20     mtsp r0,sr1
   10:   00 1c 58 20     mtsp ret0,sr1                         |   10:   00 00 98 20     mtsp r0,sr2
   14:   34 13 00 00     ldi 0,r19                             |   14:   e8 40 00 00     b,l 1c <memcpy+0x1c>,rp
   18:   00 13 98 20     mtsp r19,sr2                          |   18:   08 00 02 40     nop
   1c:   e8 40 00 00     b,l 24 <memcpy+0x24>,rp               |   1c:   4b c2 3f 59     ldw -54(sp),rp
   20:   08 00 02 40     nop                                   |   20:   08 04 02 5c     copy r4,ret0
   24:   4b c2 3f 59     ldw -54(sp),rp                        |   24:   e8 40 c0 00     bv r0(rp)
   28:   08 04 02 5c     copy r4,ret0                          |   28:   4f c4 3f 81     ldw,mb -40(sp),r4
   2c:   e8 40 c0 00     bv r0(rp)                             <
   30:   4f c4 3f 81     ldw,mb -40(sp),r4                     <
[snip]

Anyway, it's far well better than mine.

Tx,
	J.


