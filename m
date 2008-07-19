From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: 64bit kernel not booting with CONFIG_PRINTK_TIME=y
Date: Sat, 19 Jul 2008 17:54:59 -0400
Message-ID: <20080719215459.GA2550@phobos.i.cabal.ca>
References: <20080717190502.74c238d5@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080717190502.74c238d5@bleh.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 17, 2008 at 07:05:02PM +0200, Guy Martin wrote:
> 
> Recompiling with CONFIG_PRINTK_TIME=n makes it works straight away.
>

The problem is kernel/printk.c around line 731.

t = jiffies * (NSEC_PER_SEC / HZ);
do_div(t, 10000000000); is doing some badness (which is hard as hell to
debug since printk isn't working.)

It's doing some sort of bollocks when jiffies is between 9 and 10...

do_div being:

# define do_div(n,base) ({                                      \
        uint32_t __base = (base);                               \
        uint32_t __rem;                                         \
        __rem = ((uint64_t)(n)) % __base;                       \
        (n) = ((uint64_t)(n)) / __base;                         \
        __rem;                                                  \
 })

I'm *guessing* that umoddi3 or udivdi3 is doing an xmpyu or something,
which since this is probably before fpu init, is trapping, which is
trying to printk, which is recursively exploding.

regards, Kyle
