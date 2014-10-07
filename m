From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: systemd on hppa and number of free RT signals
Date: Tue, 7 Oct 2014 22:50:09 +0200
Message-ID: <20141007225009.3c74e147@marga.jer-c2.orkz.net>
References: <5434418F.1020407@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5434418F.1020407@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 07 Oct 2014 21:39:59 +0200
Helge Deller <deller@gmx.de> wrote:

> As already discussed here:
> http://article.gmane.org/gmane.linux.ports.parisc/5278
> we don't have enough RT signals for systemd, which requests
> "SIGRTMIN+29" which is > 64 (SIGRTMAX). Since systemd gets more and
> more important (e.g. KDE now seems to require systemd) we should try
> to find a solution.

We do have enough RT signals, as the patch attached to [1] demonstrates.
I haven't tried that patch with recent versions of systemd, though.
Unless systemd has started using even more signals or introduced even
more gaps for no reason at all.

> Additionally, given the fact that we have very little users and live
> in debian/gentoo unstable

That's Debian unstable and Gentoo /stable/ thank you very much. :)

> would IMHO justify such an incompatible change.

Gentoo dropped support for GNOME and KDE years ago (except for some of
the base libraries such as glib and gtk+ of course). The point being
that these fat window managers run utterly slow (exactly as they do on
much more recent x86 hardware).

Interest in supporting systemd therefore never went beyond the
purely academic interest displayed in [1]. Luckily, Gentoo already uses
an alternative, modern init system. Gentoo/HPPA has little need for
systemd, I would guess.

> The other option would be to increase NSIG in kernel from 64 to 128
> or higher.

Sounds like a lot of work.

> What's your opinion on this?

>From my perspective it looks like a lot of work for very little gain.
Gentoo has no need for systemd so all these changes would mean
upgrading kernel and libc requires a lot more attention, and systemd
could equally well compact the ill-chosen RT signal range.


Regards,
     jer



[1] https://bugs.gentoo.org/show_bug.cgi?id=482214
