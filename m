From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Do not hardcode PAGE_SIZE dependend values in
 assembler
Date: Mon, 16 Mar 2015 21:23:15 +0100
Message-ID: <55073BB3.1090109@gmx.de>
References: <20150316202117.GA3141@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20150316202117.GA3141@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

ignore this patch - it's wrong.

Helge

On 16.03.2015 21:21, Helge Deller wrote:
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
> index 2ab16bb..c9bbf88 100644
> --- a/arch/parisc/kernel/entry.S
> +++ b/arch/parisc/kernel/entry.S
> @@ -640,9 +640,9 @@
>   	 * Check "subtle" note in pacache.S re: r23/r26.
>   	 */
>   #ifdef CONFIG_64BIT
> -	extrd,u,*=	\va,41,1,%r0
> +	extrd,u,*=	\va,63-PAGE_SHIFT,1,%r0
>   #else
> -	extrw,u,=	\va,9,1,%r0
> +	extrw,u,=	\va,31-PAGE_SHIFT,1,%r0
>   #endif
>   	or,COND(tr)	%r23,%r0,\pte
>   	or		%r26,%r0,\pte
>

