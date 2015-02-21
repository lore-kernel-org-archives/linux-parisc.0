From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Sun, 22 Feb 2015 00:26:19 +0100
Message-ID: <54E9141B.4050009@gmx.de>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>	 <BLU0-SMTP47556722282C83F98582B797C50@phx.gbl>	 <201312191619.05005.vapier@gentoo.org> <5313A12E.7010307@gmx.de>	 <20140401182627.GA3285@drone.musicnaut.iki.fi> <533B0A57.2060700@gmx.de>	 <CAE2sS1jZTzccFy_uWri++cgVz+AYVfY0_aFqXFxnJXZV3d1a0g@mail.gmail.com>	 <533C7C9A.5080703@gmx.de> <BLU0-SMTP84F101069B44354FC1070C976D0@phx.gbl>	 <533DB961.9010607@gmx.de> <BLU0-SMTP7204937E7AF88D8736354E976C0@phx.gbl>	 <533DC3E8.5010701@gmx.de>	 <CAE2sS1iY6H3fnEJDHr6oPGywwGYmM_2gt2r_p+DUz+v0Rf2szg@mail.gmail.com>	 <BLU436-SMTP15952414B35EC498F0793B1972B0@phx.gbl>	 <BLU437-SMTP9274AAFB2636BF93781F02972B0@phx.gbl> <1424560158.2146.22.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Mike Frysinger <vapier@gentoo.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1424560158.2146.22.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 22.02.2015 00:09, James Bottomley wrote:
> On Sat, 2015-02-21 at 15:40 -0500, John David Anglin wrote:
>> On 2015-02-21, at 3:31 PM, John David Anglin wrote:
>>
>>> On 2015-02-20, at 4:36 PM, Carlos O'Donell wrote:
>>>
>>>> On Thu, Apr 3, 2014 at 4:26 PM, Helge Deller <deller@gmx.de> wrote:
>>>>> In current eglibc it's set to 0x00400000
>>>>> That's what my eglibc-patch changes...
>>>>> I'm currently building a eglibc on hpviz with SHMLBA set to 4096 (__getpagesize()).
>>>>
>>>> Anyone object to me fixing this upstream by making SHMLBA match the kernel?
>>>>
>>>> I plan to use a fixed value of 4096, since I never expect hppa
>>>> userspace to have to care (even if the kernel uses superpages).
>>>
>>> We currently use (__getpagesize ()) in Debian and this seems to be a common definition.
>>> Is there a performance advantage in using 4096?
>>>
>>>>
>>>> Please correct me if I'm wrong.
>>>
>>>
>>> At one time, we thought this value needed to be 4 MB.  Helge was
>> working on improving the mmap
>>> allocation scheme but this work stalled after some improvement.  I
>> can't remember the issues and how
>>> they relate to SHMLBA.
>>
>>
>> Actually, the number was 4 Mb (bit).
>
> No, it was 4MB.  That's the cache equivalency stride on PA processors
> because we have a VIPT cache.  The architectural requirement according
> to the dreaded appendix F is 16MB but we were assured by the PA
> architects that it was 4 because they never planned producing processors
> that would require 16.  The actual meaning is it's the number of bits of
> the virtual address that are significant in the virtual index.
>

Your following statement:

> The point of SHMLBA is that if the same physical page is mapped into two
> different virtual addresses but the two addresses are equal, modulo
> SHMLBA, then the L1 cache sees the equivalency and you can't get
> inequivalent cache aliases for the page (two writes to the two different
> addresses producing two separately dirty cache lines which can never
> resolve).  This means that the virtual addresses of all shared mappings
> have to be equal modulo SHMLBA for the caches not to alias.

With this you define SHMLBA to be the representative number which defines
what the current cache equivalency stride of the kernel is, *and* which then can
be used by userspace. I think this is a misinterpretation of SHMLBA (or at
least a parisc-specific interpretation of SHMLBA), which is not like how it
is used on other architectures with similar limitations.
Userspace should not know the kernel/architecture specifics. Instead they
should try to mmap() memory somewhere (e.g. 4KB aligned) and if they need shared mappings then
kernel/glibc will return a corrected mapping address (modulo 4MB).
I think this is important, since most userspace programs usually try to mmap at
a multiple of SHMLBA with which we then run very soon out of userspace (with SHMLBA=4MB).
This has been the issue with localedef in glibc (a strange coding which tries
to be platform-specific with mmap-calculation). Because of that in the end
it turned out to be best for parisc to have SHMLBA defined to 4kb (and not 4MB).

So, your statement above is correct, I would just not use "SHMLBA" in this term,
but maybe "KERNEL_SHMLBA" instead.

Helge
