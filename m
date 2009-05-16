From: Randolph Chung <randolph@tausq.org>
Subject: Re: [PATCH] misplaced parenthesis?
Date: Sat, 16 May 2009 12:14:13 +0800
Message-ID: <4A0E3D95.5090404@tausq.org>
References: <4A0DC131.8020606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
To: Roel Kluin <roel.kluin@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A0DC131.8020606@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a bit confusingly written, but your patch does not appear to be 
correct.

== has higher precedence than &, so you are basically changing it to:
if (likely(t1 & 1))

it really should be

-	if (likely(t1 & (sizeof(unsigned int)-1)) == 0) {
+	if (likely((t1 & (sizeof(unsigned int)-1)) == 0)) {

randolph


Roel Kluin wrote:
> Fix misplaced parenthesis.
>
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> I think this is what was intended? Note that this patch may affect
> profiling.
>
> diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
> index bbda909..30207b0 100644
> --- a/arch/parisc/lib/memcpy.c
> +++ b/arch/parisc/lib/memcpy.c
> @@ -405,7 +405,7 @@ byte_copy:
>  
>  unaligned_copy:
>  	/* possibly we are aligned on a word, but not on a double... */
> -	if (likely(t1 & (sizeof(unsigned int)-1)) == 0) {
> +	if (likely(t1 & (sizeof(unsigned int)-1) == 0)) {
>  		t2 = src & (sizeof(unsigned int) - 1);
>  
>  		if (unlikely(t2 != 0)) {
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   

