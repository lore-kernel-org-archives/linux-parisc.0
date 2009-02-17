From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: autoselect 32/64bit compiler
Date: Wed, 18 Feb 2009 00:12:10 +0100
Message-ID: <499B444A.8070009@gmx.de>
References: <4999DEF6.4070300@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4999DEF6.4070300@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge Deller wrote:
> Automatically select correct 32- or 64bit (cross) compiler, independent if
> the kernel is built locally (e.g. 64bit kernel target on 32bit userspace) or 
> cross-compiled from another architecture. This patch allows one to just
> run 
> 	make ARCH=parisc	when run as cross compiler, or just
> 	make 			when run locally.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

Just ignore/drop this patch.
Although IMHO the idea is good, it breaks if people name their
(cross-)compiler "hppa-linux-gcc" instead of "hppa-linux-gnu-gcc".

Helge


> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index da6f669..9d0bd90 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -22,23 +22,12 @@ KBUILD_DEFCONFIG := default_defconfig
>  NM		= sh $(srctree)/arch/parisc/nm
>  CHECKFLAGS	+= -D__hppa__=1
>  
> -MACHINE		:= $(shell uname -m)
> -ifeq ($(MACHINE),parisc*)
> -NATIVE		:= 1
> -endif
> -
>  ifdef CONFIG_64BIT
>  UTS_MACHINE	:= parisc64
>  CHECKFLAGS	+= -D__LP64__=1 -m64
> -WIDTH		:= 64
>  CROSS_COMPILE	:= hppa64-linux-gnu-
>  else # 32-bit
> -WIDTH		:=
> -endif
> -
> -# attempt to help out folks who are cross-compiling
> -ifeq ($(NATIVE),1)
> -CROSS_COMPILE	:= hppa$(WIDTH)-linux-
> +CROSS_COMPILE	:= hppa-linux-gnu-
>  endif
>  
>  OBJCOPY_FLAGS =-O binary -R .note -R .comment -S
> 

