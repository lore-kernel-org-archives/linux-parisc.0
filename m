From: Helge Deller <deller@gmx.de>
Subject: Re: FIX MES in init.c
Date: Tue, 23 Sep 2014 22:48:31 +0200
Message-ID: <5421DC9F.2080504@gmx.de>
References: <54207769.2020105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: akpm@linux-foundation.org, himangi774@gmail.com,
	julia.lawall@lip6.fr, mgorman@suse.de,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: nick <yocto6@gmail.com>, jejb@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <54207769.2020105@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Nick,

On 09/22/2014 09:24 PM, nick wrote:
> Greetings James and Other Maintainers of the Parisc Architecture,
> I am wondering about two fix mes in init.c and how to fix them
> for being const declared into actual variables.
> ...
> 	/* FIXME: This is 'const' in order to trick the compiler
> 	   into not treating it as DP-relative data. */
> 	extern void * const linux_gateway_page;

The FIXME: is misleading. It should maybe better read "HINT:" or something like that.
Trivially it's basically just casting the symbol so that the compiler
will produce the correct code later on.
There is nothing you could try to "fix".

Helge
