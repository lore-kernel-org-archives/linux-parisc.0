From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PARISC][PATCH] fix trivial section name warnings
Date: Thu, 15 May 2008 10:53:39 -0400
Message-ID: <20080515145339.GL12850@phobos.i.cabal.ca>
References: <200805022202.48586.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200805022202.48586.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, May 02, 2008 at 10:02:48PM +0200, Helge Deller wrote:
> --- a/arch/parisc/kernel/perf_asm.S
> +++ b/arch/parisc/kernel/perf_asm.S
> @@ -41,7 +41,7 @@
>  ; The coprocessor only needs to be enabled when
>  ; starting/stopping the coprocessor with the pmenb/pmdis.
>  ;
> -	.text
> +	__HEAD
>  

You didn't build test this. :(
