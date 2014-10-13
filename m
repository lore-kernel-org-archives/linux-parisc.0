From: Helge Deller <deller@gmx.de>
Subject: Re: [GIT PULL] parisc architecture patch for v3.18
Date: Mon, 13 Oct 2014 22:24:53 +0200
Message-ID: <543C3515.9090000@gmx.de>
References: <20141012100837.GA1553@p100.box> <20141013144143.475ca9f9@alan.etchedpixels.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Carlos O'Donell <carlos@systemhalted.org>
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20141013144143.475ca9f9@alan.etchedpixels.co.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/13/2014 03:41 PM, One Thousand Gnomes wrote:
> On Sun, 12 Oct 2014 12:08:37 +0200
> Helge Deller <deller@gmx.de> wrote:
>
>> Hi Linus,
>>
>> please pull one patch for the parisc architecture for kernel 3.18 from
>>    git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-3.18-1
>>
>> This patch intentionally breaks the ABI on PARISC Linux!
>>
>> It assigns new numbers to SIGSTKFLT, SIGXCPU, SIGXFSZ and SIGSYS so that
>> those are below 32 and thus leaves us with 32 RT signals like other
>> Linux architectures (SIGRTMIN now becomes 32 instead of 37).
>>
>> Even if it breaks the ABI, it doesn't seem to have any visible impact on
>> existing userspace applications.
>
> I somehow doubt your kill command magically corrects its signal numbering
> table. Likewise what does gdb do given a core dump that died from one of
> those signals, and what does your shell report if you kill one that way.
> It seems to me your minimal set of binaries to swap to get it right is
> non-zero but not problematic (libc, kill, shells, top, gdb) ?

My patch of course just marks the start of a transition phase, in which
some few applications need to be rebuilt (libc as the most important one).
But after all it makes a somewhat smooth transition possible, and as I
wrote in the commit message this is the best solution (out of 3) with the
least impact which we have.
  
> I can however really only think of one app that actually *used* SIGXCPU,
> and that was to respawn itself to avoid annoying sysadmin set CPU limits
> anyway.

:-)

Helge
