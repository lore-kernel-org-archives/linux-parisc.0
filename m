From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: What's up of this if (likely()) bracing?
Date: Fri, 4 Jan 2008 19:13:58 -0700
Message-ID: <20080105021358.GB16725@colo.lackof.org>
References: <JU2GA0$1DD13473BA78D945C68E7311CB765D2D@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <JU2GA0$1DD13473BA78D945C68E7311CB765D2D@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jan 03, 2008 at 12:37:12PM +0100, rubisher wrote:
> Hello *,
> 
> I am not sure to have perfectly understand all subtle details of likely() &
> unlikely() macros but I think there's some brace at the bad place in following
> chunk:
> --- arch/parisc/lib/memcpy.c.Orig	2007-10-18 15:27:30.000000000 +0000
> +++ arch/parisc/lib/memcpy.c	2008-01-03 10:17:52.000000000 +0000
> @@ -299,7 +299,7 @@
>  
>  	/* Check alignment */
>  	t1 = (src ^ dst);
> -	if (unlikely(t1 & (sizeof(double)-1)))
> +	if (unlikely(t1 & (sizeof(double) - 1)))

Please submit separate patches for the white space clean up.

>  		goto unaligned_copy;
>  
>  	/* src and dst have same alignment. */
> @@ -405,7 +405,7 @@
>  
>  unaligned_copy:
>  	/* possibly we are aligned on a word, but not on a double... */
> -	if (likely(t1 & (sizeof(unsigned int)-1)) == 0) {
> +	if (likely((t1 & (sizeof(unsigned int) - 1)) == 0)) {
>  		t2 = src & (sizeof(unsigned int) - 1);
>  
>  		if (unlikely(t2 != 0)) {
> === <> ===
> First hunk is just to add some whitespace?
> 
> Otoh for the second hunk, my reading of the original stuff was that:
> > likely(t1 & (sizeof(unsigned int)-1)) 
> i.e. likely's macro embraced only "t1 & (sizeof(unsigned int)-1)" in place of
> "(t1 & (sizeof(unsigned int)-1)) == 0".
> 
> What's your opinion?

I think you are right. normally likely() and unlikely() are intended
to be used with boolean expressions and that's obviously not the case.

Please resubmit this change separately and add "signed-off-by" lines
so kyle can include this in the next round of parisc patches.

cheers,
grant


> 
> Tia,
>     r.
> ---
> Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
> http://www.scarlet.be/
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
