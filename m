Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA18343
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 May 1999 01:37:57 -0600
Message-ID: <19990514073913.18827@insula.local>
Date: Fri, 14 May 1999 07:39:13 +0000
From: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
To: Justin Maurer <justin@master.debian.org>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] performance computing review of a180
Reply-To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
References: <19990513184043.A20996@master.debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990513184043.A20996@master.debian.org>; from Justin Maurer on Thu, May 13, 1999 at 06:40:43PM -0500
List-ID: <linux-parisc.vger.kernel.org>

>by popular request, here are some key bits from the review of the a180 in this
>month's _unix's review's performance computing_:

I think there are some bits there that are interesting.

> (the machine as test was priced at $16,568. it had one cpu (lc), 1gb ram, two
> 4gb drives, and hp-ux 11.0)

1 GB RAM sounds a bit much if you later whine about the RAM being too
expensive. Furthermore, they seem to have enough money to buy 1 GB of
RAM, but not enough to buy the A180C version, which scores at 130% of
the A180 in SPECweb96 (650 vs 500) according to HP's docs.

> "most recent non-intel servers have 64-bit cpus, but the core of the a-class
> is hp's pa-7300, a 32-bit processor. this may seem a bit retro, but there is
> little about internet services that actually benefits from 64-bit processor"

What is a bit retro about the 7300LC, according to HP's website, is it
is manufactured in 0.50 um-process. This could be the reason for it being
clocked comparably low at 180 MHz.

>"the only printed documentation that ships with the a-class is a small booklet
>showing basic cable connections and outlining the customary safety and
>regulatory statements. all other documentation is either part of the installed
>hp-ux os (for example, online manual pages...additionally, the hp instant
>information cd-rom, a collection of documentation is available as a $300
>option. thus, to install the a-class, it is cubersome (though necessary) to
>have another system on hand to various documentation web sites."

This attitude, if it is more common, could make Linux on the A180 a lot more
popular. Linux is fairly standardized, you can get most Documentation as
hardcopy or read it on an x86 box etc.

>finally, the last thing before the closing comments is a bit on performance:
>"...the 180-mhz a-class also produces spec scores lower than the 400mhz
>pentium ii xeon processor, which is fairly common in intel-based servers.
>interestingly, hp has chosen not to publish, at least at press time, benchmark
>results for the a-class for the specweb96 benchmark, which would be an obvious
>choice for a web-specific system design...." its spec scores are then compared
>to several other 64-bit systems..

I don't know if the information HP gave us was publically available before,
but it gives SPECweb96 results.

> "...for example, the system memory is comparatively expensive, evidenced by
> the price of the system we tested. thus, while the a-class hits the design
> mark for high-density rackmount servers (20 in a two-meter rack), more-robust
> configurations are pricey. as a result, design gets a two-flag rating on our
> scale--average."

> "...expansion is not a big issue...the version of bind should have been
> upgraded to bind 8, and not including sendmail 8.9 we feel is a
> mistake...performance is not a primary objective for hp with the a-class.."

This should be no problem with Linux.

>in short, they give it "poor" on installation and documentation, "average" on
>design, expandibility, performance, and *overall*, and "good" on operation.
>they basically give it a few nice compliments, then rag on the same things and
>more. more towards the negative side, overall.

sounds as there seems to be interest in Linux on the A180.
