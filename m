From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: State of the PA-RISC/HPPA port (August 2013)
Date: Sun, 4 Aug 2013 08:21:04 -0400
Message-ID: <CAE2sS1j6z+PJbRW5gS+B4C-WKhPZCXPwOs8np07qsPM1fxAe2w@mail.gmail.com>
References: <20130803204119.GA2392@halden.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130803204119.GA2392@halden.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Aug 3, 2013 at 4:41 PM, Helge Deller <deller@gmx.de> wrote:
> So, what's the status of the Linux kernel for parisc?
>
> Basically, I think all major outstanding kernel patches are now in the upcoming
> kernel 3.11 tree, and the important ones will show up in the stable kernel 3.10
> series soon as well. Kernel 3.9 should be OK as well, but some patches might be
> missing.
>
> With kernel 3.11 (and 3.10.5 or higher) I expect most instability issues from
> the past to be gone.  There might still be minor issues with userspace
> segfaults (due to cache issues), but they are rare....

Thanks for all the work Helge!

On the glibc front I don't have as good news. We shipped 2.18 without
all of the hppa patches, but keep a patchset up to date, and I'm
merging in some changes from Dave.

The glibc testsuite results are really bad, but hopefully I'll poke at
those over the coming year.

I'm using gentoo, and taking patches form the gentoo people and
feeding those upstream as they are reported (I still have a few to go
through).

Cheers,
Carlos.
