From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Sat, 21 Feb 2015 22:04:10 +0100
Message-ID: <54E8F2CA.6060904@gmx.de>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi> <BLU0-SMTP47556722282C83F98582B797C50@phx.gbl> <201312191619.05005.vapier@gentoo.org> <5313A12E.7010307@gmx.de> <20140401182627.GA3285@drone.musicnaut.iki.fi> <533B0A57.2060700@gmx.de> <CAE2sS1jZTzccFy_uWri++cgVz+AYVfY0_aFqXFxnJXZV3d1a0g@mail.gmail.com> <533C7C9A.5080703@gmx.de> <BLU0-SMTP84F101069B44354FC1070C976D0@phx.gbl> <533DB961.9010607@gmx.de> <BLU0-SMTP7204937E7AF88D8736354E976C0@phx.gbl> <533DC3E8.5010701@gmx.de> <CAE2sS1iY6H3fnEJDHr6oPGywwGYmM_2gt2r_p+DUz+v0Rf2szg@mail.gmail.com> <BLU436-SMTP15952414B35EC498F0793B1972B0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Mike Frysinger <vapier@gentoo.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>,
	Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP15952414B35EC498F0793B1972B0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 21.02.2015 21:31, John David Anglin wrote:
> On 2015-02-20, at 4:36 PM, Carlos O'Donell wrote:
>
>> On Thu, Apr 3, 2014 at 4:26 PM, Helge Deller <deller@gmx.de> wrote:
>>> In current eglibc it's set to 0x00400000
>>> That's what my eglibc-patch changes...
>>> I'm currently building a eglibc on hpviz with SHMLBA set to 4096 (__getpagesize()).
>>
>> Anyone object to me fixing this upstream by making SHMLBA match the kernel?

I think to remember that that would be best.
Didn't I pushed this (SHMLBA=4k) to eglibc?

>> I plan to use a fixed value of 4096, since I never expect hppa
>> userspace to have to care (even if the kernel uses superpages).

Yes.

> We currently use (__getpagesize ()) in Debian and this seems to be a common definition.
> Is there a performance advantage in using 4096?

Yes, we have:
Index: eglibc-2.18/ports/sysdeps/unix/sysv/linux/hppa/bits/shm.h
===================================================================
--- eglibc-2.18.orig/ports/sysdeps/unix/sysv/linux/hppa/bits/shm.h      2013-01-09 19:28:48.000000000 -0500
+++ eglibc-2.18/ports/sysdeps/unix/sysv/linux/hppa/bits/shm.h   2014-04-09 21:08:06.516202583 -0400
@@ -36,7 +36,7 @@
  #define SHM_UNLOCK     12              /* unlock segment (root only) */

  /* Segment low boundary address multiple.  */
-#define SHMLBA 0x00400000              /* address needs to be 4 Mb aligned */
+#define SHMLBA         (__getpagesize ())

I prefer this for glibc as well.

> At one time, we thought this value needed to be 4 MB.  Helge was working on improving the mmap
> allocation scheme but this work stalled after some improvement.

They are just on hold, but not that needed any more after we have the flexmap implementation.

> I can't remember the issues and how they relate to SHMLBA.

I would need to recall too. IIRC, SHMLBA and the 4MB cache alignments do not really relate to each
other. Userspace should just mmap(X) where X is aligned to SHMLBA. The mmap will then
mmap to the next possible address (starting somewhere above/equal to X) and still fulfilling the 4MB cache
alignment (if it's a shared mmap).

Helge
