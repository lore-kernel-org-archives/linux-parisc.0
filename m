From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: systemd on hppa and number of free RT signals
Date: Tue, 7 Oct 2014 17:03:30 -0400
Message-ID: <CAE2sS1jy4sgs7xSev5-NnVqOqb8nUvQVGnc=JZt=tc-1HPdSgQ@mail.gmail.com>
References: <5434418F.1020407@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Jeroen Roovers <jer@gentoo.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5434418F.1020407@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 7, 2014 at 3:39 PM, Helge Deller <deller@gmx.de> wrote:
> I've just had a successful boot on hppa with systemd :-)
> The bootlog is attached.

Awesome.

> The attached patches to Linux kernel and glibc shuffles around some signals,
> so that we end up with
> #define __SIGRTMIN      32
> instead of
> #define __SIGRTMIN      37

This is the right way to go.

Yes it's an ABI event, but these are fundamentally niche architectures
for which we can't ask everyone else to adjust.

> I do know that this changes the ABI and introduces a binary incompatibly.
> Nevertheless, my testing with the new kernel and glibc didn't showed any
> obvious problems, which means that I could install either of those and the
> system didn't showed problems even after reboots.

That's because the signals you moved/removed aren't used by anything :-)

> Additionally, given the fact that we have very little users and live in
> debian/gentoo unstable would IMHO justify such an incompatible change. Even
> HP-UX support was dropped a few months back...
> And we could easily rebuild packages like strace, gdb and such...

That's right.

> The other option would be to increase NSIG in kernel from 64 to 128 or
> higher.

No, that's a very very bad idea because it has consequences on
sigset_t and that would really really immediately break userspace.

> I did tried to come up with kernel patches for this now for a few weeks, but
> ended up with the recognition, that this would require to duplicate nearly
> all of Linux kernel signal handling and which would most likely introduce
> new bugs.

Agreed.

> What's your opinion on this?

Flawless hack. Very well reorganized. Your removal of SIGLOST, and
reorganizing is the best I could come up with also.

The only thing I will do different is make SIGEMT equal to SIGABRT,
that way we preserve the semantics of what this operation means. Linux
doesn't use SIGEMT, but it keeps hppa defining this for use by other
software that might want similar semantics. You can catch SIGABRT and
operate on it, so it's one way forward.

If you agree I'll checkin to glibc master.

Cheers,
Carlos.
