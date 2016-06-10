From: "George Spelvin" <linux@sciencehorizons.net>
Subject: Re: [PATCH v4] parisc: add <asm/hash.h>
Date: 9 Jun 2016 23:23:18 -0400
Message-ID: <20160610032318.32173.qmail@ns.sciencehorizons.net>
References: <5759C957.5090607@gmx.de>
Cc: linux-parisc@vger.kernel.org
To: deller@gmx.de, linux@sciencehorizons.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5759C957.5090607@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge Deller wrote:
> Minor issue:
> This line (ARCH_NO_COHERENT) is not yet in Linus' tree.
> I assume you diff'ed against -next or something?
> Maybe you move the "select HAVE_ARCH_HASH" one or two lines up, or
> wait until the other patch went upstream?

No, I'm working against v4.6, and the line is there.
Line 34 of "git show v4.6:arch/parisc/Kconfig".

You pulled my git tree, so you can see what I'm working on top of.

>> +	a += c << 3;		_ASSIGN(b, b << 7+31, "X" (c), "X" (d));
>
> This line produces compiler warnings:

Thanks for catching that.

> So, please add
> Acked-by: Helge Deller <deller@gmx.de>

Done and pushed out to git://ftp.sciencehorizons.net/linux.git hash

Would you like to take it via the PA-RISC tree?  I don't think a
"performance fix" like this is 4.7-rc material (I think it's low-risk,
so I don't object, but I think Linus would) so it has to wait for 4.8
either way.

> THANKS!

You're very welcome.  I really wanted to improve it for *every* platform,
so thank you for your help.  I still haven't heard from the Microblaze
guys.

Getting it down to 10 cycles was a fun micro-optimization challenge.
I'm just annoyed I wasted to much time optimizing for a misunderstanding
of the PA-8800 pipeline.  The large print ("QUAD-ISSUE!") giveth, and
the small print taketh waway.
