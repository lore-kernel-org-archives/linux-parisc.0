From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: increase kernel stack size to 32k
Date: Wed, 24 Apr 2013 09:33:50 +0200
Message-ID: <51778ADE.4010906@gmx.de>
References: <20130423202203.GA7287@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130423202203.GA7287@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04/23/2013 10:22 PM, Helge Deller wrote:
> commit e4e1e78facf7565cada909a69c7fb6415b6e7b83
> Author: Helge Deller <deller@gmx.de>
> Date:   Tue Apr 23 17:19:37 2013 +0200
> 
> parisc: increase kernel stack size to 32k
> 
> --- a/arch/parisc/include/asm/thread_info.h
> +++ b/arch/parisc/include/asm/thread_info.h
> -#define THREAD_SIZE_ORDER            2
> +#define THREAD_SIZE_ORDER            3	/* 32k stack */

I tested again, and it actually needs to be 64k stacks to not crash any longer.
So, the right temporary fix is:

> +#define THREAD_SIZE_ORDER            4	/* 64k stack */

Will send updated patch soon.

Helge
