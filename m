From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: keep track of last shared mmap'ed address
Date: Sun, 30 Oct 2016 18:16:12 -0400
Message-ID: <9CFF55D6-4E90-4FB4-B085-348FF2B4E0C2@bell.net>
References: <20161027183929.GA10225@ls3530.box>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20161027183929.GA10225@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-10-27, at 2:39 PM, Helge Deller wrote:

> diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
> index 0a393a0..c04d946 100644
> --- a/arch/parisc/kernel/sys_parisc.c
> +++ b/arch/parisc/kernel/sys_parisc.c
> @@ -36,12 +36,11 @@
> #include <linux/personality.h>
> #include <linux/random.h>
> 
> -/* we construct an artificial offset for the mapping based on the physical
> - * address of the kernel mapping variable */
> +/* keep track of the last mapping address offset in the private_data field */
> #define GET_LAST_MMAP(filp)		\
> -	(filp ? ((unsigned long) filp->f_mapping) >> 8 : 0UL)
> +	(filp && (file_count(filp) > 0) ? (unsigned long) filp->private_data : 0UL)
> #define SET_LAST_MMAP(filp, val)	\
> -	 { /* nothing */ }
> +	{ if (filp) filp->private_data = (void *) (val); }

In my testing, this causes hpmc's doing serial io.

Dave
--
John David Anglin	dave.anglin@bell.net



