From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was: [parisc-linux]
	clear user page test]
Date: Mon, 27 Dec 2004 10:40:49 +0000
Message-ID: <41CFE6B1.6010707@tiscali.be>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
	<20041227073654.GI29492@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041227073654.GI29492@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Grant Grundler wrote:
> On Tue, Dec 21, 2004 at 02:37:47PM +0100, Joel Soete wrote:
> 
>>Hello all,
> 
> 
> Joel,
> I trim your postings to only include the parts I need to respond to.
> Could you please do the same?
> 
Apologies, I would just like to be as detailed as possible for the others who didn't follow our previous mail exchange before :-(

> I hate having to scroll down pages of stuff to get to your comment.
> That's probably why no one else responded.
> 
I understand that make stuff too noisy

> 
> 
>>As promised, here is a cleaner (?)  patch:
>>--- arch/parisc/kernel/pacache.S.Orig	2004-12-20 08:28:23.000000000 +0100
>>+++ arch/parisc/kernel/pacache.S	2004-12-20 14:49:35.000000000 +0100
>>@@ -295,7 +295,52 @@
>> 	.callinfo NO_CALLS
>> 	.entry
>>
>>-	ldi		64, %r1
>>+	pdtlb		0(%r25)
>>+	pdtlb		0(%r26)
> 
> 
> Sorry - I missed why the pdtlb needs to be added.
> Could you explain?

Sorry no, that was a question of mine:
the previous inplementation of copy_user_page_asm() (between #if 0 ... #endif below in the code) started with:
[...]
         /* Purge any old translations */

         pdtlb           0(%r28)
         pdtlb           0(%r29)

         ldi             64, %r1
[...]

and we do the same in __clear_user_page_asm()
[...]
         /* Purge any old translation */

         pdtlb           0(%r28)

[...]
> 
> Won't the pdtlb guarantee at least one trap per page copied?
> I would hope we guarantee the D-TLB is "clean" when calling this function.
> 
Should be why it was removed but as far as I didn't find any explanation (that's obvious: that's nearly impossible to explain all 
details of implementation ;-)

> 
>>+#ifdef __LP64__
>>+
>>+	ldi		32, %r1			/* PAGE_SIZE/128 == 32 */
>>+
>>+1:	ldd		0(%r25), %r19
>>+	ldd		8(%r25), %r20
>>+	ldd		16(%r25), %r21
>>+	ldd		24(%r25), %r22
>>+	std		%r19, 0(%r26)
>>+	std		%r20, 8(%r26)
[...]
> 
> This looks good.
> 
> PA2.0 can retire 2 loads and 2 stores per cycle IFF there are no dependencies.
> can be executed in one cycle.
> 
> That means we want something like this:
> 
> +1:	ldd		0(%r25), %r19
> +	ldd		8(%r25), %r20
> +	ldd		16(%r25), %r21
> +	ldd		24(%r25), %r22
> +	std		%r19, 0(%r26)
> +	std		%r20, 8(%r26)
> +	ldd		32(%r25), %r19
> +	ldd		40(%r25), %r20
[...]
> +	ldo		128(%r25), %r25
> +	std		%r21, 112(%r26)
> +	std		%r22, 120(%r26)
> +	ADDIB>		-1, %r1, 1b
> +	ldo		128(%r26), %r26
> ...
> 
> [ Note that I've moved the "ldo" around as well!]
> 
> More distance between the "ldd %rX" and the corresponding
> "std %rX" is generally a good thing.
> This routine could use more registers in the loop to get more "distance".
Ok that was another possibility: I trust that we can use r23, r24 as far as:
     r23-r26: these are arg3-arg0, i.e. you can use them if you
         don't care about the values that were passed in anymore.

but not more of r3-r18 because:
r3-r18,r27,r30 need to be saved and restored. r3-r18 are just
     general purpose registers. [...]

> 
> It costs us 1 cycle to save two registers on the stack.
> Once the data is in L1-Cache, IFF the CPU needs more than one cycle
> to retire successive loads, we gain several cycles assuming additional
> register pairs are used multiply times per loop.
Well that (cache management) is still far beyond my skill :-(

[...]
>>-	extrd,u		%r26,56,32, %r26		/* convert phys addr to tlb insert format */
...
>>+	extrd,u		%r26,56,32, %r26	/* convert phys addr to tlb insert format */
> 
> Please post white space changes as seperate patches.
> 
oops my bad (apologies)
> 
[...]
>>* with original 2.6.10-rc3-pa8 running kernel
>># grep "^user" k-loop1
> 
> Please use "^sys" or "^real".
> "user" time is only number that should NOT change with this patch.
> 
I will try to recover those info
> 
[...]
> 
>>So the main interest is to reduce the number of clock ticks :-)
> 
> 
> Yes. :^)
> 
Thanks for your patience and relevant remarks, I will come back we more material soon ;-)

Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
