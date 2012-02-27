From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: dont unconditionally override CROSS_COMPILE for
 64 bit.
Date: Mon, 27 Feb 2012 10:14:26 -0500
Message-ID: <4F4B9DD2.6000600@bell.net>
References: <1330298813-17262-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: JBottomley@parallels.com, jejb@parisc-linux.org, kyle@mcmartin.ca,
	deller@gmx.de, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1330298813-17262-1-git-send-email-paul.gortmaker@windriver.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2/26/2012 6:26 PM, Paul Gortmaker wrote:
> Using the 64 bit toolchains from kernel.org[1], one finds that
> you can't build the a500_defconfig, because the Makefile will
> stomp whatever value you have in your env. for CROSS_COMPILE.
>
> This shows up since the kernel.org toolchains for parisc-64
> do not have the "-gnu" prefix, and so you run into it always
> saying hppa64-linux-gnu-gcc not found, regardless of the fact
> you've not got "-gnu" put anywhere into CROSS_COMPILE.
>
> [1] ftp://ftp.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.5.2/
>
> Signed-off-by: Paul Gortmaker<paul.gortmaker@windriver.com>
>
> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index 55cca1d..cefff6d 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -31,7 +31,9 @@ ifdef CONFIG_64BIT
>   UTS_MACHINE	:= parisc64
>   CHECKFLAGS	+= -D__LP64__=1 -m64
>   WIDTH		:= 64
> -CROSS_COMPILE	:= hppa64-linux-gnu-
> +ifndef CROSS_COMPILE
> + CROSS_COMPILE	:= hppa64-linux-gnu-
> +endif
>   else # 32-bit
>   WIDTH		:=
>   endif
This change breaks native builds.  So, I assume CROSS_COMPILE must be
previously defined.

I couldn't figure out where it is defined.  CONFIG_CROSS_COMPILE in my
.config was an empty string  and CROSS_COMPILE was not defined in my
build environment.

The default toolchain prefix on Debian systems contains "gnu-".

Given that users can use CONFIG_CROSS_COMPILE or set CROSS_COMPILE
in their build env, maybe setting CROSS_COMPILE in the Makefile is a 
mistake.

Dave

-- 
John David Anglin    dave.anglin@bell.net

