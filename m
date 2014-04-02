From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Wed, 2 Apr 2014 15:09:17 -0400
Message-ID: <CAE2sS1jZTzccFy_uWri++cgVz+AYVfY0_aFqXFxnJXZV3d1a0g@mail.gmail.com>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>
	<BLU0-SMTP47556722282C83F98582B797C50@phx.gbl>
	<201312191619.05005.vapier@gentoo.org>
	<5313A12E.7010307@gmx.de>
	<20140401182627.GA3285@drone.musicnaut.iki.fi>
	<533B0A57.2060700@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Mike Frysinger <vapier@gentoo.org>,
	John David Anglin <dave.anglin@bell.net>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <533B0A57.2060700@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Apr 1, 2014 at 2:49 PM, Helge Deller <deller@gmx.de> wrote:
> Yes.
> But it's not a kernel bug. Kernel 3.14 and previous stable releases are OK.
>
> I did proposed a glibc change in my previous mail (http://www.spinics.net/lists/linux-parisc/msg05384.html).
> Debian bug report with patch is here:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=741243
>
> And this is what I proposed:
>
> A trivial FIX/workaround would be to change libc-mmap.h like this:
> #ifdef __hppa__
> #define MAP_FIXED_ALIGNMENT 4096
> #else
> #define MAP_FIXED_ALIGNMENT SHMLBA
> #endif
>
> That works because then the new aligned address is then the same as the original
> (the mmap call returns 4k aligned addresses, so it stays unchanged), but I'm not sure
> if such a patch would be acceptable.
> Do you have another idea/proposal?

The responsibility for fixing this falls to me, but I've been busy.

If someone wants to propose a patch for glibc please email
libc-alpha@sourceware.org, TO me, and I'll review and commit the patch
granted that you show you've done the appropriate testing.

Otherwise I'll get to this at some point in the next couple of weeks :-(

Cheers,
Carlos.
