From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was:
	[parisc-linux]	clear user page test]
Date: Mon, 27 Dec 2004 00:36:54 -0700
Message-ID: <20041227073654.GI29492@colo.lackof.org>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418A80E8000124B5@mail-6-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Dec 21, 2004 at 02:37:47PM +0100, Joel Soete wrote:
> Hello all,

Joel,
I trim your postings to only include the parts I need to respond to.
Could you please do the same?

I hate having to scroll down pages of stuff to get to your comment.
That's probably why no one else responded.


> As promised, here is a cleaner (?)  patch:
> --- arch/parisc/kernel/pacache.S.Orig	2004-12-20 08:28:23.000000000 +0100
> +++ arch/parisc/kernel/pacache.S	2004-12-20 14:49:35.000000000 +0100
> @@ -295,7 +295,52 @@
>  	.callinfo NO_CALLS
>  	.entry
> 
> -	ldi		64, %r1
> +	pdtlb		0(%r25)
> +	pdtlb		0(%r26)

Sorry - I missed why the pdtlb needs to be added.
Could you explain?

Won't the pdtlb guarantee at least one trap per page copied?
I would hope we guarantee the D-TLB is "clean" when calling this function.

> +#ifdef __LP64__
> +
> +	ldi		32, %r1			/* PAGE_SIZE/128 == 32 */
> +
> +1:	ldd		0(%r25), %r19
> +	ldd		8(%r25), %r20
> +	ldd		16(%r25), %r21
> +	ldd		24(%r25), %r22
> +	std		%r19, 0(%r26)
> +	std		%r20, 8(%r26)
> +	std		%r21, 16(%r26)
> +	std		%r22, 24(%r26)

This looks good.

PA2.0 can retire 2 loads and 2 stores per cycle IFF there are no dependencies.
can be executed in one cycle.

That means we want something like this:

+1:	ldd		0(%r25), %r19
+	ldd		8(%r25), %r20
+	ldd		16(%r25), %r21
+	ldd		24(%r25), %r22
+	std		%r19, 0(%r26)
+	std		%r20, 8(%r26)
+	ldd		32(%r25), %r19
+	ldd		40(%r25), %r20
+	std		%r21, 16(%r26)
+	std		%r22, 24(%r26)
+	ldd		48(%r25), %r21
+	ldd		56(%r25), %r22
+	std		%r19, 32(%r26)
+	std		%r20, 40(%r26)
...
+	ldd		112(%r25), %r21
+	ldd		120(%r25), %r22
+	std		%r19, 96(%r26)
+	std		%r20, 104(%r26)
+	ldo		128(%r25), %r25
+	std		%r21, 112(%r26)
+	std		%r22, 120(%r26)
+	ADDIB>		-1, %r1, 1b
+	ldo		128(%r26), %r26
...

[ Note that I've moved the "ldo" around as well!]

More distance between the "ldd %rX" and the corresponding
"std %rX" is generally a good thing.
This routine could use more registers in the loop to get more "distance".

It costs us 1 cycle to save two registers on the stack.
Once the data is in L1-Cache, IFF the CPU needs more than one cycle
to retire successive loads, we gain several cycles assuming additional
register pairs are used multiply times per loop.
Anyone know how many cycles ldd from L1 takes?

I expect gcc encodes those times so it can schedule stuff optimally.
But I've forgotten where to find the PA2.0 scheduling magic.
It might be worth just letting gcc unroll the loop for us since
SR0 (kernel) is implied in all the ldd/std instructions.


> -	extrd,u		%r26,56,32, %r26		/* convert phys addr to tlb insert format */
> -	extrd,u		%r23,56,32, %r23		/* convert phys addr to tlb insert format */
> -	depd		%r24,63,22, %r28		/* Form aliased virtual address 'to' */
> +	extrd,u		%r26,56,32, %r26	/* convert phys addr to tlb insert format */
> +	extrd,u		%r23,56,32, %r23	/* convert phys addr to tlb insert format */
> +	depd		%r24,63,22, %r28	/* Form aliased virtual address 'to' */

Please post white space changes as seperate patches.


> the loop used:
> export i=0 ; while [ $i -le 10 ] ; do make clean ; make oldconfig ; readprofile

3 to 5 iterations are sufficient for me (since they take so long).

> -r ; time make vmlinux ; readprofile >> /var/logs/prof.doc; i=$((i+1)) ;
> done 2>&1 | tee /var/logs/k-loop1
> 
> * with original 2.6.10-rc3-pa8 running kernel
> # grep "^user" k-loop1

Please use "^sys" or "^real".
"user" time is only number that should NOT change with this patch.

> # grep copy_user_page_asm prof.doc
>   3254 copy_user_page_asm                        20.3375
>   3273 copy_user_page_asm                        20.4563
...

> * with 2.6.10-rc3-pa8 + patch and without "pdtlb		0(%r2[56])"
...
> # grep copy_user_page_asm prof.doc
>   1818 copy_user_page_asm                        11.3625
>   1763 copy_user_page_asm                        11.0188
>   1785 copy_user_page_asm                        11.1562
...

This is clearly goodness.

> * with 2.6.10-rc3-pa8 + full patch
...
> # grep copy_user_page_asm prof.doc
>   1894 copy_user_page_asm                        11.8375
>   1972 copy_user_page_asm                        12.3250
>   1975 copy_user_page_asm                        12.3438
>   1880 copy_user_page_asm                        11.7500
>   1923 copy_user_page_asm                        12.0188

I expect extra traps and/or time spent ordering the TLB operations.
pdtlb is costing about 8% performance in this routine.
I definitely want a clear explanation before adding this.

> So the main interest is to reduce the number of clock ticks :-)

Yes. :^)


thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
