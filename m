From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix NATIVE set up in build
Date: Tue, 7 May 2013 19:24:04 -0400
Message-ID: <BLU0-SMTP74F2A5D74A5FB368D237A797BA0@phx.gbl>
References: <1367686258-28525-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1367686258-28525-1-git-send-email-vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch breaks builds on current Debian systems that want compiler  
prefixes
like hppa64-linux-gnu-", "hppa-linux-gnu-" or no prefix for native 32- 
bit.  The NATIVE
match previous failed and we got the correct FSF prefix.

Dave

On 4-May-13, at 12:50 PM, Mike Frysinger wrote:

> The ifeq operator does not accept globs, so this little bit of code  
> will
> never match (unless uname literally prints out "parsic*").  Rewrite to
> use a pattern matching operator so that NATIVE is set to 1 on parisc.
>
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> arch/parisc/Makefile | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index 113e282..2f967cc 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -24,9 +24,7 @@ CHECKFLAGS	+= -D__hppa__=1
> LIBGCC		= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
>
> MACHINE		:= $(shell uname -m)
> -ifeq ($(MACHINE),parisc*)
> -NATIVE		:= 1
> -endif
> +NATIVE		:= $(if $(filter parisc%,$(MACHINE)),1,0)
>
> ifdef CONFIG_64BIT
> UTS_MACHINE	:= parisc64
> -- 
> 1.8.2.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
John David Anglin	dave.anglin@bell.net



