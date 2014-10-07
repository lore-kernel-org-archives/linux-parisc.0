From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: systemd on hppa and number of free RT signals
Date: Tue, 7 Oct 2014 17:07:14 -0400
Message-ID: <CAE2sS1h7WhgwtoWY2kUrxP5LAXDmXgFZ2uVtB8bTJFfj9vfA6w@mail.gmail.com>
References: <5434418F.1020407@gmx.de>
	<20141007225009.3c74e147@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20141007225009.3c74e147@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 7, 2014 at 4:50 PM, Jeroen Roovers <jer@gentoo.org> wrote:
>> What's your opinion on this?
>
> From my perspective it looks like a lot of work for very little gain.
> Gentoo has no need for systemd so all these changes would mean
> upgrading kernel and libc requires a lot more attention, and systemd
> could equally well compact the ill-chosen RT signal range.

Helge's changes bring hppa inline with other machines with little to
no impact to userspace.

That is a win from a maintenance perspective IMO.

Cheers,
Carlos.
