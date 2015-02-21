From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Sat, 21 Feb 2015 15:31:00 -0500
Message-ID: <BLU436-SMTP15952414B35EC498F0793B1972B0@phx.gbl>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi> <BLU0-SMTP47556722282C83F98582B797C50@phx.gbl> <201312191619.05005.vapier@gentoo.org> <5313A12E.7010307@gmx.de> <20140401182627.GA3285@drone.musicnaut.iki.fi> <533B0A57.2060700@gmx.de> <CAE2sS1jZTzccFy_uWri++cgVz+AYVfY0_aFqXFxnJXZV3d1a0g@mail.gmail.com> <533C7C9A.5080703@gmx.de> <BLU0-SMTP84F101069B44354FC1070C976D0@phx.gbl> <533DB961.9010607@gmx.de> <BLU0-SMTP7204937E7AF88D8736354E976C0@phx.gbl> <533DC3E8.5010701@gmx.de> <CAE2sS1iY6H3fnEJDHr6oPGywwGYmM_2gt2r_p+DUz+v0Rf2szg@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset="us-ascii"
Cc: Helge Deller <deller@gmx.de>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Mike Frysinger <vapier@gentoo.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1iY6H3fnEJDHr6oPGywwGYmM_2gt2r_p+DUz+v0Rf2szg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-02-20, at 4:36 PM, Carlos O'Donell wrote:

> On Thu, Apr 3, 2014 at 4:26 PM, Helge Deller <deller@gmx.de> wrote:
>> In current eglibc it's set to 0x00400000
>> That's what my eglibc-patch changes...
>> I'm currently building a eglibc on hpviz with SHMLBA set to 4096 (__getpagesize()).
> 
> Anyone object to me fixing this upstream by making SHMLBA match the kernel?
> 
> I plan to use a fixed value of 4096, since I never expect hppa
> userspace to have to care (even if the kernel uses superpages).

We currently use (__getpagesize ()) in Debian and this seems to be a common definition.
Is there a performance advantage in using 4096?

> 
> Please correct me if I'm wrong.


At one time, we thought this value needed to be 4 MB.  Helge was working on improving the mmap
allocation scheme but this work stalled after some improvement.  I can't remember the issues and how
they relate to SHMLBA.

Dave
--
John David Anglin	dave.anglin@bell.net



