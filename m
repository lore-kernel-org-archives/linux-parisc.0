From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: adjust L1_CACHE_BYTES to 128 bytes on PA8800 and PA8900
 CPUs
Date: Thu, 3 Sep 2015 20:45:02 +0200
Message-ID: <55E8952E.4080603@gmx.de>
References: <55E811AB.6070002@fau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org,
	Valentin Rothberg <valentinrothberg@gmail.com>,
	Paul Bolle <pebolle@tiscali.nl>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>
To: Andreas Ziegler <andreas.ziegler@fau.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <55E811AB.6070002@fau.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Andreas,

On 03.09.2015 11:23, Andreas Ziegler wrote:
> today's linux-next tree (next-20150903) contains commit 20f924902ff6
> ("parisc: adjust L1_CACHE_BYTES to 128 bytes on PA8800 and PA8900 CPUs")
> which you authored.
> 
> I noticed it because we[0] are running a daily analysis on all commits
> in linux-next as part of our research and our tools reported it.
> 
> In the patch, you create the following #if defined() structure in
> arch/parisc/include/asm/cache.h (lines 16 and following):
> 
>  #if defined(CONFIG_PA8X00)
>   ...
>  #elif defined(CONFIG_PA20)
>   ...
>  #else
>   ...
>  #endif
> 
> In Kconfig, CONFIG_PA20 is defined as the following
> (arch/parisc/Kconfig, line 163):
> 
> config PA20
>   def_bool y
>   depends on PA8X00
> 
> This means that CONFIG_PA20 can and will only be enabled if
> CONFIG_PA8X00 has already been enabled, which means that the contents of
> the "#elif defined(CONFIG_PA20)" block can never be reached: its
> condition is only evaluated if CONFIG_PA8X00 is disabled, but then
> CONFIG_PA20 can never be enabled either.

That's absolutely true.
I'll fix it with the next iteration of this patch.

Thanks,
Helge

