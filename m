From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Tue, 25 Nov 2008 14:58:50 +0100
Message-ID: <20081125145850.1a5ddf23.gmsoft@tuxicoman.be>
References: <20081123165718.0D5A94DCB@hiauly1.hia.nrc.ca>
	<20081125025421.9745A4FB6@hiauly1.hia.nrc.ca>
	<119aab440811250533y1a09a396i318dfc057ad0d659@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	grundler@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440811250533y1a09a396i318dfc057ad0d659@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi Carlos,

It has been happening to me as far back as 2.6.25 IIRC.
It occurs only on SMP kernels and on various models (K410, L2000).

I've tried to bissect that as well but kernel before 2.6.25 aren't really useable SMP due to the global irq bug or so.

To me that is a bug that as always been there. It is random but some builds almost always fail. Not always at the same place tho.

Cheers,
  Guy

On Tue, 25 Nov 2008 08:33:24 -0500
"Carlos O'Donell" <carlos@systemhalted.org> wrote:

> On Mon, Nov 24, 2008 at 9:54 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> > The segv looks to be in _dl_fixup at 0xf3b8 in /lib/ld.so.1.
> 
> The dynamic loader is sensitive to VM bugs, as are several of the
> glibc tests. Too bad you probably can't run the glibc testsuite on
> this kernel.
> 
> Given your earlier comments it would seen the segfault is not
> reproducible and happens often and randomly?
> 
> The _dl_fixup routine is very complicated, and eventually responsible
> for mapping in a new shared library. This could tickle any number of
> VM bugs.
> 
> The only way I know how to solve this class of problem is to start
> bisecting the kernel until it works again and determine what commit
> made the stability worse.
> 
> $0.02.
> 
> I'm still organizing the new house Kristine and I are renting, and my
> rack is only partly cabled up at this point. I'll try to get on that
> ASAP so I can also have a look at the latest kernel.
> 
> Cheers,
> Carlos.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Guy Martin
Gentoo Linux - HPPA port lead

